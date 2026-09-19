import { useMutation, useQueryClient } from "@tanstack/react-query";
import { instructorApi } from "@/features/instructor/services/instructor";
import { queryKeys } from "@/lib/queryKeys";

export function useSubmitCourse() {
  const queryClient = useQueryClient();

  const mutation = useMutation({
    mutationFn: (courseId) => instructorApi.submitCourse(courseId),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.courses(null) });
      queryClient.invalidateQueries({
        queryKey: queryKeys.instructorDashboard(),
      });
    },
  });

  return {
    submitCourse: mutation.mutateAsync,
    isSubmitting: mutation.isPending,
  };
}
