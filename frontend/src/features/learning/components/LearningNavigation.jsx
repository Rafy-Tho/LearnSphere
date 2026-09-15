import { useParams } from "react-router-dom";
import useScrollEffect from "@/hooks/useScrollEffect";
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

  return (
    <header
      className={`sticky top-0 z-50 transition-all duration-300 ${
        isScrolled
          ? "border-b border-slate-200 bg-white/95 shadow-lg backdrop-blur-md dark:border-slate-700 dark:bg-slate-900/95"
          : "border-b border-slate-200/50 bg-white/80 backdrop-blur-sm dark:border-slate-700/50 dark:bg-slate-900/80"
      }`}
    >
      <div className="mx-auto flex max-w-[100vw] flex-row flex-wrap items-center justify-between gap-2 px-3 py-2.5 sm:px-4 sm:py-3 md:gap-4 lg:px-6">
        {/* Left cluster - shared across all devices */}
        <LeftCluster
          courseId={courseId}
          isSidebarOpen={isSidebarOpen}
          setIsSidebarOpen={setIsSidebarOpen}
        />

        {/* Desktop menu - visible on md and above */}
        <DesktopMenu setIsRatingOpen={setIsRatingOpen} />

        {/* Mobile menu - visible below md breakpoint */}
        <MobileMenu setIsRatingOpen={setIsRatingOpen} />
      </div>
    </header>
  );
}

export default LearningNavigation;
