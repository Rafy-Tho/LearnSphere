import { useMutation, useQueryClient } from '@tanstack/react-query';
import { useParams } from 'react-router-dom';
import { chaptersApi } from '@/features/courses/services/chapters';

export function useDeleteChapter() {
  const queryClient = useQueryClient();
  const param = useParams();
  const courseId = param.courseId;
  const { mutateAsync: deleteChapter, isPending: isDeleting } = useMutation({
    mutationFn: (id) => chaptersApi.delete(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['course-details', courseId] });
    },
  });
  return {
    deleteChapter,
    isDeleting,
  };
}
