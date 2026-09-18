import { useMutation, useQueryClient } from "@tanstack/react-query";
import { subscriptionsApi } from "@/features/subscriptions/services/subscriptions";
import { useToast } from "@/hooks/use-toast";

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
      queryClient.invalidateQueries({ queryKey: ["admin-payments"] });
      queryClient.invalidateQueries({ queryKey: ["admin-billing-stats"] });
      toast({
        title: "Success!",
        description: "Refund submitted to Stripe successfully.",
      });
    },
    onError: (err) => {
      toast({ title: "Error!", description: err.message, variant: "destructive" });
    },
  });

  return { refundPayment, isRefunding };
}