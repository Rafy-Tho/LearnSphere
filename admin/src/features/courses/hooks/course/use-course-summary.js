import { useQuery } from '@tanstack/react-query';
import { coursesApi } from '@/features/courses/services/courses';
import { queryKeys } from '@/lib/queryKeys';

export function useCourseSummary(courseId) {
  const { data, isLoading, isError, error, refetch } = useQuery({
    queryKey: queryKeys.courseSummary(courseId),
    queryFn: () => coursesApi.getCourseSummary(courseId),
    enabled: !!courseId,
  });

  return { data, isLoading, isError, error, refetch };
}
