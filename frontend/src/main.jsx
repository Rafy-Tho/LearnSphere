import { QueryClientProvider } from "@tanstack/react-query";
import { createRoot } from "react-dom/client";
import { StrictMode, lazy, Suspense } from "react";
import App from "@/app/App";
import { queryClient } from "@/lib/queryClient";
import "@/index.css";

const ReactQueryDevtools = import.meta.env.DEV
  ? lazy(() =>
      import("@tanstack/react-query-devtools").then((module) => ({
        default: module.ReactQueryDevtools,
      })),
    )
  : null;

createRoot(document.getElementById("root")).render(
  <StrictMode>
    <QueryClientProvider client={queryClient}>
      <App />
      {ReactQueryDevtools && (
        <Suspense fallback={null}>
          <ReactQueryDevtools initialIsOpen={false} />
        </Suspense>
      )}
    </QueryClientProvider>
  </StrictMode>,
);
