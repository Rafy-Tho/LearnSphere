import { Check, X } from "lucide-react";
import cn from "@/utils/cn";

const QuizReviewItem = ({ result, index }) => {
  return (
    <div className="rounded-xl border border-border bg-surface p-4 sm:p-5">
      <div className="flex items-start gap-3">
        <span
          className={cn(
            "mt-0.5 flex h-6 w-6 shrink-0 items-center justify-center rounded-full text-white",
            result.isCorrect ? "bg-success" : "bg-destructive",
          )}
        >
          {result.isCorrect ? <Check size={14} /> : <X size={14} />}
        </span>

        <div className="min-w-0 flex-1">
          <p className="font-medium text-foreground">
            {index + 1}. {result.question}
          </p>

          <ul className="mt-3 space-y-2">
            {result.options.map((option) => {
              const isCorrect = option.id === result.correctOptionId;
              const isSelected = option.id === result.selectedOptionId;

              return (
                <li
                  key={option.id}
                  className={cn(
                    "flex items-center justify-between gap-2 rounded-lg border px-3 py-2 text-sm",
                    isCorrect
                      ? "border-success/40 bg-success/10 text-foreground"
                      : isSelected
                        ? "border-destructive/40 bg-destructive/10 text-foreground"
                        : "border-border text-foreground-muted",
                  )}
                >
                  <span>{option.text}</span>
                  {isCorrect && (
                    <span className="shrink-0 text-xs font-medium text-success">
                      Correct
                    </span>
                  )}
                  {isSelected && !isCorrect && (
                    <span className="shrink-0 text-xs font-medium text-destructive">
                      Your answer
                    </span>
                  )}
                </li>
              );
            })}
          </ul>

          {result.explanation && (
            <p className="mt-3 rounded-lg bg-surface-muted px-3 py-2 text-sm text-foreground-muted">
              {result.explanation}
            </p>
          )}
        </div>
      </div>
    </div>
  );
};

export default QuizReviewItem;
