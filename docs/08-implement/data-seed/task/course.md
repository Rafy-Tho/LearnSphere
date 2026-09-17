# Task: Author One Course Seed File

This is the single recipe for creating **one** course seed file. Follow it exactly so
every course in the catalog is structurally identical and safely re-runnable.

> Reference implementations (already applied): `backend/src/db/seeds/003_course_html_css_fundamentals.sql`
> and `backend/src/db/seeds/004_course_javascript_for_the_web.sql`.

## 0. Prerequisites

- Seeds `001_instructors.sql` and `002_categories.sql` are applied.
- Postgres is reachable via `backend/.env`; run commands from `backend/`.
- Never edit an existing seed file's UUIDs once applied; new work always gets a new block.

## 1. File Naming & Location

- Path: `backend/src/db/seeds/NNN_course_<kebab-slug>.sql`
- `NNN` is the zero-padded seed number (e.g. `014`). `<kebab-slug>` must equal the
  course `slug` column.
- The [seed runner](../../../../backend/src/db/seed.js) auto-discovers `seeds/*.sql`
  sorted lexicographically, so no registration is needed. Fixed-width 3-digit names
  keep numeric order.

## 2. UUID Block Allocation

Each seed owns exactly one 8-char prefix. **New seeds (014–102)** derive the prefix as:

```
prefix = ( "0" + seedNumber.toString(16) ).padEnd(8, "0")
id     = `${prefix}-0000-4000-8000-${offset}`
```

`014 → 0E000000`, `016 → 01000000`, `048 → 03000000`, `064 → 04000000`,
`100 → 06400000`, `102 → 06600000`.

> Why the leading `0`: a plain hex continuation collides inside the `courses` table
> (seed `048` → `30…` = course `003`; `064` → `40…` = `004`; `080` → `50…` = `005`;
> `096` → `60…` = `006`). The `0` prefix makes every new block unique.

### 2.1 New seed prefix table

| Seed | Prefix (first group) | Seed | Prefix | Seed | Prefix |
|---|---|---|---|---|---|
| 014 | `0E000000` | 045 | `02D00000` | 076 | `04C00000` |
| 015 | `0F000000` | 046 | `02E00000` | 077 | `04D00000` |
| 016 | `01000000` | 047 | `02F00000` | 078 | `04E00000` |
| 017 | `01100000` | 048 | `03000000` | 079 | `04F00000` |
| 018 | `01200000` | 049 | `03100000` | 080 | `05000000` |
| 019 | `01300000` | 050 | `03200000` | 081 | `05100000` |
| 020 | `01400000` | 051 | `03300000` | 082 | `05200000` |
| 021 | `01500000` | 052 | `03400000` | 083 | `05300000` |
| 022 | `01600000` | 053 | `03500000` | 084 | `05400000` |
| 023 | `01700000` | 054 | `03600000` | 085 | `05500000` |
| 024 | `01800000` | 055 | `03700000` | 086 | `05600000` |
| 025 | `01900000` | 056 | `03800000` | 087 | `05700000` |
| 026 | `01A00000` | 057 | `03900000` | 088 | `05800000` |
| 027 | `01B00000` | 058 | `03A00000` | 089 | `05900000` |
| 028 | `01C00000` | 059 | `03B00000` | 090 | `05A00000` |
| 029 | `01D00000` | 060 | `03C00000` | 091 | `05B00000` |
| 030 | `01E00000` | 061 | `03D00000` | 092 | `05C00000` |
| 031 | `01F00000` | 062 | `03E00000` | 093 | `05D00000` |
| 032 | `02000000` | 063 | `03F00000` | 094 | `05E00000` |
| 033 | `02100000` | 064 | `04000000` | 095 | `05F00000` |
| 034 | `02200000` | 065 | `04100000` | 096 | `06000000` |
| 035 | `02300000` | 066 | `04200000` | 097 | `06100000` |
| 036 | `02400000` | 067 | `04300000` | 098 | `06200000` |
| 037 | `02500000` | 068 | `04400000` | 099 | `06300000` |
| 038 | `02600000` | 069 | `04500000` | 100 | `06400000` |
| 039 | `02700000` | 070 | `04600000` | 101 | `06500000` |
| 040 | `02800000` | 071 | `04700000` | 102 | `06600000` |
| 041 | `02900000` | 072 | `04800000` |  |  |
| 042 | `02A00000` | 073 | `04900000` |  |  |
| 043 | `02B00000` | 074 | `04A00000` |  |  |
| 044 | `02C00000` | 075 | `04B00000` |  |  |

