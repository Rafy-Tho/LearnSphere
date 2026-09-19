import { api, buildQuery } from "@/lib/apiClient";

function toQueryString(params) {
  if (typeof params === "string") return params ? `?${params}` : "";
  return buildQuery(params);
}

export const instructorApi = {
  getDashboard: () => api.get("/instructor/dashboard"),
  getStudents: (courseId, params) =>
    api.getPaginated(
      `/instructor/courses/${courseId}/students${toQueryString(params)}`,
    ),
  getAnalytics: (courseId) =>
    api.get(`/instructor/courses/${courseId}/analytics`),
  getReviews: (courseId, params) =>
    api.getPaginated(
      `/instructor/courses/${courseId}/reviews${toQueryString(params)}`,
    ),
  getCertificates: (courseId, params) =>
    api.getPaginated(
      `/instructor/courses/${courseId}/certificates${toQueryString(params)}`,
    ),
  getEarnings: () => api.get("/instructor/earnings"),
  getPayouts: (params) =>
    api.getPaginated(`/instructor/payouts${toQueryString(params)}`),
  submitCourse: (courseId) =>
    api.post(`/instructor/courses/${courseId}/submit`),
};
