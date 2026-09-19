import { useState } from "react";
import {
  useBillingStats,
  usePayments,
  useSubscriptions,
  usePlansCrud,
  useCouponsCrud,
  useSubscriptionOverride,
  useRefund,
  useRefundRequests,
  useRefunds,
  useApproveRefundRequest,
  useRejectRefundRequest,
} from "@/features/subscriptions/hooks";
import { CouponModal } from "@/features/subscriptions/components/CouponModal";
import { CouponsTab } from "@/features/subscriptions/components/CouponsTab";
import { ConfirmDialog } from "@/components/common/ConfirmDialog";
import { PaymentDetailModal } from "@/features/subscriptions/components/PaymentDetailModal";
import { PaymentsTab } from "@/features/subscriptions/components/PaymentsTab";
import { PlanModal } from "@/features/subscriptions/components/PlanModal";
import { PlansTab } from "@/features/subscriptions/components/PlansTab";
import { RefundModal } from "@/features/subscriptions/components/RefundModal";
import { RefundRequestsTab } from "@/features/subscriptions/components/RefundRequestsTab";
import { RefundReviewModal } from "@/features/subscriptions/components/RefundReviewModal";
import { RefundsTab } from "@/features/subscriptions/components/RefundsTab";
import { SubscriptionDetailModal } from "@/features/subscriptions/components/SubscriptionDetailModal";
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
import { useGetUsers } from "@/features/users/hooks";

const PAGE_SIZE = 20;

