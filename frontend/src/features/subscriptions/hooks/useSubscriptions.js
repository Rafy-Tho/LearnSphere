import { useQuery } from "@tanstack/react-query";
import { subscriptionsApi } from "@/features/subscriptions/services/subscriptions";
import useAuth from "@/features/auth/hooks/useAuth";

export function useActiveSubscription() {
  const { user } = useAuth();
  return useQuery({
    queryKey: ["active-subscription"],
    queryFn: () => subscriptionsApi.getActive(),
    enabled: !!user,
  });
}

export function useSubscriptionDetails(planId) {
  return useQuery({
    queryKey: ["subscription", planId],
    queryFn: () => subscriptionsApi.getById(planId),
    enabled: !!planId,
    staleTime: 1000 * 60 * 10,
  });
}
