import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { lessonsApi } from '@/features/courses/services/lessons';

export function useDeleteLesson() {
  const queryClient = useQueryClient();
  const param = useParams();
  const courseId = param.courseId;
  const { mutateAsync: deleteLesson, isPending: isDeleting } = useMutation({
    mutationFn: (id) => lessonsApi.delete(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['course-details', courseId] });
    },
  });
  return {
    deleteLesson,
    isDeleting,
  };
}
