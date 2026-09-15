import { useContext } from "react";
import { AuthActionsContext } from "@/app/providers/context";

const useAuthActions = () => {
  const context = useContext(AuthActionsContext);

  if (!context) {
    throw new Error("useAuthActions must be used inside AuthProvider");
  }

  return context;
};

export default useAuthActions;
