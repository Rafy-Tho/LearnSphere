import { CreditCard, Zap, Calendar, ArrowUpRight } from "lucide-react";

const Subscribed = ({ data }) => {
  const plan = {
    name: data?.name || "",
    price: data?.price || "",
    period: "/price",
    status: "Active",
    nextBilling: data?.end_date ? new Date(data.end_date).toDateString() : "",
    features: [
      "Unlimited projects",
      "Priority support",
      "Advanced analytics",
      "Custom integrations",
    ],
  };

  return (
    <div
      className="bg-surface border border-border rounded-xl p-6 shadow-sm transition-shadow duration-200 hover:shadow-md animate-fade-in"
      style={{ animationDelay: "0.2s" }}
    >
      <div className="flex items-center justify-between mb-6">
        <div>
          <h2 className="text-lg font-semibold text-foreground tracking-tight">
            Subscription
          </h2>
          <p className="text-sm text-foreground-muted mt-0.5">
            Manage your plan and billing
          </p>
        </div>
        <span className="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-primary/10 text-primary">
          <Zap className="w-3.5 h-3.5 mr-1" />
          {plan.name}
        </span>
      </div>

      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 mb-6">
        <div className="rounded-xl bg-surface-muted p-4 border border-border">
          <div className="flex items-center gap-2 text-foreground-muted mb-1">
            <CreditCard className="w-4 h-4" />
            <span className="text-xs font-medium uppercase tracking-wider">
              Current Plan
            </span>
          </div>
          <p className="text-foreground font-semibold">
            {plan.price}
            <span className="text-sm font-normal text-foreground-muted">
              {plan.period}
            </span>
          </p>
        </div>

        <div className="rounded-xl bg-surface-muted p-4 border border-border">
          <div className="flex items-center gap-2 text-foreground-muted mb-1">
            <Calendar className="w-4 h-4" />
            <span className="text-xs font-medium uppercase tracking-wider">
              Next Billing
            </span>
          </div>
          <p className="text-foreground font-semibold text-sm">
            {plan.nextBilling}
          </p>
        </div>

        <div className="rounded-xl bg-surface-muted p-4 border border-border">
          <div className="flex items-center gap-2 text-foreground-muted mb-1">
            <Zap className="w-4 h-4" />
            <span className="text-xs font-medium uppercase tracking-wider">
              Status
            </span>
          </div>
          <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-success/10 text-success">
            {plan.status}
          </span>
        </div>
      </div>

      <div className="mb-6">
        <p className="text-xs font-medium text-foreground-muted uppercase tracking-wider mb-3">
          Plan Features
        </p>
        <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
          {plan.features.map((feature) => (
            <div
              key={feature}
              className="flex items-center gap-2 text-sm text-foreground"
            >
              <div className="w-1.5 h-1.5 rounded-full bg-primary" />
              {feature}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default Subscribed;
