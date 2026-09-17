import { Check, ChevronDown, Filter, Star, X } from "lucide-react";
import { useCallback, useState } from "react";
import { useSearchParams } from "react-router-dom";
import {
  durations,
  filters,
  levels,
  ratings,
} from "@/features/catalog/constants/courseFilterData";
import { COURSE_QUERY_PARAMS } from "@/features/catalog/constants/queryParams";
import { useCategories } from "@/features/catalog/hooks/useCategories";
import cn from "@/utils/cn";

const { LEVEL, ACCESS_TYPE, CATEGORY_ID, MIN_RATING, MIN_DURATION, MAX_DURATION } =
  COURSE_QUERY_PARAMS;

// ---------------- RANGE CONFIG ----------------
const rangeConfig = {
  [MIN_RATING]: (v) => ({ [MIN_RATING]: Number(v) }),
  [MIN_DURATION]: (v) => {
    const map = {
      60: { [MIN_DURATION]: 60, [MAX_DURATION]: 180 },
      180: { [MIN_DURATION]: 180, [MAX_DURATION]: 300 },
      300: { [MIN_DURATION]: 300, [MAX_DURATION]: 420 },
      420: { [MIN_DURATION]: 420, [MAX_DURATION]: 600 },
      600: { [MIN_DURATION]: 600 },
    };
    return map[Number(v)];
  },
};

// Every query key a filter may write, so switching/deselecting cleans up fully.
const filterParamKeys = {
  [ACCESS_TYPE]: [ACCESS_TYPE],
  [LEVEL]: [LEVEL],
  [MIN_RATING]: [MIN_RATING],
  [MIN_DURATION]: [MIN_DURATION, MAX_DURATION],
  [CATEGORY_ID]: [CATEGORY_ID],
};

const queryFields = [ACCESS_TYPE, LEVEL, MIN_RATING, MIN_DURATION, CATEGORY_ID];

function clearFilterParams(params, name) {
  (filterParamKeys[name] || [name]).forEach((key) => params.delete(key));
}

// Derive initial state directly from URL params — no useEffect needed
function getInitialSelected(searchParams) {
  return {
    [ACCESS_TYPE]: searchParams.get(ACCESS_TYPE) || "",
    [LEVEL]: searchParams.get(LEVEL) || "",
    [MIN_RATING]: searchParams.get(MIN_RATING) || "",
    [MIN_DURATION]: searchParams.get(MIN_DURATION) || "",
  };
}

