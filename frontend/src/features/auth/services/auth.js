import { api } from "@/lib/apiClient";

export const authApi = {
  login: (payload) => api.post("/auth/login", payload),
  register: (payload) => api.post("/auth/register", payload),
  logout: () => api.post("/auth/logout"),
  getMe: (options) => api.get("/users/me", options),
  sendResetPasswordCode: (payload) => api.post("/auth/password-resets", payload),
  verifyPasswordResetCode: (payload) =>
    api.post("/auth/password-resets/verify", payload),
  resetPassword: (payload) => api.patch("/auth/password", payload),
};
