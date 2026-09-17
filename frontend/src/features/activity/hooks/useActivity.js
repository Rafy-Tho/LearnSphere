import { useQuery } from "@tanstack/react-query";
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
