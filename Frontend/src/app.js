import { state, clearSession } from "./state/store.js";
import { escapeHtml, asList, safeExternalUrl } from "./utils/dom.js";
import { api as endpoints } from "./api/endpoints.js";
import { toast, reportError } from "./components/toast.js";
import { schemeId, schemeName, savedIds } from "./components/scheme-card.js";
import { loadSchemes, renderSchemes, loadSchemeDetail, renderSchemeDetail } from "./pages/schemes.js";
import { renderProfile, submitProfile } from "./pages/profile.js";
import { renderAuth, submitAuth } from "./pages/auth.js";
import { renderDashboard } from "./pages/dashboard.js";
import { renderAdmin, submitSchemeAdmin, resetSchemeForm, editScheme } from "./pages/admin.js";
import { initMotion, refreshMotion, pageEnter, pageExit } from "./utils/motion.js";
import { startFireflies } from "./utils/fireflies.js";
function renderNavigation() {
  const auth = document.getElementById("auth-nav");
  const join = document.getElementById("join-nav");
if (state.session) {
    auth.textContent = "Sign out";
    auth.dataset.action = "logout";
    join.innerHTML = state.session.role === "ADMIN" ? 'Admin <span>↗</span>' : 'My account <span>↗</span>';
    join.dataset.action = state.session.role === "ADMIN" ? "admin" : "dashboard";
  } else {
    auth.textContent = "Sign in"; auth.dataset.action = "login";
    join.innerHTML = 'Get started <span>↗</span>'; join.dataset.action = "register";
  }
}

function navigate(page) {
  const target = document.getElementById(page) ? page : "home";
  if ((target === "dashboard" || target === "admin") && !state.session) {
    location.hash = "auth";
    renderAuth("login");
    return;
  }
  if (target === "admin" && state.session.role !== "ADMIN") {
    toast("This area is available to administrators only.", "error");
    location.hash = "dashboard";
    return;
  }
  const current = document.querySelector(".page.active");
  const targetEl = document.getElementById(target);
  pageExit(current);
  document.querySelectorAll("[data-page]").forEach(pageEl => pageEl.classList.toggle("active", pageEl.id === target));
  document.querySelectorAll("[data-nav]").forEach(link => link.classList.toggle("active", link.dataset.nav === target));
  document.querySelector(".story-rail")?.classList.toggle("is-hidden", target !== "home");
  document.querySelector(".nav")?.classList.remove("open");
  refreshMotion(document.getElementById(target));
  pageEnter(document.getElementById(target));
  window.scrollTo({ top: 0, behavior: window.matchMedia("(prefers-reduced-motion: reduce)").matches ? "auto" : "smooth" });
  if (target === "schemes") loadSchemes();
  if (target === "eligibility") renderProfile();
  if (target === "dashboard") renderDashboard();
  if (target === "admin") renderAdmin();
  if (target === "auth" && !document.getElementById("auth-content").innerHTML) renderAuth("login");
  if (target === "scheme-detail" && state.currentDetail) renderSchemeDetail(state.currentDetail);
}

