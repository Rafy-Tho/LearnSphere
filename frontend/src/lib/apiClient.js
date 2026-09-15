import { clearUserQueries } from "@/lib/queryClient";

const BASE_URL = import.meta.env.VITE_BASE_URL;
const authPath = ["/login", "/signup", "/reset-password"];
class ApiClient {
  constructor(baseURL) {
    this.baseURL = baseURL;
  }

  async request(endpoint, options = {}) {
    const url = `${this.baseURL}${endpoint}`;
    const config = {
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
        "X-Requested-With": "XMLHttpRequest",
        ...options.headers,
      },
      ...options,
    };

    if (options.body instanceof FormData) {
      delete config.headers["Content-Type"];
    }

    const response = await fetch(url, config);
    const responseData = await response.json();

    if (
      !response.ok &&
      response.status === 401 &&
      !authPath.some((path) => window.location.pathname.startsWith(path))
    ) {
      clearUserQueries();
      setTimeout(() => (window.location.href = "/login"), 0);
    }
    if (!response.ok) {
      throw new Error(responseData.message || "Something went wrong");
    }

    if (responseData.pagination) {
      return { data: responseData.data, pagination: responseData.pagination };
    }
    return responseData.data;
  }

  get(endpoint) {
    return this.request(endpoint);
  }

  post(endpoint, payload) {
    return this.request(endpoint, {
      method: "POST",
      body: JSON.stringify(payload),
    });
  }

  patch(endpoint, payload) {
    return this.request(endpoint, {
      method: "PATCH",
      body: JSON.stringify(payload),
    });
  }

  put(endpoint, payload) {
    return this.request(endpoint, {
      method: "PUT",
      body: JSON.stringify(payload),
    });
  }

  delete(endpoint) {
    return this.request(endpoint, { method: "DELETE" });
  }

  upload(endpoint, formData) {
    return this.request(endpoint, {
      method: "PATCH",
      body: formData,
    });
  }
}

export const api = new ApiClient(BASE_URL);
