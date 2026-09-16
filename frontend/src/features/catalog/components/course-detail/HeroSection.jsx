import { ArrowDownIcon, BookOpen, Calendar, Clock } from "lucide-react";
import { Link } from "react-router-dom";
import { useCourseDetails as useGetCourseDetails } from "@/features/catalog/hooks/useCourses";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import Button from "@/components/ui/Button";
import formatMinutes from "@/utils/formatMinutes";
import formatTimeAgo from "@/utils/formatTimeAgo";
import RatingStars from "@/components/common/RatingStars";
import { useEnrollCourse as useEnrollment } from "@/features/learning/hooks/useLearningMutations";
import { useEnrollment as useGetEnrollment } from "@/features/learning/hooks/useLearning";
import useAuth from "@/features/auth/hooks/useAuth";

export default function HeroSection({ scrollToSection }) {
  const { data, isPending, error } = useGetCourseDetails();
  const { mutate } = useEnrollment();
  const { data: enrollmentsData } = useGetEnrollment();
  const { user } = useAuth();
  function handleEnroll() {
    if (enrollmentsData || !user) return;
    mutate();
    window.scrollTo({
      top: 0,
      behavior: "smooth",
    });
  }
  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  const course = data || {};
  return (
    <div className="bg-surface-muted rounded-b-3xl pb-12">
      <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 pt-12 sm:pt-16 lg:pt-20">
        <div className="text-center">
          <h1 className="text-3xl sm:text-4xl lg:text-5xl font-bold text-foreground mb-4">
            {course?.name || ""}
          </h1>
          <p className="text-base sm:text-lg text-foreground-muted max-w-4xl mx-auto mb-8 px-4">
            {course?.description || ""}
          </p>

          <div className="flex flex-wrap items-center justify-center gap-4 sm:gap-6 mb-8 text-sm sm:text-base">
            <div className="flex items-center gap-1">
              <div className="flex">
                <RatingStars rating={course?.rating || 0} />
              </div>
              <span className="ml-1 text-foreground-muted font-medium">
                {course?.rating || 0}
              </span>
            </div>
            <div className="flex items-center gap-2 text-foreground-muted">
              <BookOpen className="w-4 h-4 sm:w-5 sm:h-5 text-primary" />
              <span>{course?.total_lessons || 0} Lessons</span>
            </div>
            <div className="flex items-center gap-2 text-foreground-muted">
              <Calendar className="w-4 h-4 sm:w-5 sm:h-5 text-primary" />
              <span> Updated {formatTimeAgo(course?.updated_at || "")}</span>
            </div>
            <div className="flex items-center gap-2 text-foreground-muted">
              <Clock className="w-4 h-4 sm:w-5 sm:h-5 text-primary" />
              <span>{formatMinutes(course?.total_duration || 0)}</span>
            </div>
          </div>

          <div className="flex flex-col sm:flex-row items-center justify-center gap-4 mb-12">
            <Button
              as={Link}
              onClick={handleEnroll}
              to={`/courses/${course?.id}/lessons`}
              size="lg"
              className="w-full sm:w-auto"
            >
              Start Learning
            </Button>
            <Button
              variant="outline"
              size="lg"
              onClick={scrollToSection}
              rightIcon={<ArrowDownIcon className="w-5 h-5" />}
              className="w-full sm:w-auto"
            >
              Course Content
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
}
