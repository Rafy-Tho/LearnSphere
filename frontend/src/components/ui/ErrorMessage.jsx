import { useState } from "react";
import Alert from "@/components/ui/Alert";

const ErrorMessage = ({
  message = "Something went wrong. Please try again.",
  title = "Something went wrong",
  className = "",
}) => {
  const [isClosed, setIsClosed] = useState(false);
  if (isClosed) return null;

  return (
    <Alert
      variant="error"
      title={title}
      onClose={() => setIsClosed(true)}
      className={className}
    >
      {message}
    </Alert>
  );
};

export default ErrorMessage;
