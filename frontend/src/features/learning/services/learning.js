import { api, buildQuery } from "@/lib/apiClient";

export const learningApi = {
  getLearningData: (id, options) =>
    api.get(`/courses/${id}/curriculum`, options),
  getFirstLesson: (id, options) =>
    api.get(`/courses/${id}/first-lesson`, options),
  enrollCourse: (courseId) => api.post(`/courses/${courseId}/enrollments`),
  getEnrollment: (courseId, options) =>
    api.get(`/courses/${courseId}/enrollments`, options),
  createCourseProgress: (courseId) =>
    api.post(`/courses/${courseId}/progress`),
  getCourseProgress: (courseId, options) =>
    api.get(`/courses/${courseId}/progress`, options),
  updateCourseProgress: (courseId, payload) =>
    api.patch(`/courses/${courseId}/progress`, payload),
  getCourseLessonCompletions: (courseId, options) =>
    api.get(`/courses/${courseId}/completions`, options),
  claimCertificate: (courseId) =>
    api.post(`/courses/${courseId}/certificates`),
  getCertificate: (courseId, options) =>
    api.get(`/courses/${courseId}/certificates`, options),
  checkCertificateEligibility: (courseId, options) =>
    api.get(`/courses/${courseId}/certificates/check`, options),
  getMyCertificates: (params, options) =>
    api.getPaginated(`/users/me/certificates${buildQuery(params)}`, options),
  getCertificateById: (id, options) => api.get(`/certificates/${id}`, options),
};
