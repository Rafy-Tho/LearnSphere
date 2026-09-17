import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Check, Crown } from "lucide-react";
import SectionCard from "@/features/settings/components/SectionCard";
import { usePlans } from "@/features/subscriptions/hooks/useSubscriptions";
import { formatMoney } from "@/features/subscriptions/utils/money";
import useAuth from "@/features/auth/hooks/useAuth";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ErrorMessage from "@/components/ui/ErrorMessage";

function Subscription() {
  const navigate = useNavigate();
  const { user } = useAuth();
  const { data: plans, isPending, error } = usePlans();
  const [selectedId, setSelectedId] = useState(null);

  const list = plans || [];
  const selected = list.find((plan) => plan.id === selectedId) || list[0];

  function getStarted() {
    if (!user) {
      window.scrollTo({ top: 0, behavior: "smooth" });
      return navigate("/login");
    }
    if (selected) navigate(`/checkout/${selected.id}`);
  }

  return (
    <SectionCard title="Subscription" icon={<Crown size={15} />}>
      {isPending ? (
        <div className="flex justify-center py-8">
          <SpinnerLoader />
        </div>
      ) : error ? (
        <ErrorMessage
          title="We couldn't load the plans"
          message={error.message}
        />
      ) : list.length === 0 ? (
        <p className="text-sm text-foreground-muted">
          No plans are available right now.
        </p>
      ) : (
        <div className="flex flex-col sm:flex-row gap-6">
          <div className="flex-1 p-4 rounded-xl border border-border bg-surface-muted">
            <span className="inline-flex items-center gap-1.5 text-xs font-medium px-2.5 py-1 rounded-full border bg-primary/10 text-primary border-primary/30">
              {selected.name}
            </span>
            <p className="mt-3 text-2xl font-bold text-foreground">
              {formatMoney(selected.price, selected.currency)}
            </p>
            <p className="text-xs text-foreground-muted mt-0.5">
              for {selected.duration_days} days
            </p>
            <p className="mt-3 text-sm text-foreground-muted">
              {selected.description ||
                "Full access to every course on the platform."}
            </p>
            <ul className="mt-3 space-y-1.5">
              {[
                "Unlimited access to all courses",
                "Track your learning progress",
                "Certificate on course completion",
              ].map((feature) => (
                <li
                  key={feature}
                  className="flex items-center gap-2 text-sm text-foreground"
                >
                  <Check size={13} className="text-foreground-muted flex-shrink-0" />
                  {feature}
                </li>
              ))}
            </ul>
            <button
              onClick={getStarted}
              className="w-full px-4 py-3 rounded-xl text-sm font-medium text-white bg-primary hover:bg-primary-hover cursor-pointer transition-colors mt-5"
            >
              Get Started
            </button>
          </div>

          <div className="flex-1 flex flex-col gap-2.5">
            <p className="text-xs font-medium text-foreground-muted uppercase tracking-wider mb-1">
              Choose plan
            </p>
            {list.map((plan) => {
              const isActive = selected?.id === plan.id;
              return (
                <button
                  key={plan.id}
                  onClick={() => setSelectedId(plan.id)}
                  disabled={isActive}
                  className={`w-full flex items-center justify-between px-4 py-3 rounded-xl border text-sm transition-colors ${
                    isActive
                      ? "border-primary bg-primary text-white cursor-default"
                      : "border-border bg-surface text-foreground hover:border-primary/30 hover:bg-surface-muted cursor-pointer"
                  }`}
                >
                  <span className="font-medium">{plan.name}</span>
                  <span className="flex items-center gap-2">
                    {formatMoney(plan.price, plan.currency)}
                    {isActive && <Check size={14} />}
                  </span>
                </button>
              );
            })}
            <p className="text-xs text-foreground-muted mt-1">
              Payments are processed securely by Stripe.
            </p>
          </div>
        </div>
      )}
    </SectionCard>
  );
}

export default Subscription;
