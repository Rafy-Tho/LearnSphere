import { useQuery } from '@tanstack/react-query';
import { coursesApi } from '@/features/courses/services/courses';
import { queryKeys } from '@/lib/queryKeys';

const BRANCH_STALE_TIME = 5 * 60 * 1000;

export function useLessonContents(courseId, lessonId, enabled = true) {
  const { data, isLoading, isError, error, refetch } = useQuery({
    queryKey: queryKeys.lessonContents(courseId, lessonId),
    queryFn: () => coursesApi.getLessonContents(courseId, lessonId),
    enabled: !!courseId && !!lessonId && enabled,
    staleTime: BRANCH_STALE_TIME,
  });

  return { contents: data ?? [], isLoading, isError, error, refetch };
}
