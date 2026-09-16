import { useQuery } from "@tanstack/react-query";
import { categoriesApi } from "@/features/catalog/services/categories";
import { queryKeys } from "@/lib/queryKeys";

export function useCategories() {
  return useQuery({
    queryKey: queryKeys.categories(),
    queryFn: ({ signal }) => categoriesApi.getAll({ signal }),
    staleTime: 1000 * 60 * 30,
  });
}
