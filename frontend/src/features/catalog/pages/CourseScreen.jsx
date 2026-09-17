import { useState } from "react";
import { FilterTab } from "@/features/catalog/components/course/FilterTab";
import { SearchHeader } from "@/features/catalog/components/course/SearchHeader";
import { SearchResult } from "@/features/catalog/components/course/SearchResult";
import { Sidebar } from "@/features/catalog/components/course/Sidebar";

export default function CourseScreen() {
  const [showMobileFilter, setShowMobileFilter] = useState(false);
  return (
    <div className="mx-auto flex h-[calc(100dvh-64px)] max-w-7xl flex-col bg-background">
      {/* Fixed Header Section */}
      <div className="sticky top-0 z-30 shrink-0 border-b border-border bg-background">
        {/* Search Header */}
        <SearchHeader
          showMobileFilter={showMobileFilter}
          setShowMobileFilter={setShowMobileFilter}
        />
        {/* Filter Tabs */}
        <FilterTab />
      </div>

      {/* Main Content Area */}
      <div className="flex flex-1 overflow-hidden">
        {/* Desktop Sidebar - Fixed on desktop, hidden on mobile */}
        <div className="hidden h-full w-64 shrink-0 overflow-y-auto overflow-x-hidden md:block">
          <Sidebar />
        </div>

        {/* Mobile Filter Overlay */}
        {showMobileFilter && (
          <div
            className="fixed inset-0 z-40 bg-black/50 md:hidden"
            onClick={() => setShowMobileFilter(false)}
          />
        )}

        {/* Mobile Sidebar - Slide in from left on mobile */}
        <div
          className={`fixed left-0 top-0 z-50 h-full w-[min(20rem,85vw)] overflow-y-auto overscroll-contain border-r border-border bg-background transition-transform duration-300 ease-in-out md:hidden ${
            showMobileFilter ? "translate-x-0" : "-translate-x-full"
          }`}
        >
          <Sidebar setShowMobileFilter={setShowMobileFilter} />
        </div>

        {/* Results Container */}
        <div className="flex min-w-0 flex-1 flex-col overflow-hidden">
          <SearchResult />
        </div>
      </div>
    </div>
  );
}
