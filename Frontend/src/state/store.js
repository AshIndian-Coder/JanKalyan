const STORAGE_KEY = "jankalyan.session.v1";

function readSession() {
  try {
    const session = JSON.parse(window.localStorage.getItem(STORAGE_KEY) || "null");
    return session && session.token && session.userId ? session : null;
  } catch (_) {
    return null;
  }
}

export const state = {
  session: readSession(),
  schemes: [],
  saved: [],
  savedLoaded: false,
  profile: null,
  currentDetail: null,
  dashboardTab: "applications",
  schemeQuery: "",
  schemeCategory: ""
};

export function clearSession() {
  state.session = null;
  state.profile = null;
  state.saved = [];
  state.savedLoaded = false;
  try { window.localStorage.removeItem(STORAGE_KEY); } catch (_) { }
}

export function setSession(data) {
  if (!data || !data.token || !data.userId) throw new Error("Sign in succeeded, but the account details were incomplete.");
  state.session = {
    token: data.token,
    userId: data.userId,
    fullName: data.fullName || "",
    email: data.email || "",
    role: data.role || "USER",
    profileComplete: Boolean(data.profileComplete)
  };
  try { window.localStorage.setItem(STORAGE_KEY, JSON.stringify(state.session)); }
  catch (_) { }
}

export function persistSession() {
  if (!state.session) return;
  try { window.localStorage.setItem(STORAGE_KEY, JSON.stringify(state.session)); }
  catch (_) { }
}

