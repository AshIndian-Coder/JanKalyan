import { api as endpoints } from "../api/endpoints.js";
import { state, persistSession } from "../state/store.js";
import { escapeHtml, asList } from "../utils/dom.js";
import { schemeId, schemeName } from "../components/scheme-card.js";
import { toast, reportError } from "../components/toast.js";
import { refreshMotion } from "../utils/motion.js";

const fieldOptions = {
  gender: ["MALE", "FEMALE", "OTHER"], casteCategory: ["GENERAL", "OBC", "SC", "ST", "EWS"],
  maritalStatus: ["SINGLE", "MARRIED", "WIDOWED", "DIVORCED"]
};

const PROFILE_FIELDS = ["dateOfBirth", "gender", "state", "district", "annualIncome", "casteCategory", "occupation", "educationLevel", "isBpl", "disabilityStatus", "maritalStatus", "landHoldingAcres"];

function completeness(profile = {}) {
  const filled = PROFILE_FIELDS.filter(field => {
    const value = profile[field];
    return value !== null && value !== undefined && value !== "";
  }).length;
  return { filled, total: PROFILE_FIELDS.length };
}

function inputField(label, name, type = "text", value = "", hint = "") {
  const safeValue = escapeHtml(value);
  if (fieldOptions[name]) return `<div class="form-field"><label for="profile-${name}">${label}</label><select id="profile-${name}" name="${name}"><option value="">Select</option>${fieldOptions[name].map(option => `<option value="${option}" ${value === option ? "selected" : ""}>${option.charAt(0) + option.slice(1).toLowerCase()}</option>`).join("")}</select></div>`;
  if (name === "isBpl" || name === "disabilityStatus") {
    const answer = value === true || value === "true" ? "true" : "false";
    return `<div class="form-field"><label for="profile-${name}">${label}</label><select id="profile-${name}" name="${name}"><option value="true" ${answer === "true" ? "selected" : ""}>Yes</option><option value="false" ${answer === "false" ? "selected" : ""}>No</option></select></div>`;
  }
  return `<div class="form-field"><label for="profile-${name}">${label}</label><input id="profile-${name}" name="${name}" type="${type}" value="${safeValue}" ${hint ? `placeholder="${escapeHtml(hint)}"` : ""} ${type === "number" ? 'min="0" step="any"' : ""}></div>`;
}

export function profileFormMarkup(profile = {}) {
  const { filled, total } = completeness(profile);
  const pct = Math.round((filled / total) * 100);
  const note = filled === total
    ? "Your profile is complete — matches are checked against every criterion."
    : `${filled} of ${total} details filled. A scheme matches only when every rule it carries can be checked, so blank fields can hide a match.`;
  return `<form id="profile-form"><h2 class="panel-title">Your profile</h2><p class="panel-subtitle">Add the details you’re comfortable sharing. You can update these at any time.</p><div class="profile-progress"><span class="profile-progress-bar"><i style="--pct:${pct}%"></i></span><span class="profile-progress-note">${escapeHtml(note)}</span></div><div class="form-grid">${inputField("Date of birth", "dateOfBirth", "date", profile.dateOfBirth || "")}${inputField("Gender", "gender", "select", profile.gender || "")}${inputField("State", "state", "text", profile.state || "", "e.g. Maharashtra")}${inputField("District", "district", "text", profile.district || "")}${inputField("Annual family income (₹)", "annualIncome", "number", profile.annualIncome ?? "")}${inputField("Caste category", "casteCategory", "select", profile.casteCategory || "")}${inputField("Occupation", "occupation", "text", profile.occupation || "", "e.g. Farmer, student")}${inputField("Education level", "educationLevel", "text", profile.educationLevel || "")}${inputField("BPL household", "isBpl", "select", profile.isBpl ?? "")}${inputField("Disability status", "disabilityStatus", "select", profile.disabilityStatus ?? "")}${inputField("Marital status", "maritalStatus", "select", profile.maritalStatus || "")}${inputField("Land holding (acres)", "landHoldingAcres", "number", profile.landHoldingAcres ?? "")}</div><div class="form-actions"><span class="form-hint">Only saved to your JanKalyan account.</span><button type="submit" class="button button-dark button-sm">Save & check schemes <span>↗</span></button></div></form>`;
}

