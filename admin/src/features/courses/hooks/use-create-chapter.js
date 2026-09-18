import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { modulesApi } from '@/features/courses/services/modules';

export function useCreateChapter() {
  const queryClient = useQueryClient();
  const param = useParams();
  const courseId = param.courseId;
  const { mutateAsync: createChapter, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => modulesApi.createChapter(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['course-details', courseId] });
    },
  });
  return {
    createChapter,
    isCreating,
  };
}
