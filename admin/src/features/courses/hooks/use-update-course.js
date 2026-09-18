import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useSearchParams } from 'react-router-dom';
import { coursesApi } from '@/features/courses/services/courses';
import parseQueryToObject from '@/utils/parseQueryToObject';

export const useUpdateCourse = () => {
  const [searchParams] = useSearchParams();
  const queryClient = useQueryClient();
  const queryObj = parseQueryToObject(searchParams);
  const { mutateAsync: updateCourse, isPending } = useMutation({
    mutationKey: ['update-course'],
    mutationFn: ({ id, data }) => coursesApi.updateCourse(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['courses', queryObj] });
    },
  });
  return { updateCourse, isPending };
};
