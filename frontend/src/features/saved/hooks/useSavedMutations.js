import { useMutation, useQueryClient } from "@tanstack/react-query";
import { toast } from "react-toastify";
import { savedApi } from "@/features/saved/services/saved";
import { queryKeys } from "@/lib/queryKeys";

export function useToggleSaveCourse() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationKey: ["toggle-save-course"],
    mutationFn: ({ courseId, isSaved }) =>
      isSaved
        ? savedApi.unsaveCourse(courseId)
        : savedApi.saveCourse(courseId),
    onMutate: async ({ courseId, isSaved }) => {
      await queryClient.cancelQueries({
        queryKey: queryKeys.savedCourseIds(),
      });
      const previous = queryClient.getQueryData(queryKeys.savedCourseIds());
      queryClient.setQueryData(queryKeys.savedCourseIds(), (old) => {
        const ids = Array.isArray(old) ? old : [];
        return isSaved
          ? ids.filter((id) => id !== courseId)
          : [courseId, ...ids];
      });
      return { previous };
    },
    onSuccess: (_data, { isSaved }) => {
      toast.success(
        isSaved ? "Removed from saved courses" : "Course saved successfully",
      );
    },
    onError: (error, _variables, context) => {
      if (context?.previous !== undefined) {
        queryClient.setQueryData(
          queryKeys.savedCourseIds(),
          context.previous,
        );
      }
      toast.error(error.message || "Failed to update saved courses");
    },
    onSettled: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.savedCourseIds() });
      queryClient.invalidateQueries({ queryKey: queryKeys.savedCoursesRoot() });
    },
  });
}
