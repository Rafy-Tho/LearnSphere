import { useCallback, useMemo } from "react";
import { useQueryClient } from "@tanstack/react-query";
import { useGetMe } from "@/features/auth/hooks/useAuthQueries";
import { clearUserQueries } from "@/lib/queryClient";
import { queryKeys } from "@/lib/queryKeys";
import {
  AuthActionsContext,
  AuthContext,
} from "@/app/providers/context";

function AuthProvider({ children }) {
  const queryClient = useQueryClient();
  const { data, isLoading, error } = useGetMe();
  const user = data ?? null;

  const saveAuth = useCallback(
    (userData) => {
      if (!userData?.id) return;
      queryClient.setQueryData(queryKeys.me(), userData);
    },
    [queryClient],
  );

  const clearAuth = useCallback(() => {
    clearUserQueries();
  }, []);

  const authValue = useMemo(
    () => ({ user, isLoading, error }),
    [user, isLoading, error],
  );

  const actionsValue = useMemo(
    () => ({ saveAuth, clearAuth }),
    [saveAuth, clearAuth],
  );

  return (
    <AuthActionsContext.Provider value={actionsValue}>
      <AuthContext.Provider value={authValue}>{children}</AuthContext.Provider>
    </AuthActionsContext.Provider>
  );
}

export default AuthProvider;
