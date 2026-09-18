import { useMutation } from '@tanstack/react-query';
import { optionsApi } from '@/features/courses/services/options';

export function useDeleteOption() {
  const { mutateAsync: deleteOption, isPending: isDeleting } = useMutation({
    mutationFn: (id) => optionsApi.delete(id),
  });
  return {
    deleteOption,
    isDeleting,
  };
}