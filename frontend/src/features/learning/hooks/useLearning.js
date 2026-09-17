import { useQuery } from "@tanstack/react-query";
import { useParams } from "react-router-dom";
import { learningApi } from "@/features/learning/services/learning";
import { queryKeys } from "@/lib/queryKeys";
import useAuth from "@/features/auth/hooks/useAuth";

export function useCourseLearningData() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: queryKeys.courseLearningData(courseId),
    queryFn: ({ signal }) => learningApi.getLearningData(courseId, { signal }),
    enabled: !!courseId,
    staleTime: 1000 * 60 * 10,
  });
}

export function useFirstLesson() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: queryKeys.firstLesson(courseId),
    queryFn: ({ signal }) => learningApi.getFirstLesson(courseId, { signal }),
    enabled: !!courseId,
    staleTime: 1000 * 60 * 10,
  });
}

export function useEnrollment() {
  const { courseId } = useParams();
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.enrollment(courseId),
    queryFn: ({ signal }) => learningApi.getEnrollment(courseId, { signal }),
    enabled: !!courseId && !!user,
  });
}

export function useCourseProgress() {
  const { courseId } = useParams();
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.courseProgress(courseId),
    queryFn: ({ signal }) => learningApi.getCourseProgress(courseId, { signal }),
    enabled: !!courseId && !!user,
  });
}

export function useCertificate() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: queryKeys.certificate(courseId),
    queryFn: ({ signal }) => learningApi.getCertificate(courseId, { signal }),
    enabled: !!courseId,
  });
}

export function useCertificateEligibility() {
  const { courseId } = useParams();
  return useQuery({
    queryKey: queryKeys.certificateEligibility(courseId),
    queryFn: ({ signal }) =>
      learningApi.checkCertificateEligibility(courseId, { signal }),
    enabled: !!courseId,
  });
}

export function useCourseLessonCompletions() {
  const { courseId } = useParams();
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.courseLessonCompletions(courseId),
    queryFn: ({ signal }) =>
      learningApi.getCourseLessonCompletions(courseId, { signal }),
    enabled: !!courseId && !!user,
  });
}

export function useMyCertificates() {
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.myCertificates(),
    queryFn: ({ signal }) => learningApi.getMyCertificates(undefined, { signal }),
    enabled: !!user,
    select: (response) => response?.data ?? [],
  });
}

export function useMyCertificatesPage(params = {}) {
  const { user } = useAuth();
  return useQuery({
    queryKey: queryKeys.myCertificatesPage(params),
    queryFn: ({ signal }) => learningApi.getMyCertificates(params, { signal }),
    enabled: !!user,
  });
}

export function useCertificateById(id) {
  return useQuery({
    queryKey: queryKeys.certificateById(id),
    queryFn: ({ signal }) => learningApi.getCertificateById(id, { signal }),
    enabled: !!id,
    staleTime: 1000 * 60 * 10,
  });
}
