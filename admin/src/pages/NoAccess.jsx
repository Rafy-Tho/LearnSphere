import { Link } from "react-router-dom";
import { ShieldAlert } from "lucide-react";
import { Button } from "@/components/ui/button";

export default function NoAccess() {
  return (
    <div className="flex min-h-screen flex-col items-center justify-center gap-4 p-6 text-center">
      <div className="flex h-14 w-14 items-center justify-center rounded-full bg-destructive/10">
        <ShieldAlert className="h-7 w-7 text-destructive" />
      </div>
      <div>
        <h1 className="text-xl font-bold text-foreground">Access denied</h1>
        <p className="mt-1 text-sm text-muted-foreground">
          Your account does not have access to the admin console.
        </p>
      </div>
      <Button asChild variant="outline">
        <Link to="/login">Back to sign in</Link>
      </Button>
    </div>
  );
}
