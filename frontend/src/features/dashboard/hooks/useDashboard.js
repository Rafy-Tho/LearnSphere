import { useQuery } from "@tanstack/react-query";
import { dashboardApi } from "@/features/dashboard/services/dashboard";

export function useRecentlyViewedCourses() {
  return useQuery({
    queryKey: ["get-recently-viewed-courses"],
    queryFn: () => dashboardApi.getRecentlyViewed(),
  });
}

export function useRecommendedCourses() {
  return useQuery({
    queryKey: ["recommended-course"],
    queryFn: () => dashboardApi.getRecommended(),
  });
}

export function useCoursesInProgress() {
  return useQuery({
    queryKey: ["course-in-progress"],
    queryFn: () => dashboardApi.getInProgress(),
  });
}

export function useCompletedCourses() {
  return useQuery({
    queryKey: ["completed-course"],
    queryFn: () => dashboardApi.getCompleted(),
  });
}
