import { useEffect, useRef } from "react";
import QuizOption from "@/features/learning/components/course-learning/quiz/QuizOption";

const QuizQuestion = ({ question, selectedOptionId, onSelect }) => {
  const headingRef = useRef(null);

  useEffect(() => {
    headingRef.current?.focus();
  }, [question.id]);

  return (
    <div>
      <h2
        ref={headingRef}
        tabIndex={-1}
        className="text-lg font-semibold text-foreground outline-none sm:text-xl"
      >
        {question.question}
      </h2>

      <div
        role="radiogroup"
        aria-label={question.question}
        className="mt-5 space-y-3"
      >
        {question.options.map((option, index) => (
          <QuizOption
            key={option.id}
            index={index}
            option={option}
            isSelected={selectedOptionId === option.id}
            onSelect={() => onSelect(option.id)}
          />
        ))}
      </div>
    </div>
  );
};

export default QuizQuestion;
