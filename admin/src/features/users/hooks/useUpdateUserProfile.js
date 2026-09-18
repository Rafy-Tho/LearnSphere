import { useMutation } from "@tanstack/react-query";
import { usersApi } from "@/features/users/services/users";

function useUpdateUserProfile() {
  const {
    mutateAsync: updateProfile,
    isPending,
    error,
  } = useMutation({
    mutationKey: ["update-profile"],
    mutationFn: (data) => usersApi.updateProfile(data),
  });
  return { updateProfile, isPending, error };
}

export default useUpdateUserProfile;