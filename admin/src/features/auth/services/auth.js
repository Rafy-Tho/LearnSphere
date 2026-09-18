import { api } from "@/lib/apiClient";

export const authApi = {
  getMe: () => api.get("/users/me"),
  login: (data) => api.post("/auth/login", data),
  logout: () => api.post("/auth/logout"),
};