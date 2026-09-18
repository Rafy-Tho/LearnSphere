import { useEffect, useState } from "react";
import { ArrowRight, CheckCircle, Clock, RefreshCw, Star } from "lucide-react";
import { useNavigate } from "react-router-dom";
import {
  useActiveSubscription,
  usePayments,
} from "@/features/subscriptions/hooks/useSubscriptions";
import {
  formatDate,
  formatMoney,
  maskPaymentId,
} from "@/features/subscriptions/utils/money";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ErrorMessage from "@/components/ui/ErrorMessage";
import Button from "@/components/ui/Button";

const MAX_ATTEMPTS = 20;
const POLL_INTERVAL_MS = 3000;

export default function PaymentSuccess() {
  const navigate = useNavigate();
  const {
    data: subscription,
    isPending,
    error,
    refetch: refetchSubscription,
  } = useActiveSubscription();
  const { refetch: refetchPayments } = usePayments({ page: 1, limit: 1 });

  const [attempts, setAttempts] = useState(0);
  const confirmed = Boolean(subscription?.is_active);

  // Webhook confirmation is the source of truth. Poll server state until the
  // subscription is active instead of trusting the redirect.
  useEffect(() => {
    if (confirmed || attempts >= MAX_ATTEMPTS) return undefined;
    const timer = setTimeout(() => {
      refetchSubscription();
      refetchPayments();
      setAttempts((count) => count + 1);
    }, POLL_INTERVAL_MS);
    return () => clearTimeout(timer);
  }, [confirmed, attempts, refetchSubscription, refetchPayments]);

  function refresh() {
    refetchSubscription();
    refetchPayments();
    setAttempts(0);
  }

  const currency = subscription?.currency || subscription?.plan_currency;
  const details = [
    { label: "Plan", value: subscription?.name || "—" },
    {
      label: "Amount",
      value: subscription ? formatMoney(subscription.amount, currency) : "—",
    },
    {
      label: "Access until",
      value: formatDate(subscription?.end_date),
    },
    {
      label: "Payment ID",
      value: maskPaymentId(subscription?.stripe_payment_intent_id),
    },
  ];

  return (
    <div className="min-h-screen bg-surface-muted flex items-center justify-center px-4 py-16">
      <div className="w-full max-w-lg">
        <div className="bg-surface rounded-2xl shadow-xl overflow-hidden border border-border">
          <div
            className={`px-8 py-10 text-center ${confirmed ? "bg-success" : "bg-primary"}`}
          >
            <div className="inline-flex items-center justify-center w-20 h-20 bg-white/20 rounded-full mb-4 ring-4 ring-white/30">
              {confirmed ? (
                <CheckCircle className="w-10 h-10 text-white" strokeWidth={2} />
              ) : (
                <Clock className="w-10 h-10 text-white" strokeWidth={2} />
              )}
            </div>
            <h1 className="text-3xl font-bold text-white mb-1">
              {confirmed ? "Payment successful" : "Confirming your payment"}
            </h1>
            <p className="text-white text-sm font-medium">
              {confirmed
                ? "Your access has been activated"
                : "This usually takes a few moments"}
            </p>

            {confirmed && (
              <div className="mt-6 bg-white/15 rounded-2xl px-6 py-4 text-white">
                <p className="text-xs uppercase tracking-widest font-semibold mb-1">
                  Amount charged
                </p>
                <p className="text-4xl font-extrabold">
                  {formatMoney(subscription.amount, currency)}
                </p>
              </div>
            )}
          </div>

          <div className="space-y-5 px-5 py-6 sm:px-8">
            {isPending ? (
              <div className="flex justify-center py-8">
                <SpinnerLoader />
              </div>
            ) : error ? (
              <div>
                <ErrorMessage
                  title="We couldn't confirm your payment"
                  message={error.message}
                />
                <Button
                  className="mt-4"
                  variant="secondary"
                  leftIcon={<RefreshCw size={16} />}
                  onClick={refresh}
                >
                  Try Again
                </Button>
              </div>
            ) : !confirmed ? (
              <div className="rounded-xl border border-border px-4 py-5 text-center">
                <div className="flex justify-center py-4">
                  <SpinnerLoader />
                </div>
                <p className="text-sm text-foreground-muted">
                  We're still confirming your payment. This page updates
                  automatically.
                </p>
                {attempts >= MAX_ATTEMPTS && (
                  <p className="mt-3 text-xs text-foreground-muted">
                    This is taking longer than usual. Your payment will still be
                    applied once confirmed — you can check your billing page
                    later.
                  </p>
                )}
                <Button
                  className="mt-4"
                  variant="secondary"
                  leftIcon={<RefreshCw size={16} />}
                  onClick={refresh}
                >
                  Refresh
                </Button>
              </div>
            ) : (
              <>
                <div className="flex items-start gap-3 bg-success/10 border border-success/20 rounded-xl px-4 py-3">
                  <Star className="w-4 h-4 text-success mt-0.5 flex-shrink-0" />
                  <p className="text-success text-sm font-medium">
                    A confirmation email has been sent to your registered
                    address.
                  </p>
                </div>

                <div className="rounded-xl border border-border divide-y divide-border overflow-hidden">
                  {details.map(({ label, value }) => (
                    <div
                      key={label}
                      className="flex justify-between items-center px-5 py-3"
                    >
                      <span className="shrink-0 text-xs font-medium text-foreground-muted">
                        {label}
                      </span>
                      <span className="min-w-0 break-all text-right text-sm font-semibold text-foreground">
                        {value}
                      </span>
                    </div>
                  ))}
                </div>
              </>
            )}

            <div className="flex flex-col gap-3 pt-1 sm:flex-row">
              <Button
                fullWidth
                size="lg"
                rightIcon={<ArrowRight size={16} />}
                onClick={() => {
                  navigate("/learning-dashboard");
                  window.scrollTo({ top: 0, behavior: "smooth" });
                }}
              >
                Start Learning
              </Button>
              <Button
                variant="secondary"
                size="lg"
                onClick={() => {
                  navigate("/learning-dashboard/billing");
                  window.scrollTo({ top: 0, behavior: "smooth" });
                }}
              >
                View Billing
              </Button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
