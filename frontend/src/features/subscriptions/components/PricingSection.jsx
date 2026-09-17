import { useActiveSubscription, usePlans } from "@/features/subscriptions/hooks/useSubscriptions";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ErrorMessage from "@/components/ui/ErrorMessage";
import EmptyState from "@/components/ui/EmptyState";
import Button from "@/components/ui/Button";
import PricingCard from "@/features/subscriptions/components/PricingCard";
import { PackageOpen } from "lucide-react";

export default function PricingSection() {
  const {
    data: plans,
    isPending,
    error,
    refetch,
  } = usePlans();
  const { data: activeSubscription } = useActiveSubscription();

  const list = plans || [];
  const highlightedIndex = list.length > 0 ? Math.floor((list.length - 1) / 2) : -1;

  return (
    <section className="min-h-screen transition-colors duration-300 bg-surface-muted">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16 sm:py-20 lg:py-24">
        <div className="text-center mb-14 sm:mb-16 max-w-3xl mx-auto">
          <span className="text-sm font-semibold text-primary uppercase tracking-wider">
            Pricing Plans
          </span>
          <h1 className="text-4xl sm:text-5xl lg:text-6xl font-bold tracking-tight mb-4 text-foreground mt-2">
            Start your <span className="text-primary">learning journey</span>
          </h1>
          <p className="text-base sm:text-lg text-foreground-muted">
            Choose the perfect plan for your online course needs. Learn at your
            own pace, anytime, anywhere.
          </p>
        </div>

        {isPending ? (
          <div className="flex justify-center py-16">
            <SpinnerLoader />
          </div>
        ) : error ? (
          <div className="max-w-lg mx-auto text-center">
            <ErrorMessage
              title="We couldn't load the plans"
              message={error.message}
            />
            <Button className="mt-4" onClick={() => refetch()}>
              Try Again
            </Button>
          </div>
        ) : list.length === 0 ? (
          <EmptyState
            icon={<PackageOpen size={22} />}
            title="No plans available"
            description="Pricing plans will appear here once they are published."
          />
        ) : (
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 lg:gap-10 justify-items-center">
            {list.map((plan, index) => (
              <PricingCard
                key={plan.id}
                plan={plan}
                activeSubscription={activeSubscription}
                highlighted={index === highlightedIndex}
              />
            ))}
          </div>
        )}

        <p className="text-center text-foreground-muted text-sm mt-12">
          One-time payment for a fixed access period. No auto-renewal. Payments
          are processed securely by Stripe.
        </p>
      </div>
    </section>
  );
}
