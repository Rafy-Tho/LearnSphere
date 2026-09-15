import { api } from "./client";

export const usersApi = {
  getMe: () => api.get("/users/me"),
  getProfile: () => api.get("/users/me/profile"),
  updateProfile: (formData) => api.upload("/users/me/profile", formData),
  getXpEarned: () => api.get("/users/me/xp"),
  createPayment: (id) => api.post(`/subscriptions/${id}/checkout`),
  changePassword: (data) => api.patch("/users/me/password", data),
};
