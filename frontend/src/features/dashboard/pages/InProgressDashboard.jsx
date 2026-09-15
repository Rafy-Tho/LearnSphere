import { History } from "lucide-react";
import CourseGridSection from "@/features/dashboard/components/CourseGridSection";
import { useCoursesInProgress as useGetCourseInProgress } from "@/features/dashboard/hooks/useDashboard";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";

const sectionIcon = (
  <History className="size-4 text-indigo-600 dark:text-indigo-400" />
);

export default function InProgressDashboard() {
  const { data, isPending, error } = useGetCourseInProgress();
  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;

  return (
    <CourseGridSection
      title="In Progress"
      icon={sectionIcon}
      courses={data?.data || []}
      pagination={data?.pagination || {}}
      emptyTitle="No in progress courses."
    />
  );
}
