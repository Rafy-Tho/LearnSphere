import { useRegister as useRegisterMutation } from "@/features/auth/hooks/useAuthMutations";

export default function useRegister() {
  const { mutateAsync: registerUser, isPending, error } = useRegisterMutation();
  return { registerUser, isPending, error };
}
