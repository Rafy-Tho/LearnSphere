import { useMutation, useQueryClient } from "@tanstack/react-query";
import { usersApi } from "@/features/settings/services/users";
import { queryKeys } from "@/lib/queryKeys";

export function useUpdateUserProfile() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["update-profile"],
    mutationFn: (payload) => usersApi.updateProfile(payload),
    onSuccess: (updated) => {
      queryClient.setQueryData(queryKeys.me(), (current) =>
        current ? { ...current, ...updated } : current,
      );
      queryClient.invalidateQueries({ queryKey: queryKeys.profile() });
    },
  });
}

export function useUpdatePassword() {
  return useMutation({
    mutationKey: ["update-password"],
    mutationFn: (payload) => usersApi.changePassword(payload),
  });
}
