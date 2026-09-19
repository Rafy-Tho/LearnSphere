import { useMutation } from '@tanstack/react-query';
import { questionsApi } from '@/features/courses/services/questions';

export function useQuestionActions() {
  const { mutateAsync: createQuestion, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => questionsApi.createQuestion(id, data),
  });

  const { mutateAsync: updateQuestion, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => questionsApi.update(id, data),
  });

  const { mutateAsync: deleteQuestion, isPending: isDeleting } = useMutation({
    mutationFn: (id) => questionsApi.delete(id),
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
