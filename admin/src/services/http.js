const BASE_URL = import.meta.env.VITE_BASE_URL;

// Central fetch wrapper for the admin app: always sends credentials and the
// `X-Requested-With` CSRF-guard header. FormData uploads keep the browser-set
// multipart boundary (no explicit Content-Type).
export function apiFetch(url, options = {}) {
  const requestUrl = url.startsWith("http") ? url : `${BASE_URL}${url}`;
  const isFormData = options.body instanceof FormData;

  const headers = {
    "X-Requested-With": "XMLHttpRequest",
    ...(options.headers || {}),
  };

  if (isFormData) {
    delete headers["Content-Type"];
  } else if (!headers["Content-Type"]) {
    headers["Content-Type"] = "application/json";
  }

  return fetch(requestUrl, {
    credentials: "include",
    ...options,
    headers,
  });
}
