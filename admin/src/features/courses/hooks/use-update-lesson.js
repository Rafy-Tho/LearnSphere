import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { lessonsApi } from '@/features/courses/services/lessons';

export function useUpdateLesson() {
  const queryClient = useQueryClient();
  const param = useParams();
  const courseId = param.courseId;
  const { mutateAsync: updateLesson, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => lessonsApi.update(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['course-details', courseId] });
    },
  });
  return {
    updateLesson,
    isUpdating,
  };
}
