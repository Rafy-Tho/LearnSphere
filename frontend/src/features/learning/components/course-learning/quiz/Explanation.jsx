// components/Explanation.jsx
const Explanation = ({ isCorrect, explanation }) => {
  return (
    <div
      className={`p-4 rounded-xl mb-6 ${
        isCorrect
          ? "bg-success/10"
          : "bg-destructive/10"
      }`}
    >
      <p className="font-semibold mb-1 text-foreground">
        {isCorrect ? "✓ Correct!" : "✗ Incorrect"}
      </p>
      <p className="text-sm text-foreground-muted">
        {explanation}
      </p>
    </div>
  );
};

export default Explanation;
