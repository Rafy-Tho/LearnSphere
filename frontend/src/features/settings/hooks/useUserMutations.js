import { useMutation } from "@tanstack/react-query";
import { usersApi } from "@/features/settings/services/users";

export function useUpdateUserProfile() {
  return useMutation({
    mutationKey: ["update-profile"],
    mutationFn: (data) => usersApi.updateProfile(data),
  });
}

export function useUpdatePassword() {
  return useMutation({
    mutationKey: ["update-password"],
    mutationFn: (data) => usersApi.changePassword(data),
  });
}
