import { useLogin as useLoginMutation } from "@/features/auth/hooks/useAuthMutations";

export default function useLogin() {
  const { mutateAsync: login, isPending, error } = useLoginMutation();
  return { login, isPending, error };
}
