// file
export const FILE_SIZE_LIMIT = 1024 * 1024 * 5; // 5MB
// user role
export const ADMIN = "ADMIN";
export const INSTRUCTOR = "INSTRUCTOR";
// ABOUT COURSE
export const CONTENT_STATUS = ["DRAFT", "PUBLISHED"];
// Full course lifecycle including the instructor review workflow. The generic
// create/update validator intentionally stays on CONTENT_STATUS; review states
// are only set by the dedicated submit/approve/reject endpoints.
export const COURSE_STATUS = ["DRAFT", "PENDING", "PUBLISHED", "REJECTED"];
export const REJECTABLE_STATUS = ["DRAFT", "REJECTED"];
export const INSTRUCTOR_REVENUE_SHARE_DEFAULT = 70;
export const LESSON_TYPE = ["TEXT", "QUIZ"];
export const COURSE_LEVEL = ["BEGINNER", "INTERMEDIATE", "ADVANCED"];
export const ACCESS_COURSE_TYPE = ["FREE", "SUBSCRIPTION"];
