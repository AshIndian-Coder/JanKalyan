import { state } from "../state/store.js";
import { escapeHtml, asList } from "../utils/dom.js";

export function schemeId(scheme) { return scheme && (scheme.schemeId ?? scheme.id); }
export function schemeName(scheme) { return scheme && (scheme.schemeName || scheme.name) || "Untitled scheme"; }
export function categoryName(scheme) { return scheme && (scheme.category || scheme.level) || "Government support"; }
export function description(scheme) { return scheme && (scheme.description || scheme.department) || "Explore the details and find out how this program may support you."; }
export function savedIds() { return new Set(asList(state.saved).map(item => Number(schemeId(item)))); }

export function schemeCard(scheme) {
  const id = schemeId(scheme);
  const saved = savedIds().has(Number(id));
  return `<article class="scheme-card" data-reveal><div class="scheme-top"><span class="scheme-category">${escapeHtml(categoryName(scheme))}</span><button class="save-button ${saved ? "saved" : ""}" data-action="save-scheme" data-id="${escapeHtml(id)}" aria-label="${saved ? "Remove saved scheme" : "Save scheme"}">${saved ? "♥" : "♡"}</button></div><h3>${escapeHtml(schemeName(scheme))}</h3><p>${escapeHtml(description(scheme))}</p><div class="scheme-bottom"><span class="scheme-dept">${escapeHtml(scheme.department || scheme.state || "Explore benefits and eligibility")}</span><button class="detail-link" data-action="scheme-detail" data-id="${escapeHtml(id)}">View details <span>↗</span></button></div></article>`;
}

