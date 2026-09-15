import { useInfiniteQuery, useQuery } from "@tanstack/react-query";
import { useParams } from "react-router-dom";
import { reviewsApi } from "@/features/reviews/services/reviews";
import parseQueryToObject from "@/utils/parseQueryToObject";
import parseQueryToString from "@/utils/parseQueryToString";

export function useReviews(params) {
  const { courseId } = useParams();
  const queryString = parseQueryToString(params);
  const queryObject = parseQueryToObject(params);
  return useQuery({
    queryKey: ["reviews", courseId, queryObject],
    queryFn: () => reviewsApi.getReviews(queryString, courseId),
    enabled: !!courseId,
  });
}

export function useInfiniteReviews(filters = {}) {
  const { courseId } = useParams();
  const limit = filters.limit || 5;

  return useInfiniteQuery({
    queryKey: ["reviews-infinite", courseId, filters],
    queryFn: ({ pageParam = 1 }) => {
      const params = new URLSearchParams();
      params.set("page", pageParam);
      params.set("limit", limit);
      if (filters.rating && filters.rating !== "All")
        params.set("rating", filters.rating);
      if (filters.search) params.set("search", filters.search);
      return reviewsApi.getReviews(params.toString(), courseId);
    },
    getNextPageParam: (lastPage) => {
      const { pagination } = lastPage;
      if (pagination?.next) return pagination.next;
      return undefined;
    },
    initialPageParam: 1,
    enabled: !!courseId,
  });
}

export function useReviewDetails() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: ["review-details", courseId],
    queryFn: () => reviewsApi.getReviewDetails(courseId),
    enabled: !!courseId,
  });
}

export function useMyReview() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: ["review-me", courseId],
    queryFn: () => reviewsApi.getReview(courseId),
    enabled: !!courseId,
  });
}
