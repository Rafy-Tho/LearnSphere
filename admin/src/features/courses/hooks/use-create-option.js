import { useMutation } from '@tanstack/react-query';
import { questionsApi } from '@/features/courses/services/questions';

export function useCreateOption() {
  const { mutateAsync: createOption, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => questionsApi.createOption(id, data),
  });
  return {
    createOption,
    isCreating,
  };
}