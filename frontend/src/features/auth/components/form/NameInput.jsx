import { User } from "lucide-react";
import Input from "@/components/ui/Input";

function NameInput({ register, errors }) {
  return (
    <Input
      label="Full Name"
      type="text"
      placeholder="John Doe"
      autoComplete="name"
      icon={<User size={16} />}
      error={errors?.name?.message}
      required
      {...register("name")}
    />
  );
}

export default NameInput;
