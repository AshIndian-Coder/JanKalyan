export function escapeHtml(value) {
  return String(value == null ? "" : value).replace(/[&<>"']/g, char => ({
    "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;"
  })[char]);
}

export function asList(value) { return Array.isArray(value) ? value : []; }

export function safeClassName(value) {
  return String(value || "").toLowerCase().replace(/[^a-z0-9_-]/g, "");
}

export function safeExternalUrl(value) {
  try {
    const url = new URL(value);
    return url.protocol === "https:" || url.protocol === "http:" ? url.href : "";
  } catch (_) { return ""; }
}

