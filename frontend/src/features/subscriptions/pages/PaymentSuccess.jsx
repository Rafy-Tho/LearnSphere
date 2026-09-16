import { ArrowRight, CheckCircle, Package, Star } from "lucide-react";
import { useNavigate, useSearchParams } from "react-router-dom";
import { useSubscriptionDetails as useGetSubscription } from "@/features/subscriptions/hooks/useSubscriptions";

export default function PaymentSuccess() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const sessionId = searchParams.get("session_id") ?? "";
  const planId = searchParams.get("planId");
  const { data } = useGetSubscription(planId);
  const subscription = data;
  const details = [
    { label: "Order ID", value: sessionId ? sessionId.slice(0, 15) : "—" },
    {
      label: "Transaction ID",
      value: sessionId ? sessionId.slice(15, 30) : "—",
    },
    { label: "Date", value: new Date().toLocaleDateString() },
  ];
  const items = {
    name: subscription?.name ?? "—",
    price: subscription?.price != null ? `${subscription.price} USD` : "—",
  };

  return (
    <div className="min-h-screen bg-surface-muted flex items-center justify-center px-4 py-16 transition-colors duration-300">
      <div className="w-full max-w-lg">
        <div className="bg-surface rounded-3xl shadow-xl overflow-hidden border border-border">
          <div className="bg-success px-8 py-10 text-center relative overflow-hidden">
            <div className="absolute top-0 left-0 w-full h-full opacity-10">
              <div className="absolute top-4 left-8 w-24 h-24 rounded-full border-4 border-white" />
              <div className="absolute bottom-2 right-6 w-16 h-16 rounded-full border-4 border-white" />
              <div className="absolute top-10 right-16 w-8 h-8 rounded-full bg-white" />
            </div>

            <div className="relative">
              <div className="inline-flex items-center justify-center w-20 h-20 bg-white/20 rounded-full mb-4 backdrop-blur-sm ring-4 ring-white/30">
                <CheckCircle className="w-10 h-10 text-white" strokeWidth={2} />
              </div>
              <h1 className="text-3xl font-bold text-white mb-1">
                Payment Successful
              </h1>
              <p className="text-white text-sm font-medium">
                Your transaction has been confirmed
              </p>
            </div>

            <div className="relative mt-6 bg-white/15 backdrop-blur-sm rounded-2xl px-6 py-4 text-white">
              <p className="text-white text-xs uppercase tracking-widest font-semibold mb-1">
                Amount Charged
              </p>
              <p className="text-4xl font-extrabold">{items.price}</p>
            </div>
          </div>

          <div className="px-8 py-6 space-y-5">
            <div className="flex items-start gap-3 bg-success/10 border border-success/20 rounded-2xl px-4 py-3">
              <Star className="w-4 h-4 text-success mt-0.5 flex-shrink-0" />
              <p className="text-success text-sm font-medium">
                A confirmation email has been sent to your registered address.
              </p>
            </div>

            <div className="rounded-2xl border border-border overflow-hidden">
              <div className="px-5 py-3 bg-surface-muted border-b border-border">
                <p className="text-xs font-semibold text-foreground-muted uppercase tracking-wider">
                  Order Summary
                </p>
              </div>
              <div className="px-5 py-4 space-y-3">
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <Package className="w-4 h-4 text-foreground-muted flex-shrink-0" />
                    <span className="text-sm text-foreground">
                      {items.name}
                    </span>
                  </div>
                  <span className="text-sm font-semibold text-foreground">
                    {items.price}
                  </span>
                </div>

                <div className="pt-3 border-t border-border flex justify-between">
                  <span className="text-sm font-bold text-foreground">
                    Total
                  </span>
                  <span className="text-sm font-bold text-success">
                    {items.price}
                  </span>
                </div>
              </div>
            </div>

            <div className="rounded-2xl border border-border divide-y divide-border overflow-hidden">
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

            <div className="flex gap-3 pt-1">
              <button
                onClick={() => {
                  navigate("/learning-dashboard");
                  window.scrollTo({ top: 0, behavior: "smooth" });
                }}
                className="flex-1 flex items-center justify-center gap-2 bg-success hover:opacity-90 text-white font-semibold text-sm py-3 px-4 rounded-2xl transition-colors duration-200 shadow-md cursor-pointer"
              >
                Continue
                <ArrowRight className="w-4 h-4" />
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
