import { api } from "@/lib/apiClient";

export const usersApi = {
  getProfile: (options) => api.get("/users/me/profile", options),
  updateProfile: (formData) => api.upload("/users/me/profile", formData),
  getXpEarned: (options) => api.get("/users/me/xp", options),
  changePassword: (payload) => api.patch("/users/me/password", payload),
};
