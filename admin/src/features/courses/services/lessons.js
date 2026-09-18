import { api } from "@/lib/apiClient";

export const lessonsApi = {
  update: (id, data) => api.patch(`/lessons/${id}`, data),
  delete: (id) => api.delete(`/lessons/${id}`),
  createContent: (lessonId, data) =>
    api.post(`/lessons/${lessonId}/contents`, data),
  createQuestion: (lessonId, data) =>
    api.post(`/lessons/${lessonId}/questions`, data),
};