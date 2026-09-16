import { useMutation, useQueryClient } from "@tanstack/react-query";
import { useParams } from "react-router-dom";
import { learningApi } from "@/features/learning/services/learning";
import { lessonsApi } from "@/features/learning/services/lessons";
import { quizAttemptsApi } from "@/features/learning/services/quizAttempts";
import { queryKeys } from "@/lib/queryKeys";
import { toast } from "react-toastify";

export function useEnrollCourse() {
  const { courseId } = useParams();
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["enroll-course", courseId],
    mutationFn: () => learningApi.enrollCourse(courseId),
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: queryKeys.enrollment(courseId),
      });
      queryClient.invalidateQueries({ queryKey: queryKeys.inProgress() });
      queryClient.invalidateQueries({ queryKey: queryKeys.recommended() });
    },
    onError: (error) => {
      toast.error(error.message || "Enrollment failed");
    },
  });
}

export function useCreateCourseProgress() {
  const { courseId } = useParams();
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["create-course-progress", courseId],
    mutationFn: () => learningApi.createCourseProgress(courseId),
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: queryKeys.courseProgress(courseId),
      });
    },
    onError: (error) => {
      toast.error(error.message || "Failed to create course progress");
    },
  });
}

export function useUpdateCourseProgress() {
  const { courseId } = useParams();
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["update-course-progress", courseId],
    mutationFn: (payload) => learningApi.updateCourseProgress(courseId, payload),
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: queryKeys.courseProgress(courseId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.courseLessonCompletions(courseId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.certificateEligibility(courseId),
      });
    },
    onError: (error) => {
      toast.error(error.message || "Failed to update course progress");
    },
  });
}

export function useClaimCertificate() {
  const { courseId } = useParams();
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["claim-certificate", courseId],
    mutationFn: () => learningApi.claimCertificate(courseId),
    onSuccess: () => {
      toast.success("Certificate claimed successfully!");
      queryClient.invalidateQueries({
        queryKey: queryKeys.certificate(courseId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.certificateEligibility(courseId),
      });
      queryClient.invalidateQueries({ queryKey: queryKeys.myCertificates() });
    },
    onError: (error) => {
      toast.error(error.message || "Failed to claim certificate");
    },
  });
}

export function useCreateCompletedLesson() {
  const { courseId, lessonId } = useParams();
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["create-completed-lesson", lessonId],
    mutationFn: () => lessonsApi.completeLesson(lessonId),
    onError: (error) => {
      toast.error(error.message || "Failed to complete lesson");
    },
    onSuccess: () => {
      toast.success("Lesson completed successfully");
      queryClient.invalidateQueries({
        queryKey: queryKeys.completedLesson(lessonId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.courseLessonCompletionsRoot(),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.courseProgress(courseId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.certificateEligibility(courseId),
      });
      queryClient.invalidateQueries({ queryKey: queryKeys.inProgress() });
    },
  });
}

export function useSubmitQuizAttempt() {
  const { courseId, lessonId } = useParams();
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["submit-quiz-attempt", lessonId],
    mutationFn: (answers) => quizAttemptsApi.submit(lessonId, answers),
    onError: (error) => {
      toast.error(error.message || "Failed to submit quiz");
    },
    onSuccess: () => {
      queryClient.invalidateQueries({
        queryKey: queryKeys.quizAttempts(lessonId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.quizAttemptLatest(lessonId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.completedLesson(lessonId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.courseLessonCompletionsRoot(),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.courseProgress(courseId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.certificateEligibility(courseId),
      });
      queryClient.invalidateQueries({
        queryKey: queryKeys.inProgress(),
      });
    },
  });
}
