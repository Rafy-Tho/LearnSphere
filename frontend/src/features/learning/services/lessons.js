import { api } from "@/lib/apiClient";

export const lessonsApi = {
  getContent: (id, options) => api.get(`/lessons/${id}/contents`, options),
  getQuizzes: (id, options) => api.get(`/lessons/${id}/questions`, options),
  completeLesson: (id) => api.post(`/lessons/${id}/completions`),
  getCompletedLesson: (id, options) =>
    api.get(`/lessons/${id}/completions`, options),
};
