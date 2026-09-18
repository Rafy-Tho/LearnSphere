import { useMutation } from '@tanstack/react-query';
import { questionsApi } from '@/features/courses/services/questions';

export function useDeleteQuestion() {
  const { mutateAsync: deleteQuestion, isPending: isDeleting } = useMutation({
    mutationFn: (id) => questionsApi.delete(id),
  });
  return {
    deleteQuestion,
    isDeleting,
  };
}