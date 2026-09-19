import { useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import { toast } from "react-toastify";
import { ArrowLeft, BadgePercent, Check, ShieldCheck, X } from "lucide-react";
import {
  useActiveSubscription,
  useSubscriptionDetails,
} from "@/features/subscriptions/hooks/useSubscriptions";
import {
  useCheckout,
  useValidateCoupon,
} from "@/features/subscriptions/hooks/useSubscriptionMutations";
import { formatMoney } from "@/features/subscriptions/utils/money";
import Button from "@/components/ui/Button";
import Input from "@/components/ui/Input";
import Card from "@/components/ui/Card";
import Alert from "@/components/ui/Alert";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ErrorMessage from "@/components/ui/ErrorMessage";

export default function Checkout() {
  const { planId } = useParams();
  const navigate = useNavigate();
  const { data: plan, isPending, error, refetch } =
    useSubscriptionDetails(planId);
  const { data: activeSubscription } = useActiveSubscription();
  const validateCoupon = useValidateCoupon();
  const checkout = useCheckout();

  const [code, setCode] = useState("");
  const [coupon, setCoupon] = useState(null);
  const [couponError, setCouponError] = useState("");

  if (isPending) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-surface-muted">
        <SpinnerLoader />
      </div>
    );
  }

  if (error || !plan) {
    return (
      <div className="min-h-screen bg-surface-muted px-4 py-16">
        <div className="max-w-lg mx-auto text-center">
          <ErrorMessage
            title="We couldn't load this plan"
            message={error?.message || "Plan not found"}
            onRetry={() => refetch()}
          />
        </div>
      </div>
    );
  }

  const currency = plan.currency;
  const subtotal = Number(plan.price);
  const discount = coupon?.discount ?? 0;
  const total = coupon ? coupon.total : subtotal;
  const alreadyActive = !!activeSubscription?.is_active;

  async function applyCoupon() {
    const value = code.trim();
    setCouponError("");
    if (!value) return;

    try {
      const result = await validateCoupon.mutateAsync({
        code: value,
        plan_id: planId,
      });
      setCoupon(result);
      setCode(result.code);
    } catch (err) {
      setCoupon(null);
      setCouponError(err.message || "Coupon code is invalid or expired.");
    }
  }

  function removeCoupon() {
    setCoupon(null);
    setCode("");
    setCouponError("");
  }

  async function confirm() {
    try {
      const data = await checkout.mutateAsync({
        planId,
        couponCode: coupon?.code,
      });
      if (data?.session_url) {
        window.location.href = data.session_url;
        return;
      }
      toast.error("Could not start checkout. Please try again.");
    } catch (err) {
      toast.error(err.message || "Could not start checkout.");
    }
  }

  return (
    <div className="min-h-screen bg-surface-muted text-foreground">
      <div className="max-w-4xl mx-auto px-4 sm:px-6 py-12">
        <button
          type="button"
          onClick={() => navigate("/pricing")}
          className="mb-6 inline-flex items-center gap-2 text-sm text-foreground-muted hover:text-foreground transition-colors cursor-pointer"
        >
          <ArrowLeft size={16} />
          Back to plans
        </button>

        <h1 className="text-2xl sm:text-3xl font-bold mb-8">Checkout</h1>

        {alreadyActive && (
          <Alert variant="info" title="You already have an active plan" className="mb-6">
            Manage your subscription from your{" "}
            <Link to="/learning-dashboard/billing" className="text-primary underline">
              billing page
            </Link>
            .
          </Alert>
        )}

        <div className="grid grid-cols-1 lg:grid-cols-5 gap-6">
          <div className="lg:col-span-3 space-y-6">
            <Card title="Plan">
              <p className="text-lg font-semibold text-foreground">
                {plan.name}
              </p>
              <p className="mt-1 text-sm text-foreground-muted">
                {plan.description || "Full access to the learning platform."}
              </p>
              <p className="mt-3 text-sm font-medium text-foreground">
                {formatMoney(plan.price, currency)} for {plan.duration_days} days
              </p>
              <p className="mt-1 text-xs text-foreground-muted">
                One-time payment. No auto-renewal.
              </p>
            </Card>

            <Card title="Coupon">
              {coupon ? (
                <div className="flex items-center justify-between gap-3 rounded-lg border border-success/30 bg-success/5 px-4 py-3">
                  <div className="flex items-center gap-2 text-sm text-success">
                    <Check size={16} />
                    <span className="font-medium">{coupon.code} applied</span>
                  </div>
                  <button
                    type="button"
                    onClick={removeCoupon}
                    className="inline-flex items-center gap-1 text-xs font-medium text-foreground-muted hover:text-foreground cursor-pointer"
                  >
                    <X size={14} />
                    Remove
                  </button>
                </div>
              ) : (
                <>
                  <div className="flex flex-col gap-3 sm:flex-row sm:items-end">
                    <Input
                      label="Coupon code"
                      icon={<BadgePercent size={18} />}
                      value={code}
                      placeholder="Enter coupon code"
                      onChange={(event) =>
                        setCode(event.target.value.toUpperCase())
                      }
                      onKeyDown={(event) => {
                        if (event.key === "Enter") {
                          event.preventDefault();
                          applyCoupon();
                        }
                      }}
                      containerClassName="min-w-0 flex-1"
                      autoComplete="off"
                    />
                    <Button
                      variant="secondary"
                      onClick={applyCoupon}
                      isLoading={validateCoupon.isPending}
                      className="w-full sm:w-auto"
                    >
                      Apply
                    </Button>
                  </div>
                  {couponError && (
                    <p className="mt-2 text-sm text-destructive">
                      {couponError}
                    </p>
                  )}
                </>
              )}
            </Card>
          </div>

          <div className="lg:col-span-2">
            <Card title="Order summary" className="lg:sticky lg:top-6">
              <dl className="space-y-3 text-sm">
                <div className="flex justify-between">
                  <dt className="text-foreground-muted">Subtotal</dt>
                  <dd className="font-medium text-foreground">
                    {formatMoney(subtotal, currency)}
                  </dd>
                </div>
                {discount > 0 && (
                  <div className="flex justify-between">
                    <dt className="text-foreground-muted">
                      Discount
                      {coupon?.code ? ` (${coupon.code})` : ""}
                    </dt>
                    <dd className="font-medium text-success">
                      -{formatMoney(discount, currency)}
                    </dd>
                  </div>
                )}
                <div className="flex justify-between border-t border-border pt-3">
                  <dt className="font-semibold text-foreground">Total</dt>
                  <dd className="text-lg font-bold text-foreground">
                    {formatMoney(total, currency)}
                  </dd>
                </div>
              </dl>

              <Button
                className="mt-6"
                fullWidth
                size="lg"
                onClick={confirm}
                disabled={alreadyActive}
                isLoading={checkout.isPending}
              >
                {alreadyActive ? "Already subscribed" : "Continue to Stripe"}
              </Button>

              <div className="mt-4 rounded-md bg-slate-50 p-3 text-center">
                <p className="text-xs text-slate-600">
                  <strong>Sandbox Mode:</strong> This is a test payment. No real money is charged.
                </p>
                <p className="mt-1 text-xs text-slate-500">
                  Use card: 4242 4242 4242 4242 (any future date, any 3-digit CVC)
                </p>
              </div>

              <p className="mt-4 text-center text-xs text-foreground-muted">
                One-time payment for {plan.duration_days} days of access. Your
                access ends automatically — no recurring charges.
              </p>

              <p className="mt-3 flex items-center justify-center gap-2 text-xs text-foreground-muted">
                <ShieldCheck size={14} />
                Secure payment powered by Stripe
              </p>
            </Card>
          </div>
        </div>
      </div>
    </div>
  );
}
