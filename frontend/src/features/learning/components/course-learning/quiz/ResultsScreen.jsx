// components/ResultsScreen.jsx
const ResultsScreen = ({ score, onRestart }) => {
  const percentage = Math.round((score.correct / score.total) * 100);

  const getMessage = () => {
    if (percentage === 100)
      return "Perfect Score! 🎉 You're a JavaScript Master!";
    if (percentage >= 80) return "Excellent! 🌟 You really know your stuff!";
    if (percentage >= 60) return "Good job! 💪 Keep practicing!";
    if (percentage >= 40) return "Not bad! 📚 Review the topics you missed.";
    return "Keep learning! 🚀 Every mistake is an opportunity to grow.";
  };

  return (
    <div className="min-h-screen bg-background flex items-center justify-center p-4">
      <div className="max-w-md w-full bg-surface rounded-2xl shadow-xl p-8 text-center">
        <div className="text-6xl mb-4">🏆</div>
        <h2 className="text-2xl font-bold mb-2 text-foreground">
          Quiz Complete!
        </h2>
        <p className="text-foreground-muted mb-6">
          {getMessage()}
        </p>

        <div className="mb-6">
          <p className="text-5xl font-bold text-success mb-2">
            {score.correct}/{score.total}
          </p>
          <div className="h-3 bg-surface-muted rounded-full overflow-hidden">
            <div
              className="h-full bg-success rounded-full transition-[width] duration-500"
              style={{ width: `${percentage}%` }}
            />
          </div>
          <p className="text-sm text-foreground-muted mt-2">
            {percentage}% correct
          </p>
        </div>

        <button
          onClick={onRestart}
          className="bg-primary text-white px-6 py-2 rounded-lg hover:bg-primary-hover transition-colors cursor-pointer"
        >
          Try Again
        </button>
      </div>
    </div>
  );
};

export default ResultsScreen;
