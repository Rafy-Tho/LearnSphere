import { useState } from "react";
import { AlertTriangle, RotateCcw } from "lucide-react";
import Alert from "@/components/ui/Alert";
import Button from "@/components/ui/Button";
import cn from "@/utils/cn";

const ErrorMessage = ({
  message = "Something went wrong. Please try again.",
  title = "Something went wrong",
  onRetry,
  action,
  fullScreen = false,
  className = "",
}) => {
  const [isClosed, setIsClosed] = useState(false);
  if (isClosed) return null;

  const retryAction = onRetry ? (
    <Button
      variant="outline"
      size="sm"
      leftIcon={<RotateCcw size={14} />}
      onClick={onRetry}
    >
      Try again
    </Button>
  ) : null;

  const actions = action ?? retryAction;

  if (fullScreen) {
    return (
      <div
        className={cn(
          "flex min-h-screen w-full items-center justify-center bg-background p-6",
          className,
        )}
      >
        <div className="w-full max-w-md rounded-2xl border border-border bg-surface p-8 text-center shadow-sm">
          <div className="mx-auto flex h-14 w-14 items-center justify-center rounded-full bg-destructive/10 text-destructive">
            <AlertTriangle size={26} aria-hidden="true" />
          </div>
          <h2 className="mt-5 text-lg font-semibold text-foreground">{title}</h2>
          <p className="mt-2 text-sm text-foreground-muted">{message}</p>
          {actions && (
            <div className="mt-6 flex justify-center">{actions}</div>
          )}
        </div>
      </div>
    );
  }

  return (
    <Alert
      variant="error"
      title={title}
      onClose={() => setIsClosed(true)}
      className={className}
    >
      <p>{message}</p>
      {actions && <div className="mt-3">{actions}</div>}
    </Alert>
  );
};

export default ErrorMessage;
