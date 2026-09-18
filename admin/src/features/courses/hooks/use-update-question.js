import { useMutation } from '@tanstack/react-query';
import { questionsApi } from '@/features/courses/services/questions';

export function useUpdateQuestion() {
  const { mutateAsync: updateQuestion, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => questionsApi.update(id, data),
  });
  return {
    updateQuestion,
    isUpdating,
  };
}