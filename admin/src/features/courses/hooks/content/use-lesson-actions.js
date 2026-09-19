import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { chaptersApi } from '@/features/courses/services/chapters';
import { lessonsApi } from '@/features/courses/services/lessons';
import { queryKeys } from '@/lib/queryKeys';

export function useLessonActions() {
  const queryClient = useQueryClient();
  const { courseId } = useParams();

  const invalidate = () => {
    queryClient.invalidateQueries({
      queryKey: queryKeys.chapterLessonsRoot(courseId),
    });
    queryClient.invalidateQueries({
      queryKey: queryKeys.moduleChaptersRoot(courseId),
    });
    queryClient.invalidateQueries({
      queryKey: queryKeys.courseSummary(courseId),
    });
  };

  const { mutateAsync: createLesson, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => chaptersApi.createLesson(id, data),
    onSuccess: invalidate,
  });

  const { mutateAsync: updateLesson, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => lessonsApi.update(id, data),
    onSuccess: invalidate,
  });

  const { mutateAsync: deleteLesson, isPending: isDeleting } = useMutation({
    mutationFn: (id) => lessonsApi.delete(id),
    onSuccess: invalidate,
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
