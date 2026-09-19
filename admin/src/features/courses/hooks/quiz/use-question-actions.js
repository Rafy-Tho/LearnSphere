import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { lessonsApi } from '@/features/courses/services/lessons';
import { questionsApi } from '@/features/courses/services/questions';
import { queryKeys } from '@/lib/queryKeys';

export function useQuestionActions() {
  const queryClient = useQueryClient();
  const { courseId } = useParams();

  const invalidate = () => {
    queryClient.invalidateQueries({
      queryKey: queryKeys.lessonQuestionsRoot(courseId),
    });
    queryClient.invalidateQueries({
      queryKey: queryKeys.chapterLessonsRoot(courseId),
    });
  };

  const { mutateAsync: createQuestion, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => lessonsApi.createQuestion(id, data),
    onSuccess: invalidate,
  });

  const { mutateAsync: updateQuestion, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => questionsApi.update(id, data),
    onSuccess: invalidate,
  });

  const { mutateAsync: deleteQuestion, isPending: isDeleting } = useMutation({
    mutationFn: (id) => questionsApi.delete(id),
    onSuccess: invalidate,
  });

  return {
    createQuestion,
    updateQuestion,
    deleteQuestion,
    isCreating,
    isUpdating,
    isDeleting,
  };
}