function routeFromHash() {
  const route = decodeURIComponent(location.hash.replace(/^#\/?/, "")) || "home";
  if (route === "main") return;
  if (route.startsWith("scheme/")) {
    const id = route.slice("scheme/".length);
    navigate("scheme-detail");
    loadSchemeDetail(id);
    return;
  }
  navigate(route);
}

async function applyToScheme(id) {
  if (!state.session) { toast("Sign in to keep track of your application.", "error"); location.hash = "auth"; renderAuth("login"); return; }
  const scheme = state.currentDetail || state.schemes.find(item => Number(schemeId(item)) === Number(id));
  const officialUrl = scheme && safeExternalUrl(scheme.officialApplyUrl);
  const applicationTab = officialUrl ? window.open("about:blank", "_blank") : null;
  if (applicationTab) applicationTab.opener = null;
  const continueToPortal = () => {
    if (!officialUrl) return;
    if (applicationTab) applicationTab.location.href = officialUrl;
    else window.location.assign(officialUrl);
    location.hash = "dashboard";
  };
  try {
    await endpoints.redirectApply(id);
    toast("Your application journey is saved.");
    continueToPortal();
    if (!officialUrl) toast("This scheme does not list an application link yet. Check its official government page.", "error");
  } catch (error) {
    if (/already tracked/i.test(error.message || "")) {
      toast("This application is already tracked in your account.");
      continueToPortal();
      return;
    }
    if (applicationTab) applicationTab.close();
    reportError(error);
  }
}

async function toggleSaved(id) {
  if (!state.session) { toast("Sign in to save schemes to your account.", "error"); location.hash = "auth"; renderAuth("login"); return; }
  if (!state.savedLoaded) {
    try { state.saved = asList(await endpoints.saved()); state.savedLoaded = true; }
    catch (error) { reportError(error); return; }
  }
  const isSaved = savedIds().has(Number(id));
  const refresh = () => {
    if (location.hash === "#dashboard" && state.dashboardTab === "saved") renderDashboard("saved");
    else if (state.currentDetail) renderSchemeDetail(state.currentDetail);
    else renderSchemes();
  };
  try {
    if (isSaved) await endpoints.unsave(id); else await endpoints.save(id);
    state.saved = isSaved ? state.saved.filter(item => Number(schemeId(item)) !== Number(id)) : [...state.saved, state.schemes.find(item => Number(schemeId(item)) === Number(id)) || { schemeId: Number(id), schemeName: "Saved scheme" }];
    state.savedLoaded = true;
    toast(isSaved ? "Removed from your saved schemes." : "Saved to your account.");
    refresh();
  } catch (error) {
    if (!isSaved && /already saved/i.test(error.message || "")) {
      try { state.saved = asList(await endpoints.saved()); state.savedLoaded = true; } catch (_) { }
      toast("This scheme is already in your saved list.");
      refresh();
      return;
    }
    reportError(error);
  }
}

async function updateApplication(select) {
  const status = select.value;
  if (!status) return;
  select.disabled = true;
  try { await endpoints.updateStatus(select.dataset.trackingId, status); toast("Application status updated."); renderDashboard("applications"); }
  catch (error) { reportError(error); select.disabled = false; select.value = ""; }
}

document.addEventListener("click", async event => {
  const action = event.target.closest("[data-action]");
  if (!action) return;
  const name = action.dataset.action;
  if (name === "menu") { document.querySelector(".nav")?.classList.toggle("open"); return; }
  if (name === "story-chapter") {
    if (action.dataset.target === "home") window.scrollTo({ top: 0, behavior: "smooth" });
    else document.getElementById(action.dataset.target)?.scrollIntoView({ behavior: "smooth", block: "center" });
    return;
  }
  if (["home", "schemes", "eligibility", "dashboard", "admin", "scheme-detail"].includes(name)) { location.hash = name === "scheme-detail" ? `scheme/${action.dataset.id}` : name; return; }
  if (name === "login" || name === "register") { location.hash = "auth"; renderAuth(name); return; }
  if (name === "logout") { clearSession(); renderNavigation(); toast("You’ve signed out."); location.hash = "home"; return; }
  if (name === "dashboard-tab") { renderDashboard(action.dataset.tab); return; }
  if (name === "retry-schemes") { state.schemes = []; loadSchemes(); return; }
  if (name === "save-scheme") { await toggleSaved(action.dataset.id); return; }
  if (name === "apply") { await applyToScheme(action.dataset.id); return; }
  if (name === "mark-read") {
    try { await endpoints.markRead(action.dataset.id); toast("Notification marked as read."); renderDashboard("notifications"); }
    catch (error) { reportError(error); }
    return;
  }
  if (name === "mark-all-read") {
    try { await endpoints.markAllRead(); toast("Notifications cleared."); renderDashboard("notifications"); }
    catch (error) { reportError(error); }
    return;
  }
  if (name === "sync") {
    action.disabled = true; action.textContent = "Syncing…";
    try { await endpoints.sync(); toast("Scheme sync started."); await renderAdmin(); }
    catch (error) { reportError(error); }
    finally { action.disabled = false; action.innerHTML = 'Sync scheme data <span>↗</span>'; }
    return;
  }
  if (name === "new-scheme") { resetSchemeForm(); document.getElementById("scheme-admin-form")?.scrollIntoView({ behavior: "smooth", block: "center" }); return; }
  if (name === "cancel-scheme-edit") { resetSchemeForm(); return; }
  if (name === "edit-scheme") { editScheme(action.dataset.id); return; }
  if (name === "retry-connection") { await retryConnection(); return; }
  if (name === "delete-scheme") {
    const scheme = state.schemes.find(item => Number(schemeId(item)) === Number(action.dataset.id));
    if (!scheme || !window.confirm(`Deactivate “${schemeName(scheme)}”?`)) return;
    action.disabled = true;
    try { await endpoints.deleteScheme(action.dataset.id); toast("Scheme deactivated."); state.schemes = asList(await endpoints.schemes()); await renderAdmin(); }
    catch (error) { reportError(error); action.disabled = false; }
  }
});

document.addEventListener("submit", event => {
  if (event.target.id === "auth-form") { event.preventDefault(); submitAuth(event.target); }
  if (event.target.id === "profile-form") { event.preventDefault(); submitProfile(event.target); }
  if (event.target.id === "scheme-admin-form") { event.preventDefault(); submitSchemeAdmin(event.target); }
});

window.addEventListener("jankalyan:auth-view", event => renderAuth(event.detail || "login"));
window.addEventListener("jankalyan:session-updated", renderNavigation);
window.addEventListener("jankalyan:profile-saved", () => renderDashboard("profile"));
window.addEventListener("jankalyan:session-expired", () => { renderNavigation(); toast("Your session has expired. Please sign in again.", "error"); });

window.addEventListener("jankalyan:api-status", event => {
  const offline = event.detail === "offline";
  document.body.classList.toggle("is-offline", offline);
  const banner = document.getElementById("api-banner");
  if (banner) banner.hidden = !offline;
});

async function checkService() {
  try {
    await endpoints.ping();
    document.body.classList.remove("is-offline");
    const banner = document.getElementById("api-banner");
    if (banner) banner.hidden = true;
  } catch (_) {
  }
}

async function retryConnection() {
  const button = document.querySelector('[data-action="retry-connection"]');
  if (button) { button.disabled = true; button.textContent = "Retrying…"; }
  try {
    await endpoints.ping();
    document.body.classList.remove("is-offline");
    const banner = document.getElementById("api-banner");
    if (banner) banner.hidden = true;
    toast("Connection restored.");
    const target = document.querySelector(".page.active")?.id;
    if (target === "schemes") await loadSchemes();
    if (target === "eligibility") await renderProfile();
    if (target === "dashboard") await renderDashboard();
    if (target === "admin") await renderAdmin();
  } catch (error) {
    reportError(error);
  } finally {
    if (button) { button.disabled = false; button.textContent = "Retry connection"; }
  }
}

document.addEventListener("change", event => {
  if (event.target.id === "scheme-category") renderSchemes();
  if (event.target.matches(".status-select")) updateApplication(event.target);
});

let searchTimer = 0;
document.getElementById("scheme-search")?.addEventListener("input", () => {
  window.clearTimeout(searchTimer);
  searchTimer = window.setTimeout(() => renderSchemes(), 130);
});
window.addEventListener("hashchange", routeFromHash);
function startBrandShine() {
  const hero = document.querySelector(".brand-hero");
  const shine = hero?.querySelector(".brand-hero-shine");
  if (!hero || !shine || window.matchMedia("(prefers-reduced-motion: reduce)").matches) return;
  const sweep = () => {
    shine.classList.remove("is-shining");
    void shine.offsetWidth;
    shine.classList.add("is-shining");
  };
  shine.addEventListener("animationend", event => {
    if (event.animationName === "brand-shine-run") shine.classList.remove("is-shining");
  });
  const schedule = () => {
    window.setTimeout(() => { sweep(); schedule(); }, 8600 + Math.random() * 3600);
  };
  schedule();
}
function bootstrap() {
  renderNavigation();
  if (state.session && state.session.role === "ADMIN" && location.hash === "") location.hash = "admin";
  routeFromHash();
  checkService();
  startBrandShine();
}
initMotion();
startFireflies(".fireflies");
if (document.readyState === "loading") document.addEventListener("DOMContentLoaded", bootstrap, { once: true });
else bootstrap();

