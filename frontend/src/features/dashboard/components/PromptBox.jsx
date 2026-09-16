// src/components/PromptBox.tsx
import { Code, ChevronRight, Send } from "lucide-react";
import { useState } from "react";
import { useNavigate } from "react-router-dom";
const suggestions = [
  "JavaScript",
  "Java",
  "Web Development",
  "Mobile Development",
  "C++",
  "System Design",
];
export default function PromptBox() {
  const [search, setSearch] = useState("");
  const navigate = useNavigate();
  const handleSubmit = (e) => {
    e.preventDefault();
    if (!search) return;
    navigate(`/courses?search=${search}`);
  };
  return (
    <div className="mb-8 overflow-hidden rounded-xl border border-border bg-surface">
      <form
        onSubmit={handleSubmit}
        className="flex items-center gap-3 border-b border-border p-4 sm:p-5"
      >
        <Code className="size-6 shrink-0 text-primary" aria-hidden />
        <input
          type="search"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          placeholder="Search courses..."
          className="min-w-0 flex-1 bg-transparent text-foreground outline-none placeholder:text-foreground-muted"
        />
        <button
          type="submit"
          disabled={!search}
          className="flex size-10 shrink-0 items-center justify-center rounded-lg bg-primary text-white transition-colors hover:bg-primary-hover cursor-pointer disabled:cursor-not-allowed"
          aria-label="Send"
        >
          <Send className="size-5" />
        </button>
      </form>
      <div className="flex gap-2 overflow-x-auto p-4 sm:p-5">
        {suggestions.map((s) => (
          <button
            key={s}
            onClick={() => setSearch(s)}
            className="inline-flex shrink-0 cursor-pointer items-center gap-1 rounded-full border border-border px-3 py-1.5 text-sm text-foreground transition-colors hover:bg-surface-muted"
          >
            {s}
            <ChevronRight className="size-3.5 opacity-60" />
          </button>
        ))}
      </div>
    </div>
  );
}
