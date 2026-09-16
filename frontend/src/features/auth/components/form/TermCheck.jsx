function TermCheck({ register, errors }) {
  return (
    <div className="flex flex-col">
      <div className="flex items-start gap-2">
        <input
          type="checkbox"
          name="rememberMe"
          id="terms"
          {...register("term")}
          className="mt-0.5 w-4 h-4 rounded border-border bg-surface accent-primary focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring/50 cursor-pointer"
        />
        <label htmlFor="terms" className="text-sm text-foreground-muted">
          I agree to the{" "}
          <a href="#" className="text-primary hover:underline font-medium">
            Terms
          </a>{" "}
          and{" "}
          <a href="#" className="text-primary hover:underline font-medium">
            Privacy Policy
          </a>
        </label>
      </div>
      {errors?.term && (
        <p className="text-destructive text-sm mt-1">{errors.term.message}</p>
      )}
    </div>
  );
}

export default TermCheck;
