import { useQuery } from "@tanstack/react-query";
import { usersApi } from "@/features/settings/services/users";
import { queryKeys } from "@/lib/queryKeys";
import useAuth from "@/features/auth/hooks/useAuth";

export function useUserProfile() {
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.profile(),
    queryFn: ({ signal }) => usersApi.getProfile({ signal }),
    enabled: !!user,
  });
}

export function useXpEarned() {
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.xpEarned(),
    queryFn: ({ signal }) => usersApi.getXpEarned({ signal }),
    enabled: !!user,
  });
}
