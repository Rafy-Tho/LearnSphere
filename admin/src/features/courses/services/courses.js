import { api, buildQuery } from "@/lib/apiClient";

function toQueryString(params) {
  if (typeof params === "string") return params ? `?${params}` : "";
  return buildQuery(params);
}

export const coursesApi = {
  getAllCourses: (params) =>
    api.getPaginated(`/admin/courses${toQueryString(params)}`),
  createCourse: (data) => api.post("/courses", data),
  updateCourse: (id, data) => api.patch(`/courses/${id}`, data),
  deleteCourse: (id) => api.delete(`/courses/${id}`),
  getCourseDetails: (id) => api.get(`/admin/courses/${id}`),
  createObjective: (courseId, data) =>
    api.post(`/courses/${courseId}/objectives`, data),
  createModule: (courseId, data) =>
    api.post(`/courses/${courseId}/modules`, data),
};