import { History } from "lucide-react";
import CourseGridSection from "@/features/dashboard/components/CourseGridSection";
import { useCompletedCourses as useGetCompletedCourse } from "@/features/dashboard/hooks/useDashboard";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";

const sectionIcon = (
  <History className="size-4 text-primary" />
);

export default function CompletedCourseDashboard() {
  const { data, isPending, error } = useGetCompletedCourse();
  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;

  return (
    <CourseGridSection
      title="Completed Courses"
      icon={sectionIcon}
      courses={data?.data || []}
      pagination={data?.pagination || {}}
      emptyTitle="No completed courses."
    />
  );
}
