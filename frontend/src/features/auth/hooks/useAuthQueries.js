import { useQuery } from "@tanstack/react-query";
import { authApi } from "@/features/auth/services/auth";
import { queryKeys } from "@/lib/queryKeys";

export function useGetMe() {
  return useQuery({
    queryKey: queryKeys.me(),
    queryFn: async ({ signal }) => {
      try {
        return await authApi.getMe({ signal });
      } catch (err) {
        if (err?.message === "Unauthorized") return null;
        throw err;
      }
    },
    retry: false,
    staleTime: 1000 * 60 * 5,
  });
}
