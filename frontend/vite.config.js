import { defineConfig } from "vite";
import { fileURLToPath, URL } from "node:url";
import react from "@vitejs/plugin-react";
import tailwindcss from "@tailwindcss/vite";
// https://vite.dev/config/
export default defineConfig({
  plugins: [react(), tailwindcss()],
  resolve: {
    alias: {
      "@": fileURLToPath(new URL("./src", import.meta.url)),
    },
  },
  build: {
    chunkSizeWarningLimit: 700,
    rollupOptions: {
      output: {
        manualChunks(id) {
          if (!id.includes("node_modules")) return undefined;
          const path = id.replace(/\\/g, "/");
          if (path.includes("/swiper/")) return "swiper";
          if (path.includes("/@tanstack/react-query/")) return "query";
          if (path.includes("/lucide-react/")) return "icons";
          if (
            path.includes("/react-router") ||
            path.includes("/react-dom/") ||
            path.includes("/react/") ||
            path.includes("/scheduler/")
          ) {
            return "react-vendor";
          }
          return undefined;
        },
      },
    },
  },
});