### 2.2 Fixed offsets inside a block

| Entity | Offset range |
|---|---|
| course | `…0001` |
| course_objectives | `…0011`–`…0015` |
| modules | `…0101`–`…0105` |
| chapters | `…0201`–`…0210` |
| lessons | `…0301`–`…0328` |
| lesson_contents | `…0401`–`…0419` |
| quizzes | `…0501`–`…0529` |
| quiz_options | `…1001`–`…1116` |

## 3. Mandatory Structure

Every course has exactly:

- **5 modules** (positions 1–5), each with **2 chapters** → 10 chapters (`…0201`–`…0210`).
- **28 lessons** (`…0301`–`…0328`), 9 of type `QUIZ` and 19 of type `TEXT`.
- **19 lesson_contents** (`…0401`–`…0419`), one per `TEXT` lesson.
- **29 quizzes** (`…0501`–`…0529`): 24 spread over the 8 smaller quiz lessons
  (3 each) + 5 in the final assessment.
- **116 quiz_options** (`…1001`–`…1116`): 4 per question, exactly one `is_correct = TRUE`.

### 3.1 Quiz lesson placement

Lessons are laid out so that **every 3rd lesson is a quiz**, and the last lesson is the
final assessment:

| Quiz lesson | Lesson id | Lesson name | Quizzes |
|---|---|---|---|
| Q1 | `…0303` | …Quiz | `…0501`–`…0503` |
| Q2 | `…0306` | …Quiz | `…0504`–`…0506` |
| Q3 | `…0309` | …Quiz | `…0507`–`…0509` |
| Q4 | `…0312` | …Quiz | `…0510`–`…0512` |
| Q5 | `…0315` | …Quiz | `…0513`–`…0515` |
| Q6 | `…0318` | …Quiz | `…0516`–`…0518` |
| Q7 | `…0321` | …Quiz | `…0519`–`…0521` |
| Q8 | `…0324` | …Quiz | `…0522`–`…0524` |
| Q9 (final) | `…0328` | Final Assessment | `…0525`–`…0529` |

Quiz-option ranges: Q1 `…1001`–`…1012`, Q2 `…1013`–`…1024`, Q3 `…1025`–`…1036`,
Q4 `…1037`–`…1048`, Q5 `…1049`–`…1060`, Q6 `…1061`–`…1072`, Q7 `…1073`–`…1084`,
Q8 `…1085`–`…1096`, Q9 `…1097`–`…1116`.

Each `lesson_contents` id = the matching `TEXT` lesson id + 100 (e.g. `…0301` → `…0401`).
The 9 `QUIZ` lessons have no `lesson_contents` row.

## 4. Exact INSERT Shapes

Follow these column lists verbatim (also `001`/`003`/`004`).

```sql
INSERT INTO courses (
  id, instructor_id, category_id, name, slug, description, status, level, access_type, position
) VALUES ( … ) ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ( …,  …, …, 1), … ( …,  …, …, 5)
ON CONFLICT (id) DO NOTHING;

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ( …, …, 1, …, …, 'PUBLISHED'), … ;
ON CONFLICT (id) DO NOTHING;

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES … ;
ON CONFLICT (id) DO NOTHING;

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES … ;
ON CONFLICT (id) DO NOTHING;

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '<prefix>-…0401',
  '<prefix>-…0301',
  1,
  '<lesson name>',
  $html$
<!DOCTYPE html> … </html>
$html$
),
( … )
ON CONFLICT (id) DO NOTHING;

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES … ;
ON CONFLICT (id) DO NOTHING;

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES … ;
ON CONFLICT (id) DO NOTHING;
```

