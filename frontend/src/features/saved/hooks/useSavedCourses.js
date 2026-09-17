import { useQuery } from "@tanstack/react-query";
import { savedApi } from "@/features/saved/services/saved";
import { queryKeys } from "@/lib/queryKeys";
import useAuth from "@/features/auth/hooks/useAuth";

export function useSavedCourses(params, options) {
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.savedCourses(params),
    queryFn: ({ signal }) =>
      savedApi.getSavedCourses(params, { ...options, signal }),
    enabled: !!user,
  });
}

export function useSavedCourseIds() {
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.savedCourseIds(),
    queryFn: ({ signal }) => savedApi.getSavedCourseIds({ signal }),
    enabled: !!user,
    staleTime: 1000 * 60 * 5,
  });
}

export function useIsCourseSaved(courseId) {
  const { data } = useSavedCourseIds();
  return Array.isArray(data) && data.includes(courseId);
}
