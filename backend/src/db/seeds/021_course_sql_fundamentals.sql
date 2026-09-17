-- ============================================================================
-- SEED 021: Complete course — "SQL Fundamentals"
-- ----------------------------------------------------------------------------
-- Instructor : Anita Patel        (10000000-0000-4000-8000-000000000003)
-- Category   : Database & Administration (20000000-0000-4000-8000-000000000008)
-- Level      : BEGINNER · Access : FREE · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Relational Foundations  → C1 The Relational Model · C2 SELECT Basics
--   M2 Reading Data            → C3 Filtering & Sorting · C4 Joins & Relationships
--   M3 Aggregation & Analysis  → C5 Aggregation & GROUP BY · C6 Subqueries & CTEs
--   M4 Writing Data & Schemas  → C7 INSERT, UPDATE & DELETE · C8 DDL & Constraints
--   M5 Transactions & Real SQL → C9 Transactions · C10 Capstone: Analytics Queries
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across quizzes + `quizzes` and `quiz_options`.
--
-- Idempotency: every statement uses ON CONFLICT (id) DO NOTHING with fixed,
-- deterministic UUIDs, so this file can be re-run safely.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. COURSE + OBJECTIVES
-- ----------------------------------------------------------------------------

INSERT INTO courses (
  id, instructor_id, category_id, name, slug, description, status, level, access_type, position
) VALUES (
  '01500000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000003',
  '20000000-0000-4000-8000-000000000008',
  'SQL Fundamentals',
  'sql-fundamentals',
  'Learn SQL from first principles: the relational model, filtering and sorting, joins, aggregation, subqueries, data modification, constraints, and transactions — then finish by writing real analytics queries against a sample store database.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  19
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01500000-0000-4000-8000-000000000011', '01500000-0000-4000-8000-000000000001', 'Explain the relational model: tables, rows, columns, primary keys, and foreign keys.', 1),
  ('01500000-0000-4000-8000-000000000012', '01500000-0000-4000-8000-000000000001', 'Write SELECT queries that project columns, filter with WHERE, and sort with ORDER BY and LIMIT.', 2),
  ('01500000-0000-4000-8000-000000000013', '01500000-0000-4000-8000-000000000001', 'Join tables with INNER and LEFT JOIN and summarize data with aggregate functions, GROUP BY, and HAVING.', 3),
  ('01500000-0000-4000-8000-000000000014', '01500000-0000-4000-8000-000000000001', 'Compose readable queries with subqueries, derived tables, and common table expressions.', 4),
  ('01500000-0000-4000-8000-000000000015', '01500000-0000-4000-8000-000000000001', 'Modify data with INSERT, UPDATE, and DELETE, design schemas with constraints and indexes, and protect integrity with transactions.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01500000-0000-4000-8000-000000000101', '01500000-0000-4000-8000-000000000001', 1, 'Relational Foundations',  'Understand the relational model, tables, keys, and your first SELECT queries.', 'PUBLISHED'),
  ('01500000-0000-4000-8000-000000000102', '01500000-0000-4000-8000-000000000001', 2, 'Reading Data',            'Filter, sort, and join rows to answer questions about your data.',           'PUBLISHED'),
  ('01500000-0000-4000-8000-000000000103', '01500000-0000-4000-8000-000000000001', 3, 'Aggregation & Analysis', 'Summarize data with aggregates, GROUP BY, HAVING, and subqueries.',          'PUBLISHED'),
  ('01500000-0000-4000-8000-000000000104', '01500000-0000-4000-8000-000000000001', 4, 'Writing Data & Schemas', 'Insert, update, and delete rows; design tables with constraints and indexes.','PUBLISHED'),
  ('01500000-0000-4000-8000-000000000105', '01500000-0000-4000-8000-000000000001', 5, 'Transactions & Real-World SQL', 'Protect integrity with transactions and apply everything in a capstone.', 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01500000-0000-4000-8000-000000000201', '01500000-0000-4000-8000-000000000101', 1, 'The Relational Model',      'Tables, rows, columns, and keys.',                          'PUBLISHED'),
  ('01500000-0000-4000-8000-000000000202', '01500000-0000-4000-8000-000000000101', 2, 'SELECT Basics',             'Project columns, alias them, and shape output.',            'PUBLISHED'),
  ('01500000-0000-4000-8000-000000000203', '01500000-0000-4000-8000-000000000102', 1, 'Filtering & Sorting',       'Filter with WHERE and order results.',                       'PUBLISHED'),
  ('01500000-0000-4000-8000-000000000204', '01500000-0000-4000-8000-000000000102', 2, 'Joins & Relationships',     'Connect related tables with joins.',                         'PUBLISHED'),
  ('01500000-0000-4000-8000-000000000205', '01500000-0000-4000-8000-000000000103', 1, 'Aggregation & GROUP BY',    'Summarize rows into groups.',                                'PUBLISHED'),
  ('01500000-0000-4000-8000-000000000206', '01500000-0000-4000-8000-000000000103', 2, 'Subqueries & CTEs',         'Compose nested and named result sets.',                      'PUBLISHED'),
  ('01500000-0000-4000-8000-000000000207', '01500000-0000-4000-8000-000000000104', 1, 'INSERT, UPDATE & DELETE',   'Modify data safely.',                                        'PUBLISHED'),
  ('01500000-0000-4000-8000-000000000208', '01500000-0000-4000-8000-000000000104', 2, 'DDL & Constraints',         'Create tables, types, constraints, and indexes.',            'PUBLISHED'),
  ('01500000-0000-4000-8000-000000000209', '01500000-0000-4000-8000-000000000105', 1, 'Transactions',               'ACID semantics and error recovery.',                         'PUBLISHED'),
  ('01500000-0000-4000-8000-000000000210', '01500000-0000-4000-8000-000000000105', 2, 'Capstone: Analytics Queries', 'Real-world reporting queries.',                             'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01500000-…-0301 .. 0328)
--    Every 3rd lesson is a QUIZ; the final lesson is the assessment.
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01500000-0000-4000-8000-000000000301', '01500000-0000-4000-8000-000000000201', 1, 'The Relational Model',        'Understand tables, rows, columns, and how keys connect them.', 'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01500000-0000-4000-8000-000000000302', '01500000-0000-4000-8000-000000000201', 2, 'Tables, Keys & Data Types',    'Classify data with types and link tables with primary and foreign keys.','TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01500000-0000-4000-8000-000000000303', '01500000-0000-4000-8000-000000000201', 3, 'Relational Foundations Quiz', 'Check your understanding of tables, keys, and the relational model.','QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('01500000-0000-4000-8000-000000000304', '01500000-0000-4000-8000-000000000202', 1, 'Your First SELECT Queries',   'Project columns, use SELECT *, and collapse duplicates with DISTINCT.','TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('01500000-0000-4000-8000-000000000305', '01500000-0000-4000-8000-000000000202', 2, 'Aliases, Expressions & Comments', 'Rename output, compute values, and annotate queries.','TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01500000-0000-4000-8000-000000000306', '01500000-0000-4000-8000-000000000202', 3, 'SELECT Basics Quiz',          'Test how well you project, alias, and deduplicate columns.','QUIZ',    'PUBLISHED', 'FREE', 15,  5),
  ('01500000-0000-4000-8000-000000000307', '01500000-0000-4000-8000-000000000203', 1, 'Filtering Rows with WHERE',   'Keep only the rows your conditions describe.',                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01500000-0000-4000-8000-000000000308', '01500000-0000-4000-8000-000000000203', 2, 'Sorting Results with ORDER BY & LIMIT', 'Order results and page through them cleanly.','TEXT',   'PUBLISHED', 'FREE', 10,  8),
  ('01500000-0000-4000-8000-000000000309', '01500000-0000-4000-8000-000000000203', 3, 'Filtering & Sorting Quiz',    'Verify you can filter rows and order the result set.','QUIZ',   'PUBLISHED', 'FREE', 15,  5),
  ('01500000-0000-4000-8000-000000000310', '01500000-0000-4000-8000-000000000204', 1, 'INNER JOIN: Connecting Tables', 'Pair rows from two tables on a matching key.',               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01500000-0000-4000-8000-000000000311', '01500000-0000-4000-8000-000000000204', 2, 'LEFT JOIN & Multi-Table Queries', 'Keep unmatched rows and join several tables at once.','TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('01500000-0000-4000-8000-000000000312', '01500000-0000-4000-8000-000000000204', 3, 'Joins & Relationships Quiz',  'Check what you know about INNER and LEFT joins.','QUIZ',      'PUBLISHED', 'FREE', 15,  5),
  ('01500000-0000-4000-8000-000000000313', '01500000-0000-4000-8000-000000000205', 1, 'Aggregate Functions',        'Summarize rows with COUNT, SUM, AVG, MIN, and MAX.',           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01500000-0000-4000-8000-000000000314', '01500000-0000-4000-8000-000000000205', 2, 'GROUP BY & HAVING',          'Summarize per group and filter those groups with HAVING.','TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('01500000-0000-4000-8000-000000000315', '01500000-0000-4000-8000-000000000205', 3, 'Aggregation Quiz',           'Test your grasp of aggregates, GROUP BY, and HAVING.','QUIZ',   'PUBLISHED', 'FREE', 15,  5),
  ('01500000-0000-4000-8000-000000000316', '01500000-0000-4000-8000-000000000206', 1, 'Subqueries in WHERE & SELECT', 'Nest queries to filter rows and compute inline values.','TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('01500000-0000-4000-8000-000000000317', '01500000-0000-4000-8000-000000000206', 2, 'Derived Tables & Common Table Expressions', 'Name intermediate results and build readable pipelines.','TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('01500000-0000-4000-8000-000000000318', '01500000-0000-4000-8000-000000000206', 3, 'Subqueries & CTEs Quiz',     'Check your nested and named result set skills.','QUIZ',        'PUBLISHED', 'FREE', 15,  5),
  ('01500000-0000-4000-8000-000000000319', '01500000-0000-4000-8000-000000000207', 1, 'Inserting Rows with INSERT', 'Add one row or many rows to a table.',                          'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01500000-0000-4000-8000-000000000320', '01500000-0000-4000-8000-000000000207', 2, 'Updating & Deleting Rows',   'Edit existing rows and remove them precisely.',                'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01500000-0000-4000-8000-000000000321', '01500000-0000-4000-8000-000000000207', 3, 'Data Modification Quiz',     'Verify you can insert, update, and delete safely.','QUIZ',      'PUBLISHED', 'FREE', 15,  5),
  ('01500000-0000-4000-8000-000000000322', '01500000-0000-4000-8000-000000000208', 1, 'CREATE TABLE & Data Types',  'Design tables and choose types for every column.',             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01500000-0000-4000-8000-000000000323', '01500000-0000-4000-8000-000000000208', 2, 'Constraints & Indexes',      'Police integrity with constraints and speed reads with indexes.','TEXT','PUBLISHED', 'FREE', 10,  8),
  ('01500000-0000-4000-8000-000000000324', '01500000-0000-4000-8000-000000000208', 3, 'DDL & Constraints Quiz',     'Test your schema design knowledge.','QUIZ',                      'PUBLISHED', 'FREE', 15,  5),
  ('01500000-0000-4000-8000-000000000325', '01500000-0000-4000-8000-000000000209', 1, 'Transactions & ACID',        'Group dependent changes into atomic, durable units.',           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01500000-0000-4000-8000-000000000326', '01500000-0000-4000-8000-000000000210', 1, 'Capstone Setup: The Analytics Database', 'Build the store schema and load sample data.','TEXT',          'PUBLISHED', 'FREE', 10,  8),
  ('01500000-0000-4000-8000-000000000327', '01500000-0000-4000-8000-000000000210', 2, 'Capstone Queries: Reporting in Practice', 'Answer revenue, ranking, and customer value questions.','TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('01500000-0000-4000-8000-000000000328', '01500000-0000-4000-8000-000000000210', 3, 'Final Assessment',           'Prove what you learned across the whole course.',                'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01500000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01500000-0000-4000-8000-000000000401',
  '01500000-0000-4000-8000-000000000301',
  1,
  'The Relational Model',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Relational Model</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Relational Model</h1>
  <p>A relational database stores data in <strong>tables</strong>. Think of a table as a spreadsheet: the columns define one attribute of each record, and the rows are individual records.</p>
  <table>
    <tr><th>customer_id</th><th>first_name</th><th>city</th><th>vip</th></tr>
    <tr><td>1</td><td>Anita</td><td>Lisbon</td><td>true</td></tr>
    <tr><td>2</td><td>Marco</td><td>Berlin</td><td>false</td></tr>
    <tr><td>3</td><td>Lina</td><td>Oslo</td><td>true</td></tr>
  </table>
  <h2>Rows and columns</h2>
  <ul>
    <li>A <strong>column</strong> holds one attribute (for example <span class="ic">city</span>) for every row.</li>
    <li>A <strong>row</strong> is one complete record; its values line up with the columns.</li>
    <li>A <strong>table</strong> is the set of rows that share the same columns.</li>
  </ul>
  <h2>Keys connect tables</h2>
  <p>Tables do not live in isolation. A <strong>primary key</strong> uniquely identifies each row, and a <strong>foreign key</strong> stores the primary key of a related row in another table. That is how an order knows which customer placed it.</p>
  <h2>Our teaching database</h2>
  <p>Throughout this course you will query a small store: <span class="ic">customers</span>, <span class="ic">products</span>, and <span class="ic">orders</span>. A query selects columns from a table:</p>
  <pre class="code-block">SELECT first_name, city
FROM customers
WHERE city = 'Lisbon';</pre>
  <div class="callout callout-info">
    <strong>SQL dialects</strong>
    <p>SQL is standardized; PostgreSQL, MySQL, and SQL Server implement the standard with small additions. The examples here are standard SQL that works in nearly every relational engine.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Read queries aloud</strong>
    <p>&ldquo;Select first_name and city, from customers, where city is Lisbon.&rdquo; Reading a query as a sentence makes every clause easier to reason about.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000402',
  '01500000-0000-4000-8000-000000000302',
  1,
  'Tables, Keys & Data Types',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tables, Keys &amp; Data Types</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Tables, Keys &amp; Data Types</h1>
  <p>Before writing queries you should know how tables are shaped: which types hold which data, and how keys tie tables together.</p>
  <h2>The core data types</h2>
  <table>
    <tr><th>Type</th><th>Example</th><th>Notes</th></tr>
    <tr><td>INTEGER</td><td>42</td><td>Whole numbers; ideal for ids and counts</td></tr>
    <tr><td>NUMERIC</td><td>19.99</td><td>Exact decimals, great for money</td></tr>
    <tr><td>TEXT</td><td>Berlin</td><td>Strings of any length</td></tr>
    <tr><td>BOOLEAN</td><td>true</td><td>Yes / no</td></tr>
    <tr><td>TIMESTAMP</td><td>2026-09-17</td><td>Date and optionally time</td></tr>
  </table>
  <h2>Primary keys</h2>
  <p>A primary key is the column (or combination of columns) that uniquely identifies each row. It is never NULL and never repeats:</p>
  <pre class="code-block">CREATE TABLE customers (
  customer_id  INTEGER PRIMARY KEY,
  first_name   TEXT NOT NULL,
  city         TEXT
);</pre>
  <h2>Foreign keys</h2>
  <p>A foreign key stores the primary key of a related row. The orders table below references customers and products:</p>
  <pre class="code-block">CREATE TABLE orders (
  order_id    INTEGER PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(customer_id),
  product_id  INTEGER REFERENCES products(product_id),
  quantity    INTEGER
);</pre>
  <div class="callout">
    <strong>Types protect your data</strong>
    <p>Storing a price in TEXT invites typos like 19.9Z. Choosing NUMERIC makes the database reject values that do not fit.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Names first</strong>
    <p>Name columns with snake_case, one concept per name: <span class="ic">order_date</span>, not <span class="ic">date</span>. Clear names make every future query easier.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000404',
  '01500000-0000-4000-8000-000000000304',
  1,
  'Your First SELECT Queries',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your First SELECT Queries</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Your First SELECT Queries</h1>
  <p>Every read starts with <span class="ic">SELECT</span>. The clause lists the columns you want, and <span class="ic">FROM</span> names the table you read them from.</p>
  <h2>Anatomy of a SELECT</h2>
  <pre class="code-block">SELECT column1, column2
FROM table_name;</pre>
  <p>Each clause has its place; the output column order matches the order you write them in.</p>
  <h2>All columns with *</h2>
  <pre class="code-block">SELECT * FROM customers;</pre>
  <p><span class="ic">*</span> means every column. It is handy for exploration, but an explicit list is better in shared code because the result is stable even when the table changes.</p>
  <h2>Specific columns</h2>
  <pre class="code-block">SELECT first_name, last_name
FROM customers;</pre>
  <h2>Unique values with DISTINCT</h2>
  <pre class="code-block">SELECT DISTINCT city
FROM customers;</pre>
  <p><span class="ic">DISTINCT</span> collapses duplicate rows of the projected columns, so each city appears once.</p>
  <div class="callout callout-tip">
    <strong>Run it</strong>
    <p>Use a free playground like DB Fiddle or pgAdmin to run every example in this chapter. Hands-on repetition is how SQL sticks.</p>
  </div>
  <div class="callout callout-info">
    <strong>Whitespace is free</strong>
    <p>SQL ignores line breaks; the examples are laid out for your eyes, not for the parser.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000405',
  '01500000-0000-4000-8000-000000000305',
  1,
  'Aliases, Expressions & Comments',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aliases, Expressions &amp; Comments</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Aliases, Expressions &amp; Comments</h1>
  <p>Queries become more useful once you rename output, compute new values, and annotate the query itself.</p>
  <h2>Column aliases with AS</h2>
  <pre class="code-block">SELECT
  first_name AS "First",
  city       AS "Hometown"
FROM customers;</pre>
  <p>Use double quotes for an alias with spaces or mixed case. Without quotes, aliases stay word-free and lower-case.</p>
  <h2>Expressions in the column list</h2>
  <pre class="code-block">SELECT
  product_name,
  price * 4 AS "Price for 4"
FROM products;</pre>
  <p>Arithmetic works on columns: <span class="ic">+ - * / %</span>.</p>
  <h2>String expressions</h2>
  <pre class="code-block">SELECT
  first_name || ' ' || last_name AS full_name
FROM customers;</pre>
  <p>The pipe operator <span class="ic">||</span> concatenates text — standard SQL.</p>
  <h2>Comments</h2>
  <pre class="code-block">-- a single-line comment
SELECT city FROM customers;  /* block comment */

/* multi-line
   comment */</pre>
  <div class="callout callout-tip">
    <strong>Alias without quotes</strong>
    <p>For reporting keep names like <span class="ic">full_name</span>: lower-case, underscores. Quote only when a space is truly needed.</p>
  </div>
  <div class="callout callout-info">
    <strong>Aliases are output-only</strong>
    <p>An alias does not rename the column; it only changes the label in this query&rsquo;s result.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000407',
  '01500000-0000-4000-8000-000000000307',
  1,
  'Filtering Rows with WHERE',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Filtering Rows with WHERE</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Filtering Rows with WHERE</h1>
  <p>Most real queries need only <em>some</em> rows. <span class="ic">WHERE</span> tests each row and keeps the ones where the condition is true.</p>
  <h2>Comparison operators</h2>
  <table>
    <tr><th>Operator</th><th>Meaning</th></tr>
    <tr><td>=</td><td>equal</td></tr>
    <tr><td>&lt;&gt;</td><td>not equal</td></tr>
    <tr><td>&lt; / &gt;</td><td>less than / greater than</td></tr>
    <tr><td>&lt;= / &gt;=</td><td>less or equal / greater or equal</td></tr>
  </table>
  <h2>Equal and range filters</h2>
  <pre class="code-block">SELECT * FROM customers
WHERE city = 'Lisbon';

SELECT * FROM products
WHERE price &lt; 50
  AND price &gt;= 10;</pre>
  <h2>Combining with AND, OR, NOT</h2>
  <pre class="code-block">SELECT * FROM customers
WHERE (city = 'Lisbon' OR city = 'Porto')
  AND vip = true;</pre>
  <p>Parentheses say which conditions group first — <span class="ic">AND</span> binds tighter than <span class="ic">OR</span> otherwise.</p>
  <div class="callout">
    <strong>Quote text, not numbers</strong>
    <p>String and date values go in single quotes; numbers and booleans do not. Writing <span class="ic">WHERE price = '50'</span> invites type confusion.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Test one step at a time</strong>
    <p>Grow a filter incrementally: start with one condition, run it, then add the next. A wrong assumption shows up fast.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000408',
  '01500000-0000-4000-8000-000000000308',
  1,
  'Sorting Results with ORDER BY & LIMIT',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sorting Results with ORDER BY &amp; LIMIT</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Sorting Results with ORDER BY &amp; LIMIT</h1>
  <p>Query output is unordered until you ask for order. <span class="ic">ORDER BY</span> sorts the result; <span class="ic">LIMIT</span> caps how many rows come back.</p>
  <h2>ORDER BY basics</h2>
  <pre class="code-block">SELECT product_name, price
FROM products
ORDER BY price;</pre>
  <p>The default direction is ascending (low to high). Add <span class="ic">ASC</span> to be explicit or <span class="ic">DESC</span> to reverse:</p>
  <pre class="code-block">SELECT product_name, price
FROM products
ORDER BY price DESC;</pre>
  <h2>Multiple sort keys</h2>
  <pre class="code-block">SELECT city, last_name
FROM customers
ORDER BY city ASC, last_name ASC;</pre>
  <p>Rows sort by the first key; ties fall through to the next key.</p>
  <h2>Pagination with LIMIT and OFFSET</h2>
  <pre class="code-block">SELECT * FROM products
ORDER BY product_id
LIMIT 10 OFFSET 20;</pre>
  <p><span class="ic">LIMIT 10</span> returns ten rows; <span class="ic">OFFSET 20</span> skips the first twenty — page three of a ten-row page.</p>
  <div class="callout callout-tip">
    <strong>Always pair LIMIT with ORDER BY</strong>
    <p>Without a sort, the rows in the window are arbitrary; the same query can return a different slice next time.</p>
  </div>
  <div class="callout callout-info">
    <strong>NULL sorting</strong>
    <p>By default NULLs sort last when ascending in PostgreSQL. Use <span class="ic">NULLS LAST</span> to make that intent explicit.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000410',
  '01500000-0000-4000-8000-000000000310',
  1,
  'INNER JOIN: Connecting Tables',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>INNER JOIN: Connecting Tables</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>INNER JOIN: Connecting Tables</h1>
  <p>Foreign keys link tables, and <span class="ic">JOIN</span> walks those links so one query can read several tables together.</p>
  <h2>Why join at all</h2>
  <p>Orders store only the <span class="ic">customer_id</span>. To show the customer&rsquo;s name beside each order, the names must be looked up in <span class="ic">customers</span>.</p>
  <h2>INNER JOIN anatomy</h2>
  <pre class="code-block">SELECT
  orders.order_id,
  customers.first_name
FROM orders
INNER JOIN customers
  ON orders.customer_id = customers.customer_id;</pre>
  <p><span class="ic">ON</span> states the matching rule. Every order row pairs with the customer row whose key matches.</p>
  <h2>Aliasing tables</h2>
  <pre class="code-block">SELECT o.order_id, c.first_name
FROM orders AS o
INNER JOIN customers AS c
  ON o.customer_id = c.customer_id;</pre>
  <h2>What drops out</h2>
  <p>An <span class="ic">INNER JOIN</span> keeps only pairs that match. An order whose customer is missing disappears, and a customer with no orders simply does not appear.</p>
  <div class="callout callout-tip">
    <strong>Column-qualify names</strong>
    <p>When both tables share a column name, qualify it as <span class="ic">table.column</span> or the parser cannot tell them apart.</p>
  </div>
  <div class="callout callout-info">
    <strong>Equality joins are symmetric</strong>
    <p>Joining A to B with <span class="ic">ON a.id = b.id</span> is identical in reverse; the direction only matters once one side must keep all its rows.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000411',
  '01500000-0000-4000-8000-000000000311',
  1,
  'LEFT JOIN & Multi-Table Queries',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LEFT JOIN &amp; Multi-Table Queries</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>LEFT JOIN &amp; Multi-Table Queries</h1>
  <p><span class="ic">INNER JOIN</span> hides unmatched rows. <span class="ic">LEFT JOIN</span> keeps every left-side row and fills the missing right side with NULLs.</p>
  <h2>LEFT JOIN in action</h2>
  <pre class="code-block">SELECT
  c.first_name,
  o.order_id
FROM customers AS c
LEFT JOIN orders AS o
  ON c.customer_id = o.customer_id;</pre>
  <p>Every customer appears at least once; those with no orders show <span class="ic">order_id</span> as NULL.</p>
  <h2>Joining three tables</h2>
  <pre class="code-block">SELECT
  o.order_id,
  c.first_name,
  p.product_name
FROM orders AS o
INNER JOIN customers AS c
  ON o.customer_id = c.customer_id
INNER JOIN products AS p
  ON o.product_id = p.product_id;</pre>
  <p>Each join adds the next related table. Read it as: orders, matched to their customer, matched to their product.</p>
  <h2>Finding the unmatched</h2>
  <pre class="code-block">SELECT c.first_name, o.order_id
FROM customers AS c
LEFT JOIN orders AS o
  ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;</pre>
  <p>This lists customers who never ordered — NULL in the join result flags the missing match.</p>
  <div class="callout callout-tip">
    <strong>LEFT for the base entity</strong>
    <p>Start from the table whose rows must all survive (customers) and LEFT JOIN toward the optional detail (orders).</p>
  </div>
  <div class="callout callout-info">
    <strong>Beware row multiplication</strong>
    <p>One customer with three orders yields three rows in the result. Count on that duplication as a feature, not a bug.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000413',
  '01500000-0000-4000-8000-000000000313',
  1,
  'Aggregate Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aggregate Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Aggregate Functions</h1>
  <p>Aggregates collapse many rows into a single summary value. They power dashboards and business reports.</p>
  <h2>The five essentials</h2>
  <table>
    <tr><th>Function</th><th>Returns</th></tr>
    <tr><td>COUNT(*)</td><td>number of rows</td></tr>
    <tr><td>SUM(column)</td><td>total of numeric values</td></tr>
    <tr><td>AVG(column)</td><td>mean of numeric values</td></tr>
    <tr><td>MIN(column)</td><td>smallest value</td></tr>
    <tr><td>MAX(column)</td><td>largest value</td></tr>
  </table>
  <h2>Using them together</h2>
  <pre class="code-block">SELECT
  COUNT(*)            AS order_count,
  SUM(o.quantity)     AS units_sold,
  AVG(o.quantity)     AS avg_units,
  MIN(o.order_date)   AS first_order,
  MAX(o.order_date)   AS last_order
FROM orders AS o;</pre>
  <h2>COUNT(*) versus COUNT(column)</h2>
  <pre class="code-block">SELECT
  COUNT(*)    AS total_rows,
  COUNT(city) AS cities_with_values
FROM customers;</pre>
  <p><span class="ic">COUNT(*)</span> counts rows; <span class="ic">COUNT(city)</span> counts only non-NULL values. The other four aggregates skip NULLs too.</p>
  <div class="callout callout-tip">
    <strong>Distinct counts</strong>
    <p><span class="ic">COUNT(DISTINCT city)</span> counts each distinct value once — a quick way to size a column before designing with it.</p>
  </div>
  <div class="callout callout-info">
    <strong>One row comes out</strong>
    <p>Without GROUP BY, aggregates read the whole table and return exactly one row.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000414',
  '01500000-0000-4000-8000-000000000314',
  1,
  'GROUP BY & HAVING',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GROUP BY &amp; HAVING</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>GROUP BY &amp; HAVING</h1>
  <p>Aggregates become powerful when applied to groups: per-city totals, per-category averages, per-month counts.</p>
  <h2>Grouping rows</h2>
  <pre class="code-block">SELECT
  c.city,
  COUNT(*) AS customer_count
FROM customers AS c
GROUP BY c.city;</pre>
  <p>Rows sharing a city collapse into one group; <span class="ic">COUNT(*)</span> runs inside each group.</p>
  <h2>Grouping by several columns</h2>
  <pre class="code-block">SELECT
  p.category,
  p.product_name,
  SUM(o.quantity) AS sold
FROM products AS p
INNER JOIN orders AS o
  ON p.product_id = o.product_id
GROUP BY p.category, p.product_name;</pre>
  <h2>Filtering groups with HAVING</h2>
  <pre class="code-block">SELECT
  c.city,
  COUNT(*) AS customer_count
FROM customers AS c
GROUP BY c.city
HAVING COUNT(*) &gt;= 3;</pre>
  <h2>WHERE versus HAVING</h2>
  <table>
    <tr><th>Clause</th><th>Runs</th><th>Filters</th></tr>
    <tr><td>WHERE</td><td>before grouping</td><td>individual rows</td></tr>
    <tr><td>HAVING</td><td>after grouping</td><td>whole groups</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Columns in SELECT must be grouped</strong>
    <p>Any non-aggregated column in the SELECT list must appear in GROUP BY, or each group has many candidate values.</p>
  </div>
  <div class="callout callout-info">
    <strong>HAVING can use aggregates</strong>
    <p>HAVING is the only clause where <span class="ic">COUNT(*)</span> belongs — WHERE cannot reference an aggregate.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000416',
  '01500000-0000-4000-8000-000000000316',
  1,
  'Subqueries in WHERE & SELECT',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subqueries in WHERE &amp; SELECT</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Subqueries in WHERE &amp; SELECT</h1>
  <p>A subquery is a SELECT inside another query. Depending on where it sits, it can filter rows or act as a computed value.</p>
  <h2>Scalar subquery</h2>
  <p>Returning exactly one value (one row, one column) lets you compare against a number or text:</p>
  <pre class="code-block">SELECT product_name, price
FROM products
WHERE price &gt; (
  SELECT AVG(price) FROM products
);</pre>
  <h2>IN (subquery)</h2>
  <pre class="code-block">SELECT first_name
FROM customers
WHERE customer_id IN (
  SELECT DISTINCT customer_id FROM orders
);</pre>
  <p>Rows survive when their value appears anywhere in the subquery&rsquo;s result list.</p>
  <h2>EXISTS correlated subquery</h2>
  <pre class="code-block">SELECT c.first_name
FROM customers AS c
WHERE EXISTS (
  SELECT 1
  FROM orders AS o
  WHERE o.customer_id = c.customer_id
);</pre>
  <p><span class="ic">EXISTS</span> inspects the outer row as it goes; it stops at the first match, so <span class="ic">SELECT 1</span> is enough.</p>
  <h2>Subquery in the SELECT list</h2>
  <pre class="code-block">SELECT
  c.first_name,
  (
    SELECT SUM(o.quantity)
    FROM orders AS o
    WHERE o.customer_id = c.customer_id
  ) AS units_bought
FROM customers AS c;</pre>
  <div class="callout callout-tip">
    <strong>Match the tool to the task</strong>
    <p>Use <span class="ic">IN</span> when the value list is small and <span class="ic">EXISTS</span> when the check runs per row; both answer &ldquo;does this value have a match?&rdquo;</p>
  </div>
  <div class="callout callout-info">
    <strong>Correlated subqueries repeat</strong>
    <p>A correlated subquery runs once per outer row; on big tables a JOIN or CTE is often the faster, clearer rewrite.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000417',
  '01500000-0000-4000-8000-000000000317',
  1,
  'Derived Tables & Common Table Expressions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Derived Tables &amp; Common Table Expressions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Derived Tables &amp; Common Table Expressions</h1>
  <p>When a query grows complex, name an intermediate result and build on it.</p>
  <h2>Derived table in FROM</h2>
  <pre class="code-block">SELECT city, customer_count
FROM (
  SELECT city, COUNT(*) AS customer_count
  FROM customers
  GROUP BY city
) AS city_stats
WHERE customer_count &gt;= 3;</pre>
  <p>The parentheses contain a full query used as a source, exactly like a table.</p>
  <h2>Common table expression (CTE)</h2>
  <pre class="code-block">WITH city_stats AS (
  SELECT city, COUNT(*) AS customer_count
  FROM customers
  GROUP BY city
)
SELECT city, customer_count
FROM city_stats
WHERE customer_count &gt;= 3;</pre>
  <p><span class="ic">WITH</span> names the result set once, at the top, and the main query reads it like a table.</p>
  <h2>Several CTEs chained</h2>
  <pre class="code-block">WITH
ordered AS (
  SELECT customer_id, order_id FROM orders
),
counted AS (
  SELECT customer_id, COUNT(*) AS orders
  FROM ordered
  GROUP BY customer_id
)
SELECT c.first_name, n.orders
FROM customers AS c
LEFT JOIN counted AS n USING (customer_id);</pre>
  <div class="callout callout-tip">
    <strong>CTEs read top-down</strong>
    <p>Write the steps in the order humans follow: collect, aggregate, join. The next reader thanks you.</p>
  </div>
  <div class="callout callout-info">
    <strong>CTEs can recurse</strong>
    <p>A recursive CTE calls itself to walk trees like employee hierarchies or bill-of-materials — a classic SQL power move.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000419',
  '01500000-0000-4000-8000-000000000319',
  1,
  'Inserting Rows with INSERT',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inserting Rows with INSERT</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Inserting Rows with INSERT</h1>
  <p>Writing data starts with <span class="ic">INSERT</span>. It adds rows to a table, one at a time or many at once.</p>
  <h2>Insert with a column list</h2>
  <pre class="code-block">INSERT
  INTO customers (first_name, last_name, city)
VALUES
  ('Ana', 'Silva', 'Lisbon');</pre>
  <p>Columns not listed get their default or NULL.</p>
  <h2>Multiple rows in one statement</h2>
  <pre class="code-block">INSERT
  INTO products (product_name, category, price)
VALUES
  ('Espresso Machine', 'Kitchen', 299.00),
  ('Filter Basket', 'Kitchen', 19.99);</pre>
  <h2>Value order follows columns</h2>
  <pre class="code-block">INSERT
  INTO customers
VALUES (101, 'Maya', 'Petros', 'Oslo', true);</pre>
  <p>Without a column list the server assumes every column in table order — brittle and easy to break.</p>
  <h2>RETURNING hands back the row</h2>
  <pre class="code-block">INSERT
  INTO orders (customer_id, product_id, quantity)
VALUES (1, 2, 3)
RETURNING order_id;</pre>
  <p>The new id comes straight back — no extra SELECT needed.</p>
  <div class="callout callout-tip">
    <strong>Always list columns</strong>
    <p>An explicit list survives schema changes and makes the mapping between values and columns visible.</p>
  </div>
  <div class="callout callout-info">
    <strong>One statement, many rows</strong>
    <p>Batch inserts are dramatically faster than thousands of single-row statements and are still atomic.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000420',
  '01500000-0000-4000-8000-000000000320',
  1,
  'Updating & Deleting Rows',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Updating &amp; Deleting Rows</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Updating &amp; Deleting Rows</h1>
  <p>Data evolves. <span class="ic">UPDATE</span> edits existing rows; <span class="ic">DELETE</span> removes them. Both are powerful — and both honor a WHERE.</p>
  <h2>UPDATE</h2>
  <pre class="code-block">UPDATE customers
SET city = 'Porto'
WHERE customer_id = 1;</pre>
  <h2>Setting several columns</h2>
  <pre class="code-block">UPDATE products
SET
  price = price * 1.1,
  updated_at = CURRENT_TIMESTAMP
WHERE category = 'Kitchen';</pre>
  <p>The expression can draw on the row&rsquo;s own current value.</p>
  <h2>DELETE</h2>
  <pre class="code-block">DELETE FROM orders
WHERE order_id = 42;</pre>
  <h2>Without WHERE, everything goes</h2>
  <pre class="code-block">DELETE FROM archive_logs;  -- removes ALL rows</pre>
  <p>There is no confirmation prompt. A bare <span class="ic">DELETE</span> (or <span class="ic">UPDATE</span>) touches the whole table.</p>
  <div class="callout">
    <strong>Write WHERE first</strong>
    <p>Draft the <span class="ic">SELECT ... WHERE</span> that shows the target rows, run it, then turn it into the DELETE. You delete exactly what you inspected.</p>
  </div>
  <div class="callout callout-tip">
    <strong>TRUNCATE is different</strong>
    <p>To wipe every row fast, use <span class="ic">TRUNCATE</span>. It ignores WHERE and resets the table in one shot.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000422',
  '01500000-0000-4000-8000-000000000322',
  1,
  'CREATE TABLE & Data Types',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CREATE TABLE &amp; Data Types</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>CREATE TABLE &amp; Data Types</h1>
  <p>Schemas start with <span class="ic">CREATE TABLE</span>, naming columns and their types before any data arrives.</p>
  <h2>Creating a table</h2>
  <pre class="code-block">CREATE TABLE products (
  product_id   INTEGER PRIMARY KEY,
  product_name TEXT NOT NULL,
  category     TEXT,
  price        NUMERIC(10, 2)
);</pre>
  <h2>Choosing types</h2>
  <table>
    <tr><th>Purpose</th><th>Type</th></tr>
    <tr><td>whole numbers</td><td>INTEGER</td></tr>
    <tr><td>exact decimals</td><td>NUMERIC(10, 2)</td></tr>
    <tr><td>flexible text</td><td>TEXT</td></tr>
    <tr><td>dates / timestamps</td><td>TIMESTAMP</td></tr>
    <tr><td>yes or no</td><td>BOOLEAN</td></tr>
  </table>
  <h2>Altering a table</h2>
  <pre class="code-block">ALTER TABLE products
  ADD COLUMN in_stock INTEGER DEFAULT 0;</pre>
  <p>ALTER shapes an existing schema: add or drop columns, rename them, change their types.</p>
  <h2>Dropping a table</h2>
  <pre class="code-block">DROP TABLE IF EXISTS draft_notes;</pre>
  <p><span class="ic">IF EXISTS</span> keeps the script from failing when the table is already gone. DROP is destructive, so think before running it.</p>
  <div class="callout callout-tip">
    <strong>Never DROP in production by habit</strong>
    <p>Deliberate schema changes belong in versioned migration files with backups, not ad-hoc terminal sessions.</p>
  </div>
  <div class="callout callout-info">
    <strong>DEFAULT helps inserts</strong>
    <p>A sensible default (like <span class="ic">DEFAULT 0</span>) saves writers from supplying a value on every insert.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000423',
  '01500000-0000-4000-8000-000000000323',
  1,
  'Constraints & Indexes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Constraints &amp; Indexes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Constraints &amp; Indexes</h1>
  <p>Constraints police the data; indexes speed up reading it. Good schemas lean on both.</p>
  <h2>The common constraints</h2>
  <table>
    <tr><th>Constraint</th><th>Guarantees</th></tr>
    <tr><td>NOT NULL</td><td>a value is always present</td></tr>
    <tr><td>UNIQUE</td><td>no two rows share a value</td></tr>
    <tr><td>CHECK</td><td>values satisfy a condition</td></tr>
    <tr><td>DEFAULT</td><td>a fallback when none is given</td></tr>
    <tr><td>PRIMARY KEY</td><td>unique plus NOT NULL</td></tr>
    <tr><td>FOREIGN KEY</td><td>points to a row in another table</td></tr>
  </table>
  <h2>CHECK in action</h2>
  <pre class="code-block">CREATE TABLE products (
  product_id  INTEGER PRIMARY KEY,
  price       NUMERIC(10, 2) CHECK (price &gt;= 0),
  quantity    INTEGER CHECK (quantity &gt;= 0)
);</pre>
  <p>A negative price or quantity is caught by the database itself.</p>
  <h2>Indexes speed lookups</h2>
  <pre class="code-block">CREATE INDEX idx_orders_customer ON orders (customer_id);

SELECT * FROM orders WHERE customer_id = 1;</pre>
  <p>The index acts like a lookup table for the column, so the filtered read skips most of the file.</p>
  <div class="callout callout-tip">
    <strong>Index foreign keys first</strong>
    <p>Columns used in JOIN ON conditions and frequent WHERE filters are the usual index candidates.</p>
  </div>
  <div class="callout callout-info">
    <strong>Indexes cost writes</strong>
    <p>Every index must be updated on INSERT and UPDATE. Fire at the filters that matter, not at every column.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000425',
  '01500000-0000-4000-8000-000000000325',
  1,
  'Transactions & ACID',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transactions &amp; ACID</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Transactions &amp; ACID</h1>
  <p>Multi-step changes must not leave the data half-done — a failed transfer must not debit one account and skip the credit. Transactions solve this problem.</p>
  <h2>ACID in one glance</h2>
  <ul>
    <li><strong>Atomicity</strong> — the whole transaction applies, or none of it does.</li>
    <li><strong>Consistency</strong> — constraints hold before and after.</li>
    <li><strong>Isolation</strong> — concurrent transactions cannot see half-applied work.</li>
    <li><strong>Durability</strong> — once committed, the change survives a crash.</li>
  </ul>
  <h2>BEGIN, COMMIT, ROLLBACK</h2>
  <pre class="code-block">BEGIN;

UPDATE accounts
SET balance = balance - 100
WHERE account_id = 10;

UPDATE accounts
SET balance = balance + 100
WHERE account_id = 20;

COMMIT;</pre>
  <p>If anything fails before <span class="ic">COMMIT</span>, run <span class="ic">ROLLBACK</span> and both updates dissolve together.</p>
  <h2>Savepoints for partial rollback</h2>
  <pre class="code-block">BEGIN;

SAVEPOINT after_first_step;

UPDATE accounts SET balance = balance - 100 WHERE account_id = 10;

-- something looks wrong: undo just that update
ROLLBACK TO after_first_step;

COMMIT;</pre>
  <div class="callout callout-tip">
    <strong>Autocommit is the default</strong>
    <p>Drivers commit single statements automatically. Wrap dependent writes in an explicit BEGIN/COMMIT pair so they become one unit.</p>
  </div>
  <div class="callout callout-info">
    <strong>Nobody sees half the work</strong>
    <p>Readers under the default isolation never observe a transaction that started and has not committed yet.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000426',
  '01500000-0000-4000-8000-000000000326',
  1,
  'Capstone Setup: The Analytics Database',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone Setup: The Analytics Database</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone Setup: The Analytics Database</h1>
  <p>Time to apply everything. We run a small online store and need reports: revenue, top products, customer value.</p>
  <h2>The schema</h2>
  <pre class="code-block">CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY,
  first_name  TEXT NOT NULL,
  city        TEXT
);

CREATE TABLE products (
  product_id   INTEGER PRIMARY KEY,
  product_name TEXT NOT NULL,
  category     TEXT,
  price        NUMERIC(10, 2) NOT NULL
);

CREATE TABLE orders (
  order_id    INTEGER PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES customers(customer_id),
  product_id  INTEGER NOT NULL REFERENCES products(product_id),
  quantity    INTEGER NOT NULL CHECK (quantity &gt; 0),
  order_date  DATE NOT NULL
);</pre>
  <h2>Loading some data</h2>
  <pre class="code-block">INSERT
  INTO customers (customer_id, first_name, city) VALUES
  (1, 'Ana', 'Lisbon'),
  (2, 'Marco', 'Berlin');

INSERT
  INTO orders (customer_id, product_id, quantity, order_date) VALUES
  (1, 2, 3, '2026-01-10'),
  (1, 1, 1, '2026-02-14'),
  (2, 2, 2, '2026-03-02');</pre>
  <h2>Sanity-check your data</h2>
  <pre class="code-block">SELECT COUNT(*) AS orders
FROM orders;</pre>
  <p>Always fetch a couple of rows before building an entire report.</p>
  <div class="callout callout-tip">
    <strong>Recreate freely while learning</strong>
    <p>At this stage DROP and re-run the scripts as often as you like — it is the fastest way to try variations.</p>
  </div>
  <div class="callout callout-info">
    <strong>Real reports join first</strong>
    <p>Almost every capstone query in the next lesson starts from a join, so knowing this schema cold pays off.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01500000-0000-4000-8000-000000000427',
  '01500000-0000-4000-8000-000000000327',
  1,
  'Capstone Queries: Reporting in Practice',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone Queries: Reporting in Practice</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #06b6d4; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0e7490; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfeff; color: #0e7490; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #cffafe; border-left: 4px solid #06b6d4; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0284c7; }
.lesson-page .callout-tip { background: #d1fae5; border-left-color: #10b981; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #67e8f9; }
.dark .lesson-page .ic { background: #164e63; color: #a5f3fc; }
.dark .lesson-page .callout { background: #164e63; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #064e3b; border-left-color: #34d399; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone Queries: Reporting in Practice</h1>
  <p>Four questions to answer against the store, from aggregation to a final analytical query.</p>
  <h2>1. Revenue by month</h2>
  <pre class="code-block">SELECT
  DATE_TRUNC('month', o.order_date) AS month,
  SUM(o.quantity * p.price)          AS revenue
FROM orders AS o
INNER JOIN products AS p
  ON o.product_id = p.product_id
GROUP BY month
ORDER BY month;</pre>
  <h2>2. Top products by units sold</h2>
  <pre class="code-block">SELECT
  p.product_name,
  SUM(o.quantity) AS units
FROM orders AS o
INNER JOIN products AS p
  ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY units DESC
LIMIT 5;</pre>
  <h2>3. Customer lifetime value</h2>
  <pre class="code-block">SELECT
  c.first_name,
  COALESCE(SUM(o.quantity * p.price), 0) AS lifetime_value
FROM customers AS c
LEFT JOIN orders AS o
  ON c.customer_id = o.customer_id
LEFT JOIN products AS p
  ON o.product_id = p.product_id
GROUP BY c.first_name
ORDER BY lifetime_value DESC;</pre>
  <p><span class="ic">COALESCE</span> turns a NULL total into zero for customers without orders.</p>
  <h2>4. Repeat buyers</h2>
  <pre class="code-block">SELECT
  c.first_name,
  COUNT(o.order_id) AS orders
FROM customers AS c
INNER JOIN orders AS o
  ON c.customer_id = o.customer_id
GROUP BY c.first_name
HAVING COUNT(o.order_id) &gt; 1;</pre>
  <div class="callout callout-tip">
    <strong>Read each clause top to bottom</strong>
    <p>Run the FROM/JOIN part alone, then add GROUP BY, then HAVING. Building reports in stages keeps bugs visible.</p>
  </div>
  <div class="callout callout-info">
    <strong>You are ready</strong>
    <p>These patterns — joins, aggregation, aliases, LEFT JOIN, HAVING — are the spine of most production analytics queries. Practice variations on your own data next.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES  (29 questions)
--    Q1-3 for lesson 303 · Q4-6 for 306 · Q7-9 for 309 · Q10-12 for 312
--    Q13-15 for 315 · Q16-18 for 318 · Q19-21 for 321 · Q22-24 for 324
--    Q25-29 for final assessment 328.
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('01500000-0000-4000-8000-000000000501', '01500000-0000-4000-8000-000000000303',
   'Which part of a relational table holds one fact about a single record?',
   'A column stores one attribute for every row; a row is one record.', 1),
  ('01500000-0000-4000-8000-000000000502', '01500000-0000-4000-8000-000000000303',
   'What uniquely identifies every row in a table?',
   'A primary key is a column (or set of columns) that uniquely identifies each row.', 2),
  ('01500000-0000-4000-8000-000000000503', '01500000-0000-4000-8000-000000000303',
   'Which statement returns every column from a table without filtering?',
   'SELECT * FROM table_name; reads all columns and all rows.', 3),
  ('01500000-0000-4000-8000-000000000504', '01500000-0000-4000-8000-000000000306',
   'Which keyword removes duplicate rows from a result set?',
   'SELECT DISTINCT returns only unique values for the projected columns.', 1),
  ('01500000-0000-4000-8000-000000000505', '01500000-0000-4000-8000-000000000306',
   'What does the AS keyword do in a query?',
   'AS renames a column or expression in the output — an alias.', 2),
  ('01500000-0000-4000-8000-000000000506', '01500000-0000-4000-8000-000000000306',
   'How do you write an alias that contains spaces?',
   'Double quotes allow spaces and mixed case: "Full Name".', 3),
  ('01500000-0000-4000-8000-000000000507', '01500000-0000-4000-8000-000000000309',
   'Which operator tests equality in a SQL WHERE clause?',
   'SQL uses a single equals sign, not the == of many programming languages.', 1),
  ('01500000-0000-4000-8000-000000000508', '01500000-0000-4000-8000-000000000309',
   'Which keyword requires all listed conditions to be true?',
   'AND keeps a row only when every condition is satisfied.', 2),
  ('01500000-0000-4000-8000-000000000509', '01500000-0000-4000-8000-000000000309',
   'What does ORDER BY price DESC return first?',
   'DESC sorts descending, so the highest price appears first.', 3),
  ('01500000-0000-4000-8000-000000000510', '01500000-0000-4000-8000-000000000312',
   'Which join returns rows only when a match exists in BOTH tables?',
   'INNER JOIN drops unmatched rows from either side.', 1),
  ('01500000-0000-4000-8000-000000000511', '01500000-0000-4000-8000-000000000312',
   'Which join keeps every row from the left table, even without a match?',
   'LEFT JOIN preserves the left table and fills the right side with NULLs.', 2),
  ('01500000-0000-4000-8000-000000000512', '01500000-0000-4000-8000-000000000312',
   'Why alias tables when joining several together?',
   'Table aliases make column references shorter and unambiguous.', 3),
  ('01500000-0000-4000-8000-000000000513', '01500000-0000-4000-8000-000000000315',
   'Which aggregate function counts rows in a result set?',
   'COUNT(*) counts rows; COUNT(column) counts non-NULL values.', 1),
  ('01500000-0000-4000-8000-000000000514', '01500000-0000-4000-8000-000000000315',
   'What does GROUP BY do to the result set?',
   'It collapses rows that share a value into one group per value.', 2),
  ('01500000-0000-4000-8000-000000000515', '01500000-0000-4000-8000-000000000315',
   'Which clause filters groups after aggregation?',
   'HAVING applies to grouped rows; WHERE filters before grouping.', 3),
  ('01500000-0000-4000-8000-000000000516', '01500000-0000-4000-8000-000000000318',
   'What is a scalar subquery?',
   'It returns exactly one value (one row, one column) usable as an expression.', 1),
  ('01500000-0000-4000-8000-000000000517', '01500000-0000-4000-8000-000000000318',
   'What does WHERE id IN (SELECT ...) match?',
   'It keeps rows whose id equals any value returned by the subquery.', 2),
  ('01500000-0000-4000-8000-000000000518', '01500000-0000-4000-8000-000000000318',
   'What is a common table expression (CTE)?',
   'A WITH ... AS named result set that lives for the duration of one query.', 3),
  ('01500000-0000-4000-8000-000000000519', '01500000-0000-4000-8000-000000000321',
   'Which statement adds rows to a table?',
   'The INSERT statement adds one or more rows to a table.', 1),
  ('01500000-0000-4000-8000-000000000520', '01500000-0000-4000-8000-000000000321',
   'What does UPDATE modify?',
   'UPDATE changes existing rows; it never adds or removes rows.', 2),
  ('01500000-0000-4000-8000-000000000521', '01500000-0000-4000-8000-000000000321',
   'Why almost always add a WHERE to a DELETE?',
   'Without a WHERE, DELETE removes every row in the table.', 3),
  ('01500000-0000-4000-8000-000000000522', '01500000-0000-4000-8000-000000000324',
   'Which type stores whole numbers in most SQL databases?',
   'INTEGER (or INT) holds whole numbers such as 42.', 1),
  ('01500000-0000-4000-8000-000000000523', '01500000-0000-4000-8000-000000000324',
   'Which constraint forces a column to always hold a value?',
   'NOT NULL rejects NULLs, so every inserted row must supply a value.', 2),
  ('01500000-0000-4000-8000-000000000524', '01500000-0000-4000-8000-000000000324',
   'What does a FOREIGN KEY reference?',
   'A foreign key references a primary key in another table, linking records.', 3),
  ('01500000-0000-4000-8000-000000000525', '01500000-0000-4000-8000-000000000328',
   'Which shows the standard clause order of a SELECT?',
   'SELECT to FROM to WHERE to GROUP BY to HAVING to ORDER BY is the required flow.', 1),
  ('01500000-0000-4000-8000-000000000526', '01500000-0000-4000-8000-000000000328',
   'Which statement undoes the work of a transaction?',
   'ROLLBACK discards all changes made in the current transaction.', 2),
  ('01500000-0000-4000-8000-000000000527', '01500000-0000-4000-8000-000000000328',
   'Which join shows only the rows matched in both tables?',
   'INNER JOIN removes rows that appear on only one side.', 3),
  ('01500000-0000-4000-8000-000000000528', '01500000-0000-4000-8000-000000000328',
   'What does COUNT(DISTINCT city) return?',
   'It counts the unique, non-NULL city values in the set.', 4),
  ('01500000-0000-4000-8000-000000000529', '01500000-0000-4000-8000-000000000328',
   'What is the main reason to parameterize SQL in application code?',
   'Parameterization prevents SQL injection by separating code from values.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): the column
  ('01500000-0000-4000-8000-000000001001', '01500000-0000-4000-8000-000000000501', 'Column', TRUE,  1),
  ('01500000-0000-4000-8000-000000001002', '01500000-0000-4000-8000-000000000501', 'Row', FALSE, 2),
  ('01500000-0000-4000-8000-000000001003', '01500000-0000-4000-8000-000000000501', 'Index', FALSE, 3),
  ('01500000-0000-4000-8000-000000001004', '01500000-0000-4000-8000-000000000501', 'Query', FALSE, 4),
  -- Q1 (501)q2: primary key
  ('01500000-0000-4000-8000-000000001005', '01500000-0000-4000-8000-000000000502', 'Foreign key', FALSE, 1),
  ('01500000-0000-4000-8000-000000001006', '01500000-0000-4000-8000-000000000502', 'Primary key', TRUE,  2),
  ('01500000-0000-4000-8000-000000001007', '01500000-0000-4000-8000-000000000502', 'Index', FALSE, 3),
  ('01500000-0000-4000-8000-000000001008', '01500000-0000-4000-8000-000000000502', 'Alias', FALSE, 4),
  -- Q1 (501)q3: SELECT *
  ('01500000-0000-4000-8000-000000001009', '01500000-0000-4000-8000-000000000503', 'ALL FROM products;', FALSE, 1),
  ('01500000-0000-4000-8000-000000001010', '01500000-0000-4000-8000-000000000503', 'SELECT rows FROM products;', FALSE, 2),
  ('01500000-0000-4000-8000-000000001011', '01500000-0000-4000-8000-000000000503', 'SELECT * FROM products;', TRUE,  3),
  ('01500000-0000-4000-8000-000000001012', '01500000-0000-4000-8000-000000000503', 'LIST products;', FALSE, 4),
  -- Q2 (504): distinct
  ('01500000-0000-4000-8000-000000001013', '01500000-0000-4000-8000-000000000504', 'DISTINCT', TRUE,  1),
  ('01500000-0000-4000-8000-000000001014', '01500000-0000-4000-8000-000000000504', 'UNIQUE', FALSE, 2),
  ('01500000-0000-4000-8000-000000001015', '01500000-0000-4000-8000-000000000504', 'DELETE', FALSE, 3),
  ('01500000-0000-4000-8000-000000001016', '01500000-0000-4000-8000-000000000504', 'EXPAND', FALSE, 4),
  -- Q2 (504)q2: AS
  ('01500000-0000-4000-8000-000000001017', '01500000-0000-4000-8000-000000000505', 'Sorts the output', FALSE, 1),
  ('01500000-0000-4000-8000-000000001018', '01500000-0000-4000-8000-000000000505', 'Names an output column', TRUE,  2),
  ('01500000-0000-4000-8000-000000001019', '01500000-0000-4000-8000-000000000505', 'Filters rows', FALSE, 3),
  ('01500000-0000-4000-8000-000000001020', '01500000-0000-4000-8000-000000000505', 'Creates a table', FALSE, 4),
  -- Q2 (504)q3: spaced alias
  ('01500000-0000-4000-8000-000000001021', '01500000-0000-4000-8000-000000000506', 'Wrap it in single quotes', FALSE, 1),
  ('01500000-0000-4000-8000-000000001022', '01500000-0000-4000-8000-000000000506', 'Aliases cannot contain spaces', FALSE, 2),
  ('01500000-0000-4000-8000-000000001023', '01500000-0000-4000-8000-000000000506', 'Wrap it in double quotes', TRUE,  3),
  ('01500000-0000-4000-8000-000000001024', '01500000-0000-4000-8000-000000000506', 'Use underscores only', FALSE, 4),
  -- Q3 (507): equality
  ('01500000-0000-4000-8000-000000001025', '01500000-0000-4000-8000-000000000507', '=', TRUE,  1),
  ('01500000-0000-4000-8000-000000001026', '01500000-0000-4000-8000-000000000507', '==', FALSE, 2),
  ('01500000-0000-4000-8000-000000001027', '01500000-0000-4000-8000-000000000507', ':=', FALSE, 3),
  ('01500000-0000-4000-8000-000000001028', '01500000-0000-4000-8000-000000000507', 'EQ', FALSE, 4),
  -- Q3 (507)q2: AND
  ('01500000-0000-4000-8000-000000001029', '01500000-0000-4000-8000-000000000508', 'OR', FALSE, 1),
  ('01500000-0000-4000-8000-000000001030', '01500000-0000-4000-8000-000000000508', 'AND', TRUE,  2),
  ('01500000-0000-4000-8000-000000001031', '01500000-0000-4000-8000-000000000508', 'IF', FALSE, 3),
  ('01500000-0000-4000-8000-000000001032', '01500000-0000-4000-8000-000000000508', 'NOT', FALSE, 4),
  -- Q3 (507)q3: DESC
  ('01500000-0000-4000-8000-000000001033', '01500000-0000-4000-8000-000000000509', 'The lowest price', FALSE, 1),
  ('01500000-0000-4000-8000-000000001034', '01500000-0000-4000-8000-000000000509', 'Prices in alphabetical order', FALSE, 2),
  ('01500000-0000-4000-8000-000000001035', '01500000-0000-4000-8000-000000000509', 'Only rows above the average', FALSE, 3),
  ('01500000-0000-4000-8000-000000001036', '01500000-0000-4000-8000-000000000509', 'The highest price', TRUE,  4),
  -- Q4 (510): inner join
  ('01500000-0000-4000-8000-000000001037', '01500000-0000-4000-8000-000000000510', 'INNER JOIN', TRUE,  1),
  ('01500000-0000-4000-8000-000000001038', '01500000-0000-4000-8000-000000000510', 'LEFT JOIN', FALSE, 2),
  ('01500000-0000-4000-8000-000000001039', '01500000-0000-4000-8000-000000000510', 'CROSS JOIN', FALSE, 3),
  ('01500000-0000-4000-8000-000000001040', '01500000-0000-4000-8000-000000000510', 'FULL JOIN', FALSE, 4),
  -- Q4 (510)q2: left join
  ('01500000-0000-4000-8000-000000001041', '01500000-0000-4000-8000-000000000511', 'RIGHT JOIN', FALSE, 1),
  ('01500000-0000-4000-8000-000000001042', '01500000-0000-4000-8000-000000000511', 'LEFT JOIN', TRUE,  2),
  ('01500000-0000-4000-8000-000000001043', '01500000-0000-4000-8000-000000000511', 'INNER JOIN', FALSE, 3),
  ('01500000-0000-4000-8000-000000001044', '01500000-0000-4000-8000-000000000511', 'SELF JOIN', FALSE, 4),
  -- Q4 (510)q3: table aliases
  ('01500000-0000-4000-8000-000000001045', '01500000-0000-4000-8000-000000000512', 'It makes the query faster', FALSE, 1),
  ('01500000-0000-4000-8000-000000001046', '01500000-0000-4000-8000-000000000512', 'It is required for any join', FALSE, 2),
  ('01500000-0000-4000-8000-000000001047', '01500000-0000-4000-8000-000000000512', 'It shortens and clarifies column references', TRUE,  3),
  ('01500000-0000-4000-8000-000000001048', '01500000-0000-4000-8000-000000000512', 'It changes the result set', FALSE, 4),
  -- Q5 (513): count
  ('01500000-0000-4000-8000-000000001049', '01500000-0000-4000-8000-000000000513', 'COUNT(*)', TRUE,  1),
  ('01500000-0000-4000-8000-000000001050', '01500000-0000-4000-8000-000000000513', 'SUM(*)', FALSE, 2),
  ('01500000-0000-4000-8000-000000001051', '01500000-0000-4000-8000-000000000513', 'AVG(*)', FALSE, 3),
  ('01500000-0000-4000-8000-000000001052', '01500000-0000-4000-8000-000000000513', 'TOTAL(*)', FALSE, 4),
  -- Q5 (513)q2: group by
  ('01500000-0000-4000-8000-000000001053', '01500000-0000-4000-8000-000000000514', 'Sorts rows by a column', FALSE, 1),
  ('01500000-0000-4000-8000-000000001054', '01500000-0000-4000-8000-000000000514', 'Groups rows that share a value', TRUE,  2),
  ('01500000-0000-4000-8000-000000001055', '01500000-0000-4000-8000-000000000514', 'Limits how many rows return', FALSE, 3),
  ('01500000-0000-4000-8000-000000001056', '01500000-0000-4000-8000-000000000514', 'Joins two tables', FALSE, 4),
  -- Q5 (513)q3: having
  ('01500000-0000-4000-8000-000000001057', '01500000-0000-4000-8000-000000000515', 'WHERE', FALSE, 1),
  ('01500000-0000-4000-8000-000000001058', '01500000-0000-4000-8000-000000000515', 'LIMIT', FALSE, 2),
  ('01500000-0000-4000-8000-000000001059', '01500000-0000-4000-8000-000000000515', 'HAVING', TRUE,  3),
  ('01500000-0000-4000-8000-000000001060', '01500000-0000-4000-8000-000000000515', 'GROUP', FALSE, 4),
  -- Q6 (516): scalar subquery
  ('01500000-0000-4000-8000-000000001061', '01500000-0000-4000-8000-000000000516', 'Exactly one value', TRUE,  1),
  ('01500000-0000-4000-8000-000000001062', '01500000-0000-4000-8000-000000000516', 'A list of many values', FALSE, 2),
  ('01500000-0000-4000-8000-000000001063', '01500000-0000-4000-8000-000000000516', 'A full table', FALSE, 3),
  ('01500000-0000-4000-8000-000000001064', '01500000-0000-4000-8000-000000000516', 'A boolean always true', FALSE, 4),
  -- Q6 (516)q2: IN
  ('01500000-0000-4000-8000-000000001065', '01500000-0000-4000-8000-000000000517', 'Only the first returned value', FALSE, 1),
  ('01500000-0000-4000-8000-000000001066', '01500000-0000-4000-8000-000000000517', 'Any value the subquery returns', TRUE,  2),
  ('01500000-0000-4000-8000-000000001067', '01500000-0000-4000-8000-000000000517', 'Values the subquery rejects', FALSE, 3),
  ('01500000-0000-4000-8000-000000001068', '01500000-0000-4000-8000-000000000517', 'All rows in the outer table', FALSE, 4),
  -- Q6 (516)q3: CTE
  ('01500000-0000-4000-8000-000000001069', '01500000-0000-4000-8000-000000000518', 'A permanent view', FALSE, 1),
  ('01500000-0000-4000-8000-000000001070', '01500000-0000-4000-8000-000000000518', 'A separate database', FALSE, 2),
  ('01500000-0000-4000-8000-000000001071', '01500000-0000-4000-8000-000000000518', 'A named temporary result set', TRUE,  3),
  ('01500000-0000-4000-8000-000000001072', '01500000-0000-4000-8000-000000000518', 'An index on a column', FALSE, 4),
  -- Q7 (519): insert
  ('01500000-0000-4000-8000-000000001073', '01500000-0000-4000-8000-000000000519', 'INSERT', TRUE,  1),
  ('01500000-0000-4000-8000-000000001074', '01500000-0000-4000-8000-000000000519', 'ADD ROW', FALSE, 2),
  ('01500000-0000-4000-8000-000000001075', '01500000-0000-4000-8000-000000000519', 'CREATE ROW', FALSE, 3),
  ('01500000-0000-4000-8000-000000001076', '01500000-0000-4000-8000-000000000519', 'MERGE NEW', FALSE, 4),
  -- Q7 (519)q2: update
  ('01500000-0000-4000-8000-000000001077', '01500000-0000-4000-8000-000000000520', 'The database schema', FALSE, 1),
  ('01500000-0000-4000-8000-000000001078', '01500000-0000-4000-8000-000000000520', 'Existing rows', TRUE,  2),
  ('01500000-0000-4000-8000-000000001079', '01500000-0000-4000-8000-000000000520', 'New rows only', FALSE, 3),
  ('01500000-0000-4000-8000-000000001080', '01500000-0000-4000-8000-000000000520', 'The table name', FALSE, 4),
  -- Q7 (519)q3: delete where
  ('01500000-0000-4000-8000-000000001081', '01500000-0000-4000-8000-000000000521', 'It makes the delete faster', FALSE, 1),
  ('01500000-0000-4000-8000-000000001082', '01500000-0000-4000-8000-000000000521', 'It returns the deleted rows', FALSE, 2),
  ('01500000-0000-4000-8000-000000001083', '01500000-0000-4000-8000-000000000521', 'It limits which rows are removed', TRUE,  3),
  ('01500000-0000-4000-8000-000000001084', '01500000-0000-4000-8000-000000000521', 'It is required by the syntax', FALSE, 4),
  -- Q8 (522): integer
  ('01500000-0000-4000-8000-000000001085', '01500000-0000-4000-8000-000000000522', 'INTEGER', TRUE,  1),
  ('01500000-0000-4000-8000-000000001086', '01500000-0000-4000-8000-000000000522', 'VARCHAR', FALSE, 2),
  ('01500000-0000-4000-8000-000000001087', '01500000-0000-4000-8000-000000000522', 'NUMERIC', FALSE, 3),
  ('01500000-0000-4000-8000-000000001088', '01500000-0000-4000-8000-000000000522', 'TEXT', FALSE, 4),
  -- Q8 (522)q2: not null
  ('01500000-0000-4000-8000-000000001089', '01500000-0000-4000-8000-000000000523', 'UNIQUE', FALSE, 1),
  ('01500000-0000-4000-8000-000000001090', '01500000-0000-4000-8000-000000000523', 'NOT NULL', TRUE,  2),
  ('01500000-0000-4000-8000-000000001091', '01500000-0000-4000-8000-000000000523', 'DEFAULT', FALSE, 3),
  ('01500000-0000-4000-8000-000000001092', '01500000-0000-4000-8000-000000000523', 'CHECK', FALSE, 4),
  -- Q8 (522)q3: foreign key
  ('01500000-0000-4000-8000-000000001093', '01500000-0000-4000-8000-000000000524', 'An index', FALSE, 1),
  ('01500000-0000-4000-8000-000000001094', '01500000-0000-4000-8000-000000000524', 'A view', FALSE, 2),
  ('01500000-0000-4000-8000-000000001095', '01500000-0000-4000-8000-000000000524', 'A primary key in another table', TRUE,  3),
  ('01500000-0000-4000-8000-000000001096', '01500000-0000-4000-8000-000000000524', 'Another foreign key', FALSE, 4),
  -- Q9 (525): clause order
  ('01500000-0000-4000-8000-000000001097', '01500000-0000-4000-8000-000000000525', 'SELECT - FROM - WHERE - GROUP BY - HAVING - ORDER BY', TRUE,  1),
  ('01500000-0000-4000-8000-000000001098', '01500000-0000-4000-8000-000000000525', 'FROM - SELECT - WHERE - ORDER BY - GROUP BY - HAVING', FALSE, 2),
  ('01500000-0000-4000-8000-000000001099', '01500000-0000-4000-8000-000000000525', 'WHERE - SELECT - FROM - GROUP BY - ORDER BY - HAVING', FALSE, 3),
  ('01500000-0000-4000-8000-000000001100', '01500000-0000-4000-8000-000000000525', 'SELECT - ORDER BY - WHERE - FROM - HAVING - GROUP BY', FALSE, 4),
  -- Q9 (525)q2: rollback
  ('01500000-0000-4000-8000-000000001101', '01500000-0000-4000-8000-000000000526', 'COMMIT', FALSE, 1),
  ('01500000-0000-4000-8000-000000001102', '01500000-0000-4000-8000-000000000526', 'ROLLBACK', TRUE,  2),
  ('01500000-0000-4000-8000-000000001103', '01500000-0000-4000-8000-000000000526', 'BEGIN', FALSE, 3),
  ('01500000-0000-4000-8000-000000001104', '01500000-0000-4000-8000-000000000526', 'SAVEPOINT', FALSE, 4),
  -- Q9 (525)q3: inner join
  ('01500000-0000-4000-8000-000000001105', '01500000-0000-4000-8000-000000000527', 'LEFT JOIN', FALSE, 1),
  ('01500000-0000-4000-8000-000000001106', '01500000-0000-4000-8000-000000000527', 'FULL JOIN', FALSE, 2),
  ('01500000-0000-4000-8000-000000001107', '01500000-0000-4000-8000-000000000527', 'INNER JOIN', TRUE,  3),
  ('01500000-0000-4000-8000-000000001108', '01500000-0000-4000-8000-000000000527', 'CROSS JOIN', FALSE, 4),
  -- Q9 (525)q4: distinct count
  ('01500000-0000-4000-8000-000000001109', '01500000-0000-4000-8000-000000000528', 'The total number of rows', FALSE, 1),
  ('01500000-0000-4000-8000-000000001110', '01500000-0000-4000-8000-000000000528', 'The sum of all city values', FALSE, 2),
  ('01500000-0000-4000-8000-000000001111', '01500000-0000-4000-8000-000000000528', 'The number of columns', FALSE, 3),
  ('01500000-0000-4000-8000-000000001112', '01500000-0000-4000-8000-000000000528', 'How many unique non-NULL cities exist', TRUE,  4),
  -- Q9 (525)q5: parameterization
  ('01500000-0000-4000-8000-000000001113', '01500000-0000-4000-8000-000000000529', 'To prevent SQL injection', TRUE,  1),
  ('01500000-0000-4000-8000-000000001114', '01500000-0000-4000-8000-000000000529', 'To make queries run faster', FALSE, 2),
  ('01500000-0000-4000-8000-000000001115', '01500000-0000-4000-8000-000000000529', 'To skip unnecessary work', FALSE, 3),
  ('01500000-0000-4000-8000-000000001116', '01500000-0000-4000-8000-000000000529', 'To simplify quoting', FALSE, 4)
ON CONFLICT (id) DO NOTHING;