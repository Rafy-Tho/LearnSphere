import { useMutation } from "@tanstack/react-query";
import { usersApi } from "@/features/settings/services/users";

export function useUpdateUserProfile() {
  return useMutation({
    mutationKey: ["update-profile"],
    mutationFn: (payload) => usersApi.updateProfile(payload),
  });
}

export function useUpdatePassword() {
  return useMutation({
    mutationKey: ["update-password"],
    mutationFn: (payload) => usersApi.changePassword(payload),
  });
}
