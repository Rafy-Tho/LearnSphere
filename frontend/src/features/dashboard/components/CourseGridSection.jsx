import { memo } from "react";
import CourseCard from "@/components/common/CourseCard";
import EmptyState from "@/components/ui/EmptyState";
import Pagination from "@/components/common/Pagination";

function CourseGridSection({
  title,
  icon,
  courses = [],
  emptyTitle,
  pagination = {},
}) {
  return (
    <section className="mb-14">
      <h2 className="mb-6 flex items-center gap-2 text-lg font-bold">
        <span className="flex size-9 items-center justify-center rounded-full bg-indigo-100 dark:bg-indigo-950/60">
          {icon}
        </span>
        {title}
      </h2>
      {courses.length === 0 && <EmptyState title={emptyTitle} />}
      {courses.length > 0 && (
        <div className="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
          {courses.map((course) => (
            <CourseCard
              key={course.id}
              course={course}
              progress={course.progress_percentage}
              lessonId={
                Math.round(course.progress_percentage || 0) !== 100
                  ? course.lesson_progress
                  : undefined
              }
              scrollToTop={false}
            />
          ))}
        </div>
      )}
      {Number(pagination?.totalPages) > 1 && (
        <Pagination
          totalItems={Number(pagination?.totalItems)}
          itemsPerPage={Number(pagination?.limit)}
          siblingCount={1}
          showFirstLast={true}
          showPrevNext={true}
        />
      )}
    </section>
  );
}

export default memo(CourseGridSection);
