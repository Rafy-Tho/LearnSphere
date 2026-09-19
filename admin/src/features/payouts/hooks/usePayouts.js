import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";
import { payoutsApi } from "@/features/payouts/services/payouts";
import { queryKeys } from "@/lib/queryKeys";

export function usePayoutSettings() {
  const { data, isPending, error } = useQuery({
    queryKey: queryKeys.platformSettings(),
    queryFn: () => payoutsApi.getSettings(),
  });
  return { data, isPending, error };
}

export function useUpdateSettings() {
  const queryClient = useQueryClient();
  const { mutateAsync, isPending } = useMutation({
    mutationFn: (data) => payoutsApi.updateSettings(data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.platformSettings() });
      queryClient.invalidateQueries({
        queryKey: queryKeys.instructorEarnings(),
      });
    },
  });
  return { updateSettings: mutateAsync, isUpdating: isPending };
}

export function useAdminPayouts(params) {
  const { data, isPending, error } = useQuery({
    queryKey: queryKeys.adminPayouts(params),
    queryFn: () => payoutsApi.getPayouts(params),
  });
  return { data, isPending, error };
}

export function useCreatePayout() {
  const queryClient = useQueryClient();
  const { mutateAsync, isPending } = useMutation({
    mutationFn: (data) => payoutsApi.createPayout(data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.adminPayouts(null) });
    },
  });
  return { createPayout: mutateAsync, isCreating: isPending };
}

export function useUpdatePayout() {
  const queryClient = useQueryClient();
  const { mutateAsync, isPending } = useMutation({
    mutationFn: ({ id, data }) => payoutsApi.updatePayout(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.adminPayouts(null) });
    },
  });
  return { updatePayout: mutateAsync, isUpdating: isPending };
}
