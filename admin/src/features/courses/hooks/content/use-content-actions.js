import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { coursesApi } from '@/features/courses/services/courses';
import { queryKeys } from '@/lib/queryKeys';

export function useContentActions() {
  const queryClient = useQueryClient();
  const { courseId } = useParams();

  const { mutateAsync: createContent, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => coursesApi.createContent(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courseDetails(courseId) });
    },
  });

  const { mutateAsync: updateContent, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => coursesApi.updateContent(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courseDetails(courseId) });
    },
  });

  const { mutateAsync: deleteContent, isPending: isDeleting } = useMutation({
    mutationFn: (id) => coursesApi.deleteContent(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courseDetails(courseId) });
    },
  });

  return {
    createContent,
    updateContent,
    deleteContent,
    isCreating,
    isUpdating,
    isDeleting,
  };
}
