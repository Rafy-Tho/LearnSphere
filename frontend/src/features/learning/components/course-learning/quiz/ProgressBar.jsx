// components/ProgressBar.jsx
import ProgressBarPrimitive from "@/components/ui/ProgressBar";

const ProgressBar = ({ currentIndex, totalQuestions, answersCount }) => {
  const progress = totalQuestions
    ? (answersCount / totalQuestions) * 100
    : 0;

  return (
    <ProgressBarPrimitive
      value={progress}
      color="success"
      leftLabel={`Question ${currentIndex + 1} of ${totalQuestions}`}
      rightLabel={`Answered: ${answersCount}`}
      className="mb-6"
    />
  );
};

export default ProgressBar;
