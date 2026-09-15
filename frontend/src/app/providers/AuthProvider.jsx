import { useCallback } from "react";
import { useQueryClient } from "@tanstack/react-query";
import { useGetMe } from "@/features/auth/hooks/useAuthQueries";
import { AuthContext } from "@/app/providers/context";

function AuthProvider({ children }) {
  const queryClient = useQueryClient();
  const { data, isLoading, error } = useGetMe();
  const user = data ?? null;

  const saveAuth = useCallback(
    (userData) => {
      if (!userData?.id) return;
      queryClient.setQueryData(["me"], userData);
    },
    [queryClient],
  );

  const clearAuth = useCallback(() => {
    queryClient.setQueryData(["me"], null);
    queryClient.removeQueries({ predicate: (q) => q.queryKey[0] !== "me" });
  }, [queryClient]);

  return (
    <AuthContext.Provider value={{ user, isLoading, error, saveAuth, clearAuth }}>
      {children}
    </AuthContext.Provider>
  );
}

export default AuthProvider;
