import { useParams } from "react-router-dom";
import useScrollEffect from "@/hooks/useScrollEffect";
import useMediaQuery from "@/hooks/useMediaQuery";
import DesktopMenu from "@/features/learning/components/learning-navbar/DesktopMenu";
import LeftCluster from "@/features/learning/components/learning-navbar/LeftCluster";
import MobileMenu from "@/features/learning/components/learning-navbar/MobileMenu";

/**
 * Enhanced navigation bar with better styling and responsive design
 */
export function LearningNavigation({
  isSidebarOpen,
  setIsSidebarOpen,
  setIsRatingOpen,
}) {
  const { courseId } = useParams();
  const isScrolled = useScrollEffect();
  const isDesktop = useMediaQuery("(min-width: 768px)");

  return (
    <header
      className={`sticky top-0 z-50 transition-shadow ${
        isScrolled
          ? "border-b border-border bg-surface/95 shadow-md backdrop-blur-md"
          : "border-b border-border/60 bg-surface/80 backdrop-blur-sm"
      }`}
    >
      <div className="mx-auto flex w-full flex-row flex-wrap items-center justify-between gap-2 px-3 py-2.5 sm:px-4 sm:py-3 md:gap-4 lg:px-6">
        {/* Left cluster - shared across all devices */}
        <LeftCluster
          courseId={courseId}
          isSidebarOpen={isSidebarOpen}
          setIsSidebarOpen={setIsSidebarOpen}
        />

        {isDesktop ? (
          <DesktopMenu setIsRatingOpen={setIsRatingOpen} />
        ) : (
          <MobileMenu setIsRatingOpen={setIsRatingOpen} />
        )}
      </div>
    </header>
  );
}

export default LearningNavigation;
