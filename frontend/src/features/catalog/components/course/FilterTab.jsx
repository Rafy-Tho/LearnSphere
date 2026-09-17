import { useSearchParams } from "react-router-dom";
import { useCategories as useGetCategories } from "@/features/catalog/hooks/useCategories";
import SpinnerLoader from "@/components/ui/SpinnerLoader";
import ErrorMessage from "@/components/ui/ErrorMessage";

const all = { id: "all", name: "All" };
export function FilterTab() {
  const [searchParams, setSearchParams] = useSearchParams();
  const { data, isPending, error } = useGetCategories();
  const tabs = [all, ...(data || [])];
  const activeCategories = searchParams.getAll("category");
  const handleClick = (tab) => {
    const params = new URLSearchParams(searchParams.toString());
    params.delete("category");
    if (tab.id !== "all") params.set("category", tab.id);
    params.delete("page");
    params.delete("limit");
    setSearchParams(params);
  };
  if (isPending) return <SpinnerLoader />;
  if (error) return <ErrorMessage message={error.message} />;
  return (
    <div className="bg-background border-b border-border px-4 md:px-8">
      <div className="flex gap-1 overflow-x-auto">
        {tabs.map((tab) => (
          <button
            key={tab.id}
            onClick={() => handleClick(tab)}
            className={`px-4 py-3 text-sm font-medium whitespace-nowrap transition-colors border-b-2 cursor-pointer ${
              (tab.id === "all"
                ? activeCategories.length === 0
                : activeCategories.includes(tab.id))
                ? "border-primary text-primary"
                : "border-transparent text-foreground-muted hover:text-foreground"
            }`}
          >
            {tab.name}
          </button>
        ))}
      </div>
    </div>
  );
}
