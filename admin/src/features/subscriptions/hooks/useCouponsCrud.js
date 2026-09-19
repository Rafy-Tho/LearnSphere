import { useState } from "react";
import { useGetCoupons, useCreateCoupon, useUpdateCoupon, useToggleCouponActive, useDeleteCoupon } from "@/features/subscriptions/hooks";
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

export function useCouponsCrud() {
  const { toast } = useToast();
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState(null);
  const [form, setForm] = useState(DEFAULT_FORM);

  const { data, isLoading, error } = useGetCoupons();
  const coupons = data?.data || [];

  const { createCoupon, isCreating } = useCreateCoupon();
  const { updateCoupon, isUpdating } = useUpdateCoupon();
  const { toggleCouponActive, isToggling } = useToggleCouponActive();
  const { deleteCoupon, isDeleting } = useDeleteCoupon();

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
      await updateCoupon({ id: editing.id, data: form });
    } else {
      await createCoupon(form);
    }
    setModalOpen(false);
  };

  const toggleActive = async (id, isActive) => {
    await toggleCouponActive({ id, isActive: !isActive });
  };

  const remove = async (id) => {
    await deleteCoupon(id);
  };

  return {
    coupons,
    pagination: data?.pagination,
    isLoading: isLoading || isCreating || isUpdating || isToggling || isDeleting,
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
    remove,
  };
}
