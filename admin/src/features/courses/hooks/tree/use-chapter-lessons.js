import { useQuery } from '@tanstack/react-query';
import { coursesApi } from '@/features/courses/services/courses';
import { queryKeys } from '@/lib/queryKeys';

const BRANCH_STALE_TIME = 5 * 60 * 1000;

export function useChapterLessons(courseId, chapterId, enabled = true) {
  const { data, isLoading, isError, error, refetch } = useQuery({
    queryKey: queryKeys.chapterLessons(courseId, chapterId),
    queryFn: () => coursesApi.getChapterLessons(courseId, chapterId),
    enabled: !!courseId && !!chapterId && enabled,
    staleTime: BRANCH_STALE_TIME,
  });

  return { lessons: data ?? [], isLoading, isError, error, refetch };
}
