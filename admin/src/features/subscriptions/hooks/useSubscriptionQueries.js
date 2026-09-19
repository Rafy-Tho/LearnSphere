import { useQuery } from '@tanstack/react-query';
import { subscriptionsApi } from '@/features/subscriptions/services/subscriptions';
import { queryKeys } from '@/lib/queryKeys';

export function useSubscriptions(params = {}, { enabled = true } = {}) {
  const { data, isLoading, error } = useQuery({
    queryKey: [...queryKeys.subscriptions(), params],
    queryFn: () => subscriptionsApi.getSubscriptions(params),
    enabled,
  });
  const subscriptions = data?.data || [];
  return {
    subscriptions,
    pagination: data?.pagination,
    isLoading,
    error,
  };
}

export function useSubscription(id) {
  const { data, isLoading, error } = useQuery({
    queryKey: queryKeys.subscriptionsDetail(id),
    queryFn: () => subscriptionsApi.getSubscription(id),
    enabled: !!id,
  });
  return { subscription: data, isLoading, error };
}

export function useBillingStats() {
  const { data, isLoading, error } = useQuery({
    queryKey: queryKeys.billingStats(),
    queryFn: () => subscriptionsApi.getBillingStats(),
  });
  return { data, isLoading, error };
}

export function usePayments(params = {}, { enabled = true } = {}) {
  const { data, isLoading, error } = useQuery({
    queryKey: [...queryKeys.payments(), params],
    queryFn: () => subscriptionsApi.getPayments(params),
    enabled,
  });
  const payments = data?.data || [];
  return {
    payments,
    pagination: data?.pagination,
    isLoading,
    error,
  };
}

export function usePayment(id) {
  const { data, isLoading, error } = useQuery({
    queryKey: queryKeys.paymentDetails(id),
    queryFn: () => subscriptionsApi.getPayment(id),
    enabled: !!id,
  });
  return { payment: data, isLoading, error };
}

export function usePaymentRefunds(id) {
  const { data, isLoading, error } = useQuery({
    queryKey: queryKeys.paymentRefunds(id),
    queryFn: () => subscriptionsApi.getPaymentRefunds(id),
    enabled: !!id,
  });
  return { refunds: data?.refunds || [], meta: data, isLoading, error };
}

export function useRefunds(params = {}, { enabled = true } = {}) {
  const { data, isLoading, error } = useQuery({
    queryKey: [...queryKeys.refunds(), params],
    queryFn: () => subscriptionsApi.getRefunds(params),
    enabled,
  });
  const refunds = data?.data || [];
  return {
    refunds,
    pagination: data?.pagination,
    isLoading,
    error,
  };
}

export function useRefundRequests(params = {}, { enabled = true } = {}) {
  const { data, isLoading, error } = useQuery({
    queryKey: [...queryKeys.refundRequests(), params],
    queryFn: () => subscriptionsApi.getRefundRequests(params),
    enabled,
  });
  const requests = data?.data || [];
  return {
    requests,
    pagination: data?.pagination,
    isLoading,
    error,
  };
}

export function useRefundRequest(id) {
  const { data, isLoading, error } = useQuery({
    queryKey: queryKeys.refundRequestDetails(id),
    queryFn: () => subscriptionsApi.getRefundRequest(id),
    enabled: !!id,
  });
  return { request: data, isLoading, error };
}

export function useGetPlans(params = {}, { enabled = true } = {}) {
  const { data, isLoading, error } = useQuery({
    queryKey: [...queryKeys.plans(), params],
    queryFn: () => subscriptionsApi.getPlans(params),
    enabled,
  });
  const plans = data?.data || [];
  return {
    plans,
    pagination: data?.pagination,
    isLoading,
    error,
  };
}

export function useGetCoupons(params = {}, { enabled = true } = {}) {
  const { data, isLoading, error } = useQuery({
    queryKey: [...queryKeys.coupons(), params],
    queryFn: () => subscriptionsApi.getCoupons(params),
    enabled,
  });
  const coupons = data?.data || [];
  return {
    coupons,
    pagination: data?.pagination,
    isLoading,
    error,
  };
}
