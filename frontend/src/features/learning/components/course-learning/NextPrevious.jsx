import { useNavigate, useParams } from "react-router-dom";
import { CheckCircle2, ChevronLeft, ChevronRight } from "lucide-react";
import {
  useCreateCompletedLesson,
  useUpdateCourseProgress,
} from "@/features/learning/hooks/useLearningMutations";
import { useCompletedLesson as useGetCompletedLesson } from "@/features/learning/hooks/useLessons";
import { useLessonNavigation } from "@/features/learning/hooks/useLessonNavigation";
import Button from "@/components/ui/Button";
import Badge from "@/components/ui/Badge";
import ProgressBar from "@/components/ui/ProgressBar";

function NextPrevious() {
  const { courseId, lessonId } = useParams();
  const navigate = useNavigate();
  const { mutateAsync: completeLesson, isPending: isCompleting } =
    useCreateCompletedLesson();
  const { mutate: updateProgress } = useUpdateCourseProgress();
  const { data: completedLesson } = useGetCompletedLesson();
  const {
    currentLessonIndex,
    totalLessons,
    prevLessonId,
    nextLessonId,
    nextLesson,
    isPrevQuiz,
    isNextQuiz,
  } = useLessonNavigation();

  const isCompleted = Boolean(completedLesson);
  const hasNext = Boolean(nextLessonId);

  const goToNextPage = () => {
    if (!nextLessonId) return;
    if (isNextQuiz)
      navigate(`/courses/${courseId}/lessons/${nextLessonId}/quiz`);
    else navigate(`/courses/${courseId}/lessons/${nextLessonId}`);
  };

  const goToPrevPage = () => {
    if (!prevLessonId) return;
    if (isPrevQuiz)
      navigate(`/courses/${courseId}/lessons/${prevLessonId}/quiz`);
    else navigate(`/courses/${courseId}/lessons/${prevLessonId}`);
  };

  async function handlePrimaryAction() {
    if (isCompleted) {
      goToNextPage();
      return;
    }

    try {
      await completeLesson();
      updateProgress({ lessonId });
      goToNextPage();
    } catch {
      // Errors are surfaced by the mutation's toast.
    }
  }

  let primaryLabel = "Complete & Continue";
  let isPrimaryDisabled = false;

  if (isCompleted && hasNext) {
    primaryLabel = "Next Lesson";
  } else if (!hasNext && !isCompleted) {
    primaryLabel = "Mark as complete";
  } else if (!hasNext && isCompleted) {
    primaryLabel = "Course completed";
    isPrimaryDisabled = true;
  }

  return (
    <div className="sticky bottom-0 z-10 border-t border-border bg-surface/95 backdrop-blur-md">
      <div className="mx-auto flex max-w-5xl flex-col gap-3 px-4 py-3 sm:flex-row sm:items-center sm:justify-between">
        <Button
          variant="outline"
          size="md"
          onClick={goToPrevPage}
          disabled={!prevLessonId}
          leftIcon={<ChevronLeft size={16} />}
          aria-label="Previous lesson"
          className="w-full sm:w-auto"
        >
          Previous
        </Button>

        <div className="order-first w-full sm:order-none sm:max-w-xs sm:flex-none">
          <div className="mb-1.5 flex items-center justify-between gap-3 text-xs text-foreground-muted">
            <span className="font-medium whitespace-nowrap">
              Lesson {currentLessonIndex + 1} of {totalLessons}
            </span>
            {nextLesson?.name && (
              <span className="min-w-0 truncate" title={nextLesson.name}>
                Next: {nextLesson.name}
              </span>
            )}
          </div>
          <ProgressBar
            value={currentLessonIndex + 1}
            max={totalLessons}
            size="sm"
          />
        </div>

        <div className="flex w-full items-center gap-2 sm:w-auto">
          {isCompleted && (
            <Badge variant="success" className="shrink-0">
              <CheckCircle2 size={14} />
              Completed
            </Badge>
          )}
          <Button
            variant="primary"
            size="md"
            onClick={handlePrimaryAction}
            isLoading={isCompleting}
            disabled={isPrimaryDisabled}
            rightIcon={hasNext ? <ChevronRight size={16} /> : undefined}
            className="flex-1 sm:flex-none"
          >
            {primaryLabel}
          </Button>
        </div>
      </div>
    </div>
  );
}

export default NextPrevious;
