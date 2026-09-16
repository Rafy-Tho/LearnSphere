// components/NavigationButtons.jsx
const NavigationButtons = ({
  currentIndex,
  totalQuestions,
  isAnswered,
  onPrevious,
  onNext,
  onFinish,
}) => {
  return (
    <div className="flex gap-3">
      {!isAnswered && (
        <div className="text-sm text-foreground-muted p-2">
          Select an answer to continue
        </div>
      )}

      {isAnswered && (
        <>
          <button
            onClick={onPrevious}
            disabled={currentIndex === 0}
            className="px-6 py-2 border border-border rounded-lg text-foreground hover:bg-surface-muted disabled:opacity-50 disabled:cursor-not-allowed transition-colors cursor-pointer"
          >
            ← Previous
          </button>

          {currentIndex === totalQuestions - 1 ? (
            <button
              onClick={onFinish}
              className="flex-1 bg-success text-white py-2 rounded-lg hover:bg-success/90 transition-colors cursor-pointer"
            >
              Show Results
            </button>
          ) : (
            <button
              onClick={onNext}
              className="flex-1 bg-primary text-white py-2 rounded-lg hover:bg-primary-hover transition-colors cursor-pointer"
            >
              Next Question →
            </button>
          )}
        </>
      )}
    </div>
  );
};

export default NavigationButtons;
