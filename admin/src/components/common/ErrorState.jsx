import { ErrorAlert } from "@/components/ui/alert";
import { Button } from "@/components/ui/button";

export function ErrorState({ message, onRetry }) {
  return (
    <div className="space-y-3">
      <ErrorAlert message={message} />
      {onRetry ? (
        <Button variant="outline" size="sm" onClick={onRetry}>
          Try again
        </Button>
      ) : null}
    </div>
  );
}
