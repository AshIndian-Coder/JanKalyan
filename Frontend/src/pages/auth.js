import { api as endpoints } from "../api/endpoints.js";
import { setSession } from "../state/store.js";
import { refreshMotion } from "../utils/motion.js";
import { toast } from "../components/toast.js";

export function renderAuth(mode = "login") {
  const register = mode === "register";
  const container = document.getElementById("auth-content");
  container.innerHTML = `<div class="auth-card"><div class="section-kicker">${register ? "Begin with one step" : "Welcome back"}</div><h1>${register ? "Create your account." : "Good to see you."}</h1><p>${register ? "A single profile helps you find the support that fits." : "Sign in to see your profile, saved schemes and applications."}</p><div id="auth-error" class="notice error" hidden></div><form id="auth-form" data-mode="${register ? "register" : "login"}">${register ? `<div class="form-field"><label for="auth-name">Full name</label><input id="auth-name" name="fullName" type="text" required minlength="2" maxlength="100" autocomplete="name" placeholder="Your full name"></div>` : ""}<div class="form-field"><label for="auth-email">Email address</label><input id="auth-email" name="email" type="email" required maxlength="100" autocomplete="email" placeholder="you@example.com"></div>${register ? `<div class="form-field"><label for="auth-phone">Mobile number <span class="form-hint">(optional)</span></label><input id="auth-phone" name="phone" type="tel" inputmode="numeric" maxlength="10" pattern="^[6-9][0-9]{9}$" title="Enter a 10-digit Indian mobile number starting with 6, 7, 8 or 9" autocomplete="tel" placeholder="10-digit Indian number"></div>` : ""}<div class="form-field"><label for="auth-password">Password</label><input id="auth-password" name="password" type="password" required ${register ? 'minlength="8"' : ""} autocomplete="${register ? "new-password" : "current-password"}" placeholder="${register ? "At least 8 characters" : "Your password"}"></div><button type="submit" class="button button-dark">${register ? "Create my account" : "Sign in securely"}<span>↗</span></button></form><p class="form-hint" style="margin-top:18px">${register ? "Already have an account?" : "New to JanKalyan?"} <button class="auth-switch" data-action="${register ? "login" : "register"}">${register ? "Sign in" : "Create an account"}</button></p></div>`;
  refreshMotion(container);
}

export async function submitAuth(form) {
  const mode = form.dataset.mode;
  const button = form.querySelector('[type="submit"]');
  button.disabled = true; button.textContent = mode === "register" ? "Creating your account…" : "Signing in…";
  const values = Object.fromEntries(new FormData(form).entries());
  const payload = { ...values };
  Object.keys(payload).forEach(key => {
    if (payload[key] === "") delete payload[key];
  });
  try {
    const result = mode === "register" ? await endpoints.register(payload) : await endpoints.login(payload);
    setSession(result);
    window.dispatchEvent(new CustomEvent("jankalyan:session-updated"));
    toast(mode === "register" ? "Your account is ready." : `Welcome back${result.fullName ? `, ${result.fullName.split(" ")[0]}` : ""}.`);
    location.hash = result.role === "ADMIN" ? "admin" : result.profileComplete ? "dashboard" : "eligibility";
  } catch (error) {
    const message = document.getElementById("auth-error");
    message.hidden = false; message.textContent = error.message;
    button.disabled = false; button.innerHTML = `${mode === "register" ? "Create my account" : "Sign in securely"}<span>↗</span>`;
  }
}

