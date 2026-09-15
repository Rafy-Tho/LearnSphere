import { api } from "@/lib/api-client";

export const reviewsApi = {
  getReviews: (queryString, courseId) =>
    api.get(`/courses/${courseId}/reviews?${queryString}`),
  getReviewDetails: (courseId) =>
    api.get(`/courses/${courseId}/reviews/summary`),
  createReview: ({ courseId, description, rating }) =>
    api.post(`/courses/${courseId}/reviews`, { description, rating }),
  getReview: (courseId) => api.get(`/courses/${courseId}/reviews/me`),
  helpfulVote: ({ reviewId, isHelpful }) =>
    isHelpful === null
      ? api.delete(`/reviews/${reviewId}/helpful-vote`)
      : api.put(`/reviews/${reviewId}/helpful-vote`, { isHelpful }),
  report: ({ reviewId, reason, description }) =>
    api.post(`/reviews/${reviewId}/reports`, { reason, description }),
};
