import { useMutation, useQueryClient } from "@tanstack/react-query";
import { subscriptionsApi } from "@/features/subscriptions/services/subscriptions";
import { queryKeys } from "@/lib/queryKeys";

export function useCheckout() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["checkout"],
    mutationFn: ({ planId, couponCode }) =>
      subscriptionsApi.checkout(planId, couponCode),
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: queryKeys.activeSubscription(),
      });
      queryClient.invalidateQueries({ queryKey: queryKeys.paymentsRoot() });
    },
  });
}

export function useValidateCoupon() {
  return useMutation({
    mutationKey: ["validate-coupon"],
    mutationFn: (payload) => subscriptionsApi.validateCoupon(payload),
  });
}

export function useCreateRefundRequest() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["create-refund-request"],
    mutationFn: ({ paymentId, requestedAmount, reason, userNote }) =>
      subscriptionsApi.createRefundRequest(paymentId, {
        ...(requestedAmount !== undefined && requestedAmount !== null
          ? { requested_amount: requestedAmount }
          : {}),
        reason,
        ...(userNote ? { user_note: userNote } : {}),
      }),
    onSuccess: (_data, variables) => {
      queryClient.invalidateQueries({ queryKey: queryKeys.paymentsRoot() });
      queryClient.invalidateQueries({
        queryKey: queryKeys.refundRequestsRoot(),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.paymentRefundRequests(variables.paymentId),
      });
    },
  });
}
