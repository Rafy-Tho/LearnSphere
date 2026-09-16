import { Award, Shield, StarOff, TrendingUp } from "lucide-react";
import UnlockAccessButton from "@/features/learning/components/learning-navbar/UnlockAccessButton";
import ThemeSelector from "@/components/common/ThemeSelector";
import { useMyReview as useGetReview } from "@/features/reviews/hooks/useReviews";
import RatingStars from "@/components/common/RatingStars";

/**
 * Mobile menu content
 */
function MobileMenuContent({ menuId, setMenuOpen, setIsRatingOpen }) {
  const handleLeaveReview = () => {
    setIsRatingOpen(true);
    setMenuOpen(false);
  };
  const { data } = useGetReview();
  const reviews = data;
  return (
    <div
      id={menuId}
      role="menu"
      aria-labelledby={`${menuId}-trigger`}
      className="animate-dialog-in absolute right-0 top-full z-50 mt-2 w-[min(100vw-1.5rem,20rem)] origin-top-right rounded-xl border border-border bg-surface p-2 shadow-xl"
    >
      <div className="border-b border-border px-2 pb-2 pt-1">
        <p className="text-[11px] font-semibold uppercase tracking-wide text-foreground-muted">
          Quick Actions
        </p>
      </div>

      <div className="flex w-full items-center gap-3 rounded-lg px-3 py-2 text-sm text-foreground transition-colors hover:bg-surface-muted">
        <ThemeSelector />
      </div>

      <button className="flex w-full items-center gap-3 rounded-lg px-3 py-2 text-sm text-foreground transition-colors hover:bg-surface-muted cursor-pointer">
        <TrendingUp className="h-4 w-4 text-success" />
        View Analytics
      </button>

      <button className="flex w-full items-center gap-3 rounded-lg px-3 py-2 text-sm text-foreground transition-colors hover:bg-surface-muted cursor-pointer">
        <Shield className="h-4 w-4 text-primary" />
        Privacy Settings
      </button>

      <div className="border-t border-border px-2 pb-1 pt-2">
        <p className="text-[11px] font-semibold uppercase tracking-wide text-foreground-muted">
          Support
        </p>
      </div>

      <button className="flex w-full items-center gap-3 rounded-lg px-3 py-2 text-sm text-foreground transition-colors hover:bg-surface-muted cursor-pointer">
        <Award className="h-4 w-4 text-warning" />
        Help &amp; Tutorials
      </button>

      {/* Mobile CTA Buttons */}
      <UnlockAccessButton fullWidth />
      {reviews && (
        <div className="flex items-center gap-2 rounded-lg border border-border bg-surface px-4 py-2 shadow-sm">
          <RatingStars rating={reviews?.rating} />
          <div className="flex items-baseline gap-1">
            <span className="text-sm font-bold text-foreground">
              {reviews?.rating}
            </span>
          </div>
        </div>
      )}
      {!reviews && (
        <button
          type="button"
          role="menuitem"
          className="flex w-full items-center gap-3 rounded-lg border border-border bg-surface px-3 py-2.5 text-left text-sm font-medium text-foreground transition-colors hover:bg-surface-muted cursor-pointer"
          onClick={handleLeaveReview}
        >
          <StarOff className="h-4 w-4 text-warning" />
          Leave Review
        </button>
      )}
    </div>
  );
}
export default MobileMenuContent;
