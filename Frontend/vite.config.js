import { defineConfig } from "vite";

const apiProxy = {
  "/api": { target: "http://localhost:8080", changeOrigin: true }
};

export default defineConfig({
  base: "./",
  server: {
    host: "localhost",
    port: 5173,
    strictPort: true,
    proxy: apiProxy
  },
  preview: {
    host: "localhost",
    port: 5173,
    strictPort: true,
    proxy: apiProxy
  },
  build: {
    outDir: "dist",
    emptyOutDir: true,
    cssCodeSplit: true,
    sourcemap: false
  }
});
