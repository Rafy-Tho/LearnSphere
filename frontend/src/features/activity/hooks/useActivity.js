import { useInfiniteQuery, useQuery } from "@tanstack/react-query";
import { activityApi } from "@/features/activity/services/activity";
import { queryKeys } from "@/lib/queryKeys";
import useAuth from "@/features/auth/hooks/useAuth";

export function useActivities(params = {}, options = {}) {
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.activities(params),
    queryFn: ({ signal }) => activityApi.getActivities(params, { signal }),
    enabled: !!user,
    select: (response) => response?.data ?? [],
    ...options,
  });
}

export function useInfiniteActivities({ limit = 20 } = {}) {
  const { user } = useAuth();
  return useInfiniteQuery({
    queryKey: queryKeys.activitiesInfinite(),
    queryFn: ({ pageParam = 1, signal }) =>
      activityApi.getActivities({ page: pageParam, limit }, { signal }),
    getNextPageParam: (lastPage) => lastPage.pagination?.next ?? undefined,
    initialPageParam: 1,
    enabled: !!user,
  });
}
