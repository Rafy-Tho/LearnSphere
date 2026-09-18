import { api, buildQuery } from "@/lib/apiClient";

function toQueryString(params) {
  if (typeof params === "string") return params ? `?${params}` : "";
  return buildQuery(params);
}

export const usersApi = {
  getProfile: () => api.get("/users/me/profile"),
  updateProfile: (data) => api.patch("/users/me/profile", data),
  updatePassword: (data) => api.patch("/users/me/password", data),
  getUsers: (params) =>
    api.getPaginated(`/admin/users${toQueryString(params)}`),
  createUser: (data) => api.post("/admin/users", data),
  updateUser: (id, data) => api.patch(`/admin/users/${id}`, data),
  deleteUser: (id) => api.delete(`/admin/users/${id}`),
};