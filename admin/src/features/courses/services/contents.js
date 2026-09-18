import { api } from "@/lib/apiClient";

export const contentsApi = {
  update: (id, data) => api.patch(`/contents/${id}`, data),
  delete: (id) => api.delete(`/contents/${id}`),
};