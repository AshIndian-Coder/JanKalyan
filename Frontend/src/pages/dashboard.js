import { api as endpoints } from "../api/endpoints.js";
import { state } from "../state/store.js";
import { escapeHtml, asList, safeClassName } from "../utils/dom.js";
import { schemeCard } from "../components/scheme-card.js";
import { toast, showLoading, skeletons } from "../components/toast.js";
import { profileFormMarkup } from "./profile.js";
import { refreshMotion } from "../utils/motion.js";

function renderDashboardBase(tab, content) {
  const name = escapeHtml((state.session.fullName || "there").split(" ")[0]);
  document.getElementById("dashboard-content").innerHTML = `<div class="dashboard-head"><div><div class="section-kicker">Your JanKalyan</div><h1>Hello, ${name}.</h1><p>Your next steps, all in one place.</p></div><div class="dash-actions"><button class="button button-dark button-sm" data-action="eligibility">Check eligibility <span>↗</span></button></div></div><div class="dash-tabs"><button class="dash-tab ${tab === "applications" ? "active" : ""}" data-action="dashboard-tab" data-tab="applications">Applications</button><button class="dash-tab ${tab === "saved" ? "active" : ""}" data-action="dashboard-tab" data-tab="saved">Saved schemes</button><button class="dash-tab ${tab === "notifications" ? "active" : ""}" data-action="dashboard-tab" data-tab="notifications">Notifications</button><button class="dash-tab ${tab === "profile" ? "active" : ""}" data-action="dashboard-tab" data-tab="profile">Profile</button></div>${content}`;
  refreshMotion(document.getElementById("dashboard-content"));
}

export async function renderDashboard(tab = state.dashboardTab) {
  if (!state.session) { location.hash = "auth"; window.dispatchEvent(new CustomEvent("jankalyan:auth-view", { detail: "login" })); return; }
  state.dashboardTab = tab;
  renderDashboardBase(tab, `<div class="dashboard-list" aria-busy="true">${skeletons(4, "rows")}</div>`);
  try {
    if (tab === "applications") {
      const items = asList(await endpoints.applications());
      renderDashboardBase(tab, `<div class="dashboard-list">${items.length ? items.map(item => `<article class="application-item"><div><h3>${escapeHtml(item.schemeName || "Government scheme")}</h3><p>${escapeHtml(item.department || "Application activity")}${item.redirectedOn ? ` · Started ${escapeHtml(new Date(item.redirectedOn).toLocaleDateString())}` : ""}</p></div><span class="status-pill ${safeClassName(item.status)}">${escapeHtml(item.status || "REDIRECTED")}</span><select class="status-select" data-tracking-id="${escapeHtml(item.trackingId)}" aria-label="Update application status"><option value="">Update status</option><option value="APPLIED">I’ve applied</option><option value="APPROVED">Approved</option><option value="REJECTED">Rejected</option></select></article>`).join("") : '<div class="empty-state"><h3>Your application journey starts here.</h3><p>When you continue to an official portal, we’ll keep a record here.</p><button class="detail-link" data-action="schemes">Explore schemes ↗</button></div>'}</div>`);
    } else if (tab === "saved") {
      const items = asList(await endpoints.saved()); state.saved = items; state.savedLoaded = true;
      renderDashboardBase(tab, `<div class="scheme-grid">${items.length ? items.map(schemeCard).join("") : '<div class="empty-state"><h3>Save a scheme for later.</h3><p>Keep useful opportunities close while you decide what’s right for you.</p><button class="detail-link" data-action="schemes">Explore schemes ↗</button></div>'}</div>`);
    } else if (tab === "notifications") {
      const items = asList(await endpoints.notifications());
      renderDashboardBase(tab, `<div class="notification-toolbar"><button class="detail-link" data-action="mark-all-read">Mark all as read</button></div><div class="dashboard-list">${items.length ? items.map(item => `<article class="notification-item ${item.isRead ? "" : "unread"}"><span>${item.isRead ? "◌" : "✳"}</span><p>${escapeHtml(item.message || "You have an update.")}<br><span class="form-hint">${escapeHtml(item.createdAt ? new Date(item.createdAt).toLocaleString() : "")}</span></p>${item.isRead ? "" : `<button class="read-button" data-action="mark-read" data-id="${escapeHtml(item.notificationId)}">Mark read</button>`}</article>`).join("") : '<div class="empty-state"><h3>You’re all caught up.</h3><p>Updates about your applications will appear here.</p></div>'}</div>`);
    } else {
      const profile = await endpoints.getProfile(); state.profile = profile || {};
      renderDashboardBase(tab, `<div class="profile-layout" style="max-width:none"><aside class="profile-aside"><span class="aside-symbol">✳</span><h2>Your profile.</h2><p>Keep your details current to see relevant support.</p><button class="button button-light button-sm" data-action="eligibility">Edit profile <span>↗</span></button></aside><div class="profile-panel"><h2 class="panel-title">Account details</h2><p class="panel-subtitle">${escapeHtml(state.session.email)}</p>${profileFormMarkup(profile)}</div></div>`);
    }
  } catch (error) {
    renderDashboardBase(tab, `<div class="empty-state"><h3>This section couldn’t load.</h3><p>${escapeHtml(error.message)}</p><button class="detail-link" data-action="dashboard-tab" data-tab="${escapeHtml(tab)}">Try again ↗</button></div>`);
  }
}



