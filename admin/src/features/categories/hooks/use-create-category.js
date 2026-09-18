import { useMutation, useQueryClient } from '@tanstack/react-query';
import { categoriesApi } from '@/features/categories/services/categories';
export function useCreateCategory() {
  const queryClient = useQueryClient();
  const {
    mutateAsync: createCategory,
    isPending,
    error,
  } = useMutation({
    mutationKey: ['create-category'],
    mutationFn: (category) => categoriesApi.createCategory(category),
    onSuccess: () => {
      // Invalidate and refetch categories query
      queryClient.invalidateQueries({ queryKey: ['categories'] });
    },
  });

  return { createCategory, isPending, error };
}