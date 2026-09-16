import {
  keepPreviousData,
  useInfiniteQuery,
  useQuery,
} from "@tanstack/react-query";
import { useParams } from "react-router-dom";
import { reviewsApi } from "@/features/reviews/services/reviews";
import { queryKeys } from "@/lib/queryKeys";
import useAuth from "@/features/auth/hooks/useAuth";
import parseQueryToObject from "@/utils/parseQueryToObject";

export function useReviews(params) {
  const { courseId } = useParams();
  const queryObject = parseQueryToObject(params);
  return useQuery({
    queryKey: queryKeys.reviews(courseId, queryObject),
    queryFn: ({ signal }) =>
      reviewsApi.getReviews(queryObject, courseId, { signal }),
    enabled: !!courseId,
    placeholderData: keepPreviousData,
  });
}

export function useInfiniteReviews(filters = {}) {
  const { courseId } = useParams();
  const limit = filters.limit || 5;

  return useInfiniteQuery({
    queryKey: queryKeys.reviewsInfinite(courseId, filters),
    queryFn: ({ pageParam = 1, signal }) =>
      reviewsApi.getReviews(
        {
          page: pageParam,
          limit,
          ...(filters.rating && filters.rating !== "All"
            ? { rating: filters.rating }
            : {}),
          ...(filters.search ? { search: filters.search } : {}),
        },
        courseId,
        { signal },
      ),
    getNextPageParam: (lastPage) => lastPage.pagination?.next ?? undefined,
    initialPageParam: 1,
    enabled: !!courseId,
  });
}

export function useReviewDetails() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: queryKeys.reviewDetails(courseId),
    queryFn: ({ signal }) => reviewsApi.getReviewDetails(courseId, { signal }),
    enabled: !!courseId,
  });
}

export function useMyReview() {
  const { courseId } = useParams();
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.myReview(courseId),
    queryFn: ({ signal }) => reviewsApi.getReview(courseId, { signal }),
    enabled: !!courseId && !!user,
  });
}
