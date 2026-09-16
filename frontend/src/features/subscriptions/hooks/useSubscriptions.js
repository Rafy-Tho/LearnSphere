import { useQuery } from "@tanstack/react-query";
import { subscriptionsApi } from "@/features/subscriptions/services/subscriptions";
import { queryKeys } from "@/lib/queryKeys";
import useAuth from "@/features/auth/hooks/useAuth";

export function useActiveSubscription() {
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.activeSubscription(),
    queryFn: ({ signal }) => subscriptionsApi.getActive({ signal }),
    enabled: !!user,
  });
}

export function useSubscriptionDetails(planId) {
  return useQuery({
    queryKey: queryKeys.subscription(planId),
    queryFn: ({ signal }) => subscriptionsApi.getById(planId, { signal }),
    enabled: !!planId,
    staleTime: 1000 * 60 * 10,
  });
}
