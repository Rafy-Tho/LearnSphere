import { useQuery } from "@tanstack/react-query";
import { categoriesApi } from "@/features/catalog/services/categories";

export function useCategories() {
  return useQuery({
    queryKey: ["categories"],
    queryFn: () => categoriesApi.getAll(),
    staleTime: 1000 * 60 * 30,
  });
}
