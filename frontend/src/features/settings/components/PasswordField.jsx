import Input from "@/components/ui/Input";

function PasswordField({
  label,
  value,
  onChange,
  placeholder = "",
  autoComplete = "current-password",
  error,
}) {
  return (
    <Input
      label={label}
      type="password"
      value={value}
      onChange={onChange ? (e) => onChange(e.target.value) : undefined}
      placeholder={placeholder}
      autoComplete={autoComplete}
      error={error}
    />
  );
}
export default PasswordField;
