import { useMutation, useQueryClient } from '@tanstack/react-query';
import { categoriesApi } from '@/features/categories/services/categories';
import { queryKeys } from '@/lib/queryKeys';

export function useCreateCategory() {
  const queryClient = useQueryClient();
  const { mutateAsync: createCategory, isPending, error } = useMutation({
    mutationKey: ['create-category'],
    mutationFn: (category) => categoriesApi.createCategory(category),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.categories() });
    },
  });

  return { createCategory, isPending, error };
}

export function useUpdateCategory() {
  const queryClient = useQueryClient();
  const { mutateAsync: updateCategory, isPending, error } = useMutation({
    mutationKey: ['update-category'],
    mutationFn: ({ id, category }) => categoriesApi.updateCategory(id, category),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.categories() });
    },
  });

  return { updateCategory, isPending, error };
}

export function useDeleteCategory() {
  const queryClient = useQueryClient();
  const { mutateAsync: deleteCategory, isPending, error } = useMutation({
    mutationKey: ['delete-category'],
    mutationFn: (id) => categoriesApi.deleteCategory(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.categories() });
    },
  });

  return { deleteCategory, isPending, error };
}
