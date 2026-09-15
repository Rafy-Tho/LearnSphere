import { useResetPassword as useResetPwd } from "@/features/auth/hooks/useAuthMutations";

export default function useResetPassword() {
  const { mutate: resetPassword, isPending, error } = useResetPwd();
  return { resetPassword, isPending, error };
}
