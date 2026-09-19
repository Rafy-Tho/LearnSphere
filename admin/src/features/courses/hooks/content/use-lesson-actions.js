import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { chaptersApi } from '@/features/courses/services/chapters';
import { queryKeys } from '@/lib/queryKeys';

export function useLessonActions() {
  const queryClient = useQueryClient();
  const { courseId } = useParams();

  const { mutateAsync: createLesson, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => chaptersApi.createLesson(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courseDetails(courseId) });
    },
  });

  const { mutateAsync: updateLesson, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => chaptersApi.update(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courseDetails(courseId) });
    },
  });

  const { mutateAsync: deleteLesson, isPending: isDeleting } = useMutation({
    mutationFn: (id) => chaptersApi.delete(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courseDetails(courseId) });
    },
  });

  return {
    createLesson,
    updateLesson,
    deleteLesson,
    isCreating,
    isUpdating,
    isDeleting,
  };
}
