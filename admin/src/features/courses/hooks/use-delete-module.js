import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { modulesApi } from '@/features/courses/services/modules';

export function useDeleteModule() {
  const queryClient = useQueryClient();
  const param = useParams();
  const courseId = param.courseId;
  const { mutateAsync: deleteModule, isPending: isDeleting } = useMutation({
    mutationFn: (id) => modulesApi.delete(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['course-details', courseId] });
    },
  });
  return {
    deleteModule,
    isDeleting,
  };
}
