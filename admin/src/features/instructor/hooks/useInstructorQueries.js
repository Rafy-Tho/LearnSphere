import { useQuery } from "@tanstack/react-query";
import { useAuth } from "@/app/providers/context";
import { instructorApi } from "@/features/instructor/services/instructor";
import { queryKeys } from "@/lib/queryKeys";

export function useInstructorDashboard() {
  const { user } = useAuth();
  const { data, isPending, error } = useQuery({
    queryKey: queryKeys.instructorDashboard(),
    queryFn: () => instructorApi.getDashboard(),
    enabled: !!user,
  });
  return { data, isPending, error };
}

export function useInstructorStudents(courseId, params, { enabled = true } = {}) {
  const { data, isPending, error } = useQuery({
    queryKey: queryKeys.instructorStudents(courseId, params),
    queryFn: () => instructorApi.getStudents(courseId, params),
    enabled: enabled && !!courseId,
  });
  return { data, isPending, error };
}

export function useInstructorAnalytics(courseId, { enabled = true } = {}) {
  const { data, isPending, error } = useQuery({
    queryKey: queryKeys.instructorAnalytics(courseId),
    queryFn: () => instructorApi.getAnalytics(courseId),
    enabled: enabled && !!courseId,
  });
  return { data, isPending, error };
}

export function useInstructorReviews(courseId, params, { enabled = true } = {}) {
  const { data, isPending, error } = useQuery({
    queryKey: queryKeys.instructorReviews(courseId, params),
    queryFn: () => instructorApi.getReviews(courseId, params),
    enabled: enabled && !!courseId,
  });
  return { data, isPending, error };
}

export function useInstructorCertificates(
  courseId,
  params,
  { enabled = true } = {},
) {
  const { data, isPending, error } = useQuery({
    queryKey: queryKeys.instructorCertificates(courseId, params),
    queryFn: () => instructorApi.getCertificates(courseId, params),
    enabled: enabled && !!courseId,
  });
  return { data, isPending, error };
}

export function useInstructorEarnings({ enabled = true } = {}) {
  const { user } = useAuth();
  const { data, isPending, error } = useQuery({
    queryKey: queryKeys.instructorEarnings(),
    queryFn: () => instructorApi.getEarnings(),
    enabled: enabled && !!user,
  });
  return { data, isPending, error };
}

export function useInstructorPayouts(params) {
  const { data, isPending, error } = useQuery({
    queryKey: queryKeys.instructorPayouts(params),
    queryFn: () => instructorApi.getPayouts(params),
  });
  return { data, isPending, error };
}
