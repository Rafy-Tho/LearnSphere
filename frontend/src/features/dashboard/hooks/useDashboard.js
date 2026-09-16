import { useQuery } from "@tanstack/react-query";
import { dashboardApi } from "@/features/dashboard/services/dashboard";
import { queryKeys } from "@/lib/queryKeys";
import useAuth from "@/features/auth/hooks/useAuth";

export function useRecentlyViewedCourses() {
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.recentlyViewed(),
    queryFn: ({ signal }) => dashboardApi.getRecentlyViewed({ signal }),
    enabled: !!user,
  });
}

export function useRecommendedCourses() {
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.recommended(),
    queryFn: ({ signal }) => dashboardApi.getRecommended({ signal }),
    enabled: !!user,
  });
}

export function useCoursesInProgress() {
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.inProgress(),
    queryFn: ({ signal }) => dashboardApi.getInProgress(undefined, { signal }),
    enabled: !!user,
  });
}

export function useCompletedCourses() {
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.completed(),
    queryFn: ({ signal }) => dashboardApi.getCompleted(undefined, { signal }),
    enabled: !!user,
  });
}
