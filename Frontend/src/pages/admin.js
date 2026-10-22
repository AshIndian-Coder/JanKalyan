import { api as endpoints } from "../api/endpoints.js";
import { state } from "../state/store.js";
import { escapeHtml, asList, safeClassName } from "../utils/dom.js";
import { schemeId, schemeName } from "../components/scheme-card.js";
import { toast, showLoading, reportError } from "../components/toast.js";
import { refreshMotion } from "../utils/motion.js";

export async function renderAdmin() {
  const target = document.getElementById("admin-content");
  showLoading(target, "Loading administration…");
  try {
    const [stats, schemes] = await Promise.all([endpoints.adminStats(), endpoints.schemes()]);
    state.schemes = asList(schemes);
    target.innerHTML = `<div class="dashboard-head"><div><div class="section-kicker">JanKalyan · Administration</div><h1>Overview.</h1><p>Public benefit activity at a glance.</p></div><button class="button button-dark" data-action="sync">Sync scheme data <span>↗</span></button></div><div class="admin-stats">${[["Total users",stats.totalUsers],["Total schemes",stats.totalSchemes],["Active schemes",stats.activeSchemes],["Applications",stats.totalApplications],["Approved",stats.approvedApplications]].map(([label,value]) => `<article class="admin-stat"><span>${escapeHtml(label)}</span><strong>${Number(value || 0).toLocaleString()}</strong></article>`).join("")}</div><div class="notice">Scheme synchronization can take a little time. The recent activity is shown below.</div><section class="admin-management"><div class="management-heading"><div><div class="section-kicker">Catalog</div><h2>Manage schemes</h2></div><button class="button button-dark button-sm" data-action="new-scheme">Add a scheme <span>＋</span></button></div><form id="scheme-admin-form" class="scheme-admin-form" data-scheme-id=""><h3 id="scheme-form-heading">Add a scheme</h3><p class="form-hint scheme-admin-hint">Eligibility criteria attached to a scheme are preserved when you save an edit.</p><div class="form-grid">${adminInput("Scheme name", "schemeName", "text", "Required")}${adminInput("Department", "department")}${adminInput("Category", "category")}${adminInput("Level", "level", "select", "CENTRAL")}${adminInput("State (for state schemes)", "state")}${adminInput("Official application URL", "officialApplyUrl", "url")}${adminInput("Status check URL", "officialStatusCheckUrl", "url")}${adminInput("Benefits (separate with commas)", "benefits")}${adminInput("Documents (separate with commas)", "documents")}</div><div class="form-field scheme-description-field"><label for="scheme-description">Description</label><textarea id="scheme-description" name="description" rows="3" class="admin-textarea"></textarea></div><div class="form-actions"><button type="button" class="detail-link" data-action="cancel-scheme-edit">Clear form</button><button type="submit" class="button button-dark button-sm">Save scheme <span>↗</span></button></div></form><div class="admin-scheme-list">${state.schemes.length ? state.schemes.map(scheme => `<article class="admin-scheme-row"><div><h3>${escapeHtml(schemeName(scheme))}</h3><p>${escapeHtml(scheme.category || "Uncategorized")} · ${escapeHtml(scheme.department || "No department listed")}</p></div><div class="admin-row-actions"><button class="detail-link" data-action="edit-scheme" data-id="${escapeHtml(schemeId(scheme))}">Edit</button><button class="detail-link danger-link" data-action="delete-scheme" data-id="${escapeHtml(schemeId(scheme))}">Deactivate</button></div></article>`).join("") : '<div class="empty-state"><h3>No schemes are available yet.</h3></div>'}</div></section>`;
    target.insertAdjacentHTML("beforeend", '<section class="sync-log-section"><div class="section-kicker">Data freshness</div><h2>Recent sync activity</h2><div id="sync-log-list" class="sync-log-list"><div class="loading"><span class="spinner"></span>Loading sync history…</div></div></section>');
    const logTarget = document.getElementById("sync-log-list");
    try {
      const logs = asList(await endpoints.syncLogs());
      logTarget.innerHTML = logs.length ? logs.map(log => `<article class="sync-log-row"><span class="status-pill ${safeClassName(log.status)}">${escapeHtml(log.status || "UNKNOWN")}</span><span>${escapeHtml(log.sourceName || "Scheme source")}</span><span>${Number(log.recordsFetched || 0).toLocaleString()} records</span><time>${escapeHtml(log.syncedOn ? new Date(log.syncedOn).toLocaleString() : "")}</time></article>`).join("") : '<div class="empty-state"><p>No synchronization history yet.</p></div>';
    } catch (error) { logTarget.innerHTML = `<div class="notice error">${escapeHtml(error.message)}</div>`; }
    refreshMotion(target);
  } catch (error) {
    target.innerHTML = `<div class="empty-state"><h3>Admin overview unavailable</h3><p>${escapeHtml(error.message)}</p></div>`;
  }
}

