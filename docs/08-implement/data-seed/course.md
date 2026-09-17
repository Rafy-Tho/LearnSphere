# Course Seed Data

The database contains a catalog of 11 complete, published courses (seed files `003`–`013`), seeded by the [seed runner](../../../backend/src/db/seed.js) (`npm run db:seed`).

## Course Roster

| Seed | Course | Category | Instructor | Level | Access | Position |
|---|---|---|---|---|---|---|
| `003_course_html_css_fundamentals.sql` | HTML & CSS Fundamentals (`html-css-fundamentals`) | Web Development | Sarah Chen | BEGINNER | FREE | 1 |
| `004_course_javascript_for_the_web.sql` | JavaScript for the Web (`javascript-for-the-web`) | Web Development | Sarah Chen | INTERMEDIATE | SUBSCRIPTION | 2 |
| `005_course_python_basics.sql` | Python Programming Basics (`python-programming-basics`) | Programming Fundamentals | Marcus Johnson | BEGINNER | FREE | 3 |
| `006_course_data_analysis_pandas.sql` | Data Analysis with Pandas (`data-analysis-with-pandas`) | Data Science | Anita Patel | INTERMEDIATE | SUBSCRIPTION | 4 |
| `007_course_aws_fundamentals.sql` | AWS Cloud Fundamentals (`aws-cloud-fundamentals`) | Cloud Computing | David Kim | BEGINNER | FREE | 5 |
| `008_course_network_security.sql` | Network Security Essentials (`network-security-essentials`) | Cybersecurity | Elena Rodriguez | INTERMEDIATE | SUBSCRIPTION | 6 |
| `009_course_tcp_ip_routing.sql` | TCP/IP & Routing Fundamentals (`tcp-ip-routing-fundamentals`) | Networking | Sarah Chen | BEGINNER | FREE | 7 |
| `010_course_react_native.sql` | React Native Mobile Apps (`react-native-mobile-apps`) | Mobile Development | Marcus Johnson | INTERMEDIATE | SUBSCRIPTION | 8 |
| `011_course_postgresql.sql` | PostgreSQL from Zero to Pro (`postgresql-from-zero-to-pro`) | Database & Administration | Anita Patel | ADVANCED | SUBSCRIPTION | 9 |
| `012_course_docker_kubernetes.sql` | Docker & Kubernetes in Practice (`docker-kubernetes-in-practice`) | DevOps & CI/CD | David Kim | INTERMEDIATE | SUBSCRIPTION | 10 |
| `013_course_design_patterns.sql` | Design Patterns for Modern Software (`design-patterns-for-modern-software`) | Software Design & Architecture | Elena Rodriguez | ADVANCED | SUBSCRIPTION | 11 |

Covers all 10 seeded categories (`002_categories.sql`); instructors cycle through the 5 seeded `INSTRUCTOR` accounts (`001_instructors.sql`).

## Common Structure

Every course follows the same shape (all content `PUBLISHED`, mixed FREE/SUBSCRIPTION lessons):

- **5 modules** → **10 chapters** (2 per module) → **28 lessons** (19 `TEXT` + 9 `QUIZ`)
- 19 `lesson_contents` rows: self-contained HTML documents with scoped CSS (dollar-quoted `$html$…$html$`)
- 29 `quizzes` (24 across 8 quiz lessons + 5-question final assessment)
- 116 `quiz_options` (4 per question, exactly one `is_correct = TRUE`)
- `ON CONFLICT (id) DO NOTHING` everywhere → re-runnable

## UUID Blocks

Each seed owns a deterministic UUID prefix derived from its file number, mirroring `003` (`30000000-…`):

| Seed | Prefix |
|---|---|
| 004 | `40000000-0000-4000-8000` |
| 005 | `50000000-0000-4000-8000` |
| 006 | `60000000-0000-4000-8000` |
| 007 | `70000000-0000-4000-8000` |
| 008 | `80000000-0000-4000-8000` |
| 009 | `90000000-0000-4000-8000` |
| 010 | `A0000000-0000-4000-8000` |
| 011 | `B0000000-0000-4000-8000` |
| 012 | `C0000000-0000-4000-8000` |
| 013 | `D0000000-0000-4000-8000` |

Within a block, fixed offsets allocate IDs:

- course `…0001`; objectives `…0011`–`…0015`
- modules `…0101`–`…0105`; chapters `…0201`–`…0210`
- lessons `…0301`–`…0328`; lesson_contents `…0401`–`…0419`
- quizzes `…0501`–`…0529`; quiz_options `…1001`–`…1116`

## Run Order

```
001_instructors  →  002_categories  →  003…013 courses
```

Run all with `npm run db:seed` (backend). Check applied versions with `npm run db:seed:status`.