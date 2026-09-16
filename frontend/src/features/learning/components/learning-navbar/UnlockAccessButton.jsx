import { Sparkles } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { useActiveSubscription as useGetActiveSubscription } from "@/features/subscriptions/hooks/useSubscriptions";

/**
 * Reusable Unlock Access button component
 */
function UnlockAccessButton({ fullWidth = false }) {
  const navigate = useNavigate();
  const { data } = useGetActiveSubscription();
  const activeSubscription = data || null;
  const buttonClasses = fullWidth
    ? "w-full rounded-lg bg-primary py-3 text-center text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-hover active:scale-95 cursor-pointer"
    : "inline-flex items-center rounded-lg bg-primary px-4 py-2 text-sm font-semibold text-white shadow-sm transition-colors hover:bg-primary-hover active:scale-95 cursor-pointer";

  const content = (
    <span className="flex items-center justify-center gap-2">
      <Sparkles className="h-4 w-4" />
      Unlock Full Access
    </span>
  );

  if (activeSubscription) return null;
  return (
    <div className={fullWidth ? "relative mb-3" : ""}>
      <button onClick={() => navigate("/pricing")} className={buttonClasses}>
        {content}
      </button>
    </div>
  );
}
export default UnlockAccessButton;
