import { useQuery } from "@tanstack/react-query";
import { subscriptionsApi } from "@/features/subscriptions/services/subscriptions";

export function useSubscriptions() {
  const { data, isLoading, error } = useQuery({
    queryKey: ["admin-user-subscriptions"],
    queryFn: () => subscriptionsApi.getSubscriptions(),
  });
  const subscriptions = data?.data || [];
  return {
    subscriptions,
    pagination: data?.pagination,
    isLoading,
    error,
  };
}