- All rows: `status = 'PUBLISHED'`.
- `lessons.xp_points`: 10 for `TEXT`, 15 for the 8 short quizzes, 30 for the final.
- `lessons.duration_minutes`: 5–12 (final assessment up to 10), realistic.
- Sections are separated by banner comments (`-- 1. COURSE + OBJECTIVES`, …) and the
  file starts with a header block naming instructor, category, level, access, and the
  module/chapter outline.

## 5. Lesson Content Rules (HTML)

- One **self-contained** HTML document per `TEXT` lesson.
- Dollar-quoted with the `$html$` tag: opening `$html$` on its own line, closing `$html$`
  on its own line, **19 times** (38 delimiter lines total).
- Use the scoped `.lesson-page` stylesheet from `004` (light + `.dark` variants), including
  `h1/h2`, `p`, lists, `.ic`, `pre.code-block`, `.callout`/`.callout-info`/`.callout-tip`,
  and `table` styles. Accent color may vary per course.
- HTML-escape code shown in prose (`&lt;`, `&gt;`, `&amp;`) but keep real markup structural.
- Aim for ~80–120 lines of HTML per lesson; whole file ~1900–2100 lines.
- You **may** include SQL examples inside the HTML — they are inside the dollar-quoted
  string and safe (that is why `grep -c INSERT` can exceed 8 in file `011`).

## 6. SQL-Safety Rules (bug-prevention)

These exact mistakes previously broke seeds — do not repeat them:

1. **No backslash escapes.** `standard_conforming_strings` is on, so `\'` is invalid.
   Double single quotes instead: `'navigation.navigate(''Details'', { id: 7 })'`.
2. **Quote every string.** Never leave a bare word/UUID where a string value is expected.
3. **Close every content row with `),`.** Verify no `$html$` closing line is followed by
   `(` before its `),`.
4. **Balance `$html$` delimiters.** Exactly 38 occurrences (19 pairs) per file, one per line.
5. **No stray bare `$html$` inside content**, and no unescaped single quote outside the
   dollar-quoted body.
6. `ON CONFLICT (id) DO NOTHING` on every statement → the file must be re-runnable.

## 7. Rotation Rules (Catalog Balance)

- **Category**: the target catalog is 10 courses per category. Assign each new seed the
  category listed in the roster (below) to keep the balance.
- **Instructor**: cycle the 5 seeded instructors in order so each ends near 20 courses:
  `Sarah Chen` (`10000000-…0001`), `Marcus Johnson` (`…0002`), `Anita Patel` (`…0003`),
  `David Kim` (`…0004`), `Elena Rodriguez` (`…0005`).
- **Level**: mix `BEGINNER`, `INTERMEDIATE`, `ADVANCED` (avoid all-advanced).
- **Access**: keep a healthy free tier — roughly 2 `FREE` per 10 courses, rest
  `SUBSCRIPTION`.
- **position**: continue the global sequence (current max is 11; new seeds 12→100).

## 8. Course Roster (seeds 014–102)

### Web Development (`20000000-…0001`) — +8
| Seed | Title | Slug |
|---|---|---|
| 014 | TypeScript for Web Developers | `typescript-for-web-developers` |
| 024 | Modern CSS Layouts: Flexbox & Grid | `modern-css-layouts-flexbox-grid` |
| 034 | Responsive Web Design | `responsive-web-design` |
| 044 | React Essentials | `react-essentials` |
| 054 | Vue.js: The Complete Guide | `vuejs-the-complete-guide` |
| 064 | Web Accessibility in Practice | `web-accessibility-in-practice` |
| 074 | Web Performance Optimization | `web-performance-optimization` |
| 084 | Full-Stack Web Development with Node.js | `full-stack-web-development-nodejs` |

### Programming Fundamentals (`20000000-…0002`) — +9
| Seed | Title | Slug |
|---|---|---|
| 015 | Programming Logic & Problem Solving | `programming-logic-and-problem-solving` |
| 025 | Algorithms & Data Structures | `algorithms-and-data-structures` |
| 035 | Object-Oriented Programming | `object-oriented-programming` |
| 045 | Functional Programming Principles | `functional-programming-principles` |
| 055 | C Programming from Scratch | `c-programming-from-scratch` |
| 065 | Java Programming Essentials | `java-programming-essentials` |
| 075 | C++ Fundamentals | `cpp-fundamentals` |
| 085 | Go Programming for Beginners | `go-programming-for-beginners` |
| 094 | Debugging & Testing Fundamentals | `debugging-and-testing-fundamentals` |

