import { useState } from "react";
import { FilterTab } from "@/features/catalog/components/course/FilterTab";
import { SearchHeader } from "@/features/catalog/components/course/SearchHeader";
import { SearchResult } from "@/features/catalog/components/course/SearchResult";
import { Sidebar } from "@/features/catalog/components/course/Sidebar";

export default function CourseScreen() {
  const [showMobileFilter, setShowMobileFilter] = useState(false);
  return (
    <div className="h-[calc(100vh-64px)] bg-background flex flex-col max-w-7xl mx-auto">
      {/* Fixed Header Section */}
      <div className="sticky top-0 z-30 bg-background border-b border-border">
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
        <div className="hidden md:block w-64 shrink-0  sticky top-0 overflow-y-auto h-full  overflow-x-hidden">
          <Sidebar />
        </div>

        {/* Mobile Filter Overlay */}
        {showMobileFilter && (
          <div
            className="fixed inset-0 bg-black/50 z-40 md:hidden"
            onClick={() => setShowMobileFilter(false)}
          />
        )}

        {/* Mobile Sidebar - Slide in from left on mobile */}
        <div
          className={`fixed left-0 top-0 w-72 bg-background border-r border-border z-50 transform transition-transform duration-300 ease-in-out md:hidden h-full overflow-y-auto ${
            showMobileFilter ? "translate-x-0" : "-translate-x-full"
          }`}
        >
          <Sidebar setShowMobileFilter={setShowMobileFilter} />
        </div>

        {/* Results Container */}
        <div className="flex-1 flex flex-col overflow-hidden">
          <SearchResult />
        </div>
      </div>
    </div>
  );
}
