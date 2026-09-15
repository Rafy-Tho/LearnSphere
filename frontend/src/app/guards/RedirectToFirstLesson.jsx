import { Navigate, useParams } from "react-router-dom";
import { useFirstLesson as useGetFirstLesson } from "@/features/learning/hooks/useLearning";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ErrorMessage from "@/components/ui/ErrorMessage";

function RedirectToFirstLesson() {
  const params = useParams();
  const { data, isPending, error } = useGetFirstLesson();
  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  return (
    <Navigate
      to={`/courses/${params.courseId}/lessons/${data?.id}`}
      replace
    />
  );
}

export default RedirectToFirstLesson;
