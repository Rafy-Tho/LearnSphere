import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useSearchParams } from 'react-router-dom';
import { coursesApi } from '@/features/courses/services/courses';
import parseQueryToObject from '@/utils/parseQueryToObject';

export const useDeleteCourse = () => {
  const [searchParams] = useSearchParams();
  const queryClient = useQueryClient();
  const queryObj = parseQueryToObject(searchParams);
  const { mutateAsync: deleteCourse, isPending: isDeleting } = useMutation({
    mutationKey: ['delete-course'],
    mutationFn: (id) => coursesApi.deleteCourse(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['courses', queryObj] });
    },
  });
  return { deleteCourse, isDeleting };
};
