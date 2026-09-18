import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { coursesApi } from '@/features/courses/services/courses';

export function useCreateModule() {
  const queryClient = useQueryClient();
  const param = useParams();
  const courseId = param.courseId;
  const { mutateAsync: createModule, isPending: isCreating } = useMutation({
    mutationFn: (data) => coursesApi.createModule(courseId, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['course-details', courseId] });
    },
  });
  return {
    createModule,
    isCreating,
  };
}
