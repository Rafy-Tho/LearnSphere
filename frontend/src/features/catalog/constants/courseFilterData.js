import { COURSE_QUERY_PARAMS } from "@/features/catalog/constants/queryParams";

const levels = [
  { name: COURSE_QUERY_PARAMS.LEVEL, label: "Beginner", value: "BEGINNER" },
  {
    name: COURSE_QUERY_PARAMS.LEVEL,
    label: "Intermediate",
    value: "INTERMEDIATE",
  },
  { name: COURSE_QUERY_PARAMS.LEVEL, label: "Advanced", value: "ADVANCED" },
];

const filters = [
  { name: COURSE_QUERY_PARAMS.ACCESS_TYPE, label: "Free", value: "FREE" },
  {
    name: COURSE_QUERY_PARAMS.ACCESS_TYPE,
    label: "Paid",
    value: "SUBSCRIPTION",
  },
];

// Rating thresholds: selecting N means "N and up".
const ratings = [
  { name: COURSE_QUERY_PARAMS.MIN_RATING, label: "1", value: "1" },
  { name: COURSE_QUERY_PARAMS.MIN_RATING, label: "2", value: "2" },
  { name: COURSE_QUERY_PARAMS.MIN_RATING, label: "3", value: "3" },
  { name: COURSE_QUERY_PARAMS.MIN_RATING, label: "4", value: "4" },
  { name: COURSE_QUERY_PARAMS.MIN_RATING, label: "5", value: "5" },
];

// Duration buckets in minutes; the value is the lower bound of the range.
const durations = [
  { name: COURSE_QUERY_PARAMS.MIN_DURATION, label: "1-3 hrs", value: "60" },
  { name: COURSE_QUERY_PARAMS.MIN_DURATION, label: "3-5 hrs", value: "180" },
  { name: COURSE_QUERY_PARAMS.MIN_DURATION, label: "5-7 hrs", value: "300" },
  { name: COURSE_QUERY_PARAMS.MIN_DURATION, label: "7-10 hrs", value: "420" },
  { name: COURSE_QUERY_PARAMS.MIN_DURATION, label: "10+ hrs", value: "600" },
];

export { filters, levels, ratings, durations };
