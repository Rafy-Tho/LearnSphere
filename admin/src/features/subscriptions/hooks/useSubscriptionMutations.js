import { useMutation, useQueryClient } from '@tanstack/react-query';
import { subscriptionsApi } from '@/features/subscriptions/services/subscriptions';
import { useToast } from '@/hooks/use-toast';
import { queryKeys } from '@/lib/queryKeys';

export function useRefund() {
  const queryClient = useQueryClient();
  const { toast } = useToast();

  const {
    mutateAsync: refundPayment,
    isPending: isRefunding,
  } = useMutation({
    mutationFn: ({ id, amount, reason }) =>
      subscriptionsApi.refundPayment(id, { amount, reason }),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.payments() });
      queryClient.invalidateQueries({ queryKey: queryKeys.billingStats() });
      toast({
        title: 'Success!',
        description: 'Refund submitted to Stripe successfully.',
      });
    },
    onError: (err) => {
      toast({ title: 'Error!', description: err.message, variant: 'destructive' });
    },
  });

  return { refundPayment, isRefunding };
}

export function useSubscriptionOverride() {
  const queryClient = useQueryClient();
  const { toast } = useToast();

  const {
    mutateAsync: overrideSubscription,
    isPending: isOverriding,
  } = useMutation({
    mutationFn: (data) => subscriptionsApi.overrideSubscription(data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.subscriptions() });
      queryClient.invalidateQueries({ queryKey: queryKeys.billingStats() });
      toast({
        title: 'Success!',
        description: 'Subscription override applied successfully.',
      });
    },
    onError: (err) => {
      toast({ title: 'Error!', description: err.message, variant: 'destructive' });
    },
  });

  return { overrideSubscription, isOverriding };
}

export function useCreatePlan() {
  const queryClient = useQueryClient();
  const { toast } = useToast();

  const {
    mutateAsync: createPlan,
    isPending: isCreating,
  } = useMutation({
    mutationFn: (payload) => subscriptionsApi.createPlan(payload),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.plans() });
      toast({ title: 'Success!', description: 'Plan created successfully.' });
    },
    onError: (err) => {
      toast({ title: 'Error!', description: err.message, variant: 'destructive' });
    },
  });

  return { createPlan, isCreating };
}

export function useUpdatePlan() {
  const queryClient = useQueryClient();
  const { toast } = useToast();

  const {
    mutateAsync: updatePlan,
    isPending: isUpdating,
  } = useMutation({
    mutationFn: ({ id, data: payload }) => subscriptionsApi.updatePlan(id, payload),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.plans() });
      toast({ title: 'Success!', description: 'Plan updated successfully.' });
    },
    onError: (err) => {
      toast({ title: 'Error!', description: err.message, variant: 'destructive' });
    },
  });

  return { updatePlan, isUpdating };
}

export function useDeletePlan() {
  const queryClient = useQueryClient();
  const { toast } = useToast();

  const {
    mutateAsync: deletePlan,
    isPending: isDeleting,
  } = useMutation({
    mutationFn: (id) => subscriptionsApi.deletePlan(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.plans() });
      toast({ title: 'Success!', description: 'Plan deleted successfully.' });
    },
    onError: (err) => {
      toast({ title: 'Error!', description: err.message, variant: 'destructive' });
    },
  });

  return { deletePlan, isDeleting };
}

export function useCreateCoupon() {
  const queryClient = useQueryClient();
  const { toast } = useToast();

  const {
    mutateAsync: createCoupon,
    isPending: isCreating,
  } = useMutation({
    mutationFn: (payload) => subscriptionsApi.createCoupon(payload),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.coupons() });
      toast({ title: 'Success!', description: 'Coupon created successfully.' });
    },
    onError: (err) => {
      toast({ title: 'Error!', description: err.message, variant: 'destructive' });
    },
  });

  return { createCoupon, isCreating };
}

export function useUpdateCoupon() {
  const queryClient = useQueryClient();
  const { toast } = useToast();

  const {
    mutateAsync: updateCoupon,
    isPending: isUpdating,
  } = useMutation({
    mutationFn: ({ id, data: payload }) => subscriptionsApi.updateCoupon(id, payload),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.coupons() });
      toast({ title: 'Success!', description: 'Coupon updated successfully.' });
    },
    onError: (err) => {
      toast({ title: 'Error!', description: err.message, variant: 'destructive' });
    },
  });

  return { updateCoupon, isUpdating };
}

export function useToggleCouponActive() {
  const queryClient = useQueryClient();
  const { toast } = useToast();

  const {
    mutateAsync: toggleCouponActive,
    isPending: isToggling,
  } = useMutation({
    mutationFn: ({ id, isActive }) => subscriptionsApi.setCouponActive(id, isActive),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.coupons() });
      queryClient.invalidateQueries({ queryKey: queryKeys.billingStats() });
      toast({
        title: 'Success!',
        description: 'Coupon status updated successfully.',
      });
    },
    onError: (err) => {
      toast({ title: 'Error!', description: err.message, variant: 'destructive' });
    },
  });

  return { toggleCouponActive, isToggling };
}

export function useDeleteCoupon() {
  const queryClient = useQueryClient();
  const { toast } = useToast();

  const {
    mutateAsync: deleteCoupon,
    isPending: isDeleting,
  } = useMutation({
    mutationFn: (id) => subscriptionsApi.deleteCoupon(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.coupons() });
      toast({ title: 'Success!', description: 'Coupon deleted successfully.' });
    },
    onError: (err) => {
      toast({ title: 'Error!', description: err.message, variant: 'destructive' });
    },
  });

  return { deleteCoupon, isDeleting };
}
