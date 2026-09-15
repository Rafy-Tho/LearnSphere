import { toast } from "react-toastify";
import { useLogoutApi } from "@/features/auth/hooks/useAuthMutations";
import useAuth from "@/features/auth/hooks/useAuth";

export default function useLogout() {
  const { clearAuth } = useAuth();
  const mutation = useLogoutApi();

  const logout = async () => {
    try {
      await mutation.mutateAsync();
      toast.success("Logout success");
      clearAuth();
      window.location.href = "/login";
    } catch (err) {
      toast.error(err.message || "Logout failed");
    }
  };

  return { logout, isPending: mutation.isPending };
}
