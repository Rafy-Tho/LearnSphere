import FaqSection from "@/features/catalog/components/home/FaqSection";
import PricingSection from "@/features/subscriptions/components/PricingSection";

export default function PricingScreen() {
  return (
    <div className="min-h-screen text-foreground mb-16">
      <PricingSection />
      <FaqSection />
    </div>
  );
}
