import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { modulesApi } from '@/features/courses/services/modules';
import { queryKeys } from '@/lib/queryKeys';

export function useModuleActions() {
  const queryClient = useQueryClient();
  const { courseId } = useParams();

  const { mutateAsync: createModule, isPending: isCreating } = useMutation({
    mutationFn: (data) => modulesApi.createModule(data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courseDetails(courseId) });
    },
  });

  const { mutateAsync: updateModule, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => modulesApi.update(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courseDetails(courseId) });
    },
  });

  const { mutateAsync: deleteModule, isPending: isDeleting } = useMutation({
    mutationFn: (id) => modulesApi.delete(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courseDetails(courseId) });
    },
  });

  return {
    createModule,
    updateModule,
    deleteModule,
    isCreating,
    isUpdating,
    isDeleting,
  };
}
