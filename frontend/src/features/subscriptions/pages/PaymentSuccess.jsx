import { ArrowRight, CheckCircle, RefreshCw, Star } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { useActiveSubscription } from "@/features/subscriptions/hooks/useSubscriptions";
import {
  formatDate,
  formatMoney,
  maskPaymentId,
} from "@/features/subscriptions/utils/money";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import Button from "@/components/ui/Button";

export default function PaymentSuccess() {
  const navigate = useNavigate();
  const { data: subscription, isPending, refetch } = useActiveSubscription();

  const currency = subscription?.currency || subscription?.plan_currency || "usd";
  const details = [
    { label: "Plan", value: subscription?.name || "—" },
    {
      label: "Payment date",
      value: formatDate(subscription?.paid_at || new Date()),
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
          <div className="bg-success px-8 py-10 text-center">
            <div className="inline-flex items-center justify-center w-20 h-20 bg-white/20 rounded-full mb-4 ring-4 ring-white/30">
              <CheckCircle className="w-10 h-10 text-white" strokeWidth={2} />
            </div>
            <h1 className="text-3xl font-bold text-white mb-1">
              Payment Successful
            </h1>
            <p className="text-white text-sm font-medium">
              Your transaction has been confirmed
            </p>

            <div className="mt-6 bg-white/15 rounded-2xl px-6 py-4 text-white">
              <p className="text-xs uppercase tracking-widest font-semibold mb-1">
                Amount Charged
              </p>
              <p className="text-4xl font-extrabold">
                {subscription
                  ? formatMoney(subscription.amount, currency)
                  : "—"}
              </p>
            </div>
          </div>

          <div className="px-8 py-6 space-y-5">
            {isPending ? (
              <div className="flex justify-center py-8">
                <SpinnerLoader />
              </div>
            ) : !subscription ? (
              <div className="rounded-xl border border-border px-4 py-5 text-center">
                <p className="text-sm text-foreground-muted">
                  We're still confirming your payment. This usually takes a
                  moment.
                </p>
                <Button
                  className="mt-4"
                  variant="secondary"
                  leftIcon={<RefreshCw size={16} />}
                  onClick={() => refetch()}
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
                      <span className="text-xs text-foreground-muted font-medium">
                        {label}
                      </span>
                      <span className="text-xs font-semibold text-foreground font-mono">
                        {value}
                      </span>
                    </div>
                  ))}
                </div>
              </>
            )}

            <div className="flex gap-3 pt-1">
              <Button
                fullWidth
                size="lg"
                rightIcon={<ArrowRight size={16} />}
                onClick={() => {
                  navigate("/learning-dashboard/billing");
                  window.scrollTo({ top: 0, behavior: "smooth" });
                }}
              >
                View Billing
              </Button>
              <Button
                variant="secondary"
                size="lg"
                onClick={() => {
                  navigate("/learning-dashboard");
                  window.scrollTo({ top: 0, behavior: "smooth" });
                }}
              >
                Dashboard
              </Button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
