import { useMutation } from "@tanstack/react-query";
import { authApi } from "@/features/auth/services/auth";

function useLogin() {
  const { mutateAsync: login, isPending, error } = useMutation({
    mutationFn: (credentials) => authApi.login(credentials),
  });
  return { login, isPending, error };
}

export default useLogin;