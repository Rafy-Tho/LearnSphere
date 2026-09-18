import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { chaptersApi } from '@/features/courses/services/chapters';

export const useUpdateChapter = () => {
  const queryClient = useQueryClient();
  const param = useParams();
  const courseId = param.courseId;
  const { mutateAsync: updateChapter, isPending: isUpdating } = useMutation({
    mutationKey: ['update-chapter'],
    mutationFn: ({ id, data }) => chaptersApi.update(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['course-details', courseId] });
    },
  });
  return { updateChapter, isUpdating };
};
