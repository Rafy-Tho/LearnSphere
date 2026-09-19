import { useMutation, useQueryClient } from '@tanstack/react-query';
import { coursesApi } from '@/features/courses/services/courses';
import { queryKeys } from '@/lib/queryKeys';

export function useCourseReviewActions() {
  const queryClient = useQueryClient();

  const invalidate = () => {
    queryClient.invalidateQueries({ queryKey: queryKeys.courses(null) });
    queryClient.invalidateQueries({
      queryKey: queryKeys.instructorDashboard(),
    });
  };

  const { mutateAsync: approveCourse, isPending: isApproving } = useMutation({
    mutationFn: (id) => coursesApi.approveCourse(id),
    onSuccess: invalidate,
  });

  const { mutateAsync: rejectCourse, isPending: isRejecting } = useMutation({
    mutationFn: ({ id, reason }) => coursesApi.rejectCourse(id, reason),
    onSuccess: invalidate,
  });

  return { approveCourse, rejectCourse, isApproving, isRejecting };
}
