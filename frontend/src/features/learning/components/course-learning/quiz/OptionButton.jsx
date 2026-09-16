// components/OptionButton.jsx
const OptionButton = ({
  index,
  option,
  isSelected,
  isAnswered,
  isCorrect,
  isWrong,
  onSelect,
  disabled,
}) => {
  let bgColor = "bg-surface border-border";

  if (isAnswered && isCorrect) {
    bgColor = "bg-success/10 border-success";
  } else if (isAnswered && isWrong) {
    bgColor = "bg-destructive/10 border-destructive";
  } else if (!isAnswered && isSelected) {
    bgColor = "bg-primary/10 border-primary";
  }

  return (
    <button
      onClick={onSelect}
      disabled={disabled}
      className={`w-full p-4 text-left border-2 rounded-xl transition-colors ${bgColor} ${
        !disabled &&
        "hover:border-primary hover:bg-primary/10"
      }`}
    >
      <div className="flex items-center justify-between">
        <span className="text-foreground">
          {String.fromCharCode(65 + index)}. {option.text}
        </span>
        {isAnswered && isCorrect && (
          <span className="text-success text-xl">✓</span>
        )}
        {isAnswered && isWrong && (
          <span className="text-destructive text-xl">✗</span>
        )}
      </div>
    </button>
  );
};

export default OptionButton;
