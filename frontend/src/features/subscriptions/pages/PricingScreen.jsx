import FaqSection from "@/features/catalog/components/home/FaqSection";
import PricingSection from "@/features/subscriptions/components/PricingSection";

export default function PricingScreen() {
  return (
    <div className="min-h-screen dark:text-white mb-16">
      <PricingSection />
      <FaqSection />
    </div>
  );
}
