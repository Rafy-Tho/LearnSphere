import { useQuery } from "@tanstack/react-query";
import { useParams } from "react-router-dom";
import { lessonsApi } from "@/features/learning/services/lessons";
import { queryKeys } from "@/lib/queryKeys";

export function useLessonContent() {
  const { lessonId } = useParams();
  return useQuery({
    queryKey: queryKeys.lessonContent(lessonId),
    queryFn: ({ signal }) => lessonsApi.getContent(lessonId, { signal }),
    enabled: !!lessonId,
    staleTime: 1000 * 60 * 10,
  });
}

export function useQuizzes() {
  const { lessonId } = useParams();
  return useQuery({
    queryKey: queryKeys.quizzes(lessonId),
    queryFn: ({ signal }) => lessonsApi.getQuizzes(lessonId, { signal }),
    enabled: !!lessonId,
    staleTime: 1000 * 60 * 10,
  });
}

export function useCompletedLesson() {
  const { lessonId } = useParams();
  return useQuery({
    queryKey: queryKeys.completedLesson(lessonId),
    queryFn: ({ signal }) => lessonsApi.getCompletedLesson(lessonId, { signal }),
    enabled: !!lessonId,
  });
}
