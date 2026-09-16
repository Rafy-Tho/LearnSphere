import { useQuery } from "@tanstack/react-query";
import { useParams } from "react-router-dom";
import { quizAttemptsApi } from "@/features/learning/services/quizAttempts";
import { queryKeys } from "@/lib/queryKeys";

export function useQuizAttempts() {
  const { lessonId } = useParams();
  return useQuery({
    queryKey: queryKeys.quizAttempts(lessonId),
    queryFn: ({ signal }) => quizAttemptsApi.list(lessonId, { signal }),
    enabled: !!lessonId,
  });
}

export function useLatestQuizAttempt() {
  const { lessonId } = useParams();
  return useQuery({
    queryKey: queryKeys.quizAttemptLatest(lessonId),
    queryFn: ({ signal }) => quizAttemptsApi.latest(lessonId, { signal }),
    enabled: !!lessonId,
  });
}
