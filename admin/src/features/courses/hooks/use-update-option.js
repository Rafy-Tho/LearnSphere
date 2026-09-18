import { useMutation } from '@tanstack/react-query';
import { optionsApi } from '@/features/courses/services/options';

export function useUpdateOption() {
  const { mutateAsync: updateOption, isPending: isUpdating } = useMutation({
    mutationFn: ({ id, data }) => optionsApi.update(id, data),
  });
  return {
    updateOption,
    isUpdating,
  };
}