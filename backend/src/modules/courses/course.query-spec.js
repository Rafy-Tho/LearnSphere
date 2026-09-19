import {
  ACCESS_COURSE_TYPE,
  COURSE_LEVEL,
  COURSE_STATUS,
} from "../../common/constants/constants.js";

/**
 * Query spec for the learner course catalog (`GET /courses`).
 * This is the single source of truth for filters, sorting and search; the
 * repository, validation middleware and docs all derive from it.
 */
export const courseListQuerySpec = {
  baseAlias: "c",
  filters: {
    level: {
      column: "c.level",
      type: "enum",
      values: COURSE_LEVEL,
      description: "Course difficulty level",
    },
    categoryId: {
      column: "c.category_id",
      type: "uuid",
      array: true,
      description: "Category UUID(s); repeat the key to match several",
    },
    accessType: {
      column: "c.access_type",
      type: "enum",
      values: ACCESS_COURSE_TYPE,
      description: "Free or subscription-only access",
    },
    minRating: {
      column: "rv.avg_rating",
      operator: ">=",
      type: "number",
      min: 0,
      max: 5,
      description: "Minimum average rating",
    },
    maxRating: {
      column: "rv.avg_rating",
      operator: "<=",
      type: "number",
      min: 0,
      max: 5,
      description: "Maximum average rating",
    },
    minDuration: {
      column: "ld.total_duration",
      operator: ">=",
      type: "int",
      min: 0,
      description: "Minimum total duration in minutes",
    },
    maxDuration: {
      column: "ld.total_duration",
      operator: "<=",
      type: "int",
      min: 0,
      description: "Maximum total duration in minutes",
    },
  },
  sortable: {
    createdAt: "c.created_at",
    avgRating: "rv.avg_rating",
    totalDuration: "ld.total_duration",
  },
  search: {
    columns: ["c.name", "c.description"],
    mode: "trigram",
    minLength: 2,
  },
  defaultSort: "createdAt",
};

/**
 * Query spec for the admin course list (`GET /admin/courses`). The dashboard
 * query does not join rating/duration aggregates, so it exposes a smaller set.
 */
export const adminCourseListQuerySpec = {
  baseAlias: "c",
  filters: {
    status: {
      column: "c.status",
      type: "enum",
      values: COURSE_STATUS,
      description: "Course lifecycle status (review queue uses status=PENDING)",
    },
    instructorId: {
      column: "c.instructor_id",
      type: "uuid",
      hidden: true,
      description: "Internal: scope the list to a single instructor",
    },
    level: {
      column: "c.level",
      type: "enum",
      values: COURSE_LEVEL,
      description: "Course difficulty level",
    },
    categoryId: {
      column: "c.category_id",
      type: "uuid",
      array: true,
      description: "Category UUID(s); repeat the key to match several",
    },
    accessType: {
      column: "c.access_type",
      type: "enum",
      values: ACCESS_COURSE_TYPE,
      description: "Free or subscription-only access",
    },
  },
  sortable: {
    createdAt: "c.created_at",
  },
  search: {
    columns: ["c.name", "c.description"],
    mode: "trigram",
    minLength: 2,
  },
  defaultSort: "createdAt",
};
