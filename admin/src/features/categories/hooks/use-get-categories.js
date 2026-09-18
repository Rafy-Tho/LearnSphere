import { useQuery } from '@tanstack/react-query';
import { useAuth } from '@/app/providers/context';
import { categoriesApi } from '@/features/categories/services/categories';

function useGetCategories() {
  const { user } = useAuth();
  const { data, isLoading, error } = useQuery({
    queryKey: ['categories'],
    queryFn: () => categoriesApi.getCategories(),
    enabled: !!user,
  });

  return { data, isLoading, error };
}
export default useGetCategories;