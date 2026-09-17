import { useEffect, useRef } from "react";
import { useSearchParams } from "react-router-dom";
import { Search } from "lucide-react";
import { useCourses as useGetCourses } from "@/features/catalog/hooks/useCourses";
import { CourseCardDetailed } from "@/features/catalog/components/course/CourseCardDetailed";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ErrorMessage from "@/components/ui/ErrorMessage";
import EmptyState from "@/components/ui/EmptyState";
import Pagination from "@/components/common/Pagination";
import scrollToTop from "@/utils/scrollToTop";

export function SearchResult() {
  const [searchParams] = useSearchParams();
  const scrollRef = useRef(null);
  const queryKey = searchParams.toString();
  const { data, isPending, error } = useGetCourses(searchParams);
  const courses = data?.data || [];
  const pagination = data?.pagination || {};

  useEffect(() => {
    scrollToTop(scrollRef.current);
    scrollToTop();
  }, [queryKey]);

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;

  return (
    <div ref={scrollRef} className="flex-1 overflow-y-auto">
      <div className="p-4 md:p-8">
        <h2 className="text-xl md:text-2xl font-semibold text-foreground mb-6">
          Search Results ({pagination?.totalItems || 0})
        </h2>
        {courses.length === 0 && (
          <EmptyState
            icon={<Search className="size-6" />}
            title="No courses found."
          />
        )}
        {courses.length > 0 && (
          <div className="space-y-4 md:space-y-5">
            {courses.map((course) => (
              <CourseCardDetailed key={course.id} course={course} />
            ))}
          </div>
        )}
        <Pagination
          totalItems={Number(pagination?.totalItems)}
          itemsPerPage={Number(pagination?.limit)}
          siblingCount={1}
          showFirstLast={true}
          showPrevNext={true}
        />
      </div>
    </div>
  );
}
