import ProgressBar from "@/components/ui/ProgressBar";
import cn from "@/utils/cn";

const QuizProgress = ({
  currentIndex,
  totalQuestions,
  answeredIndexes,
  onJump,
}) => {
  return (
    <div className="mb-6">
      <div className="mb-2 flex items-center justify-between text-xs text-foreground-muted">
        <span className="font-medium">
          Question {currentIndex + 1} of {totalQuestions}
        </span>
        <span>{answeredIndexes.size} answered</span>
      </div>

      <ProgressBar
        value={answeredIndexes.size}
        max={totalQuestions}
        size="sm"
      />

      <div className="mt-3 flex flex-wrap gap-1.5">
        {Array.from({ length: totalQuestions }, (_, index) => {
          const isCurrent = index === currentIndex;
          const isAnswered = answeredIndexes.has(index);

          return (
            <button
              key={index}
              type="button"
              onClick={() => onJump(index)}
              aria-label={`Go to question ${index + 1}`}
              aria-current={isCurrent ? "step" : undefined}
              className={cn(
                "h-7 w-7 cursor-pointer rounded-md text-xs font-medium transition-colors",
                isCurrent
                  ? "bg-primary text-white"
                  : isAnswered
                    ? "bg-primary/10 text-primary"
                    : "bg-surface-muted text-foreground-muted hover:bg-border",
              )}
            >
              {index + 1}
            </button>
          );
        })}
      </div>
    </div>
  );
};

export default QuizProgress;
