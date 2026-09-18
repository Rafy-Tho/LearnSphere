import { useMutation, useQueryClient } from "@tanstack/react-query";
import { subscriptionsApi } from "@/features/subscriptions/services/subscriptions";
import { useToast } from "@/hooks/use-toast";

export function useSubscriptionOverride() {
  const queryClient = useQueryClient();
  const { toast } = useToast();

  const {
    mutateAsync: overrideSubscription,
    isPending: isOverriding,
  } = useMutation({
    mutationFn: (data) => subscriptionsApi.overrideSubscription(data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["admin-user-subscriptions"] });
      queryClient.invalidateQueries({ queryKey: ["admin-billing-stats"] });
      toast({
        title: "Success!",
        description: "Subscription override applied successfully.",
      });
    },
    onError: (err) => {
      toast({ title: "Error!", description: err.message, variant: "destructive" });
    },
  });

  return { overrideSubscription, isOverriding };
}