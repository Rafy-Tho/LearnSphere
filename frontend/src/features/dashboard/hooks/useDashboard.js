import { useQuery } from "@tanstack/react-query";
import { dashboardApi } from "@/features/dashboard/services/dashboard";
import useAuth from "@/features/auth/hooks/useAuth";

export function useRecentlyViewedCourses() {
  const { user } = useAuth();
  return useQuery({
    queryKey: ["get-recently-viewed-courses"],
    queryFn: () => dashboardApi.getRecentlyViewed(),
    enabled: !!user,
  });
}

export function useRecommendedCourses() {
  const { user } = useAuth();
  return useQuery({
    queryKey: ["recommended-course"],
    queryFn: () => dashboardApi.getRecommended(),
    enabled: !!user,
  });
}

export function useCoursesInProgress() {
  const { user } = useAuth();
  return useQuery({
    queryKey: ["course-in-progress"],
    queryFn: () => dashboardApi.getInProgress(),
    enabled: !!user,
  });
}

export function useCompletedCourses() {
  const { user } = useAuth();
  return useQuery({
    queryKey: ["completed-course"],
    queryFn: () => dashboardApi.getCompleted(),
    enabled: !!user,
  });
}
