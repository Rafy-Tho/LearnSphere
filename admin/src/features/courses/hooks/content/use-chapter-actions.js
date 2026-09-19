import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { chaptersApi } from '@/features/courses/services/chapters';
import { queryKeys } from '@/lib/queryKeys';

export function useChapterActions() {
  const queryClient = useQueryClient();
  const { courseId } = useParams();

  const { mutateAsync: createChapter, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => chaptersApi.createChapter(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courseDetails(courseId) });
    },
  });

  const { mutateAsync: updateChapter, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => chaptersApi.update(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courseDetails(courseId) });
    },
  });

  const { mutateAsync: deleteChapter, isPending: isDeleting } = useMutation({
    mutationFn: (id) => chaptersApi.delete(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courseDetails(courseId) });
    },
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
