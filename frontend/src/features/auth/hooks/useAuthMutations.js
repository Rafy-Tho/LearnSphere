import { useCallback } from "react";
import { useMutation } from "@tanstack/react-query";
import { toast } from "react-toastify";
import { authApi } from "@/features/auth/services/auth";
import useAuthActions from "@/features/auth/hooks/useAuthActions";

export function useLogin() {
  const { mutateAsync: login, isPending, error } = useMutation({
    mutationKey: ["login"],
    mutationFn: (payload) => authApi.login(payload),
  });
  return { login, isPending, error };
}

export function useRegister() {
  const { mutateAsync: registerUser, isPending, error } = useMutation({
    mutationKey: ["register"],
    mutationFn: (payload) => authApi.register(payload),
  });
  return { registerUser, isPending, error };
}

export function useVerifyEmail() {
  const { mutateAsync: verifyEmail, isPending, error } = useMutation({
    mutationKey: ["verifyEmail"],
    mutationFn: (payload) => authApi.verifyEmail(payload),
  });
  return { verifyEmail, isPending, error };
}

export function useResendVerificationCode() {
  const { mutateAsync: resendVerificationCode, isPending, error } =
    useMutation({
      mutationKey: ["resendVerificationCode"],
      mutationFn: () => authApi.resendVerificationCode(),
    });
  return { resendVerificationCode, isPending, error };
}

export function useSendResetPasswordCode() {
  const { mutate: sendResetPasswordCode, isPending, error } = useMutation({
    mutationKey: ["sendResetPasswordCode"],
    mutationFn: (payload) => authApi.sendResetPasswordCode(payload),
  });
  return { sendResetPasswordCode, isPending, error };
}

export function useVerifyResetPasswordCode() {
  const { mutate: verifyResetPasswordCode, isPending, error } = useMutation({
    mutationKey: ["verifyResetPasswordCode"],
    mutationFn: (payload) => authApi.verifyPasswordResetCode(payload),
  });
  return { verifyResetPasswordCode, isPending, error };
}

export function useResetPassword() {
  const { mutate: resetPassword, isPending, error } = useMutation({
    mutationKey: ["resetPassword"],
    mutationFn: (payload) => authApi.resetPassword(payload),
  });
  return { resetPassword, isPending, error };
}

export function useLogout() {
  const { clearAuth } = useAuthActions();
  const mutation = useMutation({
    mutationKey: ["logout"],
    mutationFn: () => authApi.logout(),
  });

  const { mutateAsync } = mutation;
  const logout = useCallback(async () => {
    try {
      await mutateAsync();
      toast.success("Logout success");
      clearAuth();
      window.location.href = "/login";
    } catch (err) {
      toast.error(err.message || "Logout failed");
    }
  }, [mutateAsync, clearAuth]);

  return { logout, isPending: mutation.isPending };
}
