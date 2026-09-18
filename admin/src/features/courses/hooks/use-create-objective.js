import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { coursesApi } from '@/features/courses/services/courses';

export const useCreateObjective = () => {
  const queryClient = useQueryClient();
  const param = useParams();
  const courseId = param.courseId;
  const { mutateAsync: createObjective, isPending: isCreating } = useMutation({
    mutationKey: ['create-objective'],
    mutationFn: ({ objectiveData }) =>
      coursesApi.createObjective(courseId, objectiveData),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['course-details', courseId] });
    },
  });
  return { createObjective, isCreating };
};
