import { useMutation, useQueryClient } from "@tanstack/react-query";
import { usersApi } from "@/features/users/services/users";

function useDeleteUser() {
  const queryClient = useQueryClient();
  const {
    mutateAsync: deleteUser,
    isPending,
    error,
  } = useMutation({
    mutationKey: ["delete-user"],
    mutationFn: (id) => usersApi.deleteUser(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-users"] });
    },
  });
  return { deleteUser, isPending, error };
}

export default useDeleteUser;