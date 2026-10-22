import { request } from "./client.js";
import { state } from "../state/store.js";

const id = value => encodeURIComponent(value);

function requireUserId() {
  const value = state.session?.userId;
  if (!value) throw new Error("Please sign in again before continuing.");
  return encodeURIComponent(value);
}

export const api = {
  login: body => request("/api/auth/login", { method: "POST", body, anonymous: true }),
  register: body => request("/api/auth/register", { method: "POST", body, anonymous: true }),
  ping: () => request("/api/schemes/category/__connectivity_probe__", { key: "ping" }),
  schemes: () => request("/api/schemes", { key: "schemes" }),
  scheme: schemeId => request(`/api/schemes/${id(schemeId)}`),
  getProfile: () => request("/api/profile/me", { key: "profile" }),
  saveProfile: body => request(`/api/profile/${requireUserId()}`, { method: "PUT", body }),
  checkEligibility: () => request("/api/eligibility/check/me", { method: "POST", key: "eligibility" }),

  applications: () => request("/api/apply/my-applications", { key: "applications" }),
  redirectApply: schemeId => request(`/api/apply/redirect/${id(schemeId)}?userId=${requireUserId()}`, { method: "POST" }),
  updateStatus: (trackingId, status) => request(`/api/apply/status/${id(trackingId)}`, { method: "PUT", body: { status } }),

  saved: () => request("/api/saved/my-saved", { key: "saved" }),
  save: schemeId => request(`/api/saved/${id(schemeId)}?userId=${requireUserId()}`, { method: "POST" }),
  unsave: schemeId => request(`/api/saved/${id(schemeId)}?userId=${requireUserId()}`, { method: "DELETE" }),

  notifications: () => request("/api/notifications/my-notifications", { key: "notifications" }),
  markRead: notificationId => request(`/api/notifications/${id(notificationId)}/read`, { method: "PUT" }),
  markAllRead: () => request(`/api/notifications/${requireUserId()}/read-all`, { method: "PUT" }),

  adminStats: () => request("/api/admin/dashboard/stats", { key: "admin-stats", admin: true }),
  sync: () => request("/api/admin/sync/trigger", { method: "POST", admin: true }),
  syncLogs: () => request("/api/admin/sync/logs", { key: "sync-logs", admin: true }),
  createScheme: body => request("/api/admin/schemes", { method: "POST", body, admin: true }),
  updateScheme: (schemeId, body) => request(`/api/admin/schemes/${id(schemeId)}`, { method: "PUT", body, admin: true }),
  deleteScheme: schemeId => request(`/api/admin/schemes/${id(schemeId)}`, { method: "DELETE", admin: true })
};
