export function toast(message, type = "") {
  const region = document.getElementById("toast-region");
  if (!region) return;
  const item = document.createElement("div");
  item.className = `toast ${type}`.trim();
  item.setAttribute("role", type === "error" ? "alert" : "status");
  item.textContent = String(message == null ? "" : message);
  region.appendChild(item);
  let removed = false;
  const dismiss = () => {
    if (removed) return;
    removed = true;
    window.clearTimeout(timer);
    item.classList.add("is-leaving");
    window.setTimeout(() => item.remove(), 320);
  };
  const timer = window.setTimeout(dismiss, 4200);
  item.addEventListener("click", dismiss);
}

export function reportError(error) {
  if (!error || error.silent) return;
  toast(error.message || "Something went wrong. Please try again.", "error");
}

export function showLoading(container, message = "Loading…") {
  if (!container) return;
  container.removeAttribute("aria-busy");
  container.innerHTML = `<div class="loading" role="status"><span class="spinner" aria-hidden="true"></span>${escapeHtml(message)}</div>`;
}

export function skeletons(count = 6, variant = "cards") {
  const unit = variant === "rows"
    ? '<div class="skeleton-row"><span class="sk sk-avatar"></span><span class="sk sk-text"></span><span class="sk sk-pill"></span></div>'
    : '<div class="skeleton-card"><span class="sk sk-chip"></span><span class="sk sk-title"></span><span class="sk sk-line"></span><span class="sk sk-line sk-short"></span></div>';
  return `<div class="skeleton-wrap" aria-hidden="true">${Array.from({ length: count }, () => unit).join("")}</div>`;
}

export function showSkeletons(container, count = 6, variant = "cards") {
  if (!container) return;
  container.setAttribute("aria-busy", "true");
  container.innerHTML = skeletons(count, variant);
}