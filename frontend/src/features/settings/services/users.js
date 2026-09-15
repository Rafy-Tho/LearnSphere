import { api } from "@/lib/apiClient";

export const usersApi = {
  getProfile: () => api.get("/users/me/profile"),
  updateProfile: (formData) => api.upload("/users/me/profile", formData),
  getXpEarned: () => api.get("/users/me/xp"),
  changePassword: (payload) => api.patch("/users/me/password", payload),
};
