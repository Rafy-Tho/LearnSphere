import { api } from "@/lib/apiClient";

export const quizAttemptsApi = {
  submit: (lessonId, answers) =>
    api.post(`/lessons/${lessonId}/quiz-attempts`, { answers }),
  list: (lessonId, options) =>
    api.get(`/lessons/${lessonId}/quiz-attempts`, options),
  latest: (lessonId, options) =>
    api.get(`/lessons/${lessonId}/quiz-attempts/latest`, options),
};
