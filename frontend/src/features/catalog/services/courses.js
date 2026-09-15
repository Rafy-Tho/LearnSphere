import { api } from "@/lib/apiClient";

export const coursesApi = {
  getAll: (queryString) => api.get(`/courses?${queryString}`),
  getById: (id) => api.get(`/courses/${id}`),
  getObjectives: (id) => api.get(`/courses/${id}/objectives`),
  getPopular: () => api.get("/courses/popular"),
};
