let initialized = false;
let revealObserver;
let chapterObserver;
let frame = 0;
let pointer = { x: 50, y: 50 };
let dolly = 0;
const parallaxElements = [];
let heroRail = null;

const REDUCED = () => window.matchMedia("(prefers-reduced-motion: reduce)").matches;

function collectParallax() {
  parallaxElements.length = 0;
  document.querySelectorAll("[data-depth]").forEach(layer => {
    const depth = Number(layer.dataset.depth || 0);
    if (depth) parallaxElements.push({ el: layer, depth });
  });
}

function revealTargets(root = document) {
  const targets = root.querySelectorAll("[data-story], .journey-card, .feature-art, .scheme-card, .result-card, .application-item, .notification-item, .admin-stat, .admin-scheme-row, .sync-log-row, .detail-hero, .detail-content");
  targets.forEach((element, index) => {
    if (!element.hasAttribute("data-reveal")) element.dataset.reveal = "";
    element.style.setProperty("--reveal-delay", `${Math.min(index % 4, 3) * 75}ms`);
    if (revealObserver) revealObserver.observe(element);
    else element.classList.add("is-revealed");
    if (chapterObserver && element.dataset.story) chapterObserver.observe(element);
  });
}

function updatePointerLayers() {
  const heroPage = document.getElementById("home")?.classList.contains("active");
  const reduced = REDUCED();
  for (const { el, depth } of parallaxElements) {
    const inHero = !!el.closest("#home");
    if (!heroPage || !inHero || reduced) { el.style.transform = "none"; continue; }
    const mx = (pointer.x - 50) * depth * 0.12;
    const my = (pointer.y - 50) * depth * 0.12;
    const scale = 1 + depth * 0.02 + dolly * 0.05;
    el.style.transform = `translate3d(${mx.toFixed(2)}px,${my.toFixed(2)}px,0) scale(${scale.toFixed(4)})`;
  }
}

function updateScrollScene() {
  frame = 0;
  const scrollable = document.documentElement.scrollHeight - window.innerHeight;
  const progress = scrollable > 0 ? Math.min(1, Math.max(0, window.scrollY / scrollable)) : 0;
  document.documentElement.style.setProperty("--page-progress", `${progress}`);

  const topbar = document.querySelector(".topbar");
  topbar?.classList.toggle("is-scrolled", window.scrollY > 12);

  const heroPage = document.getElementById("home")?.classList.contains("active");
  if (heroPage && !REDUCED()) {
    dolly = Math.min(1, Math.max(0, window.scrollY / (window.innerHeight * 1.1)));
  } else dolly = 0;

  updatePointerLayers();

  if (heroRail) {
    const activeId = heroPage
      ? [...document.querySelectorAll("#home [data-story]")].find(section => {
          const r = section.getBoundingClientRect();
          return r.top <= window.innerHeight * 0.5 && r.bottom > window.innerHeight * 0.5;
        })?.id
      : null;
    heroRail.querySelectorAll("[data-target]").forEach(link => {
      const isActive = link.dataset.target === (activeId || "home");
      link.classList.toggle("active", isActive);
      if (isActive) link.setAttribute("aria-current", "step");
      else link.removeAttribute("aria-current");
    });
  }
}

export function refreshMotion(root = document) {
  collectParallax();
  revealTargets(root);
  updatePointerLayers();
  if (!frame) frame = window.requestAnimationFrame(updateScrollScene);
}

function onPointerMove(event) {
  pointer.x = (event.clientX / window.innerWidth) * 100;
  pointer.y = (event.clientY / window.innerHeight) * 100;
  document.documentElement.style.setProperty("--pointer-x", `${pointer.x.toFixed(2)}%`);
  document.documentElement.style.setProperty("--pointer-y", `${pointer.y.toFixed(2)}%`);
  if (!frame) frame = window.requestAnimationFrame(updateScrollScene);
}

export function initMotion() {
  if (initialized) return;
  initialized = true;
  heroRail = document.querySelector(".story-rail");
  if ("IntersectionObserver" in window && !REDUCED()) {
    revealObserver = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (!entry.isIntersecting) return;
        entry.target.classList.add("is-revealed");
        revealObserver.unobserve(entry.target);
      });
    }, { threshold: 0.12, rootMargin: "0px 0px -6% 0px" });
  }
  revealTargets();
  window.addEventListener("scroll", () => {
    if (!frame) frame = window.requestAnimationFrame(updateScrollScene);
  }, { passive: true });
  window.addEventListener("resize", () => {
    if (!frame) frame = window.requestAnimationFrame(updateScrollScene);
  }, { passive: true });
  window.addEventListener("mousemove", onPointerMove, { passive: true });
  window.matchMedia("(prefers-reduced-motion: reduce)").addEventListener?.("change", () => {
    document.documentElement.style.removeProperty("--hero-dolly");
    document.documentElement.style.removeProperty("--scene-drift");
    if (REDUCED()) updateScrollScene();
  });
  updateScrollScene();
}

export function pageEnter(element) {
  if (!element || REDUCED()) return;
  element.classList.remove("page-exit");
  element.classList.add("page-enter");
  window.setTimeout(() => element.classList.remove("page-enter"), 1100);
}

export function pageExit(element) {
  if (!element || REDUCED()) return;
  element.classList.remove("page-enter");
  element.classList.add("page-exit");
}
