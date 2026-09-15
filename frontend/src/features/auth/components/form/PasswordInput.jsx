import Input from "@/components/ui/Input";

function PasswordInput({ register, errors }) {
  return (
    <Input
      label="Password"
      type="password"
      placeholder="••••••••"
      autoComplete="current-password"
      error={errors?.password?.message}
      required
      {...register("password")}
    />
  );
}

export default PasswordInput;
