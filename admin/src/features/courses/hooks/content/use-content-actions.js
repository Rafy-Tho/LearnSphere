import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { contentsApi } from '@/features/courses/services/contents';
import { lessonsApi } from '@/features/courses/services/lessons';
import { queryKeys } from '@/lib/queryKeys';

export function useContentActions() {
  const queryClient = useQueryClient();
  const { courseId } = useParams();

  const invalidate = () => {
    queryClient.invalidateQueries({
      queryKey: queryKeys.lessonContentsRoot(courseId),
    });
    queryClient.invalidateQueries({
      queryKey: queryKeys.chapterLessonsRoot(courseId),
    });
  };

  const { mutateAsync: createContent, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => lessonsApi.createContent(id, data),
    onSuccess: invalidate,
  });

  const { mutateAsync: updateContent, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => contentsApi.update(id, data),
    onSuccess: invalidate,
  });

  const { mutateAsync: deleteContent, isPending: isDeleting } = useMutation({
    mutationFn: (id) => contentsApi.delete(id),
    onSuccess: invalidate,
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
