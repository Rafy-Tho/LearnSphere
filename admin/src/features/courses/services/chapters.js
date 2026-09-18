import { api } from "@/lib/apiClient";

export const chaptersApi = {
  update: (id, data) => api.patch(`/chapters/${id}`, data),
  delete: (id) => api.delete(`/chapters/${id}`),
  createLesson: (chapterId, data) =>
    api.post(`/chapters/${chapterId}/lessons`, data),
};