import { useMutation } from "@tanstack/react-query";
import { authApi } from "@/features/auth/services/auth";

function useLogin() {
  return useMutation({
    mutationFn: (credentials) => authApi.login(credentials),
  });
}

export default useLogin;