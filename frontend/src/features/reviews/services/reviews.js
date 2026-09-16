import { api, buildQuery } from "@/lib/apiClient";

export const reviewsApi = {
  getReviews: (params, courseId, options) =>
    api.getPaginated(
      `/courses/${courseId}/reviews${buildQuery(params)}`,
      options,
    ),
  getReviewDetails: (courseId, options) =>
    api.get(`/courses/${courseId}/reviews/summary`, options),
  createReview: ({ courseId, description, rating }) =>
    api.post(`/courses/${courseId}/reviews`, { description, rating }),
  getReview: (courseId, options) =>
    api.get(`/courses/${courseId}/reviews/me`, options),
  helpfulVote: ({ reviewId, isHelpful }) =>
    isHelpful === null
      ? api.delete(`/reviews/${reviewId}/helpful-vote`)
      : api.put(`/reviews/${reviewId}/helpful-vote`, { isHelpful }),
  report: ({ reviewId, reason, description }) =>
    api.post(`/reviews/${reviewId}/reports`, { reason, description }),
};
