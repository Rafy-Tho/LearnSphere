import { api, buildQuery } from "@/lib/apiClient";

export const savedApi = {
  getSavedCourses: (params, options) =>
    api.getPaginated(`/users/me/saved-courses${buildQuery(params)}`, options),
  getSavedCourseIds: (options) =>
    api.get("/users/me/saved-courses/ids", options),
  saveCourse: (courseId) => api.post(`/courses/${courseId}/saved`),
  unsaveCourse: (courseId) => api.delete(`/courses/${courseId}/saved`),
};
