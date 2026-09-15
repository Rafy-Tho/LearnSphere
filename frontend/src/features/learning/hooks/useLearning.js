import { useQuery } from "@tanstack/react-query";
import { useParams } from "react-router-dom";
import { learningApi } from "@/features/learning/services/learning";
import useAuth from "@/features/auth/hooks/useAuth";

export function useCourseLearningData() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: ["course-learning-data", courseId],
    queryFn: () => learningApi.getLearningData(courseId),
    enabled: !!courseId,
    staleTime: 1000 * 60 * 10,
  });
}

export function useFirstLesson() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: ["first-lesson", courseId],
    queryFn: () => learningApi.getFirstLesson(courseId),
    enabled: !!courseId,
    staleTime: 1000 * 60 * 10,
  });
}

export function useEnrollment() {
  const { courseId } = useParams();
  const { user } = useAuth();
  return useQuery({
    queryKey: ["enrolled", courseId],
    queryFn: () => learningApi.getEnrollment(courseId),
    enabled: !!courseId && !!user,
  });
}

export function useCourseProgress() {
  const { courseId } = useParams();
  const { user } = useAuth();
  return useQuery({
    queryKey: ["course-progress", courseId],
    queryFn: () => learningApi.getCourseProgress(courseId),
    enabled: !!courseId && !!user,
  });
}

export function useCertificate() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: ["certificate", courseId],
    queryFn: () => learningApi.getCertificate(courseId),
    enabled: !!courseId,
  });
}

export function useCertificateEligibility() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: ["certificate-eligibility", courseId],
    queryFn: () => learningApi.checkCertificateEligibility(courseId),
    enabled: !!courseId,
  });
}

export function useCourseLessonCompletions() {
  const { courseId } = useParams();
  const { user } = useAuth();
  return useQuery({
    queryKey: ["course-lesson-completions", courseId],
    queryFn: () => learningApi.getCourseLessonCompletions(courseId),
    enabled: !!courseId && !!user,
  });
}

export function useMyCertificates() {
  const { user } = useAuth();
  return useQuery({
    queryKey: ["my-certificates"],
    queryFn: () => learningApi.getMyCertificates(),
    enabled: !!user,
    select: (response) =>
      Array.isArray(response) ? response : response?.data ?? [],
  });
}

export function useCertificateById(id) {
  return useQuery({
    queryKey: ["certificate-by-id", id],
    queryFn: () => learningApi.getCertificateById(id),
    enabled: !!id,
    staleTime: 1000 * 60 * 10,
  });
}
