import { useMutation } from '@tanstack/react-query';
import { questionsApi } from '@/features/courses/services/questions';

export function useOptionActions() {
  const { mutateAsync: createOption, isPending: isCreating } = useMutation({
    mutationFn: ({ id, data }) => questionsApi.createOption(id, data),
  });

  const { mutateAsync: updateOption, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => questionsApi.updateOption(id, data),
  });

  const { mutateAsync: deleteOption, isPending: isDeleting } = useMutation({
    mutationFn: (id) => questionsApi.deleteOption(id),
  });

  return {
    createOption,
    updateOption,
    deleteOption,
    isCreating,
    isUpdating,
    isDeleting,
  };
}
