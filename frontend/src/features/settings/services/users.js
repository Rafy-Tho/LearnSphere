import { api } from "@/lib/api-client";

export const usersApi = {
  getProfile: () => api.get("/users/me/profile"),
  updateProfile: (formData) => api.upload("/users/me/profile", formData),
  getXpEarned: () => api.get("/users/me/xp"),
  changePassword: (data) => api.patch("/users/me/password", data),
};
