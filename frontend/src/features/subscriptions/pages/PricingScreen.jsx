import FreAskQuestion from "@/features/catalog/components/home/FreAskQuestion";
import PricingSection from "@/features/subscriptions/components/PricingSection";

export default function PricingScreen() {
  return (
    <div className="min-h-screen dark:text-white mb-16">
      <PricingSection />
      <FreAskQuestion />
    </div>
  );
}
