import { useState } from "react";
import { Link, useSearchParams } from "react-router-dom";
import { CreditCard, Receipt } from "lucide-react";
import {
  useActiveSubscription,
  usePayments,
} from "@/features/subscriptions/hooks/useSubscriptions";
import BillingStatusBadge from "@/features/subscriptions/components/BillingStatusBadge";
import PaymentDetailsModal from "@/features/subscriptions/components/PaymentDetailsModal";
import {
  formatDate,
  formatMoney,
} from "@/features/subscriptions/utils/money";
import Card from "@/components/ui/Card";
import Button from "@/components/ui/Button";
import EmptyState from "@/components/ui/EmptyState";
import Skeleton from "@/components/ui/Skeleton";
import ErrorMessage from "@/components/ui/ErrorMessage";
import Pagination from "@/components/common/Pagination";

const LIMIT = 10;

function CurrentPlan({ subscription }) {
  if (!subscription) {
    return (
      <EmptyState
        icon={<CreditCard size={22} />}
        title="No subscription yet"
        description="Subscribe to a plan to unlock every course on the platform."
        action={
          <Button as={Link} to="/pricing">
            View Plans
          </Button>
        }
      />
    );
  }

  const currency = subscription.currency || subscription.plan_currency;
  const status = subscription.status || (subscription.is_active ? "ACTIVE" : "EXPIRED");

  if (!subscription.is_active) {
    return (
      <div className="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <div>
          <div className="flex items-center gap-2">
            <p className="text-lg font-semibold text-foreground">
              {subscription.name}
            </p>
            <BillingStatusBadge status={status} />
          </div>
          <p className="mt-1 text-sm text-foreground-muted">
            Your access ended on {formatDate(subscription.end_date)}.
          </p>
        </div>
        <Button as={Link} to="/pricing">
          View Plans
        </Button>
      </div>
    );
  }

  return (
    <div className="flex flex-col gap-5 sm:flex-row sm:items-start sm:justify-between">
      <div>
        <div className="flex items-center gap-2">
          <p className="text-lg font-semibold text-foreground">
            {subscription.name}
          </p>
          <BillingStatusBadge status={status} />
        </div>
        <p className="mt-1 text-sm text-foreground-muted">
          {formatMoney(subscription.price, currency)} /{" "}
          {subscription.duration_days} days
        </p>
      </div>

      <dl className="grid grid-cols-2 gap-x-8 gap-y-3 text-sm sm:grid-cols-3">
        <div>
          <dt className="text-foreground-muted">Started</dt>
          <dd className="mt-0.5 font-medium text-foreground">
            {formatDate(subscription.start_date)}
          </dd>
        </div>
        <div>
          <dt className="text-foreground-muted">Access until</dt>
          <dd className="mt-0.5 font-medium text-foreground">
            {formatDate(subscription.end_date)}
          </dd>
        </div>
        <div>
          <dt className="text-foreground-muted">Days remaining</dt>
          <dd className="mt-0.5 font-medium text-foreground">
            {subscription.days_remaining ?? 0}
          </dd>
        </div>
      </dl>
    </div>
  );
}

