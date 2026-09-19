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
  getCourseSummary: (courseId) =>
    api.get(`/admin/courses/${courseId}/summary`),
  getModuleChapters: (courseId, moduleId) =>
    api.get(`/admin/courses/${courseId}/modules/${moduleId}/chapters`),
  getChapterLessons: (courseId, chapterId) =>
    api.get(`/admin/courses/${courseId}/chapters/${chapterId}/lessons`),
  getLessonContents: (courseId, lessonId) =>
    api.get(`/admin/courses/${courseId}/lessons/${lessonId}/contents`),
  getLessonQuestions: (courseId, lessonId) =>
    api.get(`/admin/courses/${courseId}/lessons/${lessonId}/questions`),
  approveCourse: (id) => api.post(`/admin/courses/${id}/approve`),
  rejectCourse: (id, reason) =>
    api.post(`/admin/courses/${id}/reject`, { reason }),
  createObjective: (courseId, data) =>
    api.post(`/courses/${courseId}/objectives`, data),
  createModule: (courseId, data) =>
    api.post(`/courses/${courseId}/modules`, data),
};