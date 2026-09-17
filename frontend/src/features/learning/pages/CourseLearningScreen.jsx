import { useCallback, useEffect, useRef } from "react";
import {
  Outlet,
  useLocation,
  useOutletContext,
  useParams,
} from "react-router-dom";
import useMediaQuery from "@/hooks/useMediaQuery";
import { CourseSidebar } from "@/features/learning/components/course-learning/CourseSidebar";
import NextPrevious from "@/features/learning/components/course-learning/NextPrevious";
import CourseRating from "@/features/learning/components/course-learning/CourseRating";
import { useStartLesson } from "@/features/learning/hooks/useLearningMutations";

const CourseLearningScreen = () => {
  const { isSidebarOpen, setIsSidebarOpen } = useOutletContext();
  const isDesktop = useMediaQuery("(min-width: 1024px)");
  const sectionRef = useRef(null);
  const location = useLocation();
  const { lessonId } = useParams();
  const { mutate: startLesson } = useStartLesson();
  const isQuizRoute = location.pathname.endsWith("/quiz");
  const closeSidebar = useCallback(
    () => setIsSidebarOpen(false),
    [setIsSidebarOpen],
  );

  // Record lesson start / advance the current lesson whenever a lesson opens.
  useEffect(() => {
    if (lessonId) startLesson();
  }, [lessonId, startLesson]);

  return (
    <div className="flex h-[calc(100vh-64px)] overflow-hidden bg-background">
      {/* rating modal */}
      <CourseRating />
      {/* Mobile overlay */}
      {!isDesktop && isSidebarOpen && (
        <div
          className="fixed inset-0 z-30 bg-black/20"
          onClick={closeSidebar}
        />
      )}
      {/* Mobile sidebar (overlay) */}
      {!isDesktop && (
        <div
          className={`fixed top-0 left-0 h-full z-40 w-[320px]
        transition-transform duration-200 ease-out pt-15
        ${isSidebarOpen ? "translate-x-0" : "-translate-x-full"}
      `}
        >
          <CourseSidebar onClose={closeSidebar} />
        </div>
      )}

      <div className="flex w-full">
        {/* Desktop sidebar - collapsible by controlling width */}
        {isDesktop && (
          <div
            className={`
          shrink-0 transition-[width] duration-200 ease-out overflow-hidden
          ${isSidebarOpen ? "w-[320px]" : "w-0"}
        `}
          >
            <div className="w-[320px] h-full">
              <CourseSidebar onClose={closeSidebar} />
            </div>
          </div>
        )}

        {/* Main content */}
        <div className="flex-1 flex flex-col overflow-hidden">
          <main
            key={location.pathname}
            className="flex-1 overflow-y-auto"
            ref={sectionRef}
          >
            <Outlet />
            {/* Navigation buttons (lesson content only) */}
            {!isQuizRoute && <NextPrevious />}
          </main>
        </div>
      </div>
    </div>
  );
};

export default CourseLearningScreen;
