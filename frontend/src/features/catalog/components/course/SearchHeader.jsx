import { Filter, Search } from "lucide-react";
import { useState } from "react";
import { useSearchParams } from "react-router-dom";

export function SearchHeader({ setShowMobileFilter, showMobileFilter }) {
  const [searchParams, setSearchParams] = useSearchParams();
  const [searchQuery, setSearchQuery] = useState(
    () => searchParams.get("search") || "",
  );

  const handleSearch = (e) => {
    e.preventDefault();
    if (searchQuery.trim() === "") return;
    const params = new URLSearchParams(searchParams);
    params.delete("page");
    params.delete("limit");
    params.set("search", searchQuery);
    setSearchParams(params);
  };
  const handleSearchChange = (value) => {
    setSearchQuery(value);
    if (value.trim() !== "") return;
    const params = new URLSearchParams(searchParams);
    params.delete("search");
    params.delete("page");
    params.delete("limit");
    setSearchParams(params);
  };
  return (
    <form
      onSubmit={handleSearch}
      className="flex flex-col justify-between gap-3 border-b border-border bg-background px-4 py-4 md:flex-row md:px-8 md:py-6"
    >
      <div className="flex min-w-0 flex-1 items-center gap-3 rounded-full border border-border px-4 py-3 md:px-5 md:py-4">
        <Search className="h-5 w-5 shrink-0 text-foreground-muted" />
        <input
          type="search"
          placeholder="Search"
          value={searchQuery}
          onChange={(e) => handleSearchChange(e.target.value)}
          className="min-w-0 flex-1 bg-transparent text-base text-foreground placeholder:text-foreground-muted focus:outline-none sm:text-sm"
        />

        <button
          onClick={() => setShowMobileFilter(!showMobileFilter)}
          aria-label="Toggle filters"
          className="shrink-0 cursor-pointer text-foreground-muted md:hidden"
        >
          <Filter className="h-4 w-4" />
        </button>
      </div>

      <button
        type="submit"
        className="w-full shrink-0 cursor-pointer rounded-full bg-primary px-6 py-2.5 text-sm font-medium text-white transition-colors hover:bg-primary-hover focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 focus-visible:ring-offset-background active:scale-95 md:w-auto"
      >
        Apply
      </button>
    </form>
  );
}
