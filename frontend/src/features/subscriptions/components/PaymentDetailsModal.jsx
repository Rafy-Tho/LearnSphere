import Modal from "@/components/ui/Modal";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ErrorMessage from "@/components/ui/ErrorMessage";
import BillingStatusBadge from "@/features/subscriptions/components/BillingStatusBadge";
import { usePayment } from "@/features/subscriptions/hooks/useSubscriptions";
import {
  formatDate,
  formatMoney,
  maskPaymentId,
} from "@/features/subscriptions/utils/money";

function Row({ label, value, valueClassName = "" }) {
  return (
    <div className="flex items-center justify-between gap-4 py-2">
      <span className="shrink-0 text-sm text-foreground-muted">{label}</span>
      <span
        className={`min-w-0 break-all text-right text-sm font-medium text-foreground ${valueClassName}`}
      >
        {value}
      </span>
    </div>
  );
}

export default function PaymentDetailsModal({ paymentId, open, onClose }) {
  const { data, isPending, error } = usePayment(open ? paymentId : null);

  const currency = data?.currency || "usd";
  const refunded = Number(data?.refunded_total || 0);
  const remaining = Number(data?.amount || 0) - refunded;

  return (
    <Modal open={open} onClose={onClose} title="Payment details" size="md">
      {isPending ? (
        <div className="flex justify-center py-10">
          <SpinnerLoader />
        </div>
      ) : error ? (
        <ErrorMessage
          title="We couldn't load this payment"
          message={error.message}
        />
      ) : data ? (
        <div className="space-y-4">
          <div className="flex items-center justify-between">
            <p className="text-base font-semibold text-foreground">
              {data.plan_name || "Subscription"}
            </p>
            <BillingStatusBadge status={data.payment_status} />
          </div>

          <div className="rounded-lg border border-border divide-y divide-border px-4">
            <Row
              label="Subtotal"
              value={formatMoney(data.subtotal ?? data.amount, currency)}
            />
            {data.coupon_code && (
              <Row label="Coupon" value={data.coupon_code} />
            )}
            {Number(data.discount_amount) > 0 && (
              <Row
                label="Discount"
                value={`-${formatMoney(data.discount_amount, currency)}`}
                valueClassName="text-success"
              />
            )}
            <Row
              label="Total"
              value={formatMoney(data.amount, currency)}
              valueClassName="font-semibold"
            />
          </div>

          <div className="rounded-lg border border-border divide-y divide-border px-4">
            <Row label="Payment date" value={formatDate(data.paid_at || data.created_at)} />
            <Row label="Payment ID" value={maskPaymentId(data.stripe_payment_intent_id || data.id)} />
          </div>

          {refunded > 0 && (
            <div className="rounded-lg border border-warning/30 bg-warning/5 px-4 py-2">
              <Row
                label="Original payment"
                value={formatMoney(data.amount, currency)}
              />
              <Row
                label="Refunded"
                value={formatMoney(refunded, currency)}
                valueClassName="text-warning"
              />
              {remaining > 0 && (
                <Row
                  label="Remaining"
                  value={formatMoney(remaining, currency)}
                />
              )}
            </div>
          )}
        </div>
      ) : null}
    </Modal>
  );
}
