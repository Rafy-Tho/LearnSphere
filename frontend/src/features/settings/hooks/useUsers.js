import { useQuery } from "@tanstack/react-query";
import { usersApi } from "@/features/settings/services/users";
import useAuth from "@/features/auth/hooks/useAuth";

export function useUserProfile() {
  const { user } = useAuth();
  return useQuery({
    queryKey: ["profile"],
    queryFn: () => usersApi.getProfile(),
    enabled: !!user,
  });
}

export function useXpEarned() {
  const { user } = useAuth();
  return useQuery({
    queryKey: ["xp-earned"],
    queryFn: () => usersApi.getXpEarned(),
    enabled: !!user,
  });
}
