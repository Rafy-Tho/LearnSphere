import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { chaptersApi } from '@/features/courses/services/chapters';
import { modulesApi } from '@/features/courses/services/modules';
import { queryKeys } from '@/lib/queryKeys';

export function useChapterActions() {
  const queryClient = useQueryClient();
  const { courseId } = useParams();

  const invalidate = () => {
    queryClient.invalidateQueries({
      queryKey: queryKeys.moduleChaptersRoot(courseId),
    });
    queryClient.invalidateQueries({
      queryKey: queryKeys.courseSummary(courseId),
    });
  };

  const { mutateAsync: createChapter, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => modulesApi.createChapter(id, data),
    onSuccess: invalidate,
  });

  const { mutateAsync: updateChapter, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => chaptersApi.update(id, data),
    onSuccess: invalidate,
  });

  const { mutateAsync: deleteChapter, isPending: isDeleting } = useMutation({
    mutationFn: (id) => chaptersApi.delete(id),
    onSuccess: invalidate,
  });

  return {
    createChapter,
    updateChapter,
    deleteChapter,
    isCreating,
    isUpdating,
    isDeleting,
  };
}
