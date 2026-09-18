import { useQuery } from '@tanstack/react-query';

import { useAuth } from '@/app/providers/context';
import { coursesApi } from '@/features/courses/services/courses';
import parseQueryToObject from '@/utils/parseQueryToObject';
import parseQueryToString from '@/utils/parseQueryToString';

export const useGetCourses = (params) => {
  const { user } = useAuth();
  const queryString = parseQueryToString(params);
  const queryObj = parseQueryToObject(params);
  const { data, isLoading, error } = useQuery({
    queryKey: ['courses', queryObj],
    queryFn: () => coursesApi.getAllCourses(queryString),
    enabled: !!user,
  });
  return { data, isLoading, error };
};
