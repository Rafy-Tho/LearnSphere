import { useId } from "react";
import useMenuState from "@/hooks/useMenuState";
import { MoreVertical, StarOff } from "lucide-react";
import DesktopMoreMenuContent from "@/features/learning/components/learning-navbar/DesktopMoreMenuContent";
import UnlockAccessButton from "@/features/learning/components/learning-navbar/UnlockAccessButton";
import { useMyReview as useGetReview } from "@/features/reviews/hooks/useReviews";
import RatingStars from "@/components/common/RatingStars";

/**
 * Desktop menu component (visible on md and above)
 * Uses its own state management
 */
function DesktopMenu({ setIsRatingOpen }) {
  const {
    isOpen: moreMenuOpen,
    setIsOpen: setMoreMenuOpen,
    menuRef: desktopMoreRef,
  } = useMenuState();
  const moreMenuId = useId();
  const { data } = useGetReview();
  const reviews = data;
  return (
    <div className="hidden min-w-0 flex-wrap items-center justify-end gap-2 sm:gap-2.5 md:flex md:shrink-0">
      {/* Unlock Full Access Button */}
      <UnlockAccessButton />
      {/* Your Reviews  */}
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
      {/* Leave Review Button */}
      {!reviews && (
        <button
          onClick={() => setIsRatingOpen(true)}
          type="button"
          className="group inline-flex items-center gap-2 rounded-lg border border-border bg-surface px-3 py-2 text-sm font-medium text-foreground shadow-sm transition-colors hover:bg-surface-muted cursor-pointer"
        >
          <StarOff className="h-4 w-4 text-warning transition-transform duration-200 group-hover:rotate-12" />
          Leave Review
        </button>
      )}

      {/* More Menu */}
      <div ref={desktopMoreRef} className="relative">
        <button
          type="button"
          id={`${moreMenuId}-trigger`}
          aria-expanded={moreMenuOpen}
          aria-controls={moreMenuId}
          aria-haspopup="true"
          aria-label="More options"
          className={`flex h-9 w-9 items-center justify-center rounded-lg text-foreground-muted transition-colors hover:bg-surface-muted hover:text-foreground cursor-pointer ${
            moreMenuOpen ? "bg-surface-muted text-foreground" : ""
          }`}
          onClick={() => setMoreMenuOpen(!moreMenuOpen)}
        >
          <MoreVertical className="h-4 w-4" />
        </button>

        {moreMenuOpen && (
          <DesktopMoreMenuContent
            moreMenuId={moreMenuId}
            setMoreMenuOpen={setMoreMenuOpen}
          />
        )}
      </div>
    </div>
  );
}
export default DesktopMenu;
