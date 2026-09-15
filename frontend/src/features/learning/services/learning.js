import { api } from "@/lib/apiClient";

export const learningApi = {
  getLearningData: (id) => api.get(`/courses/${id}/curriculum`),
  getFirstLesson: (id) => api.get(`/courses/${id}/first-lesson`),
  enrollCourse: (courseId) => api.post(`/courses/${courseId}/enrollments`),
  getEnrollment: (courseId) => api.get(`/courses/${courseId}/enrollments`),
  createCourseProgress: (courseId) =>
    api.post(`/courses/${courseId}/progress`),
  getCourseProgress: (courseId) => api.get(`/courses/${courseId}/progress`),
  updateCourseProgress: (courseId, payload) =>
    api.patch(`/courses/${courseId}/progress`, payload),
  getCourseLessonCompletions: (courseId) =>
    api.get(`/courses/${courseId}/completions`),
  claimCertificate: (courseId) =>
    api.post(`/courses/${courseId}/certificates`),
  getCertificate: (courseId) => api.get(`/courses/${courseId}/certificates`),
  checkCertificateEligibility: (courseId) =>
    api.get(`/courses/${courseId}/certificates/check`),
  getMyCertificates: () => api.get("/users/me/certificates"),
  getCertificateById: (id) => api.get(`/certificates/${id}`),
};
