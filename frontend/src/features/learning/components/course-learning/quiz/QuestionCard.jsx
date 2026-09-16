// components/QuestionCard.jsx
import OptionButton from "@/features/learning/components/course-learning/quiz/OptionButton";
import Explanation from "@/features/learning/components/course-learning/quiz/Explanation";

const QuestionCard = ({
  question,
  selectedOptionId,
  isAnswered,
  isSubmitting,
  answerResult,
  onAnswerSelect,
}) => {
  return (
    <div>
      <h2 className="text-xl font-bold text-foreground mb-6">
        {question.question}
      </h2>

      <div className="space-y-3 mb-6">
        {question.options.map((option, idx) => {
          const isSelected = selectedOptionId === option.id;
          const isCorrect = isAnswered && answerResult.correctOptionId === option.id;
          const isWrong = isAnswered && isSelected && !answerResult.isCorrect;

          return (
            <OptionButton
              key={option.id}
              index={idx}
              option={option}
              isSelected={isSelected}
              isAnswered={isAnswered}
              isCorrect={isCorrect}
              isWrong={isWrong}
              onSelect={() => onAnswerSelect(option.id)}
              disabled={isAnswered || isSubmitting}
            />
          );
        })}
      </div>

      {isAnswered && (
        <Explanation
          isCorrect={answerResult.isCorrect}
          explanation={answerResult.explanation}
        />
      )}
    </div>
  );
};

export default QuestionCard;
