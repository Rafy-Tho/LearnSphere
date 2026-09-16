import { api, buildQuery } from "@/lib/apiClient";

export const coursesApi = {
  getAll: (params, options) =>
    api.getPaginated(`/courses${buildQuery(params)}`, options),
  getById: (id, options) => api.get(`/courses/${id}`, options),
  getObjectives: (id, options) => api.get(`/courses/${id}/objectives`, options),
  getPopular: (options) => api.get("/courses/popular", options),
};
