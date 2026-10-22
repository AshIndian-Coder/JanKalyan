import { api as endpoints } from "../api/endpoints.js";
import { state } from "../state/store.js";
import { schemeId, schemeName, categoryName, description, schemeCard, savedIds } from "../components/scheme-card.js";
import { escapeHtml, asList } from "../utils/dom.js";
import { showLoading, showSkeletons } from "../components/toast.js";
import { refreshMotion } from "../utils/motion.js";

const FIELD_LABELS = {
  age: "Age",
  annual_income: "Annual family income",
  caste_category: "Caste category",
  date_of_birth: "Date of birth",
  disability_status: "Disability status",
  district: "District",
  education_level: "Education level",
  gender: "Gender",
  is_bpl: "BPL household",
  land_holding_acres: "Land holding",
  marital_status: "Marital status",
  occupation: "Occupation",
  state: "State"
};

const OPERATOR_LABELS = {
  "=": "is",
  "!=": "is not",
  "<": "below",
  "<=": "at most",
  ">": "above",
  ">=": "at least",
  IN: "is one of",
  BETWEEN: "between"
};

const VALUE_LABELS = {
  MALE: "Male", FEMALE: "Female", OTHER: "Other",
  GENERAL: "General", OBC: "OBC", SC: "SC", ST: "ST", EWS: "EWS",
  SINGLE: "Single", MARRIED: "Married", WIDOWED: "Widowed", DIVORCED: "Divorced",
  true: "Yes", false: "No", TRUE: "Yes", FALSE: "No"
};

const MONEY_FIELDS = new Set(["annual_income", "land_holding_acres"]);

function humanizeField(field) {
  return String(field || "")
    .replace(/_/g, " ")
    .replace(/([a-z])([A-Z])/g, "$1 $2")
    .replace(/^./, c => c.toUpperCase());
}

function humanizeValue(field, value) {
  if (value === null || value === undefined || value === "") return "any";
  const raw = String(value).trim();
  if (VALUE_LABELS[raw]) return VALUE_LABELS[raw];
  if (MONEY_FIELDS.has(field)) {
    const num = Number(raw);
    if (Number.isFinite(num)) return `₹${num.toLocaleString("en-IN")}${field === "landHoldingAcres" ? " acres" : ""}`;
  }
  return raw;
}

function criteriaList(criteria) {
  if (!criteria.length) return '<p class="form-hint">Check your profile to see if this scheme matches.</p>';
  return `<ul class="criteria-list">${criteria.map(item => {
    const field = item.fieldName || item.field || "";
    const label = FIELD_LABELS[field] || humanizeField(field);
    const operator = OPERATOR_LABELS[String(item.operator || "").toUpperCase()] || item.operator || "matches";
    const value = humanizeValue(field, item.value);
    const second = item.value2 ? humanizeValue(field, item.value2) : "";
    return `<li><span class="crit-label">${escapeHtml(label)}</span><span class="crit-op">${escapeHtml(operator)}</span><span class="crit-value">${escapeHtml(value)}${second ? ` – ${escapeHtml(second)}` : ""}</span></li>`;
  }).join("")}</ul>`;
}

function categoriesFrom(schemes) {
  return [...new Set(asList(schemes).map(s => s.category).filter(Boolean))].sort((a, b) => a.localeCompare(b));
}

function ensureCategories(select) {
  const categories = categoriesFrom(state.schemes);
  const key = categories.join("|");
  if (select.dataset.categoriesKey === key) return;
  const current = select.value;
  select.innerHTML = '<option value="">All categories</option>' + categories.map(c => `<option value="${escapeHtml(c)}">${escapeHtml(c)}</option>`).join("");
  select.value = categories.includes(current) ? current : "";
  select.dataset.categoriesKey = key;
}

