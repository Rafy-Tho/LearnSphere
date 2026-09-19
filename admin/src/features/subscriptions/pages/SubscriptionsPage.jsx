import { useState } from "react";
import { useBillingStats, usePayments, useSubscriptions, usePlansCrud, useCouponsCrud, useSubscriptionOverride, useRefund } from "@/features/subscriptions/hooks";
import { CouponModal } from "@/features/subscriptions/components/CouponModal";
import { CouponsTab } from "@/features/subscriptions/components/CouponsTab";
import { DeleteConfirmDialog } from "@/features/subscriptions/components/DeleteConfirmDialog";
import { PaymentsTab } from "@/features/subscriptions/components/PaymentsTab";
import { PlanModal } from "@/features/subscriptions/components/PlanModal";
import { PlansTab } from "@/features/subscriptions/components/PlansTab";
import { RefundModal } from "@/features/subscriptions/components/RefundModal";
import { SubscriptionsTab } from "@/features/subscriptions/components/SubscriptionsTab";
import { SubscriptionOverrideModal } from "@/features/subscriptions/components/SubscriptionOverrideModal";
import { SubscriptionStats } from "@/features/subscriptions/components/SubscriptionStats";
import {
  Tabs,
  TabsContent,
  TabsList,
  TabsTrigger,
} from "@/components/ui/tabs";
import { SubscriptionsPageSkeleton } from "@/components/ui/skeleton";
import useGetUsers from "@/features/users/hooks/useGetUsers";

export default function SubscriptionsPage() {
  const statsHook = useBillingStats();
  const planHook = usePlansCrud();
  const subHook = useSubscriptions();
  const payHook = usePayments();
  const couponHook = useCouponsCrud();
  const { overrideSubscription, isOverriding } = useSubscriptionOverride();
  const { refundPayment, isRefunding } = useRefund();
  const { data: learnersData, isPending: playersPending } = useGetUsers({
    role: "LEARNER",
    limit: 100,
  });
  const learners = learnersData?.data || [];

  const [deleteTarget, setDeleteTarget] = useState(null);
  const [overrideOpen, setOverrideOpen] = useState(false);
  const [overrideForm, setOverrideForm] = useState({
    user_id: "",
    plan_id: "",
    start_date: "",
    end_date: "",
    reason: "",
  });
  const [refundTarget, setRefundTarget] = useState(null);

  const isLoading =
    statsHook.isLoading ||
    planHook.isLoading ||
    subHook.isLoading ||
    payHook.isLoading ||
    couponHook.isLoading ||
    playersPending;

  if (isLoading) return <SubscriptionsPageSkeleton />;

  const handleDelete = async () => {
    if (!deleteTarget) return;
    if (deleteTarget.type === "plan") await planHook.remove(deleteTarget.id);
    setDeleteTarget(null);
  };

  const handleOverride = async () => {
    if (
      !overrideForm.user_id ||
      !overrideForm.plan_id ||
      !overrideForm.start_date ||
      !overrideForm.end_date ||
      !overrideForm.reason
    ) {
      return;
    }
    await overrideSubscription(overrideForm);
    setOverrideOpen(false);
  };

  const handleRefund = async ({ amount, reason }) => {
    if (!refundTarget) return;
    await refundPayment({ id: refundTarget.id, amount, reason });
    setRefundTarget(null);
  };

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-foreground">Subscriptions</h1>
        <p className="text-muted-foreground mt-1">
          Manage plans, user subscriptions, payments, and coupons
        </p>
      </div>

      <SubscriptionStats stats={statsHook.data} />

      <Tabs defaultValue="plans" className="w-full">
        <TabsList className="bg-muted/50">
          <TabsTrigger value="plans">Plans</TabsTrigger>
          <TabsTrigger value="subscriptions">User Subscriptions</TabsTrigger>
          <TabsTrigger value="payments">Payments</TabsTrigger>
          <TabsTrigger value="coupons">Coupons</TabsTrigger>
        </TabsList>
        <TabsContent value="plans">
          <PlansTab
            plans={planHook.plans}
            onAdd={planHook.openCreate}
            onEdit={planHook.openEdit}
            onDelete={(id) => setDeleteTarget({ type: "plan", id })}
          />
        </TabsContent>
        <TabsContent value="subscriptions">
          <SubscriptionsTab
            subscriptions={subHook.subscriptions}
            onOverride={() => setOverrideOpen(true)}
          />
        </TabsContent>
        <TabsContent value="payments">
          <PaymentsTab payments={payHook.payments} onRefund={setRefundTarget} />
        </TabsContent>
        <TabsContent value="coupons">
          <CouponsTab
            coupons={couponHook.coupons}
            onAdd={couponHook.openCreate}
            onEdit={couponHook.openEdit}
            onToggle={couponHook.toggleActive}
          />
        </TabsContent>
      </Tabs>

      <PlanModal
        open={planHook.modalOpen}
        onOpenChange={planHook.setModalOpen}
        editing={planHook.editing}
        form={planHook.form}
        setForm={planHook.setForm}
        onSave={planHook.save}
      />

      <SubscriptionOverrideModal
        open={overrideOpen}
        onOpenChange={setOverrideOpen}
        form={overrideForm}
        setForm={setOverrideForm}
        onSave={handleOverride}
        learners={learners}
        plans={planHook.plans}
        isSaving={isOverriding}
      />

      <RefundModal
        open={!!refundTarget}
        onOpenChange={(open) => {
          if (!open) setRefundTarget(null);
        }}
        payment={refundTarget}
        onConfirm={handleRefund}
        isRefunding={isRefunding}
      />

      <CouponModal
        open={couponHook.modalOpen}
        onOpenChange={couponHook.setModalOpen}
        editing={couponHook.editing}
        form={couponHook.form}
        setForm={couponHook.setForm}
        onSave={couponHook.save}
      />

      <DeleteConfirmDialog
        target={deleteTarget}
        onConfirm={handleDelete}
        onCancel={() => setDeleteTarget(null)}
      />
    </div>
  );
}