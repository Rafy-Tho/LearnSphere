import Input from "@/components/ui/Input";

function InputField({
  label,
  icon,
  value,
  onChange,
  type = "text",
  disabled = false,
  hidden = false,
  placeholder = "",
  error,
}) {
  return (
    <Input
      label={label}
      icon={icon}
      type={type}
      value={value}
      onChange={onChange ? (e) => onChange(e.target.value) : undefined}
      disabled={disabled}
      hidden={hidden}
      placeholder={placeholder}
      error={error}
    />
  );
}
export default InputField;
