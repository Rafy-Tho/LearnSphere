import { useState } from "react";
import SectionCard from "@/features/settings/components/SectionCard";
import { Check, Crown } from "lucide-react";
import { useCreatePayment } from "@/features/subscriptions/hooks/useSubscriptionMutations";
import useAuth from "@/features/auth/hooks/useAuth";
import { useNavigate } from "react-router-dom";
import { toast } from "react-toastify";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import { PLAN_IDS } from "@/constants/plans";

const planConfig = {
  "1-Month": {
    id: PLAN_IDS["1-Month"],
    label: "1 Month",
    color: "bg-surface-muted text-foreground-muted border-border",
    features: [
      "5 projects",
      "1 GB storage",
      "Community support",
      "Basic analytics",
    ],
  },
  "6-Months": {
    id: PLAN_IDS["6-Months"],
    label: "6 Months",
    color: "bg-primary/10 text-primary border-primary/30",
    features: [
      "Unlimited projects",
      "50 GB storage",
      "Priority support",
      "Advanced analytics",
      "Custom domains",
    ],
  },
  "12-Months": {
    id: PLAN_IDS["12-Months"],
    label: "12 Months",
    color: "bg-primary text-white border-primary",
    features: [
      "Unlimited everything",
      "1 TB storage",
      "24/7 dedicated support",
      "SSO & audit logs",
      "SLA guarantee",
      "Custom integrations",
    ],
  },
};

function Subscription() {
  const [plan, setPlan] = useState("1-Month");
  const navigate = useNavigate();
  const { mutateAsync, isPending: isLoading } = useCreatePayment();
  const { user } = useAuth();
  const planInfo = planConfig[plan];
  async function payment() {
    if (!user) {
      window.scrollTo({
        top: 0,
        behavior: "smooth",
      });
      return navigate("/login");
    }
    try {
      const data = await mutateAsync(planInfo.id);
      const paymentUrl = data?.session_url;
      window.location.href = paymentUrl;
    } catch (error) {
      toast.error(error.message || "Failed to start checkout");
    }
  }
  if (!planInfo) {
    return null;
  }
  return (
    <SectionCard title="Subscription" icon={<Crown size={15} />}>
      <div className="flex flex-col sm:flex-row gap-6">
        <div className="flex-1 p-4 rounded-xl border border-border bg-surface-muted">
          <div className="flex items-center gap-2 mb-3">
            <span
              className={`inline-flex items-center gap-1.5 text-xs font-medium px-2.5 py-1 rounded-full border ${planInfo.color}`}
            >
              {planInfo.label}
            </span>
          </div>
          <p className="text-xs text-foreground-muted mb-3">
            this plan includes:
          </p>
          <ul className="space-y-1.5">
            {planInfo.features.map((feature) => (
              <li
                key={feature}
                className="flex items-center gap-2 text-sm text-foreground"
              >
                <Check
                  size={13}
                  className="text-foreground-muted flex-shrink-0"
                />
                {feature}
              </li>
            ))}
          </ul>
          <button
            onClick={payment}
            disabled={isLoading}
            className="w-full px-4 py-3 rounded-xl text-sm font-medium text-white bg-primary hover:bg-primary-hover cursor-pointer transition-colors mt-5 inline-flex items-center justify-center gap-2 disabled:opacity-60"
          >
            {isLoading && <SpinnerLoader size="sm" color="muted" />}
            {isLoading ? "Redirecting..." : "Get Started"}
          </button>
        </div>

        <div className="flex-1 flex flex-col gap-2.5">
          <p className="text-xs font-medium text-foreground-muted uppercase tracking-wider mb-1">
            choose Plan
          </p>
          {Object.keys(planConfig).map((p) => {
            const isActive = plan === p;
            return (
              <button
                key={p}
                onClick={() => {
                  if (!isActive) {
                    setPlan(p);
                  }
                }}
                disabled={isActive}
                className={`w-full flex items-center justify-between px-4 py-3 rounded-xl border text-sm transition-colors ${
                  isActive
                    ? "border-primary bg-primary text-white cursor-default"
                    : "border-border bg-surface text-foreground hover:border-primary/30 hover:bg-surface-muted cursor-pointer"
                }`}
              >
                <div className="flex items-center gap-2">
                  <span className="font-medium">{planConfig[p].label}</span>
                </div>
                {isActive && <Check size={14} />}
              </button>
            );
          })}
          <p className="text-xs text-foreground-muted mt-1">
            Billing is managed securely. Changes take effect immediately.
          </p>
        </div>
      </div>
    </SectionCard>
  );
}

export default Subscription;
