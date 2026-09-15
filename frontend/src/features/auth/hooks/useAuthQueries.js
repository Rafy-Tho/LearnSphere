import { useQuery } from "@tanstack/react-query";
import { authApi } from "@/features/auth/services/auth";

export function useGetMe() {
  return useQuery({
    queryKey: ["me"],
    queryFn: async () => {
      try {
        return await authApi.getMe();
      } catch (err) {
        if (err?.message === "Unauthorized") return null;
        throw err;
      }
    },
    retry: false,
    staleTime: 1000 * 60 * 5,
  });
}
