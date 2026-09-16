// components/StartScreen.jsx
const StartScreen = ({ onStart, totalQuestions }) => {
  return (
    <div className="min-h-screen bg-background flex items-center justify-center px-4">
      <div className="max-w-2xl w-full text-center">
        <h1 className="text-4xl md:text-6xl font-bold text-foreground mb-6">
          Quiz Challenge
        </h1>
        <p className="text-lg md:text-xl text-foreground-muted mb-12">
          Test your knowledge with {totalQuestions} questions across various
          topics
        </p>
        <button
          onClick={onStart}
          className="bg-success hover:bg-success/90 text-white font-bold py-4 px-12 rounded-lg text-xl transition-colors cursor-pointer"
        >
          Start Quiz
        </button>
      </div>
    </div>
  );
};

export default StartScreen;