export default function BillingDashboard() {
  const [searchParams] = useSearchParams();
  const page = Number(searchParams.get("page")) || 1;
  const [selectedPayment, setSelectedPayment] = useState(null);

  const {
    data: subscription,
    isPending: subLoading,
    error: subError,
    refetch: refetchSub,
  } = useActiveSubscription();

  const {
    data: paymentsData,
    isPending: payLoading,
    error: payError,
    refetch: refetchPay,
  } = usePayments({ page, limit: LIMIT });

  const payments = paymentsData?.data || [];
  const pagination = paymentsData?.pagination;

  return (
    <div className="space-y-6">
      <Card title="Current plan" icon={<CreditCard size={16} />}>
        {subLoading ? (
          <div className="space-y-3">
            <Skeleton variant="text" className="w-1/3" />
            <Skeleton variant="text" className="w-1/2" />
          </div>
        ) : subError ? (
          <ErrorMessage
            title="We couldn't load your subscription"
            message={subError.message}
          />
        ) : (
          <CurrentPlan subscription={subscription} />
        )}
        {subError && (
          <Button className="mt-4" onClick={() => refetchSub()}>
            Try Again
          </Button>
        )}
      </Card>

      <Card title="Payment history" icon={<Receipt size={16} />}>
        {payLoading ? (
          <div className="space-y-3">
            <Skeleton variant="text" />
            <Skeleton variant="text" />
            <Skeleton variant="text" />
          </div>
        ) : payError ? (
          <div>
            <ErrorMessage
              title="We couldn't load your payments"
              message={payError.message}
            />
            <Button className="mt-4" onClick={() => refetchPay()}>
              Try Again
            </Button>
          </div>
        ) : payments.length === 0 ? (
          <EmptyState
            icon={<Receipt size={22} />}
            title="No payment history yet"
            description="Your payments will appear here after you subscribe to a plan."
          />
        ) : (
          <>
            {/* Desktop table */}
            <div className="hidden md:block overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-border text-left text-xs uppercase tracking-wider text-foreground-muted">
                    <th className="py-3 pr-4 font-medium">Date</th>
                    <th className="py-3 pr-4 font-medium">Plan</th>
                    <th className="py-3 pr-4 font-medium text-right">Subtotal</th>
                    <th className="py-3 pr-4 font-medium text-right">Discount</th>
                    <th className="py-3 pr-4 font-medium text-right">Total</th>
                    <th className="py-3 pr-4 font-medium">Status</th>
                    <th className="py-3 font-medium">Refund</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-border">
                  {payments.map((payment) => (
                    <tr
                      key={payment.id}
                      onClick={() => setSelectedPayment(payment.id)}
                      className="cursor-pointer transition-colors hover:bg-surface-muted"
                    >
                      <td className="py-3 pr-4 text-foreground-muted">
                        {formatDate(payment.paid_at || payment.created_at)}
                      </td>
                      <td className="py-3 pr-4 font-medium text-foreground">
                        {payment.plan_name || "Subscription"}
                      </td>
                      <td className="py-3 pr-4 text-right text-foreground-muted">
                        {formatMoney(
                          payment.subtotal ?? payment.amount,
                          payment.currency,
                        )}
                      </td>
                      <td className="py-3 pr-4 text-right text-foreground-muted">
                        {Number(payment.discount_amount) > 0
                          ? `-${formatMoney(payment.discount_amount, payment.currency)}`
                          : "—"}
                      </td>
                      <td className="py-3 pr-4 text-right font-medium text-foreground">
                        {formatMoney(payment.amount, payment.currency)}
                      </td>
                      <td className="py-3 pr-4">
                        <BillingStatusBadge status={payment.payment_status} />
                      </td>
                      <td className="py-3">
                        {Number(payment.refunded_total) > 0 ? (
                          <BillingStatusBadge
                            status={payment.refund_status || "REFUNDED"}
                          />
                        ) : (
                          <span className="text-foreground-muted">—</span>
                        )}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            {/* Mobile cards */}
            <div className="space-y-3 md:hidden">
              {payments.map((payment) => (
                <button
                  key={payment.id}
                  type="button"
                  onClick={() => setSelectedPayment(payment.id)}
                  className="w-full rounded-lg border border-border p-4 text-left transition-colors hover:bg-surface-muted cursor-pointer"
                >
                  <div className="flex items-center justify-between">
                    <span className="font-medium text-foreground">
                      {payment.plan_name || "Subscription"}
                    </span>
                    <BillingStatusBadge status={payment.payment_status} />
                  </div>
                  <div className="mt-2 flex items-center justify-between text-sm text-foreground-muted">
                    <span>{formatDate(payment.paid_at || payment.created_at)}</span>
                    <span className="font-medium text-foreground">
                      {formatMoney(payment.amount, payment.currency)}
                    </span>
                  </div>
                  <div className="mt-2 flex items-center justify-between text-xs text-foreground-muted">
                    <span>
                      Subtotal{" "}
                      {formatMoney(
                        payment.subtotal ?? payment.amount,
                        payment.currency,
                      )}
                      {Number(payment.discount_amount) > 0
                        ? ` · Discount -${formatMoney(payment.discount_amount, payment.currency)}`
                        : ""}
                    </span>
                    {Number(payment.refunded_total) > 0 && (
                      <BillingStatusBadge
                        status={payment.refund_status || "REFUNDED"}
                      />
                    )}
                  </div>
                </button>
              ))}
            </div>

            {pagination && (
              <Pagination
                totalItems={pagination.total}
                itemsPerPage={pagination.limit}
              />
            )}
          </>
        )}
      </Card>

      <PaymentDetailsModal
        paymentId={selectedPayment}
        open={!!selectedPayment}
        onClose={() => setSelectedPayment(null)}
      />
    </div>
  );
}
