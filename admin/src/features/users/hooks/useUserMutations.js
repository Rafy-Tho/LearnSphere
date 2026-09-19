import { useMutation, useQueryClient } from '@tanstack/react-query';
import { usersApi } from '@/features/users/services/users';
import { queryKeys } from '@/lib/queryKeys';

export function useCreateUser() {
  const queryClient = useQueryClient();
  const {
    mutateAsync: createUser,
    isPending,
    error,
  } = useMutation({
    mutationKey: ['create-user'],
    mutationFn: (data) => usersApi.createUser(data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.users() });
    },
  });
  return { createUser, isPending, error };
}

export function useUpdateUser() {
  const queryClient = useQueryClient();
  const {
    mutateAsync: updateUser,
    isPending,
    error,
  } = useMutation({
    mutationKey: ['update-user'],
    mutationFn: ({ id, data }) => usersApi.updateUser(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.users() });
    },
  });
  return { updateUser, isPending, error };
}

export function useDeleteUser() {
  const queryClient = useQueryClient();
  const {
    mutateAsync: deleteUser,
    isPending,
    error,
  } = useMutation({
    mutationKey: ['delete-user'],
    mutationFn: (id) => usersApi.deleteUser(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: queryKeys.users() });
    },
  });
  return { deleteUser, isPending, error };
}

export function useUpdatePassword() {
  const {
    mutateAsync: updatePassword,
    isPending,
    error,
  } = useMutation({
    mutationKey: ['update-password'],
    mutationFn: async (data) => usersApi.updatePassword(data),
  });
  return { updatePassword, isPending, error };
}

export function useUpdateUserProfile() {
  const {
    mutateAsync: updateProfile,
    isPending,
    error,
  } = useMutation({
    mutationKey: ['update-profile'],
    mutationFn: (data) => usersApi.updateProfile(data),
  });
  return { updateProfile, isPending, error };
}
