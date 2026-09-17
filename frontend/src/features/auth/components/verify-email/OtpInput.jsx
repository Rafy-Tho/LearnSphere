import { useRef } from "react";

const LENGTH = 6;

function OtpInput({ value = "", onChange, disabled = false, hasError = false }) {
  const inputsRef = useRef([]);

  const digits = Array.from({ length: LENGTH }, (_, i) => value[i] ?? "");

  const focusInput = (index) => {
    const input = inputsRef.current[index];
    if (input) input.focus();
  };

  const commit = (nextDigits) => {
    onChange(nextDigits.join(""));
  };

  const handleChange = (index, event) => {
    const raw = event.target.value.replace(/\D/g, "");
    if (!raw) return;

    const nextDigits = [...digits];
    nextDigits[index] = raw[raw.length - 1];
    commit(nextDigits);

    if (index < LENGTH - 1) focusInput(index + 1);
  };

  const handleKeyDown = (index, event) => {
    if (event.key === "Backspace") {
      event.preventDefault();
      const nextDigits = [...digits];

      if (nextDigits[index]) {
        nextDigits[index] = "";
        commit(nextDigits);
      } else if (index > 0) {
        nextDigits[index - 1] = "";
        commit(nextDigits);
        focusInput(index - 1);
      }
      return;
    }

    if (event.key === "ArrowLeft" && index > 0) {
      event.preventDefault();
      focusInput(index - 1);
    }

    if (event.key === "ArrowRight" && index < LENGTH - 1) {
      event.preventDefault();
      focusInput(index + 1);
    }
  };

  const handlePaste = (event) => {
    event.preventDefault();
    const pasted = event.clipboardData
      .getData("text")
      .replace(/\D/g, "")
      .slice(0, LENGTH);
    if (!pasted) return;

    const nextDigits = Array.from({ length: LENGTH }, (_, i) => pasted[i] ?? "");
    commit(nextDigits);
    focusInput(Math.min(pasted.length, LENGTH - 1));
  };

  return (
    <div
      className="flex items-center justify-center gap-1.5 sm:gap-2"
      onPaste={handlePaste}
    >
      {digits.map((digit, index) => (
        <input
          key={index}
          ref={(el) => {
            inputsRef.current[index] = el;
          }}
          type="text"
          inputMode="numeric"
          autoComplete="one-time-code"
          maxLength={1}
          value={digit}
          disabled={disabled}
          aria-label={`Verification code digit ${index + 1}`}
          onChange={(event) => handleChange(index, event)}
          onKeyDown={(event) => handleKeyDown(index, event)}
          onFocus={(event) => event.target.select()}
          className={`h-12 w-9 text-center text-lg font-semibold bg-surface-muted border sm:h-14 sm:w-12 sm:text-xl ${
            hasError ? "border-destructive" : "border-border"
          } rounded-lg text-foreground focus:outline-none focus:ring-2 focus:ring-ring/50 transition-colors disabled:opacity-60`}
        />
      ))}
    </div>
  );
}

export default OtpInput;
