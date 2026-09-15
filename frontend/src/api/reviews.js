import { api } from "./client";

export const reviewsApi = {
  helpfulVote: ({ reviewId, isHelpful }) =>
    isHelpful === null
      ? api.delete(`/reviews/${reviewId}/helpful-vote`)
      : api.put(`/reviews/${reviewId}/helpful-vote`, { isHelpful }),
  report: ({ reviewId, reason, description }) =>
    api.post(`/reviews/${reviewId}/reports`, { reason, description }),
};
