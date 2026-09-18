import { useCallback, useMemo } from "react";
import { useQueryClient } from "@tanstack/react-query";
import { useGetMe } from "@/features/auth/hooks/useGetMe";
import { authApi } from "@/features/auth/services/auth";
import { clearUserQueries } from "@/lib/queryClient";
import { queryKeys } from "@/lib/queryKeys";
import { AuthContext } from "@/app/providers/context";

function AuthProvider({ children }) {
  const queryClient = useQueryClient();
  const { data, isLoading, error } = useGetMe();
  const user = data ?? null;

  const login = useCallback(
    (userData) => {
      if (!userData?.id) return;
      queryClient.setQueryData(queryKeys.me(), userData);
    },
    [queryClient],
  );

  const logout = useCallback(async () => {
    try {
      await authApi.logout();
    } catch {
      // proceed with local logout even if the API call fails
    }
    clearUserQueries();
  }, []);

  const value = useMemo(
    () => ({ user, login, logout, isLoading, error }),
    [user, login, logout, isLoading, error],
  );

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export default AuthProvider;