### Data Science (`20000000-…0003`) — +9
| Seed | Title | Slug |
|---|---|---|
| 016 | NumPy for Data Science | `numpy-for-data-science` |
| 026 | Data Visualization with Matplotlib & Seaborn | `data-visualization-matplotlib-seaborn` |
| 036 | Statistics for Data Science | `statistics-for-data-science` |
| 046 | Machine Learning Foundations | `machine-learning-foundations` |
| 056 | SQL for Data Analysis | `sql-for-data-analysis` |
| 066 | Data Cleaning & Preprocessing | `data-cleaning-and-preprocessing` |
| 076 | Deep Learning with TensorFlow | `deep-learning-with-tensorflow` |
| 086 | Natural Language Processing | `natural-language-processing` |
| 095 | Time Series Analysis & Forecasting | `time-series-analysis-and-forecasting` |

### Cloud Computing (`20000000-…0004`) — +9
| Seed | Title | Slug |
|---|---|---|
| 017 | Microsoft Azure Fundamentals | `microsoft-azure-fundamentals` |
| 027 | Google Cloud Platform Essentials | `google-cloud-platform-essentials` |
| 037 | Cloud Architecture & Design | `cloud-architecture-and-design` |
| 047 | Serverless Computing with AWS Lambda | `serverless-computing-aws-lambda` |
| 057 | Infrastructure as Code with Terraform | `infrastructure-as-code-terraform` |
| 067 | Cloud Cost Optimization | `cloud-cost-optimization` |
| 077 | Cloud Storage & Databases | `cloud-storage-and-databases` |
| 087 | Multi-Cloud Strategy | `multi-cloud-strategy` |
| 096 | Site Reliability Engineering | `site-reliability-engineering` |

### Cybersecurity (`20000000-…0005`) — +9
| Seed | Title | Slug |
|---|---|---|
| 018 | Ethical Hacking Fundamentals | `ethical-hacking-fundamentals` |
| 028 | Cryptography & Encryption | `cryptography-and-encryption` |
| 038 | Web Application Security | `web-application-security` |
| 048 | Security Operations & Incident Response | `security-operations-incident-response` |
| 058 | Threat Modeling & Risk Assessment | `threat-modeling-and-risk-assessment` |
| 068 | Identity & Access Management | `identity-and-access-management` |
| 078 | Digital Forensics Basics | `digital-forensics-basics` |
| 088 | Penetration Testing in Practice | `penetration-testing-in-practice` |
| 097 | Cloud Security & Compliance | `cloud-security-and-compliance` |

### Networking (`20000000-…0006`) — +9
| Seed | Title | Slug |
|---|---|---|
| 019 | Network Protocols Deep Dive | `network-protocols-deep-dive` |
| 029 | Wireless Networking & Wi-Fi | `wireless-networking-and-wifi` |
| 039 | Network Administration & Troubleshooting | `network-administration-and-troubleshooting` |
| 049 | Switching & VLANs | `switching-and-vlans` |
| 059 | Software-Defined Networking | `software-defined-networking` |
| 069 | DNS & Internet Infrastructure | `dns-and-internet-infrastructure` |
| 079 | Network Automation with Python | `network-automation-with-python` |
| 089 | VPNs & Secure Tunnels | `vpns-and-secure-tunnels` |
| 098 | Network Monitoring & Analysis | `network-monitoring-and-analysis` |

