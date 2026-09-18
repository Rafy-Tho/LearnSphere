import { api } from "@/lib/apiClient";

export const questionsApi = {
  update: (id, data) => api.patch(`/questions/${id}`, data),
  delete: (id) => api.delete(`/questions/${id}`),
  createOption: (questionId, data) =>
    api.post(`/questions/${questionId}/options`, data),
};