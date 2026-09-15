import { useActiveSubscription as useGetActiveSubscription } from "@/features/subscriptions/hooks/useSubscriptions";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import Subscribed from "@/features/settings/components/Subscribed";
import Subscription from "@/features/settings/components/Subscription";

function SubscriptionContainer() {
  const { data, isPending } = useGetActiveSubscription();
  const activeSubscription = data || null;
  if (isPending) return <SpinnerLoader />;
  return activeSubscription ? (
    <Subscribed data={activeSubscription} />
  ) : (
    <Subscription />
  );
}

export default SubscriptionContainer;