### Mobile Development (`20000000-…0007`) — +9
| Seed | Title | Slug |
|---|---|---|
| 020 | Flutter: Cross-Platform Apps | `flutter-cross-platform-apps` |
| 030 | iOS Development with Swift | `ios-development-with-swift` |
| 040 | Android Development with Kotlin | `android-development-with-kotlin` |
| 050 | Mobile UI/UX Design | `mobile-ui-ux-design` |
| 060 | SwiftUI for Modern iOS | `swiftui-for-modern-ios` |
| 070 | Jetpack Compose for Android | `jetpack-compose-for-android` |
| 080 | Mobile App Publishing & Monetization | `mobile-app-publishing-and-monetization` |
| 090 | Mobile App Testing & CI/CD | `mobile-app-testing-and-cicd` |
| 099 | Progressive Web Apps | `progressive-web-apps` |

### Database & Administration (`20000000-…0008`) — +9
| Seed | Title | Slug |
|---|---|---|
| 021 | SQL Fundamentals | `sql-fundamentals` |
| 031 | MySQL Administration | `mysql-administration` |
| 041 | MongoDB & NoSQL Databases | `mongodb-and-nosql-databases` |
| 051 | Database Design & Normalization | `database-design-and-normalization` |
| 061 | Redis & Caching Strategies | `redis-and-caching-strategies` |
| 071 | Database Performance Tuning | `database-performance-tuning` |
| 081 | Data Warehousing & ETL | `data-warehousing-and-etl` |
| 091 | Backup, Recovery & High Availability | `backup-recovery-and-high-availability` |
| 100 | Graph Databases with Neo4j | `graph-databases-with-neo4j` |

### DevOps & CI/CD (`20000000-…0009`) — +9
| Seed | Title | Slug |
|---|---|---|
| 022 | Linux for DevOps | `linux-for-devops` |
| 032 | CI/CD with GitHub Actions | `cicd-with-github-actions` |
| 042 | Git & Version Control Mastery | `git-and-version-control-mastery` |
| 052 | Ansible & Configuration Management | `ansible-and-configuration-management` |
| 062 | Monitoring with Prometheus & Grafana | `monitoring-with-prometheus-and-grafana` |
| 072 | Jenkins Automation | `jenkins-automation` |
| 082 | Helm & Kubernetes Packaging | `helm-and-kubernetes-packaging` |
| 092 | DevSecOps Fundamentals | `devsecops-fundamentals` |
| 101 | Platform Engineering Essentials | `platform-engineering-essentials` |

### Software Design & Architecture (`20000000-…0010`) — +9
| Seed | Title | Slug |
|---|---|---|
| 023 | Clean Code & Refactoring | `clean-code-and-refactoring` |
| 033 | SOLID Principles in Practice | `solid-principles-in-practice` |
| 043 | Domain-Driven Design | `domain-driven-design` |
| 053 | Microservices Architecture | `microservices-architecture` |
| 063 | System Design for Interviews | `system-design-for-interviews` |
| 073 | Event-Driven Architecture | `event-driven-architecture` |
| 083 | API Design & RESTful Best Practices | `api-design-and-restful-best-practices` |
| 093 | Software Architecture Patterns | `software-architecture-patterns` |
| 102 | Advanced Software Architecture | `advanced-software-architecture` |

## 9. Verification Checklist

Run after writing each file (from `backend/`):

1. **Delimiter/count sanity**
   ```powershell
   $f = "src\db\seeds\NNN_course_<slug>.sql"
   (Select-String -LiteralPath $f -Pattern '\$html\$' -AllMatches).Matches.Count   # 38
   (Select-String -LiteralPath $f -Pattern 'INSERT INTO').Count                    # 8
   ```
2. **Parse/transaction probe** (rolls back; see `docs/08-implement/data-seed/task/course.md`
   history or write a temporary `node` script in `backend/` that `BEGIN`s, runs the file,
   and `ROLLBACK`s). Any `syntax error at or near ...` with a `position` pinpoints the bug.
3. **Apply**: `npm run db:seed:status` then `npm run db:seed`.
4. **Row counts** (expect exactly these per new course):
   `5 modules · 10 chapters · 28 lessons · 19 contents · 29 quizzes · 116 options · 5 objectives`.
5. **Option sanity**: every quiz has exactly one `is_correct = TRUE` and 3 `FALSE`.
6. Append the seed's row to the roster table and its prefix to the UUID table in
   [`../course.md`](../course.md).
