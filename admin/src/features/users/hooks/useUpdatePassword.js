import { useMutation } from "@tanstack/react-query";
import { usersApi } from "@/features/users/services/users";

function useUpdatePassword() {
  const {
    mutateAsync: updatePassword,
    isPending,
    error,
  } = useMutation({
    mutationKey: ["update-password"],
    mutationFn: async (data) => usersApi.updatePassword(data),
  });
  return { updatePassword, isPending, error };
}

export default useUpdatePassword;