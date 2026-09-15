import { useSendResetPasswordCode as useSendCode } from "@/features/auth/hooks/useAuthMutations";

export default function useSendResetPasswordCode() {
  const { mutate: sendResetPasswordCode, isPending, error } = useSendCode();
  return { sendResetPasswordCode, isPending, error };
}
