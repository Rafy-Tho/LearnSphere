import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { chaptersApi } from '@/features/courses/services/chapters';

export function useCreateLesson() {
  const queryClient = useQueryClient();
  const param = useParams();
  const courseId = param.courseId;
  const { mutateAsync: createLesson, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => chaptersApi.createLesson(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['course-details', courseId] });
    },
  });
  return {
    createLesson,
    isCreating,
  };
}
