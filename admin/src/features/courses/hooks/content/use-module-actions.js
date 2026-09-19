import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { modulesApi } from '@/features/courses/services/modules';
import { coursesApi } from '@/features/courses/services/courses';
import { queryKeys } from '@/lib/queryKeys';

export function useModuleActions() {
  const queryClient = useQueryClient();
  const { courseId } = useParams();

  const invalidate = () => {
    queryClient.invalidateQueries({
      queryKey: queryKeys.courseSummary(courseId),
    });
  };

  const { mutateAsync: createModule, isPending: isCreating } = useMutation({
    mutationFn: (data) => coursesApi.createModule(courseId, data),
    onSuccess: invalidate,
  });

  const { mutateAsync: updateModule, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => modulesApi.update(id, data),
    onSuccess: invalidate,
  });

  const { mutateAsync: deleteModule, isPending: isDeleting } = useMutation({
    mutationFn: (id) => modulesApi.delete(id),
    onSuccess: invalidate,
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