function adminInput(label, name, type = "text", placeholder = "") {
  if (type === "select") return `<div class="form-field"><label for="scheme-${name}">${label}</label><select id="scheme-${name}" name="${name}"><option value="CENTRAL">Central</option><option value="STATE">State</option></select></div>`;
  return `<div class="form-field"><label for="scheme-${name}">${label}</label><input id="scheme-${name}" name="${name}" type="${type}" ${name === "schemeName" ? "required maxlength=\"150\"" : ""} ${placeholder ? `placeholder="${placeholder}"` : ""}></div>`;
}

export function resetSchemeForm() {
  const form = document.getElementById("scheme-admin-form");
  if (!form) return;
  form.reset(); form.dataset.schemeId = "";
  document.getElementById("scheme-form-heading").textContent = "Add a scheme";
  form.querySelector('[type="submit"]').innerHTML = 'Save scheme <span>↗</span>';
}

export function editScheme(id) {
  const scheme = state.schemes.find(item => Number(schemeId(item)) === Number(id));
  const form = document.getElementById("scheme-admin-form");
  if (!scheme || !form) return;
  form.dataset.schemeId = String(id);
  Object.entries({
    schemeName: scheme.schemeName, department: scheme.department, category: scheme.category, level: scheme.level,
    state: scheme.state, officialApplyUrl: scheme.officialApplyUrl, officialStatusCheckUrl: scheme.officialStatusCheckUrl,
    benefits: asList(scheme.benefits).join(", "), documents: asList(scheme.documents).join(", "), description: scheme.description
  }).forEach(([key, value]) => { const field = form.elements.namedItem(key); if (field && value != null) field.value = value; });
  document.getElementById("scheme-form-heading").textContent = "Edit scheme";
  form.querySelector('[type="submit"]').innerHTML = 'Update scheme <span>↗</span>';
  form.scrollIntoView({ behavior: "smooth", block: "center" });
}

async function schemeAdminPayload(form) {
  const raw = Object.fromEntries(new FormData(form).entries());
  const splitList = value => value.split(",").map(item => item.trim()).filter(Boolean);
  const id = form.dataset.schemeId;
  let criteria = [];
  if (id) {
    try {
      const detail = await endpoints.scheme(id);
      criteria = asList(detail && detail.criteria);
    } catch (_) {
      criteria = [];
    }
  }
  return {
    schemeName: raw.schemeName.trim(), description: raw.description.trim(), department: raw.department.trim(),
    level: raw.level, state: raw.state.trim() || null, category: raw.category.trim(),
    officialApplyUrl: raw.officialApplyUrl.trim() || null, officialStatusCheckUrl: raw.officialStatusCheckUrl.trim() || null,
    criteriaList: criteria
      .filter(item => item && item.fieldName && item.operator && item.value)
      .map(item => ({ fieldName: item.fieldName, operator: item.operator, value: item.value, value2: item.value2 || null })),
    documentList: splitList(raw.documents || "").map(documentName => ({ documentName })),
    benefitList: splitList(raw.benefits || "").map(benefitDescription => ({ benefitDescription }))
  };
}

export async function submitSchemeAdmin(form) {
  const button = form.querySelector('[type="submit"]');
  const id = form.dataset.schemeId;
  button.disabled = true;
  try {
    const payload = await schemeAdminPayload(form);
    if (id) await endpoints.updateScheme(id, payload); else await endpoints.createScheme(payload);
    toast(id ? "Scheme updated." : "Scheme added.");
    state.schemes = asList(await endpoints.schemes());
    await renderAdmin();
  } catch (error) { reportError(error); button.disabled = false; }
}

