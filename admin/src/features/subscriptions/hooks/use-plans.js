import { useState } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { subscriptionsApi } from "@/features/subscriptions/services/subscriptions";
import { useToast } from "@/hooks/use-toast";

const DEFAULT_FORM = { name: "", duration_days: 30, price: 0 };

export function usePlans() {
  const queryClient = useQueryClient();
  const { toast } = useToast();
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState(null);
  const [form, setForm] = useState(DEFAULT_FORM);

  const { data, isLoading, error } = useQuery({
    queryKey: ["admin-plans"],
    queryFn: () => subscriptionsApi.getPlans(),
  });
  const plans = data?.data || [];

  const onSuccess = () => {
    queryClient.invalidateQueries({ queryKey: ["admin-plans"] });
  };

  const createMutation = useMutation({
    mutationFn: (payload) => subscriptionsApi.createPlan(payload),
    onSuccess: () => {
      onSuccess();
      toast({ title: "Success!", description: "Plan created successfully." });
    },
    onError: (err) => {
      toast({ title: "Error!", description: err.message, variant: "destructive" });
    },
  });

  const updateMutation = useMutation({
    mutationFn: ({ id, data: payload }) => subscriptionsApi.updatePlan(id, payload),
    onSuccess: () => {
      onSuccess();
      toast({ title: "Success!", description: "Plan updated successfully." });
    },
    onError: (err) => {
      toast({ title: "Error!", description: err.message, variant: "destructive" });
    },
  });

  const deleteMutation = useMutation({
    mutationFn: (id) => subscriptionsApi.deletePlan(id),
    onSuccess: () => {
      onSuccess();
      toast({ title: "Success!", description: "Plan deleted successfully." });
    },
    onError: (err) => {
      toast({ title: "Error!", description: err.message, variant: "destructive" });
    },
  });

  const openCreate = () => {
    setEditing(null);
    setForm(DEFAULT_FORM);
    setModalOpen(true);
  };

  const openEdit = (p) => {
    setEditing(p);
    setForm({
      name: p.name,
      duration_days: p.duration_days,
      price: p.price,
    });
    setModalOpen(true);
  };

  const save = async () => {
    if (!form.name || form.price <= 0) return;
    if (editing) {
      await updateMutation.mutateAsync({ id: editing.id, data: form });
    } else {
      await createMutation.mutateAsync(form);
    }
    setModalOpen(false);
  };

  const remove = async (id) => {
    await deleteMutation.mutateAsync(id);
  };

  return {
    plans,
    pagination: data?.pagination,
    isLoading,
    error,
    modalOpen,
    setModalOpen,
    editing,
    form,
    setForm,
    openCreate,
    openEdit,
    save,
    remove,
  };
}