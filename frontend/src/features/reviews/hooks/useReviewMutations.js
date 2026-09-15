import { useMutation, useQueryClient } from "@tanstack/react-query";
import { reviewsApi } from "@/features/reviews/services/reviews";

export function useCreateReview() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["createReview"],
    mutationFn: (payload) => reviewsApi.createReview(payload),
    onSuccess: (_response, variables) => {
      const courseId = variables?.courseId;
      queryClient.invalidateQueries({ queryKey: ["review-me", courseId] });
      queryClient.invalidateQueries({ queryKey: ["reviews", courseId] });
      queryClient.invalidateQueries({
        queryKey: ["reviews-infinite", courseId],
      });
      queryClient.invalidateQueries({
        queryKey: ["review-details", courseId],
      });
    },
  });
}

export function useHelpfulVote() {
  return useMutation({
    mutationKey: ["helpful-vote"],
    mutationFn: ({ reviewId, isHelpful }) =>
      reviewsApi.helpfulVote({ reviewId, isHelpful }),
  });
}

export function useCreateReviewReport() {
  return useMutation({
    mutationKey: ["createReviewReport"],
    mutationFn: ({ reviewId, reason, description }) =>
      reviewsApi.report({ reviewId, reason, description }),
  });
}
