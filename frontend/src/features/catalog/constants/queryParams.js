/**
 * Canonical query-parameter names for the catalog API. Keep these in sync with
 * the backend query specs (`backend/src/modules/courses/course.query-spec.js`).
 */
export const COURSE_QUERY_PARAMS = {
  PAGE: "page",
  LIMIT: "limit",
  SORT: "sort",
  SEARCH: "search",
  LEVEL: "level",
  CATEGORY_ID: "categoryId",
  ACCESS_TYPE: "accessType",
  MIN_RATING: "minRating",
  MIN_DURATION: "minDuration",
  MAX_DURATION: "maxDuration",
};
