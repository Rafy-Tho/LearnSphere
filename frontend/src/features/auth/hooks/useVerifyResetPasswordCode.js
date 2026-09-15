import { useVerifyResetPasswordCode as useVerifyCode } from "@/features/auth/hooks/useAuthMutations";

export default function useVerifyResetPasswordCode() {
  const { mutate: verifyResetPasswordCode, isPending, error } = useVerifyCode();
  return { verifyResetPasswordCode, isPending, error };
}
