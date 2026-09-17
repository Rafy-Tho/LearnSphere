import { ArrowLeft, HelpCircle, MessageCircle, RefreshCw, ShieldAlert, XCircle } from "lucide-react";
import { useNavigate } from "react-router-dom";

export default function PaymentCancel() {
  const navigate = useNavigate();
  const reasons = [
    "Payment was declined by your bank",
    "Session timed out during checkout",
    "You chose to cancel the transaction",
  ];
  return (
    <div className="min-h-screen bg-surface-muted flex items-center justify-center px-4 py-16 transition-colors duration-300">
      <div className="w-full max-w-lg">
        <div className="bg-surface rounded-3xl shadow-xl overflow-hidden border border-border">
          <div className="bg-destructive px-8 py-10 text-center relative overflow-hidden">
            <div className="absolute top-0 left-0 w-full h-full opacity-10">
              <div className="absolute top-4 left-8 w-24 h-24 rounded-full border-4 border-white" />
              <div className="absolute bottom-2 right-6 w-16 h-16 rounded-full border-4 border-white" />
              <div className="absolute top-10 right-16 w-8 h-8 rounded-full bg-white" />
            </div>

            <div className="relative">
              <div className="inline-flex items-center justify-center w-20 h-20 bg-white/20 rounded-full mb-4 backdrop-blur-sm ring-4 ring-white/30">
                <XCircle className="w-10 h-10 text-white" strokeWidth={2} />
              </div>
              <h1 className="text-3xl font-bold text-white mb-1">
                Payment Cancelled
              </h1>
              <p className="text-white text-sm font-medium">
                Your transaction was not completed
              </p>
            </div>

            <div className="relative mt-6 bg-white/15 backdrop-blur-sm rounded-2xl px-6 py-4 text-white">
              <p className="text-white text-xs uppercase tracking-widest font-semibold mb-1">
                Status
              </p>
              <p className="text-2xl font-extrabold">No charge was made</p>
            </div>
          </div>

          <div className="space-y-5 px-5 py-6 sm:px-8">
            <div className="flex items-start gap-3 bg-warning/10 border border-warning/20 rounded-2xl px-4 py-3">
              <ShieldAlert className="w-4 h-4 text-warning mt-0.5 flex-shrink-0" />
              <p className="text-warning text-sm font-medium">
                Your payment information is safe. No funds have been deducted
                from your account.
              </p>
            </div>

            <div className="rounded-2xl border border-border overflow-hidden">
              <div className="px-5 py-3 bg-surface-muted border-b border-border flex items-center gap-2">
                <HelpCircle className="w-3.5 h-3.5 text-foreground-muted" />
                <p className="text-xs font-semibold text-foreground-muted uppercase tracking-wider">
                  Possible Reasons
                </p>
              </div>
              <div className="px-5 py-4 space-y-3">
                {reasons.map((reason, i) => (
                  <div key={i} className="flex items-start gap-3">
                    <div className="w-5 h-5 rounded-full bg-destructive/10 flex items-center justify-center flex-shrink-0 mt-0.5">
                      <span className="text-destructive text-xs font-bold">
                        {i + 1}
                      </span>
                    </div>
                    <p className="text-sm text-foreground-muted">
                      {reason}
                    </p>
                  </div>
                ))}
              </div>
            </div>

            <div className="rounded-2xl border border-border overflow-hidden">
              <div className="px-5 py-3 bg-surface-muted border-b border-border">
                <p className="text-xs font-semibold text-foreground-muted uppercase tracking-wider">
                  What you can do
                </p>
              </div>
              <div className="divide-y divide-border">
                {[
                  {
                    icon: RefreshCw,
                    text: "Try again with the same payment method",
                  },
                  {
                    icon: ArrowLeft,
                    text: "Go back and update your payment details",
                  },
                  {
                    icon: MessageCircle,
                    text: "Contact support if the issue persists",
                  },
                ].map(({ icon, text }, i) => {
                  const Icon = icon;
                  return (
                    <div key={i} className="flex items-center gap-3 px-5 py-3">
                      <div className="w-8 h-8 rounded-xl bg-surface-muted flex items-center justify-center flex-shrink-0">
                        <Icon className="w-4 h-4 text-foreground-muted" />
                      </div>
                      <p className="text-sm text-foreground-muted">{text}</p>
                    </div>
                  );
                })}
              </div>
            </div>

            <div className="flex flex-col gap-3 pt-1 sm:flex-row">
              <button
                onClick={() => {
                  navigate("/learning-dashboard");
                  window.scrollTo({ top: 0, behavior: "smooth" });
                }}
                className="flex-1 flex items-center justify-center gap-2 bg-surface-muted hover:bg-border text-foreground font-semibold text-sm py-3 px-4 rounded-2xl transition-colors duration-200 cursor-pointer"
              >
                <ArrowLeft className="w-4 h-4" />
                Go Back
              </button>
              <button
                onClick={() => {
                  navigate("/pricing");
                  window.scrollTo({ top: 0, behavior: "smooth" });
                }}
                className="flex-1 flex items-center justify-center gap-2 bg-destructive hover:opacity-90 text-white font-semibold text-sm py-3 px-4 rounded-2xl transition-colors duration-200 shadow-md cursor-pointer"
              >
                <RefreshCw className="w-4 h-4" />
                Try Again
              </button>
            </div>

            <div className="flex flex-col items-start gap-3 rounded-2xl border border-border px-5 py-4 sm:flex-row sm:items-center sm:justify-between">
              <div>
                <p className="text-sm font-semibold text-foreground">
                  Need help?
                </p>
                <p className="text-xs text-foreground-muted mt-0.5">
                  Our team is available 24/7
                </p>
              </div>
              <button className="flex items-center gap-2 bg-surface-muted hover:bg-border text-foreground text-xs font-semibold px-4 py-2 rounded-xl transition-colors duration-200 cursor-pointer">
                <MessageCircle className="w-3.5 h-3.5" />
                Contact Support
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
