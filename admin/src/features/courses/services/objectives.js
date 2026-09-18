import { api } from "@/lib/apiClient";

export const objectivesApi = {
  update: (id, data) => api.patch(`/objectives/${id}`, data),
  delete: (id) => api.delete(`/objectives/${id}`),
};