import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useSearchParams } from 'react-router-dom';
import { coursesApi } from '@/features/courses/services/courses';
import parseQueryToObject from '@/utils/parseQueryToObject';
import { queryKeys } from '@/lib/queryKeys';

export function useCourseActions() {
  const [searchParams] = useSearchParams();
  const queryClient = useQueryClient();
  const queryObj = parseQueryToObject(searchParams);

  const { mutateAsync: createCourse, isPending: isCreating } = useMutation({
    mutationFn: (data) => coursesApi.createCourse(data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courses(queryObj) });
    },
  });

  const { mutateAsync: updateCourse, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => coursesApi.updateCourse(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courses(queryObj) });
    },
  });

  const { mutateAsync: deleteCourse, isPending: isDeleting } = useMutation({
    mutationFn: (id) => coursesApi.deleteCourse(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courses(queryObj) });
    },
  });

  return {
    createCourse,
    updateCourse,
    deleteCourse,
    isCreating,
    isUpdating,
    isDeleting,
  };
}
