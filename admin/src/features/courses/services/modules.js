import { api } from "@/lib/apiClient";

export const modulesApi = {
  update: (id, data) => api.patch(`/modules/${id}`, data),
  delete: (id) => api.delete(`/modules/${id}`),
  createChapter: (moduleId, data) =>
    api.post(`/modules/${moduleId}/chapters`, data),
};