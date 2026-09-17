import { ArrowDownIcon, BookOpen, Bookmark, Calendar, CheckCircle2, Clock, Play } from "lucide-react";
import { Link, useNavigate } from "react-router-dom";
import { useCourseDetails as useGetCourseDetails } from "@/features/catalog/hooks/useCourses";
import ErrorMessage from "@/components/ui/ErrorMessage";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import Button from "@/components/ui/Button";
import Badge from "@/components/ui/Badge";
import ProgressBar from "@/components/ui/ProgressBar";
import formatMinutes from "@/utils/formatMinutes";
import formatTimeAgo from "@/utils/formatTimeAgo";
import RatingStars from "@/components/common/RatingStars";
import { useEnrollCourse as useEnrollment } from "@/features/learning/hooks/useLearningMutations";
import {
  useEnrollment as useGetEnrollment,
  useCourseProgress,
  useCourseLessonCompletions,
} from "@/features/learning/hooks/useLearning";
import useAuth from "@/features/auth/hooks/useAuth";
import { useSavedCourseIds } from "@/features/saved/hooks/useSavedCourses";
import { useToggleSaveCourse } from "@/features/saved/hooks/useSavedMutations";

export default function HeroSection({ scrollToSection }) {
  const { data, isPending, error } = useGetCourseDetails();
  const { mutate: enroll, isPending: isEnrolling } = useEnrollment();
  const { data: enrollment } = useGetEnrollment();
  const { data: progress } = useCourseProgress();
  const { data: completions } = useCourseLessonCompletions();
  const { user } = useAuth();
  const navigate = useNavigate();
  const { data: savedCourseIds } = useSavedCourseIds();
  const { mutate: toggleSave, isPending: isSaving } = useToggleSaveCourse();

  const course = data || {};
  const isEnrolled = Boolean(enrollment);
  const isSaved =
    Array.isArray(savedCourseIds) && savedCourseIds.includes(course.id);

  const totalLessons = Number(course.total_lessons) || 0;
  const completedLessons = Array.isArray(completions) ? completions.length : 0;
  const progressPercent =
    totalLessons > 0
      ? Math.min(100, Math.round((completedLessons / totalLessons) * 100))
      : 0;
  const isCourseCompleted = isEnrolled && totalLessons > 0 && progressPercent >= 100;
  const currentLessonId = progress?.current_lesson_id;

  function handleEnroll() {
    if (isEnrolled || !user) return;
    enroll(undefined, {
      onSuccess: () => navigate(`/courses/${course.id}/lessons`),
    });
  }

  function handleToggleSave() {
    if (!course?.id) return;
    if (!user) {
      navigate("/login");
      return;
    }
    toggleSave({ courseId: course.id, isSaved });
  }

  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;

  const continueTarget = currentLessonId
    ? `/courses/${course.id}/lessons/${currentLessonId}`
    : `/courses/${course.id}/lessons`;

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
              <span>{totalLessons} Lessons</span>
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

          {isEnrolled && (
            <div className="mx-auto mb-10 max-w-md rounded-xl border border-border bg-surface p-4 text-left">
              <div className="mb-3 flex items-center justify-between">
                <span className="text-sm font-medium text-foreground">
                  Course Progress
                </span>
                {isCourseCompleted ? (
                  <Badge variant="success">
                    <CheckCircle2 size={14} />
                    Completed
                  </Badge>
                ) : (
                  <Badge variant="default">Enrolled</Badge>
                )}
              </div>
              <ProgressBar
                value={completedLessons}
                max={totalLessons || 1}
                size="md"
                showValue
              />
              <p className="mt-2 text-sm text-foreground-muted">
                {completedLessons} / {totalLessons} lessons completed
              </p>
            </div>
          )}

          <div className="flex flex-col sm:flex-row items-center justify-center gap-4 mb-12">
            {!isEnrolled ? (
              <Button
                onClick={handleEnroll}
                size="lg"
                isLoading={isEnrolling}
                rightIcon={<Play className="w-5 h-5" />}
                className="w-full sm:w-auto"
              >
                Start Learning
              </Button>
            ) : (
              <Button
                as={Link}
                to={continueTarget}
                size="lg"
                rightIcon={<Play className="w-5 h-5" />}
                className="w-full sm:w-auto"
              >
                {isCourseCompleted ? "Review Course" : "Continue Learning"}
              </Button>
            )}
            <Button
              variant="outline"
              size="lg"
              onClick={handleToggleSave}
              disabled={isSaving}
              aria-pressed={isSaved}
              leftIcon={
                <Bookmark
                  className={`w-5 h-5 ${isSaved ? "fill-current text-primary" : ""}`}
                />
              }
              className={`w-full sm:w-auto ${isSaved ? "text-primary" : ""}`}
            >
              {isSaved ? "Saved" : "Save Course"}
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
