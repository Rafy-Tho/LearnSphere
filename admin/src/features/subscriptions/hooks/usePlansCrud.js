import { useState } from "react";
import {
  useGetPlans,
  useCreatePlan,
  useUpdatePlan,
  useDeletePlan,
  useSetPlanStatus,
} from "@/features/subscriptions/hooks";

const DEFAULT_FORM = { name: "", duration_days: 30, price: 0 };

export function usePlansCrud() {
  const [modalOpen, setModalOpen] = useState(false);
  const [editing, setEditing] = useState(null);
  const [form, setForm] = useState(DEFAULT_FORM);

  const { plans, pagination, isLoading, error } = useGetPlans();

  const { createPlan, isCreating } = useCreatePlan();
  const { updatePlan, isUpdating } = useUpdatePlan();
  const { deletePlan, isDeleting } = useDeletePlan();
  const { setPlanStatus, isUpdatingStatus } = useSetPlanStatus();

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

  const toggleStatus = async (id, isActive) => {
    await setPlanStatus({ id, isActive: !isActive });
  };

  return {
    plans,
    pagination,
    isLoading:
      isLoading || isCreating || isUpdating || isDeleting || isUpdatingStatus,
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
    toggleStatus,
  };
}
