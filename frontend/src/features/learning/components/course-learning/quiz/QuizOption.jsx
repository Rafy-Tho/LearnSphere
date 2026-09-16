import { Check } from "lucide-react";
import cn from "@/utils/cn";

const QuizOption = ({ index, option, isSelected, onSelect }) => {
  return (
    <button
      type="button"
      role="radio"
      aria-checked={isSelected}
      onClick={onSelect}
      className={cn(
        "flex w-full cursor-pointer items-center gap-3 rounded-xl border-2 p-4 text-left transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 focus-visible:ring-offset-background",
        isSelected
          ? "border-primary bg-primary/10"
          : "border-border bg-surface hover:border-primary/50 hover:bg-surface-muted",
      )}
    >
      <span
        className={cn(
          "flex h-7 w-7 shrink-0 items-center justify-center rounded-full border text-xs font-semibold",
          isSelected
            ? "border-primary bg-primary text-white"
            : "border-border text-foreground-muted",
        )}
      >
        {isSelected ? <Check size={15} /> : String.fromCharCode(65 + index)}
      </span>
      <span
        className={cn(
          "text-sm sm:text-base",
          isSelected ? "font-medium text-foreground" : "text-foreground",
        )}
      >
        {option.text}
      </span>
    </button>
  );
};

export default QuizOption;
