import { useMutation, useQueryClient } from "@tanstack/react-query";
import { usersApi } from "@/features/users/services/users";

function useCreateUser() {
  const queryClient = useQueryClient();
  const {
    mutateAsync: createUser,
    isPending,
    error,
  } = useMutation({
    mutationKey: ["create-user"],
    mutationFn: (data) => usersApi.createUser(data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-users"] });
    },
  });
  return { createUser, isPending, error };
}

export default useCreateUser;