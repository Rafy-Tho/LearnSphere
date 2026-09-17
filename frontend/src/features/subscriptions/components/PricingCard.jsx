import { CheckCircle2 } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { memo } from "react";
import useAuth from "@/features/auth/hooks/useAuth";
import Button from "@/components/ui/Button";
import { formatMoney } from "@/features/subscriptions/utils/money";

function durationLabel(days) {
  const value = Number(days);
  if (!value) return "—";
  if (value % 30 === 0) {
    const months = value / 30;
    return `${months} ${months === 1 ? "month" : "months"}`;
  }
  return `${value} days`;
}

function PricingCard({ plan, activeSubscription, highlighted = false }) {
  const { user } = useAuth();
  const navigate = useNavigate();

  const features = Array.isArray(plan.features) ? plan.features : [];
  const isActivePlan = activeSubscription?.plan_id === plan.id;
  const hasActiveSubscription = !!activeSubscription?.is_active;

  function startCheckout() {
    if (!user) {
      window.scrollTo({ top: 0, behavior: "smooth" });
      return navigate("/login");
    }
    if (hasActiveSubscription) return;
    navigate(`/checkout/${plan.id}`);
  }

  const dimmed = hasActiveSubscription && !isActivePlan;

  return (
    <div
      className={`
        relative flex w-full max-w-[340px] flex-col rounded-2xl p-6 transition-colors duration-300 sm:p-8
        ${isActivePlan || dimmed ? "bg-surface-muted opacity-75" : "bg-surface"}
        ${
          highlighted && !hasActiveSubscription
            ? "ring-2 ring-primary shadow-md"
            : "ring-1 ring-border"
        }
      `}
    >
      <div className="mb-6">
        <h3
          className={`text-lg font-semibold mb-4 ${
            highlighted && !hasActiveSubscription
              ? "text-primary"
              : "text-foreground"
          }`}
        >
          {plan.name}
          {isActivePlan && (
            <span className="ml-2 text-xs font-normal text-success">
              (Current Plan)
            </span>
          )}
          {dimmed && (
            <span className="ml-2 text-xs font-normal text-foreground-muted">
              (Unavailable)
            </span>
          )}
        </h3>

        <div className="flex items-end gap-1 mb-4">
          <span
            className={`text-5xl font-bold leading-none ${
              dimmed ? "text-foreground-muted" : "text-foreground"
            }`}
          >
            {formatMoney(plan.price, plan.currency)}
          </span>
          <span className="mb-2 text-sm text-foreground-muted">
            / {durationLabel(plan.duration_days)}
          </span>
        </div>

        <p className="text-sm leading-relaxed text-foreground-muted">
          {plan.description || "Full access to the learning platform."}
        </p>
      </div>

      {features.length > 0 && (
        <ul className="flex-1 space-y-4 mb-8">
          {features.map((feature) => (
            <li key={feature} className="flex items-center gap-3">
              <CheckCircle2
                size={18}
                className="flex-shrink-0 text-foreground-muted"
              />
              <span
                className={`text-sm ${
                  dimmed ? "text-foreground-muted" : "text-foreground"
                }`}
              >
                {feature}
              </span>
            </li>
          ))}
        </ul>
      )}

      <Button
        onClick={startCheckout}
        disabled={hasActiveSubscription}
        variant={highlighted ? "primary" : "outline"}
        size="lg"
        fullWidth
        className="rounded-xl text-sm font-semibold"
      >
        {isActivePlan
          ? "Current Plan"
          : hasActiveSubscription
            ? "Not Available"
            : "Subscribe"}
      </Button>
    </div>
  );
}

export default memo(PricingCard);
