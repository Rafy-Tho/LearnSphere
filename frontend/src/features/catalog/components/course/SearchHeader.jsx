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
      className="bg-background border-b border-border px-4 md:px-8 py-6 flex flex-col md:flex-row justify-between gap-3
   "
    >
      <div className="flex items-center gap-3 border border-border rounded-full px-5 py-4 flex-1">
        <Search className="w-5 h-5 text-foreground-muted shrink-0" />
        <input
          type="search"
          placeholder="Search"
          value={searchQuery}
          onChange={(e) => handleSearchChange(e.target.value)}
          className="w-full bg-transparent text-foreground placeholder:text-foreground-muted text-sm focus:outline-none flex-1"
        />

        <button
          onClick={() => setShowMobileFilter(!showMobileFilter)}
          aria-label="Toggle filters"
          className="text-foreground-muted shrink-0 md:hidden cursor-pointer"
        >
          <Filter className="w-4 h-4" />
        </button>
      </div>

      <button
        type="submit"
        className="text-sm text-white shrink-0 bg-primary hover:bg-primary-hover rounded-full px-6 py-2 font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 focus-visible:ring-offset-background active:scale-95 cursor-pointer"
      >
        Apply
      </button>
    </form>
  );
}
