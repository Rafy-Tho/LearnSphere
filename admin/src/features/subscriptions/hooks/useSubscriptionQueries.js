import { useQuery } from '@tanstack/react-query';
import { subscriptionsApi } from '@/features/subscriptions/services/subscriptions';
import { queryKeys } from '@/lib/queryKeys';

export function useSubscriptions() {
  const { data, isLoading, error } = useQuery({
    queryKey: queryKeys.subscriptions(),
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

export function useBillingStats() {
  const { data, isLoading, error } = useQuery({
    queryKey: queryKeys.billingStats(),
    queryFn: () => subscriptionsApi.getBillingStats(),
  });
  return { data, isLoading, error };
}

export function usePayments() {
  const { data, isLoading, error } = useQuery({
    queryKey: queryKeys.payments(),
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

export function useGetPlans() {
  const { data, isLoading, error } = useQuery({
    queryKey: queryKeys.plans(),
    queryFn: () => subscriptionsApi.getPlans(),
  });
  const plans = data?.data || [];
  return {
    plans,
    pagination: data?.pagination,
    isLoading,
    error,
  };
}

export function useGetCoupons() {
  const { data, isLoading, error } = useQuery({
    queryKey: queryKeys.coupons(),
    queryFn: () => subscriptionsApi.getCoupons(),
  });
  const coupons = data?.data || [];
  return {
    coupons,
    pagination: data?.pagination,
    isLoading,
    error,
  };
}