export default function SubscriptionsPage() {
  const statsHook = useBillingStats();
  const planHook = usePlansCrud();
  const couponHook = useCouponsCrud();

  const [subFilters, setSubFilters] = useState({
    search: "",
    status: "",
    plan_id: "",
  });
  const [subPage, setSubPage] = useState(1);
  const subHook = useSubscriptions({
    ...subFilters,
    page: subPage,
    limit: PAGE_SIZE,
  });

  const [payFilters, setPayFilters] = useState({
    search: "",
    status: "",
    plan_id: "",
  });
  const [payPage, setPayPage] = useState(1);
  const payHook = usePayments({
    ...payFilters,
    page: payPage,
    limit: PAGE_SIZE,
  });

  const [requestFilters, setRequestFilters] = useState({
    search: "",
    status: "",
  });
  const [requestPage, setRequestPage] = useState(1);
  const refundRequestsHook = useRefundRequests({
    ...requestFilters,
    page: requestPage,
    limit: PAGE_SIZE,
  });

  const [refundFilters, setRefundFilters] = useState({
    search: "",
    status: "",
  });
  const [refundPage, setRefundPage] = useState(1);
  const refundsHook = useRefunds({
    ...refundFilters,
    page: refundPage,
    limit: PAGE_SIZE,
  });

  const { overrideSubscription, isOverriding } = useSubscriptionOverride();
  const { refundPayment, isRefunding } = useRefund();
  const { approveRefundRequest, isApproving } = useApproveRefundRequest();
  const { rejectRefundRequest, isRejecting } = useRejectRefundRequest();

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
  const [reviewTarget, setReviewTarget] = useState(null);
  const [detailPaymentId, setDetailPaymentId] = useState(null);
  const [viewSubscriptionId, setViewSubscriptionId] = useState(null);

  const isLoading =
    statsHook.isLoading ||
    planHook.isLoading ||
    couponHook.isLoading ||
    playersPending;

  if (isLoading) return <SubscriptionsPageSkeleton />;

  const updateSubFilters = (patch) => {
    setSubFilters((f) => ({ ...f, ...patch }));
    setSubPage(1);
  };
  const updatePayFilters = (patch) => {
    setPayFilters((f) => ({ ...f, ...patch }));
    setPayPage(1);
  };
  const updateRequestFilters = (patch) => {
    setRequestFilters((f) => ({ ...f, ...patch }));
    setRequestPage(1);
  };
  const updateRefundFilters = (patch) => {
    setRefundFilters((f) => ({ ...f, ...patch }));
    setRefundPage(1);
  };

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
    const refundRequestId =
      refundTarget.refund_request_status === "APPROVED"
        ? refundTarget.refund_request_id
        : undefined;
    await refundPayment({
      id: refundTarget.id,
      amount,
      reason,
      refundRequestId,
    });
    setRefundTarget(null);
  };

  const handleApprove = async ({ note }) => {
    if (!reviewTarget) return;
    await approveRefundRequest({ id: reviewTarget.id, note });
    setReviewTarget(null);
  };

  const handleReject = async ({ reason }) => {
    if (!reviewTarget) return;
    await rejectRefundRequest({ id: reviewTarget.id, reason });
    setReviewTarget(null);
  };

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold text-foreground">Subscriptions</h1>
        <p className="text-muted-foreground mt-1">
          Manage plans, subscriptions, payments, refund requests, refunds, and
          coupons
        </p>
      </div>

      <SubscriptionStats stats={statsHook.data} />

      <Tabs defaultValue="plans" className="w-full">
        <TabsList className="bg-muted/50">
          <TabsTrigger value="plans">Plans</TabsTrigger>
          <TabsTrigger value="subscriptions">User Subscriptions</TabsTrigger>
          <TabsTrigger value="payments">Payments</TabsTrigger>
          <TabsTrigger value="refund-requests">Refund Requests</TabsTrigger>
          <TabsTrigger value="refunds">Refunds</TabsTrigger>
          <TabsTrigger value="coupons">Coupons</TabsTrigger>
        </TabsList>
        <TabsContent value="plans">
          <PlansTab
            plans={planHook.plans}
            onAdd={planHook.openCreate}
            onEdit={planHook.openEdit}
            onToggle={planHook.toggleStatus}
            onDelete={(id) => setDeleteTarget({ type: "plan", id })}
          />
        </TabsContent>
        <TabsContent value="subscriptions">
          <SubscriptionsTab
            subscriptions={subHook.subscriptions}
            filters={subFilters}
            onFilterChange={updateSubFilters}
            plans={planHook.plans}
            page={subPage}
            totalPages={subHook.pagination?.totalPages || 1}
            onPageChange={setSubPage}
            onOverride={() => setOverrideOpen(true)}
            onView={setViewSubscriptionId}
          />
        </TabsContent>
        <TabsContent value="payments">
          <PaymentsTab
            payments={payHook.payments}
            filters={payFilters}
            onFilterChange={updatePayFilters}
            plans={planHook.plans}
            page={payPage}
            totalPages={payHook.pagination?.totalPages || 1}
            onPageChange={setPayPage}
            onRefund={setRefundTarget}
            onView={setDetailPaymentId}
          />
        </TabsContent>
        <TabsContent value="refund-requests">
          <RefundRequestsTab
            requests={refundRequestsHook.requests}
            filters={requestFilters}
            onFilterChange={updateRequestFilters}
            page={requestPage}
            totalPages={refundRequestsHook.pagination?.totalPages || 1}
            onPageChange={setRequestPage}
            onReview={setReviewTarget}
          />
        </TabsContent>
        <TabsContent value="refunds">
          <RefundsTab
            refunds={refundsHook.refunds}
            filters={refundFilters}
            onFilterChange={updateRefundFilters}
            page={refundPage}
            totalPages={refundsHook.pagination?.totalPages || 1}
            onPageChange={setRefundPage}
          />
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
        key={refundTarget?.id || "refund"}
        open={!!refundTarget}
        onOpenChange={(open) => {
          if (!open) setRefundTarget(null);
        }}
        payment={refundTarget}
        onConfirm={handleRefund}
        isRefunding={isRefunding}
      />

      <RefundReviewModal
        key={reviewTarget?.id || "review"}
        open={!!reviewTarget}
        onOpenChange={(open) => {
          if (!open) setReviewTarget(null);
        }}
        request={reviewTarget}
        onApprove={handleApprove}
        onReject={handleReject}
        isApproving={isApproving}
        isRejecting={isRejecting}
      />

      <PaymentDetailModal
        open={!!detailPaymentId}
        onOpenChange={(open) => {
          if (!open) setDetailPaymentId(null);
        }}
        paymentId={detailPaymentId}
        onRefund={(payment) => {
          setDetailPaymentId(null);
          setRefundTarget(payment);
        }}
      />

      <SubscriptionDetailModal
        open={!!viewSubscriptionId}
        onOpenChange={(open) => {
          if (!open) setViewSubscriptionId(null);
        }}
        subscriptionId={viewSubscriptionId}
      />

      <CouponModal
        open={couponHook.modalOpen}
        onOpenChange={couponHook.setModalOpen}
        editing={couponHook.editing}
        form={couponHook.form}
        setForm={couponHook.setForm}
        onSave={couponHook.save}
      />

      <ConfirmDialog
        open={!!deleteTarget}
        onConfirm={handleDelete}
        onCancel={() => setDeleteTarget(null)}
      />
    </div>
  );
}
