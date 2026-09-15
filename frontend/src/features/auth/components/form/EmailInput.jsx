import { Mail } from "lucide-react";
import Input from "@/components/ui/Input";

function EmailInput({ register, errors }) {
  return (
    <Input
      label="Email Address"
      type="email"
      placeholder="you@example.com"
      autoComplete="email"
      icon={<Mail size={16} />}
      error={errors?.email?.message}
      required
      {...register("email")}
    />
  );
}

export default EmailInput;
