import { useMutation, useQueryClient } from "@tanstack/react-query";
import { subscriptionsApi } from "@/features/subscriptions/services/subscriptions";
import { queryKeys } from "@/lib/queryKeys";

export function useCreatePayment() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["create-payment"],
    mutationFn: (id) => subscriptionsApi.createPayment(id),
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: queryKeys.activeSubscription(),
      });
    },
  });
}
