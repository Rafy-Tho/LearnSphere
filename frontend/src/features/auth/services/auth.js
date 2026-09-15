import { api } from "@/lib/api-client";

export const authApi = {
  login: (data) => api.post("/auth/login", data),
  register: (data) => api.post("/auth/register", data),
  logout: () => api.post("/auth/logout"),
  getMe: () => api.get("/users/me"),
  sendResetPasswordCode: (data) => api.post("/auth/password-resets", data),
  verifyPasswordResetCode: (data) =>
    api.post("/auth/password-resets/verify", data),
  resetPassword: (data) => api.patch("/auth/password", data),
};
