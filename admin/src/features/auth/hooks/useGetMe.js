import { useQuery } from "@tanstack/react-query";
import { authApi } from "@/features/auth/services/auth";
import { queryKeys } from "@/lib/queryKeys";

export function useGetMe() {
  return useQuery({
    queryKey: queryKeys.me(),
    queryFn: () => authApi.getMe(),
    retry: false,
    staleTime: 1000 * 60 * 10, // 10 minutes
    refetchOnWindowFocus: false,
  });
}