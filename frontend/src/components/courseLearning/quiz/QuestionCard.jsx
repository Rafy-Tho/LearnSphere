// components/QuestionCard.jsx
import OptionButton from "./OptionButton";
import Explanation from "./Explanation";

const QuestionCard = ({
  question,
  selectedOptionId,
  isAnswered,
  isSubmitting,
  result,
  onAnswerSelect,
}) => {
  return (
    <div>
      <h2 className="text-xl font-bold text-slate-900 dark:text-white mb-6">
        {question.question}
      </h2>

      <div className="space-y-3 mb-6">
        {question.options.map((option, idx) => {
          const isSelected = selectedOptionId === option.id;
          const isCorrect = isAnswered && result.correctOptionId === option.id;
          const isWrong = isAnswered && isSelected && !result.isCorrect;

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
          isCorrect={result.isCorrect}
          explanation={result.explanation}
        />
      )}
    </div>
  );
};

export default QuestionCard;