// ---------------- COMPONENT ----------------
export function Sidebar({ setShowMobileFilter }) {
  const [searchParams, setSearchParams] = useSearchParams();
  const { data: categories = [] } = useCategories();
  const [selectedFilters, setSelectedFilters] = useState(() =>
    getInitialSelected(searchParams),
  );
  const selectedCategories = searchParams.getAll(CATEGORY_ID);

  // ---------------- SINGLE SELECT (radio) ----------------
  const toggleSingle = useCallback(
    (name, value) => {
      setSearchParams((prev) => {
        const params = new URLSearchParams(prev);
        const isSame = selectedFilters[name] === value;
        clearFilterParams(params, name);
        if (!isSame) {
          const range = rangeConfig[name]?.(value);
          if (range) {
            Object.entries(range).forEach(([key, val]) => params.set(key, val));
          } else {
            params.set(name, value);
          }
        }
        params.delete("page");
        params.delete("limit");
        return params;
      });
      setSelectedFilters((p) => ({ ...p, [name]: p[name] === value ? "" : value }));
    },
    [selectedFilters, setSearchParams],
  );

  // ---------------- MULTI SELECT (checkbox) ----------------
  const toggleCategory = useCallback(
    (categoryId) => {
      setSearchParams((prev) => {
        const params = new URLSearchParams(prev);
        const current = params.getAll(CATEGORY_ID);
        params.delete(CATEGORY_ID);
        const next = current.includes(categoryId)
          ? current.filter((v) => v !== categoryId)
          : [...current, categoryId];
        next.forEach((v) => params.append(CATEGORY_ID, v));
        params.delete("page");
        params.delete("limit");
        return params;
      });
    },
    [setSearchParams],
  );

  // ---------------- CLEAR ----------------
  const handleClear = useCallback(() => {
    const params = new URLSearchParams(searchParams);
    queryFields.forEach((f) => clearFilterParams(params, f));
    params.delete("page");
    params.delete("limit");
    setSearchParams(params);
    setSelectedFilters({
      [ACCESS_TYPE]: "",
      [LEVEL]: "",
      [MIN_RATING]: "",
      [MIN_DURATION]: "",
    });
  }, [searchParams, setSearchParams]);

  // ---------------- ACTIVE FILTERS ----------------
  const activeFilters = [];
  const accessType = selectedFilters[ACCESS_TYPE];
  if (accessType) {
    const option = filters.find((f) => f.value === accessType);
    if (option) activeFilters.push({ key: ACCESS_TYPE, name: ACCESS_TYPE, label: option.label });
  }
  const level = selectedFilters[LEVEL];
  if (level) {
    const option = levels.find((l) => l.value === level);
    if (option) activeFilters.push({ key: LEVEL, name: LEVEL, label: option.label });
  }
  const rating = selectedFilters[MIN_RATING];
  if (rating) {
    activeFilters.push({ key: MIN_RATING, name: MIN_RATING, label: `${rating}★ & up` });
  }
  const duration = selectedFilters[MIN_DURATION];
  if (duration) {
    const option = durations.find((d) => d.value === duration);
    if (option) activeFilters.push({ key: MIN_DURATION, name: MIN_DURATION, label: option.label });
  }
  const selectedCategoryIds = selectedCategories.map(String);
  selectedCategories.forEach((id) => {
    const category = categories.find((c) => String(c.id) === String(id));
    if (category) {
      activeFilters.push({
        key: `${CATEGORY_ID}-${id}`,
        type: "category",
        value: id,
        label: category.name,
      });
    }
  });

  const removeFilter = (filter) => {
    if (filter.type === "category") {
      toggleCategory(filter.value);
      return;
    }
    setSearchParams((prev) => {
      const params = new URLSearchParams(prev);
      clearFilterParams(params, filter.name);
      params.delete("page");
      params.delete("limit");
      return params;
    });
    setSelectedFilters((p) => ({ ...p, [filter.name]: "" }));
  };

  const handleRadioChange = (name, value) => () => toggleSingle(name, value);
  const handleRadioDeselect = (name, value) => () => {
    if (selectedFilters[name] === value) toggleSingle(name, value);
  };

  // ---------------- UI ----------------
  return (
    <div className="relative flex w-full flex-col text-foreground md:w-64 md:border-r md:border-border">
      <div className="sticky top-0 z-10 border-b border-border bg-background/95 px-4 pb-3 pt-4 backdrop-blur md:px-6 md:pt-6">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Filter className="h-4 w-4 text-primary" />
            <h2 className="text-base font-semibold">Filters</h2>
            {activeFilters.length > 0 && (
              <span className="inline-flex h-5 min-w-5 items-center justify-center rounded-full bg-primary px-1.5 text-xs font-semibold text-white">
                {activeFilters.length}
              </span>
            )}
          </div>
          <div className="flex items-center gap-1">
            {activeFilters.length > 0 && (
              <button
                type="button"
                onClick={handleClear}
                className="cursor-pointer rounded-md px-2 py-1 text-xs font-medium text-foreground-muted transition-colors hover:bg-surface-muted hover:text-foreground"
              >
                Clear all
              </button>
            )}
            <button
              type="button"
              onClick={() => setShowMobileFilter?.(false)}
              aria-label="Close filters"
              className="cursor-pointer rounded-md p-1 text-foreground-muted transition-colors hover:bg-surface-muted hover:text-foreground md:hidden"
            >
              <X className="h-5 w-5" />
            </button>
          </div>
        </div>
      </div>

      <div className="flex flex-col px-4 pb-6 md:px-6">
        {activeFilters.length > 0 && (
          <div className="flex flex-wrap gap-2 border-b border-border py-3">
            {activeFilters.map((filter) => (
              <button
                key={filter.key}
                type="button"
                onClick={() => removeFilter(filter)}
                aria-label={`Remove ${filter.label} filter`}
                className="group inline-flex cursor-pointer items-center gap-1 rounded-full bg-primary/10 px-2.5 py-1 text-xs font-medium text-primary transition-colors hover:bg-primary/20"
              >
                {filter.label}
                <X className="h-3 w-3 opacity-60 transition-opacity group-hover:opacity-100" />
              </button>
            ))}
          </div>
        )}

        <FilterSection title="Access" activeCount={accessType ? 1 : 0}>
          {filters.map((o) => (
            <FilterOption
              key={o.value}
              type="radio"
              name={o.name}
              value={o.value}
              checked={selectedFilters[o.name] === o.value}
              onChange={handleRadioChange(o.name, o.value)}
              onDeselect={handleRadioDeselect(o.name, o.value)}
            >
              {o.label}
            </FilterOption>
          ))}
        </FilterSection>

        <FilterSection title="Skill Level" activeCount={level ? 1 : 0}>
          {levels.map((o) => (
            <FilterOption
              key={o.value}
              type="radio"
              name={o.name}
              value={o.value}
              checked={selectedFilters[o.name] === o.value}
              onChange={handleRadioChange(o.name, o.value)}
              onDeselect={handleRadioDeselect(o.name, o.value)}
            >
              {o.label}
            </FilterOption>
          ))}
        </FilterSection>

        <FilterSection title="Rating" activeCount={rating ? 1 : 0}>
          {ratings.map((o) => (
            <FilterOption
              key={o.value}
              type="radio"
              name={o.name}
              value={o.value}
              checked={selectedFilters[o.name] === o.value}
              onChange={handleRadioChange(o.name, o.value)}
              onDeselect={handleRadioDeselect(o.name, o.value)}
            >
              <span className="flex items-center gap-1.5">
                <Star className="h-3.5 w-3.5 fill-warning text-warning" />
                {o.label} &amp; up
              </span>
            </FilterOption>
          ))}
        </FilterSection>

        <FilterSection title="Duration" activeCount={duration ? 1 : 0}>
          {durations.map((o) => (
            <FilterOption
              key={o.value}
              type="radio"
              name={o.name}
              value={o.value}
              checked={selectedFilters[o.name] === o.value}
              onChange={handleRadioChange(o.name, o.value)}
              onDeselect={handleRadioDeselect(o.name, o.value)}
            >
              {o.label}
            </FilterOption>
          ))}
        </FilterSection>

        <FilterSection title="Topics" activeCount={selectedCategoryIds.length}>
          {categories.length === 0 ? (
            <p className="px-2 text-sm text-foreground-muted">No topics yet</p>
          ) : (
            categories.map((category) => (
              <FilterOption
                key={category.id}
                type="checkbox"
                name={CATEGORY_ID}
                value={category.id}
                checked={selectedCategoryIds.includes(String(category.id))}
                onChange={() => toggleCategory(category.id)}
              >
                {category.name}
              </FilterOption>
            ))
          )}
        </FilterSection>
      </div>
    </div>
  );
}

