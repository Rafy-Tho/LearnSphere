import { useMutation } from '@tanstack/react-query';
import { lessonsApi } from '@/features/courses/services/lessons';

export function useCreateQuestion() {
  const { mutateAsync: createQuestion, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => lessonsApi.createQuestion(id, data),
  });
  return {
    createQuestion,
    isCreating,
  };
}