import { useMutation, useQueryClient } from "@tanstack/react-query";
import { usersApi } from "@/features/users/services/users";

function useUpdateUser() {
  const queryClient = useQueryClient();
  const {
    mutateAsync: updateUser,
    isPending,
    error,
  } = useMutation({
    mutationKey: ["update-user"],
    mutationFn: ({ id, data }) => usersApi.updateUser(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-users"] });
    },
  });
  return { updateUser, isPending, error };
}

export default useUpdateUser;