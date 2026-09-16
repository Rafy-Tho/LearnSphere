import { clearUserQueries } from "@/lib/queryClient";

const BASE_URL = import.meta.env.VITE_BASE_URL;
const AUTH_PATHS = ["/login", "/signup", "/reset-password"];

export class ApiError extends Error {
  constructor(message, { statusCode = null, data = null } = {}) {
    super(message);
    this.name = "ApiError";
    this.statusCode = statusCode;
    this.data = data;
  }
}

export function buildQuery(params) {
  if (!params) return "";

  if (params instanceof URLSearchParams) {
    const queryString = params.toString();
    return queryString ? `?${queryString}` : "";
  }

  const searchParams = new URLSearchParams();
  const append = (key, value) => {
    if (value === undefined || value === null || value === "") return;
    if (Array.isArray(value)) {
      value.forEach((item) => append(key, item));
      return;
    }
    if (typeof value === "object") {
      Object.entries(value).forEach(([operator, operand]) =>
        append(`${key}[${operator}]`, operand),
      );
      return;
    }
    searchParams.append(key, String(value));
  };

  Object.entries(params).forEach(([key, value]) => append(key, value));
  const queryString = searchParams.toString();
  return queryString ? `?${queryString}` : "";
}

async function parseBody(response) {
  if (response.status === 204) return null;
  const text = await response.text();
  if (!text) return null;
  try {
    return JSON.parse(text);
  } catch {
    return null;
  }
}

class ApiClient {
  constructor(baseURL) {
    this.baseURL = baseURL;
  }

  async requestRaw(endpoint, options = {}) {
    const { method = "GET", body, headers, signal } = options;
    const url = `${this.baseURL}${endpoint}`;
    const isFormData = body instanceof FormData;

    const config = {
      method,
      credentials: "include",
      headers: {
        "X-Requested-With": "XMLHttpRequest",
        ...(isFormData ? {} : { "Content-Type": "application/json" }),
        ...headers,
      },
      ...(body === undefined ? {} : { body }),
      ...(signal ? { signal } : {}),
    };

    const response = await fetch(url, config);
    const payload = await parseBody(response);

    if (
      response.status === 401 &&
      !AUTH_PATHS.some((path) => window.location.pathname.startsWith(path))
    ) {
      clearUserQueries();
      setTimeout(() => (window.location.href = "/login"), 0);
    }

    if (!response.ok) {
      throw new ApiError(payload?.message || "Something went wrong", {
        statusCode: response.status,
        data: payload?.data ?? null,
      });
    }

    return payload;
  }

  async request(endpoint, options = {}) {
    const payload = await this.requestRaw(endpoint, options);
    return payload?.data ?? null;
  }

  get(endpoint, options) {
    return this.request(endpoint, { ...options, method: "GET" });
  }

  getPaginated(endpoint, options) {
    return this.requestRaw(endpoint, { ...options, method: "GET" }).then(
      (payload) => ({
        data: payload?.data ?? null,
        pagination: payload?.pagination ?? null,
      }),
    );
  }

  post(endpoint, payload, options) {
    return this.request(endpoint, {
      ...options,
      method: "POST",
      body: payload === undefined ? undefined : JSON.stringify(payload),
    });
  }

  patch(endpoint, payload, options) {
    return this.request(endpoint, {
      ...options,
      method: "PATCH",
      body: payload === undefined ? undefined : JSON.stringify(payload),
    });
  }

  put(endpoint, payload, options) {
    return this.request(endpoint, {
      ...options,
      method: "PUT",
      body: payload === undefined ? undefined : JSON.stringify(payload),
    });
  }

  delete(endpoint, options) {
    return this.request(endpoint, { ...options, method: "DELETE" });
  }

  upload(endpoint, formData, method = "PATCH") {
    return this.request(endpoint, { method, body: formData });
  }
}

export const api = new ApiClient(BASE_URL);
