import { Bookmark } from "lucide-react";
import CourseGridSection from "@/features/dashboard/components/CourseGridSection";
import { useSavedCourses } from "@/features/saved/hooks/useSavedCourses";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";

const sectionIcon = <Bookmark className="size-4 text-primary" />;

export default function SavedCoursesDashboard() {
  const { data, isPending, error } = useSavedCourses();

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;

  return (
    <CourseGridSection
      title="Saved Courses"
      icon={sectionIcon}
      courses={data?.data || []}
      pagination={data?.pagination || {}}
      emptyTitle="No saved courses."
    />
  );
}