export async function renderProfile() {
  const panel = document.getElementById("profile-panel");
  const results = document.getElementById("eligibility-results");
  results.hidden = true;
  if (!state.session) {
    panel.innerHTML = `<div class="notice">Sign in or create an account to build your profile and check eligibility.</div><h2 class="panel-title">Your account is the starting point.</h2><p class="panel-subtitle">Your profile is saved securely so you can return to your results and applications.</p><div class="form-actions"><button class="button button-dark" data-action="login">Sign in <span>↗</span></button><button class="button button-dark button-sm" data-action="register">Create account <span>↗</span></button></div>`;
    return;
  }
  panel.innerHTML = profileFormMarkup(state.profile || {});
  try {
    const profile = await endpoints.getProfile();
    if (!profile) return;
    state.profile = profile || {};
    panel.innerHTML = profileFormMarkup(state.profile);
  } catch (error) {
    if (!/404|not found|no profile|profile/i.test(error.message)) reportError(error);
  }
}

function profilePayload(form) {
  const data = Object.fromEntries(new FormData(form).entries());
  ["annualIncome", "landHoldingAcres"].forEach(key => { data[key] = data[key] === "" ? null : Number(data[key]); });
  ["isBpl", "disabilityStatus"].forEach(key => { data[key] = data[key] === "" ? null : data[key] === "true"; });
  Object.keys(data).forEach(key => { if (data[key] === "") data[key] = null; });
  return data;
}

export async function submitProfile(form) {
  if (!state.session) { location.hash = "auth"; window.dispatchEvent(new CustomEvent("jankalyan:auth-view", { detail: "login" })); return; }
  const submit = form.querySelector('[type="submit"]');
  submit.disabled = true; submit.textContent = "Saving your profile…";
  try {
    state.profile = await endpoints.saveProfile(profilePayload(form));
    state.session.profileComplete = true;
    persistSession();
    if (document.getElementById("dashboard").classList.contains("active")) {
      toast("Your profile has been updated.");
      window.dispatchEvent(new CustomEvent("jankalyan:profile-saved"));
      return;
    }
    toast("Profile saved. Checking your eligibility…");
    const matched = await endpoints.checkEligibility();
    renderEligibilityResults(asList(matched));
  } catch (error) {
    reportError(error);
    submit.disabled = false; submit.innerHTML = 'Save & check schemes <span>↗</span>';
  }
}

export function renderEligibilityResults(results) {
  const container = document.getElementById("eligibility-results");
  container.hidden = false;
  container.innerHTML = `<h2 class="results-title">${results.length ? "Worth exploring." : "Keep looking."}</h2><p class="results-copy">${results.length ? `We found ${results.length} scheme${results.length === 1 ? "" : "s"} that may fit your profile. Review each scheme’s official criteria before applying.` : "No matching schemes came up for your profile this time. You can update your details or browse every available scheme."}</p>${results.length ? `<div class="result-grid">${results.map(result => {
    const raw = Number(result.matchPercentage);
    const pct = Number.isFinite(raw) ? Math.max(0, Math.min(100, Math.round(raw))) : null;
    return `<article class="result-card"><span class="match-label">${pct !== null ? `${escapeHtml(pct)}% PROFILE MATCH` : escapeHtml(result.category || "POSSIBLE MATCH")}</span>${pct !== null ? `<span class="match-meter" role="img" aria-label="${escapeHtml(pct)} percent profile match"><span style="--pct:${pct}%"></span></span>` : ""}<h3>${escapeHtml(schemeName(result))}</h3><p>${escapeHtml(result.description || result.department || "")}</p><p>${asList(result.benefits).map(escapeHtml).join(" · ")}</p><button class="detail-link" data-action="scheme-detail" data-id="${escapeHtml(schemeId(result))}">Review scheme <span>↗</span></button></article>`;
  }).join("")}</div>` : '<button class="button button-dark" data-action="schemes">Explore all schemes <span>↗</span></button>'}`;
  refreshMotion(container);
  container.scrollIntoView({ behavior: "smooth", block: "start" });
}

