import { useQuery } from "@tanstack/react-query";
import { subscriptionsApi } from "@/features/subscriptions/services/subscriptions";

export function usePayments() {
  const { data, isLoading, error } = useQuery({
    queryKey: ["admin-payments"],
    queryFn: () => subscriptionsApi.getPayments(),
  });
  const payments = data?.data || [];
  return {
    payments,
    pagination: data?.pagination,
    isLoading,
    error,
  };
}