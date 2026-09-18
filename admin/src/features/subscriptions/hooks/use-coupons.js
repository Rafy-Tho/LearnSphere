import { useState } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { subscriptionsApi } from "@/features/subscriptions/services/subscriptions";
import { useToast } from "@/hooks/use-toast";

const DEFAULT_FORM = {
  code: "",
  discount_type: "PERCENTAGE",
  discount_value: 0,
  max_redemptions: "",
  starts_at: "",
  expires_at: "",
  is_active: true,
};

export function useCoupons() {
  const queryClient = useQueryClient();
  const { toast } = useToast();
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState(null);
  const [form, setForm] = useState(DEFAULT_FORM);

  const { data, isLoading, error } = useQuery({
    queryKey: ["admin-coupons"],
    queryFn: () => subscriptionsApi.getCoupons(),
  });
  const coupons = data?.data || [];

  const onSuccess = () => {
    queryClient.invalidateQueries({ queryKey: ["admin-coupons"] });
  };

  const createMutation = useMutation({
    mutationFn: (payload) => subscriptionsApi.createCoupon(payload),
    onSuccess: () => {
      onSuccess();
      toast({ title: "Success!", description: "Coupon created successfully." });
    },
    onError: (err) => {
      toast({ title: "Error!", description: err.message, variant: "destructive" });
    },
  });

  const updateMutation = useMutation({
    mutationFn: ({ id, data: payload }) => subscriptionsApi.updateCoupon(id, payload),
    onSuccess: () => {
      onSuccess();
      toast({ title: "Success!", description: "Coupon updated successfully." });
    },
    onError: (err) => {
      toast({ title: "Error!", description: err.message, variant: "destructive" });
    },
  });

  const toggleMutation = useMutation({
    mutationFn: ({ id, isActive }) => subscriptionsApi.setCouponActive(id, isActive),
    onSuccess: () => {
      onSuccess();
      queryClient.invalidateQueries({ queryKey: ["admin-billing-stats"] });
      toast({
        title: "Success!",
        description: "Coupon status updated successfully.",
      });
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

  const openEdit = (c) => {
    setEditing(c);
    setForm({
      code: c.code,
      discount_type: c.discount_type,
      discount_value: Number(c.discount_value),
      max_redemptions: c.max_redemptions ?? "",
      starts_at: c.starts_at?.slice(0, 10) || "",
      expires_at: c.expires_at?.slice(0, 10) || "",
      is_active: c.is_active,
    });
    setModalOpen(true);
  };

  const save = async () => {
    if (!form.code || form.discount_value <= 0) return;
    if (editing) {
      await updateMutation.mutateAsync({ id: editing.id, data: form });
    } else {
      await createMutation.mutateAsync(form);
    }
    setModalOpen(false);
  };

  const toggleActive = async (id, isActive) => {
    await toggleMutation.mutateAsync({ id, isActive: !isActive });
  };

  return {
    coupons,
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
    toggleActive,
  };
}