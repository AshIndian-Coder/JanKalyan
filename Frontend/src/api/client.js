import { clearSession, state } from "../state/store.js";

const API_BASE = (import.meta.env?.VITE_API_BASE_URL ?? window.JANKALYAN_API_URL ?? "").replace(/\/$/, "");
const activeRequests = new Map();
const TIMEOUT_MS = 20000;

let apiStatus = "unknown";

export function getApiStatus() {
  return apiStatus;
}

function setApiStatus(status) {
  if (apiStatus === status) return;
  apiStatus = status;
  window.dispatchEvent(new CustomEvent("jankalyan:api-status", { detail: status }));
}

const STATUS_MESSAGES = {
  400: "The service rejected that request.",
  401: "Your session has expired. Please sign in again.",
  403: "You don’t have permission to open this area.",
  404: "We couldn’t find that record.",
  405: "That request isn’t supported by the service.",
  409: "That record already exists.",
  428: "Complete your profile before running an eligibility check.",
  500: "The service ran into a problem. Please try again shortly.",
  502: "The service is temporarily unavailable.",
  503: "The service is temporarily unavailable.",
  504: "The service took too long to respond."
};

function fieldDetails(payload) {
  const data = payload?.data;
  if (!data || typeof data !== "object" || Array.isArray(data)) return "";
  const entries = Object.entries(data).filter(([, value]) => typeof value === "string");
  if (!entries.length) return "";
  return entries.map(([field, message]) => `${field}: ${message}`).join(" · ");
}

function errorMessage(response, payload, rawText) {
  if (payload && typeof payload === "object") {
    if (payload.message) {
      const details = fieldDetails(payload);
      return details ? `${payload.message} (${details})` : payload.message;
    }
    const details = fieldDetails(payload);
    if (details) return details;
  }
  if (rawText && rawText.length < 180) return rawText.trim();
  return STATUS_MESSAGES[response.status] || `Request failed (${response.status}).`;
}

export async function request(path, options = {}) {
  const controller = new AbortController();
  const key = options.key;
  if (key && activeRequests.has(key)) activeRequests.get(key).abort();
  if (key) activeRequests.set(key, controller);
  const timeout = window.setTimeout(() => controller.abort(), TIMEOUT_MS);
  const headers = {
    Accept: "application/json",
    ...(options.body !== undefined ? { "Content-Type": "application/json" } : {}),
    ...(options.headers || {})
  };
  if (state.session?.token) headers.Authorization = `Bearer ${state.session.token}`;

  try {
    const response = await fetch(`${API_BASE}${path}`, {
      method: options.method || "GET",
      headers,
      body: options.body !== undefined ? JSON.stringify(options.body) : undefined,
      signal: controller.signal
    });

    const text = await response.text();
    let payload = null;
    if (text) {
      try { payload = JSON.parse(text); }
      catch (_) { payload = null; }
    }

    setApiStatus("online");

    if (response.status === 401) {
      if (!options.anonymous) {
        clearSession();
        window.dispatchEvent(new CustomEvent("jankalyan:session-expired"));
        const expired = new Error(STATUS_MESSAGES[401]);
        expired.silent = true;
        expired.sessionExpired = true;
        throw expired;
      }
      throw new Error(payload?.message || "Those sign-in details don’t match. Please try again.");
    }

    if (response.status === 403 && !options.anonymous && !payload && !options.admin) {
      clearSession();
      window.dispatchEvent(new CustomEvent("jankalyan:session-expired"));
      const expired = new Error(STATUS_MESSAGES[401]);
      expired.silent = true;
      expired.sessionExpired = true;
      throw expired;
    }

    if (!response.ok) throw new Error(errorMessage(response, payload, text));
    if (payload?.success === false) throw new Error(payload.message || "The request could not be completed.");
    if (payload && Object.prototype.hasOwnProperty.call(payload, "data")) return payload.data;
    return payload;
  } catch (error) {
    if (error.name === "AbortError") {
      if (key && activeRequests.get(key) !== controller) return null;
      throw new Error("The request took too long. Please try again.");
    }
    if (error instanceof TypeError) {
      setApiStatus("offline");
      throw new Error("Can’t reach JanKalyan right now. Check that the backend is running on port 8080, then try again.");
    }
    throw error;
  } finally {
    window.clearTimeout(timeout);
    if (key && activeRequests.get(key) === controller) activeRequests.delete(key);
  }
}
