import { useMutation } from "@tanstack/react-query";
import { subscriptionsApi } from "@/features/subscriptions/services/subscriptions";

export function useCreatePayment() {
  return useMutation({
    mutationKey: ["create-payment"],
    mutationFn: (id) => subscriptionsApi.createPayment(id),
  });
}
