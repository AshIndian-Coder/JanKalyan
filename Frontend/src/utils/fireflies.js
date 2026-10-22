let active = false;
let rafId = 0;
let particles = [];
let ctx = null;
let canvas = null;
let sprite = null;
let width = 0;
let height = 0;
let dpr = 1;
let pointer = { x: -9999, y: -9999 };
let clientPointer = { x: -9999, y: -9999 };
let running = false;
let intersectionObserver = null;
let resizeObserver = null;
let lastTime = 0;

const REDUCED = () => window.matchMedia("(prefers-reduced-motion: reduce)").matches;

function makeSprite() {
  const size = 64;
  const off = document.createElement("canvas");
  off.width = size;
  off.height = size;
  const sctx = off.getContext("2d");
  const grad = sctx.createRadialGradient(size / 2, size / 2, 0, size / 2, size / 2, size / 2);
  grad.addColorStop(0, "rgba(240,235,190,0.9)");
  grad.addColorStop(0.25, "rgba(228,226,160,0.55)");
  grad.addColorStop(0.6, "rgba(216,227,154,0.18)");
  grad.addColorStop(1, "rgba(216,227,154,0)");
  sctx.fillStyle = grad;
  sctx.fillRect(0, 0, size, size);
  return off;
}

function seed() {
  const target = Math.min(64, Math.max(22, Math.round((width * height) / 26000)));
  particles = Array.from({ length: target }, () => ({
    x: Math.random() * width,
    y: Math.random() * height,
    vx: (Math.random() - 0.5) * 6,
    vy: -3 - Math.random() * 7,
    depth: 0.35 + Math.random() * 0.65,
    size: 1.6 + Math.random() * 3.4,
    phase: Math.random() * Math.PI * 2,
    breathe: 0.5 + Math.random() * 0.9,
    alpha: 0.25 + Math.random() * 0.5
  }));
}

function resize() {
  if (!canvas) return;
  const rect = canvas.getBoundingClientRect();
  if (!rect.width || !rect.height) return;
  dpr = Math.min(2, window.devicePixelRatio || 1);
  width = rect.width;
  height = rect.height;
  canvas.width = Math.round(width * dpr);
  canvas.height = Math.round(height * dpr);
  ctx = canvas.getContext("2d");
  ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
  if (!particles.length || particles.length < 12) seed();
}

function drawFrame(time) {
  if (!ctx) return;
  const rect = canvas.getBoundingClientRect();
  pointer.x = clientPointer.x - rect.left;
  pointer.y = clientPointer.y - rect.top;
  const dt = lastTime ? Math.min(0.05, (time - lastTime) / 1000) : 0.016;
  lastTime = time;
  ctx.clearRect(0, 0, width, height);
  ctx.globalCompositeOperation = "lighter";
  for (const p of particles) {
    p.phase += p.breathe * dt * 2.2;
    p.x += (p.vx + Math.sin(p.phase * 0.8) * 3) * dt;
    const px = pointer.x;
    const py = pointer.y;
    const dx = px - p.x;
    const dy = py - p.y;
    const dist2 = dx * dx + dy * dy;
    if (dist2 < 32000) {
      const pull = (1 - dist2 / 32000) * 26;
      const inv = 1 / Math.max(1, Math.sqrt(dist2));
      p.x += dx * inv * pull * dt;
      p.y += dy * inv * pull * dt;
    }
    p.y += (p.vy - Math.cos(p.phase * 0.6) * 2) * dt;
    if (p.y < -20) { p.y = height + 14; p.x = Math.random() * width; }
    if (p.x < -20) p.x = width + 12;
    if (p.x > width + 20) p.x = -12;
    const wobble = 0.55 + 0.45 * Math.sin(p.phase * 1.7);
    const size = p.size * (5 + p.depth * 5) * (0.8 + 0.2 * wobble);
    ctx.globalAlpha = p.alpha * wobble;
    const jitterX = (pointer.x > -999 ? (pointer.x - width / 2) * -0.012 * p.depth : 0);
    const jitterY = (pointer.y > -999 ? (pointer.y - height / 2) * -0.012 * p.depth : 0);
    ctx.drawImage(sprite, p.x + jitterX - size / 2, p.y + jitterY - size / 2, size, size);
  }
  ctx.globalAlpha = 1;
  ctx.globalCompositeOperation = "source-over";
}

function loop(time) {
  if (!running) return;
  drawFrame(time);
  rafId = requestAnimationFrame(loop);
}

function start() {
  if (running || REDUCED() || document.hidden) return;
  resize();
  lastTime = 0;
  running = true;
  rafId = requestAnimationFrame(loop);
}

function stop() {
  running = false;
  if (rafId) cancelAnimationFrame(rafId);
  rafId = 0;
}

function onPointerMove(event) {
  clientPointer.x = event.clientX;
  clientPointer.y = event.clientY;
}

function onPointerLeave() {
  clientPointer.x = -9999;
  clientPointer.y = -9999;
}

function onVisibilityChange() {
  if (document.hidden) stop();
  else if (active && !REDUCED()) start();
}

function renderStill() {
  resize();
  if (!ctx) return;
  for (const p of particles) {
    const size = p.size * (5 + p.depth * 5);
    ctx.globalAlpha = p.alpha * 0.7;
    ctx.drawImage(sprite, p.x - size / 2, p.y - size / 2, size, size);
  }
  ctx.globalAlpha = 1;
}

export function startFireflies(target) {
  canvas = typeof target === "string" ? document.querySelector(target) : target;
  if (!canvas || canvas.dataset.firefliesBound) return;
  canvas.dataset.firefliesBound = "true";
  sprite = makeSprite();
  ctx = canvas.getContext("2d");
  if (REDUCED()) { canvas.classList.add("is-still"); seed(); renderStill(); return; }
  resize();
  seed();
  active = true;
  canvas.classList.add("is-lit");
  window.addEventListener("pointermove", onPointerMove, { passive: true });
  window.addEventListener("pointerdown", onPointerMove, { passive: true });
  document.documentElement.addEventListener("pointerleave", onPointerLeave, { passive: true });
  document.addEventListener("visibilitychange", onVisibilityChange);
  if ("ResizeObserver" in window) {
    resizeObserver = new ResizeObserver(() => { resize(); if (!running) renderStill(); });
    resizeObserver.observe(canvas);
  } else {
    window.addEventListener("resize", resize, { passive: true });
  }
  if ("IntersectionObserver" in window) {
    intersectionObserver = new IntersectionObserver(entries => {
      entries.forEach(entry => { entry.isIntersecting ? start() : stop(); });
    }, { threshold: 0 });
    intersectionObserver.observe(canvas);
  } else {
    start();
  }
}