// ---------------- SMALL COMPONENTS ----------------
function FilterSection({ title, activeCount = 0, children }) {
  const [open, setOpen] = useState(true);
  return (
    <div className="border-b border-border py-4 last:border-b-0">
      <button
        type="button"
        onClick={() => setOpen((o) => !o)}
        aria-expanded={open}
        className="group flex w-full cursor-pointer items-center justify-between text-left"
      >
        <span className="flex items-center gap-2 text-xs font-semibold uppercase tracking-wide text-foreground-muted transition-colors group-hover:text-foreground">
          {title}
          {activeCount > 0 && (
            <span className="inline-flex h-4 min-w-4 items-center justify-center rounded-full bg-primary/10 px-1 text-[10px] font-semibold text-primary">
              {activeCount}
            </span>
          )}
        </span>
        <ChevronDown
          className={cn(
            "h-4 w-4 text-foreground-muted transition-transform duration-200",
            open && "rotate-180",
          )}
        />
      </button>
      {open && <div className="mt-2 space-y-0.5">{children}</div>}
    </div>
  );
}

function FilterOption({
  type,
  name,
  value,
  checked,
  onChange,
  onDeselect,
  children,
}) {
  const isRadio = type === "radio";
  return (
    <label
      className={cn(
        "group -mx-2 flex cursor-pointer items-center gap-3 rounded-md px-2 py-1.5 transition-colors",
        checked ? "bg-primary/5" : "hover:bg-surface-muted",
      )}
    >
      <input
        type={type}
        name={name}
        value={value}
        checked={checked}
        onChange={onChange}
        onClick={() => {
          if (isRadio && checked) onDeselect?.();
        }}
        className="peer sr-only"
      />
      <span
        className={cn(
          "flex h-4 w-4 shrink-0 items-center justify-center border transition-colors peer-focus-visible:ring-2 peer-focus-visible:ring-ring peer-focus-visible:ring-offset-1 peer-focus-visible:ring-offset-background",
          isRadio ? "rounded-full" : "rounded",
          checked
            ? "border-primary bg-primary"
            : "border-border bg-surface group-hover:border-primary/50",
        )}
      >
        {checked &&
          (isRadio ? (
            <span className="h-1.5 w-1.5 rounded-full bg-white" />
          ) : (
            <Check className="h-3 w-3 text-white" strokeWidth={3} />
          ))}
      </span>
      <span
        className={cn(
          "text-sm transition-colors",
          checked ? "font-medium text-foreground" : "text-foreground-muted group-hover:text-foreground",
        )}
      >
        {children}
      </span>
    </label>
  );
}
