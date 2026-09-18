import { useQuery } from "@tanstack/react-query";
import { subscriptionsApi } from "@/features/subscriptions/services/subscriptions";

export function useBillingStats() {
  const { data, isLoading, error } = useQuery({
    queryKey: ["admin-billing-stats"],
    queryFn: () => subscriptionsApi.getBillingStats(),
  });
  return { data, isLoading, error };
}

export default useBillingStats;