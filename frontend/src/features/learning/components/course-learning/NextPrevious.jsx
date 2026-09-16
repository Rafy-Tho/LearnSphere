import { useNavigate, useParams } from "react-router-dom";
import { useCreateCompletedLesson } from "@/features/learning/hooks/useLearningMutations";
import { useCompletedLesson as useGetCompletedLesson } from "@/features/learning/hooks/useLessons";
import { useUpdateCourseProgress } from "@/features/learning/hooks/useLearningMutations";
import { useLessonNavigation } from "@/features/learning/hooks/useLessonNavigation";

function NextPrevious() {
  const { courseId, lessonId } = useParams();
  const navigate = useNavigate();
  const { mutate: completeLesson } = useCreateCompletedLesson();
  const { mutate: updateProgress } = useUpdateCourseProgress();
  const { data: completedLesson } = useGetCompletedLesson();
  const {
    currentLessonIndex,
    totalLessons,
    prevLessonId,
    nextLessonId,
    isPrevQuiz,
    isNextQuiz,
  } = useLessonNavigation();

  function handleCompleteLesson() {
    if (completedLesson) return;
    completeLesson();
    updateProgress({ lessonId });
  }
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
  return (
    <div className="flex flex-col sm:flex-row justify-between items-center gap-4 px-4 py-6 border-t border-border bg-surface mt-8">
      <button
        onClick={goToPrevPage}
        disabled={!prevLessonId}
        className={`
                  flex items-center gap-2 px-4 py-2 rounded-lg transition-colors duration-200 w-full sm:w-auto justify-center
                  ${
                    prevLessonId
                      ? "bg-surface-muted text-foreground hover:bg-border cursor-pointer"
                      : "bg-surface-muted text-foreground-muted cursor-not-allowed"
                  }
                `}
      >
        <svg
          className="w-4 h-4"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth={2}
            d="M15 19l-7-7 7-7"
          />
        </svg>
        Previous
      </button>

      <div className="text-sm text-foreground-muted font-medium px-3 py-1 bg-surface-muted rounded-full sm:bg-transparent ">
        Lesson {currentLessonIndex + 1} of {totalLessons}
      </div>
      <div className="flex items-center gap-2 w-full sm:w-auto">
        {!completedLesson && (
          <button
            onClick={handleCompleteLesson}
            className={`
                  flex items-center gap-2 px-4 py-2 rounded-lg transition-colors duration-200 w-full sm:w-auto justify-center
                  ${
                    !completedLesson
                      ? "bg-warning text-white hover:bg-warning/90 active:bg-warning/80 cursor-pointer"
                      : "bg-surface-muted text-foreground-muted cursor-not-allowed"
                  }
                `}
          >
            Complete
          </button>
        )}
        <button
          onClick={goToNextPage}
          disabled={!nextLessonId}
          className={`
                  flex items-center gap-2 px-4 py-2 rounded-lg transition-colors duration-200 w-full sm:w-auto justify-center
                  ${
                    nextLessonId
                      ? "bg-warning text-white hover:bg-warning/90 active:bg-warning/80 cursor-pointer"
                      : "bg-surface-muted text-foreground-muted cursor-not-allowed"
                  }
                `}
        >
          Next
          <svg
            className="w-4 h-4"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M9 5l7 7-7 7"
            />
          </svg>
        </button>
      </div>
    </div>
  );
}

export default NextPrevious;
