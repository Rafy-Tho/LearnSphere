import { useState } from "react";
import { useGetPlans, useCreatePlan, useUpdatePlan, useDeletePlan } from "@/features/subscriptions/hooks";
import { useToast } from "@/hooks/use-toast";

const DEFAULT_FORM = { name: "", duration_days: 30, price: 0 };

export function usePlansCrud() {
  const { toast } = useToast();
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState(null);
  const [form, setForm] = useState(DEFAULT_FORM);

  const { data, isLoading, error } = useGetPlans();
  const plans = data?.data || [];

  const { createPlan, isCreating } = useCreatePlan();
  const { updatePlan, isUpdating } = useUpdatePlan();
  const { deletePlan, isDeleting } = useDeletePlan();

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
      await updatePlan({ id: editing.id, data: form });
    } else {
      await createPlan(form);
    }
    setModalOpen(false);
  };

  const remove = async (id) => {
    await deletePlan(id);
  };

  return {
    plans,
    pagination: data?.pagination,
    isLoading: isLoading || isCreating || isUpdating || isDeleting,
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
