// src/components/RecentlyViewed.tsx
import { History } from "lucide-react";
import { useSearchParams } from "react-router-dom";
import { useRecentlyViewedCourses as useGetRecentlyViewedCourses } from "@/features/dashboard/hooks/useDashboard";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import EmptyState from "@/components/ui/EmptyState";
import CourseCard from "@/components/common/CourseCard";
import Pagination from "@/components/common/Pagination";

const PAGE_SIZE = 8;

export default function RecentlyViewed({ limit }) {
  const { data, isPending, error } = useGetRecentlyViewedCourses();
  const [searchParams] = useSearchParams();
  const page = Number(searchParams.get("page")) || 1;
  const courses = data || [];

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;

  const total = courses.length;
  const visible = limit
    ? courses.slice(0, limit)
    : courses.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE);

  return (
    <section className="mb-14">
      <h2 className="mb-6 flex items-center gap-2 text-lg font-bold">
        <span className="flex size-9 items-center justify-center rounded-full bg-primary/10">
          <History className="size-4 text-primary" />
        </span>
        Recently Viewed
      </h2>
      {courses.length === 0 && (
        <EmptyState title="No recently viewed courses." />
      )}
      {courses.length > 0 && (
        <div className="grid grid-cols-1 gap-4 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
          {visible.map((course) => (
            <CourseCard
              key={course.id}
              course={course}
              lessonId={course.last_lesson}
              scrollToTop={false}
            />
          ))}
        </div>
      )}
      {!limit && total > PAGE_SIZE && (
        <Pagination
          totalItems={total}
          itemsPerPage={PAGE_SIZE}
          siblingCount={1}
        />
      )}
    </section>
  );
}
