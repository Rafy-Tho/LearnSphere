import { useMutation, useQueryClient } from "@tanstack/react-query";
import { useParams } from "react-router-dom";
import { reviewsApi } from "@/features/reviews/services/reviews";
import { queryKeys } from "@/lib/queryKeys";

function patchInfiniteReviews(queryClient, courseId, reviewId, patch) {
  const queryKey = queryKeys.reviewsInfiniteRoot(courseId);
  const entries = queryClient.getQueriesData({ queryKey });

  entries.forEach(([key, value]) => {
    if (!value?.pages) return;
    queryClient.setQueryData(key, {
      ...value,
      pages: value.pages.map((page) => ({
        ...page,
        data: Array.isArray(page.data)
          ? page.data.map((review) =>
              review.id === reviewId ? { ...review, ...patch } : review,
            )
          : page.data,
      })),
    });
  });

  return entries;
}

function restoreQueries(queryClient, entries) {
  entries?.forEach(([key, value]) => queryClient.setQueryData(key, value));
}

export function useCreateReview() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["createReview"],
    mutationFn: (payload) => reviewsApi.createReview(payload),
    onSuccess: (_response, variables) => {
      const { courseId } = variables;
      queryClient.invalidateQueries({ queryKey: queryKeys.myReview(courseId) });
      queryClient.invalidateQueries({
        queryKey: queryKeys.reviewsRoot(courseId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.reviewsInfiniteRoot(courseId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.reviewDetails(courseId),
      });
    },
  });
}

export function useHelpfulVote() {
  const queryClient = useQueryClient();
  const { courseId } = useParams();
  return useMutation({
    mutationKey: ["helpful-vote"],
    mutationFn: ({ reviewId, isHelpful }) =>
      reviewsApi.helpfulVote({ reviewId, isHelpful }),
    onMutate: async ({ reviewId, isHelpful }) => {
      await queryClient.cancelQueries({
        queryKey: queryKeys.reviewsInfiniteRoot(courseId),
      });
      const previous = patchInfiniteReviews(queryClient, courseId, reviewId, {
        is_helpful: isHelpful,
      });
      return { previous };
    },
    onError: (_error, _variables, context) => {
      restoreQueries(queryClient, context?.previous);
    },
    onSettled: () => {
      queryClient.invalidateQueries({
        queryKey: queryKeys.reviewsInfiniteRoot(courseId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.reviewsRoot(courseId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.reviewDetails(courseId),
      });
    },
  });
}

export function useCreateReviewReport() {
  const queryClient = useQueryClient();
  const { courseId } = useParams();
  return useMutation({
    mutationKey: ["createReviewReport"],
    mutationFn: ({ reviewId, reason, description }) =>
      reviewsApi.report({ reviewId, reason, description }),
    onMutate: async ({ reviewId }) => {
      await queryClient.cancelQueries({
        queryKey: queryKeys.reviewsInfiniteRoot(courseId),
      });
      const previous = patchInfiniteReviews(queryClient, courseId, reviewId, {
        is_reported: true,
      });
      return { previous };
    },
    onError: (_error, _variables, context) => {
      restoreQueries(queryClient, context?.previous);
    },
    onSettled: () => {
      queryClient.invalidateQueries({
        queryKey: queryKeys.reviewsInfiniteRoot(courseId),
      });
    },
  });
}