export function renderSchemes() {
  const grid = document.getElementById("scheme-grid");
  const count = document.getElementById("scheme-count");
  if (!grid) return;
  const categorySelect = document.getElementById("scheme-category");
  if (categorySelect) ensureCategories(categorySelect);
  const query = (document.getElementById("scheme-search")?.value || state.schemeQuery).trim().toLocaleLowerCase();
  const activeCategory = categorySelect?.value || "";
  state.schemeQuery = query;
  state.schemeCategory = activeCategory;
  const visible = state.schemes.filter(scheme => {
    const text = [schemeName(scheme), scheme.category, scheme.department, scheme.description, ...asList(scheme.benefits), ...asList(scheme.documents)].join(" ").toLocaleLowerCase();
    return (!query || text.includes(query)) && (!activeCategory || scheme.category === activeCategory);
  });
  count.textContent = `${visible.length} ${visible.length === 1 ? "scheme" : "schemes"}`;
  grid.innerHTML = visible.length ? visible.map(schemeCard).join("") : '<div class="empty-state"><h3>No schemes found</h3><p>Try a different search or category.</p></div>';
  grid.removeAttribute("aria-busy");
  refreshMotion(grid);
}

export async function loadSchemes() {
  const grid = document.getElementById("scheme-grid");
  if (!grid) return;
  if (state.schemes.length) { renderSchemes(); return; }
  showSkeletons(grid, 6);
  try {
    const results = await endpoints.schemes();
    if (!results) return;
    state.schemes = asList(results);
    renderSchemes();
  } catch (error) {
    grid.removeAttribute("aria-busy");
    grid.innerHTML = `<div class="empty-state"><h3>We couldn’t load schemes</h3><p>${escapeHtml(error.message)}</p><button class="detail-link" data-action="retry-schemes">Try again ↗</button></div>`;
    document.getElementById("scheme-count").textContent = "Connection needed";
  }
}

export async function loadSchemeDetail(id) {
  state.currentDetail = null;
  const container = document.getElementById("scheme-detail-content");
  showLoading(container, "Loading scheme details…");
  try {
    const scheme = await endpoints.scheme(id);
    state.currentDetail = scheme;
    renderSchemeDetail(scheme);
  } catch (error) {
    container.innerHTML = `<div class="empty-state"><h3>Scheme details unavailable</h3><p>${escapeHtml(error.message)}</p><button class="detail-link" data-action="schemes">Back to schemes ↗</button></div>`;
  }
}

export function renderSchemeDetail(scheme) {
  const id = schemeId(scheme);
  const saved = savedIds().has(Number(id));
  const benefits = asList(scheme.benefits);
  const docs = asList(scheme.documents);
  const criteria = asList(scheme.criteria);
  document.getElementById("scheme-detail-content").innerHTML = `<div class="detail-wrap"><button class="back-link" data-action="schemes">← &nbsp;All schemes</button><section class="detail-hero"><span class="scheme-category">${escapeHtml(categoryName(scheme))}</span><h1>${escapeHtml(schemeName(scheme))}</h1><p>${escapeHtml(scheme.description || "")}</p><p>${escapeHtml(scheme.department || "")}${scheme.state ? ` · ${escapeHtml(scheme.state)}` : ""}</p></section><section class="detail-content"><div class="detail-columns"><div><h2>Benefits</h2>${benefits.length ? `<ul>${benefits.map(item => `<li>${escapeHtml(item)}</li>`).join("")}</ul>` : `<p class="form-hint">Benefit details are not listed for this scheme.</p>`}<h2>Eligibility</h2>${criteriaList(criteria)}</div><div><h2>Documents to prepare</h2>${docs.length ? `<ul>${docs.map(item => `<li>${escapeHtml(item)}</li>`).join("")}</ul>` : `<p class="form-hint">Check the official portal for document requirements.</p>`}<h2>Scheme details</h2><ul><li>Level: ${escapeHtml(scheme.level || "Not specified")}</li><li>Department: ${escapeHtml(scheme.department || "Not specified")}</li></ul></div></div><div class="detail-actions"><button class="button button-dark" data-action="apply" data-id="${escapeHtml(id)}">Continue to apply <span>↗</span></button><button class="button button-outline" data-action="save-scheme" data-id="${escapeHtml(id)}">${saved ? "♥ Saved" : "♡ Save scheme"}</button><button class="button button-outline" data-action="eligibility">Check my eligibility</button></div></section></div>`;
  refreshMotion(document.getElementById("scheme-detail-content"));
}