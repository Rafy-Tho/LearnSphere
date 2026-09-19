import { FormModal } from "@/components/common/FormModal";
import { StatusBadge } from "@/components/common/StatusBadge";
import { Button } from "@/components/ui/button";
import { Skeleton } from "@/components/ui/skeleton";
import { Undo2 } from "lucide-react";
import {
  usePayment,
  usePaymentRefunds,
  useRefundRequests,
} from "@/features/subscriptions/hooks";

function Row({ label, value }) {
  return (
    <div className="flex justify-between gap-4 text-sm">
      <span className="text-muted-foreground">{label}</span>
      <span className="text-right font-medium text-foreground">{value}</span>
    </div>
  );
}

export function PaymentDetailModal({
  open,
  onOpenChange,
  paymentId,
  onRefund,
}) {
  const { payment, isLoading } = usePayment(open ? paymentId : undefined);
  const { refunds, meta } = usePaymentRefunds(
    open ? paymentId : undefined,
  );
  const { requests } = useRefundRequests(
    { payment_id: paymentId, limit: 20 },
    { enabled: !!open && !!paymentId },
  );

  const refundable = Number(
    meta?.refundable_amount ?? payment?.refundable_amount ?? 0,
  );

  return (
    <FormModal
      open={open}
      onOpenChange={onOpenChange}
      title="Payment Details"
    >
      {isLoading || !payment ? (
        <div className="space-y-2">
          <Skeleton className="h-4 w-full" />
          <Skeleton className="h-4 w-full" />
          <Skeleton className="h-4 w-full" />
        </div>
      ) : (
        <div className="space-y-4">
          <div className="space-y-2 rounded-lg border border-border bg-muted/30 p-3">
            <Row label="Payment ID" value={<span className="font-mono text-xs">{payment.id}</span>} />
            <Row label="User" value={`${payment.user_name} (${payment.user_email})`} />
            <Row label="Plan" value={payment.plan_name} />
            <Row label="Amount" value={`$${Number(payment.amount).toFixed(2)} ${payment.currency}`} />
            <Row label="Subtotal" value={`$${Number(payment.subtotal ?? payment.amount).toFixed(2)}`} />
            <Row label="Discount" value={`$${Number(payment.discount_amount ?? 0).toFixed(2)}`} />
            <Row label="Coupon" value={payment.coupon_code || "-"} />
            <Row label="Provider" value={payment.provider || "STRIPE"} />
            <Row label="Method" value={payment.payment_method || "card"} />
            <Row label="Status" value={<StatusBadge status={payment.payment_status} />} />
            <Row
              label="Paid at"
              value={payment.paid_at ? new Date(payment.paid_at).toLocaleString() : "-"}
            />
            <Row
              label="Refundable"
              value={`$${refundable.toFixed(2)}`}
            />
            <Row
              label="Refund request"
              value={payment.refund_request_status || "-"}
            />
            <Row
              label="Stripe intent"
              value={
                <span className="font-mono text-xs">
                  {payment.stripe_payment_intent_id || "-"}
                </span>
              }
            />
            <Row
              label="Checkout order"
              value={
                <span className="font-mono text-xs">
                  {payment.checkout_order_id || "-"}
                </span>
              }
            />
            <Row
              label="Checkout plan"
              value={payment.checkout_plan_name || payment.plan_name}
            />
            <Row
              label="Checkout total"
              value={
                payment.checkout_total != null
                  ? `$${Number(payment.checkout_total).toFixed(2)} ${
                      payment.checkout_currency || ""
                    }`
                  : "-"
              }
            />
            <Row
              label="Checkout session"
              value={
                <span className="font-mono text-xs">
                  {payment.checkout_session_id || "-"}
                </span>
              }
            />
          </div>

          <div>
            <p className="mb-2 text-sm font-semibold text-foreground">
              Refund history
            </p>
            {refunds.length === 0 ? (
              <p className="text-sm text-muted-foreground">No refunds yet.</p>
            ) : (
              <div className="space-y-2">
                {refunds.map((r) => (
                  <div
                    key={r.id}
                    className="flex items-center justify-between rounded-lg border border-border p-2 text-sm"
                  >
                    <span className="text-foreground">
                      ${Number(r.amount).toFixed(2)} {r.currency}
                    </span>
                    <StatusBadge status={r.refund_status} />
                  </div>
                ))}
              </div>
            )}
          </div>

          <div>
            <p className="mb-2 text-sm font-semibold text-foreground">
              Refund requests
            </p>
            {requests.length === 0 ? (
              <p className="text-sm text-muted-foreground">
                No refund requests for this payment.
              </p>
            ) : (
              <div className="space-y-2">
                {requests.map((r) => (
                  <div
                    key={r.id}
                    className="flex items-center justify-between rounded-lg border border-border p-2 text-sm"
                  >
                    <span className="text-foreground">
                      ${Number(r.requested_amount).toFixed(2)} - {r.reason}
                    </span>
                    <StatusBadge status={r.status} />
                  </div>
                ))}
              </div>
            )}
          </div>

          <div className="flex justify-end gap-3 pt-2">
            <Button variant="outline" onClick={() => onOpenChange(false)}>
              Close
            </Button>
            <Button
              className="gap-1"
              disabled={
                refundable <= 0 ||
                !["COMPLETED", "PARTIALLY_REFUNDED"].includes(
                  payment.payment_status,
                )
              }
              onClick={() => onRefund(payment)}
            >
              <Undo2 className="h-4 w-4" /> Create Refund
            </Button>
          </div>
        </div>
      )}
    </FormModal>
  );
}
