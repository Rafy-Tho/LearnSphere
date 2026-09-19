import { useQuery } from '@tanstack/react-query';
import { coursesApi } from '@/features/courses/services/courses';
import { queryKeys } from '@/lib/queryKeys';

const BRANCH_STALE_TIME = 5 * 60 * 1000;

export function useModuleChapters(courseId, moduleId, enabled = true) {
  const { data, isLoading, isError, error, refetch } = useQuery({
    queryKey: queryKeys.moduleChapters(courseId, moduleId),
    queryFn: () => coursesApi.getModuleChapters(courseId, moduleId),
    enabled: !!courseId && !!moduleId && enabled,
    staleTime: BRANCH_STALE_TIME,
  });

  return { chapters: data ?? [], isLoading, isError, error, refetch };
}
