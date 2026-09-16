import { CheckCircle2, Info } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { memo } from "react";
import { useCreatePayment } from "@/features/subscriptions/hooks/useSubscriptionMutations";
import useAuth from "@/features/auth/hooks/useAuth";
import { toast } from "react-toastify";
import Button from "@/components/ui/Button";

function PricingCard({ plan, activeSubscription }) {
  const { id, tier, price, description, features, highlighted = false } = plan;
  const { mutateAsync, isPending: isLoading } = useCreatePayment();
  const { user } = useAuth();
  const navigate = useNavigate();
  // Check if this plan is the active subscription
  const isActivePlan = activeSubscription?.plan_id === id;
  // Check if user has ANY active subscription
  const hasActiveSubscription = !!activeSubscription;

  async function payment() {
    if (!user) {
      window.scrollTo({
        top: 0,
        behavior: "smooth",
      });
      return navigate("/login");
    }
    // Don't allow payment if there's already an active subscription
    if (hasActiveSubscription) return;

    try {
      const data = await mutateAsync(id);
      const paymentUrl = data?.session_url;
      window.location.href = paymentUrl;
    } catch (error) {
      toast.error(error.message || "Failed to start checkout");
    }
  }

  return (
    <div
      className={`
        relative flex flex-col rounded-2xl p-8 transition-colors duration-300
        ${
          isActivePlan
            ? "bg-surface-muted opacity-75"
            : hasActiveSubscription
              ? "bg-surface-muted opacity-60"
              : "bg-surface"
        }
        max-w-[340px]
        ${
          highlighted && !isActivePlan && !hasActiveSubscription
            ? "ring-2 ring-primary shadow-md"
            : "ring-1 ring-border"
        }
      `}
    >
      <div className="mb-6">
        <h3
          className={`text-lg font-semibold mb-4 ${
            highlighted && !isActivePlan && !hasActiveSubscription
              ? "text-primary"
              : "text-foreground"
          }`}
        >
          {tier}
          {isActivePlan && (
            <span className="ml-2 text-xs font-normal text-success">
              (Current Plan)
            </span>
          )}
          {hasActiveSubscription && !isActivePlan && (
            <span className="ml-2 text-xs font-normal text-foreground-muted">
              (Unavailable)
            </span>
          )}
        </h3>

        <div className="flex items-end gap-1 mb-4">
          <span
            className={`text-6xl font-bold leading-none ${
              hasActiveSubscription && !isActivePlan
                ? "text-foreground-muted"
                : "text-foreground"
            }`}
          >
            ${price}
          </span>
          <span className="mb-2 text-sm text-foreground-muted">/ price</span>
        </div>

        <p className="text-sm leading-relaxed text-foreground-muted">
          {description}
        </p>
      </div>

      <ul className="flex-1 space-y-4 mb-8">
        {features.map((feature) => (
          <li key={feature} className="flex items-center gap-3">
            <CheckCircle2
              size={18}
              className="flex-shrink-0 text-foreground-muted"
            />
            <span
              className={`text-sm ${
                hasActiveSubscription ? "text-foreground-muted" : "text-foreground"
              }`}
            >
              {feature.text}
            </span>
            {feature.hasInfo && (
              <Info size={14} className="flex-shrink-0 text-foreground-muted" />
            )}
          </li>
        ))}
      </ul>

      <Button
        onClick={payment}
        disabled={hasActiveSubscription}
        isLoading={isLoading}
        variant={highlighted ? "primary" : "outline"}
        size="lg"
        fullWidth
        className="rounded-xl text-sm font-semibold"
      >
        {isActivePlan
          ? "Current Plan"
          : hasActiveSubscription
            ? "Not Available"
            : isLoading
              ? "Redirecting..."
              : "Get Started"}
      </Button>
    </div>
  );
}

export default memo(PricingCard);
