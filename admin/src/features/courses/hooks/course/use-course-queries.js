import { useQuery } from '@tanstack/react-query';
import { coursesApi } from '@/features/courses/services/courses';
import { queryKeys } from '@/lib/queryKeys';
import parseQueryToObject from '@/utils/parseQueryToObject';

export function useGetCourses(searchParams) {
  const queryObj = parseQueryToObject(searchParams);
  const queryString = searchParams?.toString?.() || '';

  const { data, isLoading, error } = useQuery({
    queryKey: queryKeys.courses(queryObj),
    queryFn: () => coursesApi.getAllCourses(queryString || undefined),
  });

  return { data, isLoading, error };
}
