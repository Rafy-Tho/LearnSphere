-- ============================================================================
-- SEED 011: Complete course — "PostgreSQL from Zero to Pro"
-- ----------------------------------------------------------------------------
-- Instructor : Anita Patel        (10000000-0000-4000-8000-000000000003)
-- Category   : Database & Administration (20000000-0000-4000-8000-000000000008)
-- Level      : ADVANCED · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Foundations            → C1 Introducing PostgreSQL · C2 SQL Basics & Data Types
--   M2 Querying               → C3 SELECT, Filtering & Joins · C4 Aggregation & Subqueries
--   M3 Schema Design          → C5 Tables, Constraints & Keys · C6 Normalization & Indexing
--   M4 Advanced Features      → C7 Transactions & Concurrency · C8 Functions, Triggers & Views
--   M5 Capstone: Library DB   → C9 Project Setup & Design · C10 Building & Optimizing
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
  'B0000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000003',
  '20000000-0000-4000-8000-000000000008',
  'PostgreSQL from Zero to Pro',
  'postgresql-from-zero-to-pro',
  'Design robust schemas, write efficient SQL, and take on everyday database administration. From your first SELECT through transactions, indexes, functions, and a complete library database, this advanced path turns you into a confident PostgreSQL professional.',
  'PUBLISHED',
  'ADVANCED',
  'SUBSCRIPTION',
  9
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('B0000000-0000-4000-8000-000000000011', 'B0000000-0000-4000-8000-000000000001', 'Design robust relational schemas with proper keys and constraints.', 1),
  ('B0000000-0000-4000-8000-000000000012', 'B0000000-0000-4000-8000-000000000001', 'Write efficient SQL for filtering, joining, aggregating, and reporting.', 2),
  ('B0000000-0000-4000-8000-000000000013', 'B0000000-0000-4000-8000-000000000001', 'Apply normalization and indexing to keep databases fast and clean.',     3),
  ('B0000000-0000-4000-8000-000000000014', 'B0000000-0000-4000-8000-000000000001', 'Manage transactions, concurrency, functions, triggers, and views.',     4),
  ('B0000000-0000-4000-8000-000000000015', 'B0000000-0000-4000-8000-000000000001', 'Plan, build, and optimize a complete library database project.',         5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('B0000000-0000-4000-8000-000000000101', 'B0000000-0000-4000-8000-000000000001', 1, 'Foundations',                  'Install PostgreSQL, master core SQL statements, and choose the right data types.', 'PUBLISHED'),
  ('B0000000-0000-4000-8000-000000000102', 'B0000000-0000-4000-8000-000000000001', 2, 'Querying',                     'Retrieve and combine data with filtering, joins, aggregation, and subqueries.',      'PUBLISHED'),
  ('B0000000-0000-4000-8000-000000000103', 'B0000000-0000-4000-8000-000000000001', 3, 'Schema Design',                'Design robust tables with keys, constraints, normalization, and indexes.',          'PUBLISHED'),
  ('B0000000-0000-4000-8000-000000000104', 'B0000000-0000-4000-8000-000000000001', 4, 'Advanced Features',            'Control transactions, concurrency, functions, triggers, and views.',                'PUBLISHED'),
  ('B0000000-0000-4000-8000-000000000105', 'B0000000-0000-4000-8000-000000000001', 5, 'Capstone: Library Database',   'Build and optimize a complete library management database.',                        'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('B0000000-0000-4000-8000-000000000201', 'B0000000-0000-4000-8000-000000000101', 1, 'Introducing PostgreSQL',       'What PostgreSQL is and how to get started with the server.',                        'PUBLISHED'),
  ('B0000000-0000-4000-8000-000000000202', 'B0000000-0000-4000-8000-000000000101', 2, 'SQL Basics & Data Types',      'Core statements and the PostgreSQL type system.',                                    'PUBLISHED'),
  ('B0000000-0000-4000-8000-000000000203', 'B0000000-0000-4000-8000-000000000102', 1, 'SELECT, Filtering & Joins',    'Write precise queries and combine data across tables.',                              'PUBLISHED'),
  ('B0000000-0000-4000-8000-000000000204', 'B0000000-0000-4000-8000-000000000102', 2, 'Aggregation & Subqueries',     'Summarize data and nest queries for complex logic.',                                 'PUBLISHED'),
  ('B0000000-0000-4000-8000-000000000205', 'B0000000-0000-4000-8000-000000000103', 1, 'Tables, Constraints & Keys',   'Define structure with DDL, constraints, keys, and sequences.',                       'PUBLISHED'),
  ('B0000000-0000-4000-8000-000000000206', 'B0000000-0000-4000-8000-000000000103', 2, 'Normalization & Indexing',     'Design clean schemas and keep queries fast with indexes.',                           'PUBLISHED'),
  ('B0000000-0000-4000-8000-000000000207', 'B0000000-0000-4000-8000-000000000104', 1, 'Transactions & Concurrency',   'Keep data safe and consistent even under heavy concurrent load.',                    'PUBLISHED'),
  ('B0000000-0000-4000-8000-000000000208', 'B0000000-0000-4000-8000-000000000104', 2, 'Functions, Triggers & Views',  'Extend PostgreSQL and encapsulate logic on the server.',                             'PUBLISHED'),
  ('B0000000-0000-4000-8000-000000000209', 'B0000000-0000-4000-8000-000000000105', 1, 'Project Setup & Design',       'Plan the capstone library database: entities, keys, and relationships.',             'PUBLISHED'),
  ('B0000000-0000-4000-8000-000000000210', 'B0000000-0000-4000-8000-000000000105', 2, 'Building & Optimizing',        'Create the schema, seed data, and tune real-world queries.',                         'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: B0000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('B0000000-0000-4000-8000-000000000301', 'B0000000-0000-4000-8000-000000000201', 1, 'What is PostgreSQL?',                 'Discover what PostgreSQL is, where it excels, and why so many products rely on it.',  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  6),
  ('B0000000-0000-4000-8000-000000000302', 'B0000000-0000-4000-8000-000000000201', 2, 'Installing PostgreSQL & First Steps', 'Install PostgreSQL locally, connect with psql, and run your first commands.',         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('B0000000-0000-4000-8000-000000000303', 'B0000000-0000-4000-8000-000000000201', 3, 'PostgreSQL Basics Quiz',              'Check your understanding of PostgreSQL fundamentals.',                                'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('B0000000-0000-4000-8000-000000000304', 'B0000000-0000-4000-8000-000000000202', 1, 'Core SQL Statements',                 'Work through the essential statements: SELECT, INSERT, UPDATE, and DELETE.',          'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('B0000000-0000-4000-8000-000000000305', 'B0000000-0000-4000-8000-000000000202', 2, 'Data Types & NULL Handling',          'Choose the right types and master how NULL behaves in SQL.',                         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('B0000000-0000-4000-8000-000000000306', 'B0000000-0000-4000-8000-000000000202', 3, 'SQL Basics Quiz',                     'Test your grasp of core statements and data types.',                                  'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('B0000000-0000-4000-8000-000000000307', 'B0000000-0000-4000-8000-000000000203', 1, 'SELECT, WHERE & ORDER BY',            'Write precise queries with filtering, sorting, and limits.',                          'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('B0000000-0000-4000-8000-000000000308', 'B0000000-0000-4000-8000-000000000203', 2, 'Joins Across Tables',                 'Combine tables with INNER, LEFT, RIGHT, and FULL joins.',                            'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 14),
  ('B0000000-0000-4000-8000-000000000309', 'B0000000-0000-4000-8000-000000000203', 3, 'Joins & Filtering Quiz',              'Verify your SELECT, filtering, and join skills.',                                     'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('B0000000-0000-4000-8000-000000000310', 'B0000000-0000-4000-8000-000000000204', 1, 'Aggregation with GROUP BY',           'Summarize data with aggregates, GROUP BY, and HAVING.',                               'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('B0000000-0000-4000-8000-000000000311', 'B0000000-0000-4000-8000-000000000204', 2, 'Subqueries & CTEs',                   'Nest queries and simplify complex logic with common table expressions.',               'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 14),
  ('B0000000-0000-4000-8000-000000000312', 'B0000000-0000-4000-8000-000000000204', 3, 'Aggregation Quiz',                    'Check your aggregation and subquery knowledge.',                                      'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('B0000000-0000-4000-8000-000000000313', 'B0000000-0000-4000-8000-000000000205', 1, 'Creating & Altering Tables',          'Write data definition language to create, alter, and drop tables.',                  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('B0000000-0000-4000-8000-000000000314', 'B0000000-0000-4000-8000-000000000205', 2, 'Keys, Constraints & Sequences',       'Model relationships with primary keys, foreign keys, and sequences.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('B0000000-0000-4000-8000-000000000315', 'B0000000-0000-4000-8000-000000000205', 3, 'Schema Design Quiz',                  'Test your schema design and constraints knowledge.',                                  'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('B0000000-0000-4000-8000-000000000316', 'B0000000-0000-4000-8000-000000000206', 1, 'Normalization & Database Design',     'Apply the normal forms to build clean, maintainable schemas.',                        'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 14),
  ('B0000000-0000-4000-8000-000000000317', 'B0000000-0000-4000-8000-000000000206', 2, 'Indexes & Query Performance',        'Speed up reads with indexes and read execution plans with EXPLAIN.',                  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 14),
  ('B0000000-0000-4000-8000-000000000318', 'B0000000-0000-4000-8000-000000000206', 3, 'Normalization & Indexing Quiz',      'Check your normalization and indexing skills.',                                       'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('B0000000-0000-4000-8000-000000000319', 'B0000000-0000-4000-8000-000000000207', 1, 'Transactions & ACID',                'Group statements into atomic, consistent, isolated, durable transactions.',           'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('B0000000-0000-4000-8000-000000000320', 'B0000000-0000-4000-8000-000000000207', 2, 'Concurrency & Isolation Levels',     'Understand MVCC, locks, and isolation levels that prevent anomalies.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 14),
  ('B0000000-0000-4000-8000-000000000321', 'B0000000-0000-4000-8000-000000000207', 3, 'Transactions Quiz',                  'Test your transactions and concurrency knowledge.',                                   'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('B0000000-0000-4000-8000-000000000322', 'B0000000-0000-4000-8000-000000000208', 1, 'Functions & Triggers',               'Write stored functions and automatic responses with triggers.',                       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 14),
  ('B0000000-0000-4000-8000-000000000323', 'B0000000-0000-4000-8000-000000000208', 2, 'Views & Materialized Views',         'Simplify queries with views and cache results with materialized views.',               'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('B0000000-0000-4000-8000-000000000324', 'B0000000-0000-4000-8000-000000000208', 3, 'Functions & Views Quiz',             'Check your functions, triggers, and views skills.',                                   'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('B0000000-0000-4000-8000-000000000325', 'B0000000-0000-4000-8000-000000000209', 1, 'Designing the Library Schema',       'Plan tables, keys, and relationships for a library catalog.',                         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('B0000000-0000-4000-8000-000000000326', 'B0000000-0000-4000-8000-000000000210', 1, 'Building the Library Database',      'Turn the design into real tables and populate them with data.',                       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 14),
  ('B0000000-0000-4000-8000-000000000327', 'B0000000-0000-4000-8000-000000000210', 2, 'Querying & Tuning the Library',      'Query the catalog with joins, aggregates, and optimization techniques.',               'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 14),
  ('B0000000-0000-4000-8000-000000000328', 'B0000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                   'Prove what you learned across the whole course.',                                      'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: B0000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  'B0000000-0000-4000-8000-000000000401',
  'B0000000-0000-4000-8000-000000000301',
  1,
  'What is PostgreSQL?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is PostgreSQL?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>What is PostgreSQL?</h1>
  <p>PostgreSQL is a powerful, open-source <strong>relational database management system</strong> (RDBMS). It stores data in related tables, enforces rules through constraints, and answers complex questions with a mature query language. Banks, governments, and startups alike run their most critical workloads on it.</p>
  <p>Think of a database as a well-organized warehouse: tables are the shelves, rows are the boxes, and SQL is the forklift that retrieves exactly what you need. PostgreSQL is one of the most respected forklifts in existence, and it is completely free.</p>
  <h2>What makes PostgreSQL special</h2>
  <ul>
    <li><strong>ACID compliance</strong> — transactions are atomic, consistent, isolated, and durable.</li>
    <li><strong>MVCC concurrency</strong> — readers and writers never block each other.</li>
    <li><strong>Rich data types</strong> — numeric, temporal, array, range, JSONB, and geometric types.</li>
    <li><strong>Deeply extensible</strong> — custom types, functions, and operators are first-class citizens.</li>
    <li><strong>Flexible indexing</strong> — B-tree, hash, GiST, GIN, BRIN, and covering indexes.</li>
  </ul>
  <pre class="code-block">-- The classic PERN stack pairs PostgreSQL with Express, React, and Node
SELECT name, released
FROM releases
ORDER BY released DESC
LIMIT 3;</pre>
  <h2>Who uses it</h2>
  <p>E-commerce carts, analytics dashboards, mobile backends, geospatial applications (via PostGIS), and machine-learning pipelines all store their data in PostgreSQL. It is one of the most widely deployed database engines in the world.</p>
  <table>
    <thead>
      <tr><th>Process</th><th>Role</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">postgres</span></td><td>The server process that manages storage and answers queries.</td></tr>
      <tr><td><span class="ic">psql</span></td><td>The interactive client that sends SQL and prints results.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Mental model</strong>
    <p>If a spreadsheet is a single ledger, PostgreSQL is a whole library of ledgers that stay consistent even when hundreds of people write to the same data at once.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>You do not need an ORM to use PostgreSQL well. Learn SQL directly with the psql client first — it is the fastest path to a confident database professional.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000402',
  'B0000000-0000-4000-8000-000000000302',
  1,
  'Installing PostgreSQL & First Steps',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Installing PostgreSQL &amp; First Steps</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Installing PostgreSQL &amp; First Steps</h1>
  <p>To build real database skills, run PostgreSQL on your own machine. Installers exist for Windows, macOS, and Linux, and the workflow is the same everywhere: install the server, set the superuser password, and connect with <span class="ic">psql</span>.</p>
  <h2>Installation quick guide</h2>
  <ol>
    <li>Download the installer from the official PostgreSQL website.</li>
    <li>Run it and choose a strong password for the <span class="ic">postgres</span> superuser.</li>
    <li>Keep the default port <span class="ic">5432</span> unless you have a reason to change it.</li>
    <li>Finish the wizard, then open psql from the start menu or terminal.</li>
  </ol>
  <pre class="code-block">-- Connect as the postgres superuser
psql -U postgres -h localhost -p 5432

-- Create your own database
CREATE DATABASE learning;

-- Connect to it
\c learning

-- Show the server version
SELECT version();</pre>
  <h2>Handy psql meta-commands</h2>
  <table>
    <thead>
      <tr><th>Command</th><th>What it does</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">\l</span></td><td>Lists all databases on the server.</td></tr>
      <tr><td><span class="ic">\dt</span></td><td>Lists tables in the current schema.</td></tr>
      <tr><td><span class="ic">\d table</span></td><td>Describes the structure of a table.</td></tr>
      <tr><td><span class="ic">\q</span></td><td>Exits psql.</td></tr>
    </tbody>
  </table>
  <h2>A quick tour</h2>
  <p>Create a tiny table, add a row, and read it back:</p>
  <pre class="code-block">CREATE TABLE greeting (id int, text varchar(50));

INSERT INTO greeting VALUES (1, 'hello from PostgreSQL');

SELECT * FROM greeting;</pre>
  <div class="callout callout-info">
    <strong>Identifier rules</strong>
    <p>SQL keywords such as <span class="ic">CREATE</span> and <span class="ic">SELECT</span> are case-insensitive, but identifiers you write in code match by lowercase unless you quote them. Unquoted <span class="ic">Greeting</span> is the same as <span class="ic">greeting</span>.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Run <span class="ic">\conninfo</span> to confirm where you are connected. It is a fast habit that saves you from accidentally writing to the wrong database when juggling several environments.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000403',
  'B0000000-0000-4000-8000-000000000304',
  1,
  'Core SQL Statements',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Core SQL Statements</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Core SQL Statements</h1>
  <p>Four statement families do almost all of the data work in any application: <span class="ic">SELECT</span> reads data, <span class="ic">INSERT</span> adds it, <span class="ic">UPDATE</span> changes it, and <span class="ic">DELETE</span> removes it. We will practice all four against a small <span class="ic">product</span> table.</p>
  <h2>SELECT — read data</h2>
  <pre class="code-block">SELECT * FROM product;                  -- every column

SELECT name, price FROM product;        -- chosen columns only</pre>
  <h2>INSERT — add rows</h2>
  <pre class="code-block">INSERT INTO product (name, price, in_stock)
VALUES ('Wireless Mouse', 29.99, TRUE);

-- Insert several rows at once and return what was created
INSERT INTO product (name, price, in_stock) VALUES
  ('Mechanical Keyboard', 49.99, TRUE),
  ('HD Webcam',           89.00, FALSE)
RETURNING id, name;</pre>
  <h2>UPDATE — change rows</h2>
  <pre class="code-block">UPDATE product
SET price = 24.99
WHERE name = 'Wireless Mouse';

SELECT * FROM product ORDER BY id;</pre>
  <div class="callout">
    <strong>Warning</strong>
    <p>Never run an <span class="ic">UPDATE</span> without a <span class="ic">WHERE</span> when you only intend to change one row — a missing filter updates <em>every</em> row in the table.</p>
  </div>
  <h2>DELETE — remove rows</h2>
  <pre class="code-block">DELETE FROM product WHERE name = 'Mechanical Keyboard';

-- Empty the table but keep its structure
TRUNCATE product;</pre>
  <h2>Statement anatomy</h2>
  <table>
    <thead>
      <tr><th>Statement</th><th>Purpose</th><th>Common clauses</th></tr>
    </thead>
    <tbody>
      <tr><td>SELECT</td><td>Read and project data</td><td>FROM, WHERE, GROUP BY, ORDER BY</td></tr>
      <tr><td>INSERT</td><td>Create rows</td><td>INTO, VALUES, RETURNING</td></tr>
      <tr><td>UPDATE</td><td>Modify rows</td><td>SET, WHERE, RETURNING</td></tr>
      <tr><td>DELETE</td><td>Remove rows</td><td>FROM, WHERE, RETURNING</td></tr>
    </tbody>
  </table>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Use <span class="ic">RETURNING</span> after INSERT, UPDATE, and DELETE to see exactly which rows changed instead of guessing from counts.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000404',
  'B0000000-0000-4000-8000-000000000305',
  1,
  'Data Types & NULL Handling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Data Types &amp; NULL Handling</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Data Types &amp; NULL Handling</h1>
  <p>A column type declares <em>what kind of values</em> a column can hold. Choosing the honest type protects data quality, saves space, and unlocks the right operators and functions.</p>
  <h2>The type families</h2>
  <table>
    <thead>
      <tr><th>Family</th><th>Representative types</th></tr>
    </thead>
    <tbody>
      <tr><td>Text</td><td>TEXT, VARCHAR(n), CHAR(n)</td></tr>
      <tr><td>Numeric</td><td>INTEGER, BIGINT, NUMERIC(p, s), REAL, DOUBLE PRECISION</td></tr>
      <tr><td>Temporal</td><td>DATE, TIME, TIMESTAMP, TIMESTAMPTZ, INTERVAL</td></tr>
      <tr><td>Binary</td><td>BYTEA</td></tr>
      <tr><td>JSON</td><td>JSON, JSONB</td></tr>
      <tr><td>Array &amp; range</td><td>type[], int4range, tstzrange</td></tr>
    </tbody>
  </table>
  <p>Practical guidance: use <span class="ic">TEXT</span> unless a domain truly needs a size cap, <span class="ic">NUMERIC</span> for money, <span class="ic">BIGINT</span> for counts and identifiers, and <span class="ic">TIMESTAMPTZ</span> for moment-in-time tracking.</p>
  <h2>NULL is not zero</h2>
  <ul>
    <li>NULL means <em>unknown or missing</em>, never the number zero.</li>
    <li>NULL does not equal NULL — compare with <span class="ic">IS NULL</span> and <span class="ic">IS NOT NULL</span>.</li>
    <li>Any arithmetic with NULL yields NULL.</li>
  </ul>
  <pre class="code-block">SELECT 1 + NULL;                 -- NULL

SELECT price * quantity FROM sale;  -- NULL if either value is missing

SELECT COALESCE(price, 0) FROM product;  -- fall back to zero</pre>
  <h2>Helpers you will use often</h2>
  <pre class="code-block">SELECT NULLIF(a, b);        -- NULL when a equals b, otherwise a
SELECT GREATEST(a, b);      -- the largest value
SELECT ISNULL(price, 0);    -- alias form of COALESCE</pre>
  <table>
    <thead>
      <tr><th>Value</th><th>Semantics</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">NULL</span></td><td>Missing or unknown data.</td></tr>
      <tr><td><span class="ic">''</span> (empty string)</td><td>Known, deliberately empty text.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Counting trap</strong>
    <p><span class="ic">COUNT(column)</span> ignores NULLs; <span class="ic">COUNT(*)</span> counts every row. They disagree exactly on rows with NULLs.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Store what is true about the data. A missing middle name is <span class="ic">NULL</span>; a deliberately blank field is your business decision to signal with an empty string.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000405',
  'B0000000-0000-4000-8000-000000000307',
  1,
  'SELECT, WHERE & ORDER BY',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SELECT, WHERE &amp; ORDER BY</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>SELECT, WHERE &amp; ORDER BY</h1>
  <p>SELECT is the workhorse of SQL. Combining the clauses <span class="ic">WHERE</span>, <span class="ic">ORDER BY</span>, and <span class="ic">LIMIT</span> lets you turn raw tables into exactly the answer you need.</p>
  <h2>The shape of a query</h2>
  <pre class="code-block">SELECT name, price
FROM product
WHERE price &gt; 20
ORDER BY price DESC
LIMIT 10;</pre>
  <h2>Filtering with WHERE</h2>
  <table>
    <thead>
      <tr><th>Operator</th><th>Meaning</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">=</span></td><td>Equal to</td></tr>
      <tr><td><span class="ic">!=</span> or <span class="ic">&lt;&gt;</span></td><td>Not equal to</td></tr>
      <tr><td><span class="ic">&gt;</span> <span class="ic">&lt;</span> <span class="ic">&gt;=</span> <span class="ic">&lt;=</span></td><td>Comparisons</td></tr>
      <tr><td><span class="ic">BETWEEN a AND b</span></td><td>Inclusive range</td></tr>
      <tr><td><span class="ic">LIKE</span> / <span class="ic">ILIKE</span></td><td>Pattern match (% and _ wildcards)</td></tr>
      <tr><td><span class="ic">IN (list)</span></td><td>Matches any listed value</td></tr>
      <tr><td><span class="ic">IS NULL</span></td><td>Missing value</td></tr>
    </tbody>
  </table>
  <pre class="code-block">SELECT name, price, in_stock
FROM product
WHERE in_stock = FALSE
  AND price BETWEEN 10 AND 50
  AND name ILIKE '%key%';</pre>
  <h2>Sorting</h2>
  <p>ORDER BY defaults to ascending; add <span class="ic">DESC</span> for descending and list several keys to break ties:</p>
  <pre class="code-block">SELECT name, price, in_stock
FROM product
ORDER BY price DESC, name ASC;</pre>
  <h2>Limits and pagination</h2>
  <pre class="code-block">-- First page of 20 rows
SELECT * FROM product ORDER BY id LIMIT 20 OFFSET 0;

-- Second page of 20 rows
SELECT * FROM product ORDER BY id LIMIT 20 OFFSET 20;</pre>
  <h2>Deduplicate with DISTINCT</h2>
  <pre class="code-block">SELECT DISTINCT category FROM product;</pre>
  <div class="callout callout-info">
    <strong>Order of operations</strong>
    <p>WHERE filters <em>rows</em> before grouping or aliasing — you cannot reference a SELECT alias inside WHERE.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Keep ORDER BY column order aligned with index columns to help the planner, but do not add indexes purely speculatively — measure with EXPLAIN first.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000406',
  'B0000000-0000-4000-8000-000000000308',
  1,
  'Joins Across Tables',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Joins Across Tables</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Joins Across Tables</h1>
  <p>Real applications spread data across many tables, connected by foreign keys. A <strong>join</strong> recombines those tables for a single query, so you can answer questions that span entities.</p>
  <h2>Your first join</h2>
  <pre class="code-block">SELECT p.name, c.name AS category
FROM product p
JOIN category c ON p.category_id = c.id;</pre>
  <p>Here <span class="ic">ON</span> states the matching rule: a product row is combined with the category row whose <span class="ic">id</span> equals the product <span class="ic">category_id</span>.</p>
  <h2>Join types</h2>
  <table>
    <thead>
      <tr><th>Join</th><th>Keeps</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">INNER JOIN</span></td><td>Only rows with a match on both sides.</td></tr>
      <tr><td><span class="ic">LEFT JOIN</span></td><td>All left rows; unmatched right columns become NULL.</td></tr>
      <tr><td><span class="ic">RIGHT JOIN</span></td><td>All right rows; unmatched left columns become NULL.</td></tr>
      <tr><td><span class="ic">FULL JOIN</span></td><td>Every row from both tables, matched where possible.</td></tr>
      <tr><td><span class="ic">CROSS JOIN</span></td><td>Every combination of the two tables.</td></tr>
    </tbody>
  </table>
  <pre class="code-block">-- Books with their authors, including books that have none yet
SELECT b.title, a.name
FROM book b
LEFT JOIN book_author ba ON ba.book_id = b.id
LEFT JOIN author a ON a.id = ba.author_id;</pre>
  <h2>Joining three tables</h2>
  <pre class="code-block">SELECT m.name, b.title, l.due_date
FROM loan l
JOIN member m ON m.id = l.member_id
JOIN book b  ON b.id = l.book_id
WHERE l.returned_on IS NULL
ORDER BY l.due_date;</pre>
  <h2>Column aliases</h2>
  <p>Short aliases (<span class="ic">p</span>, <span class="ic">c</span>, <span class="ic">b</span>) keep long queries readable and are mandatory when a query joins a table to itself.</p>
  <div class="callout callout-info">
    <strong>Ambiguity</strong>
    <p>When two joined tables share a column name, prefix it with its table: <span class="ic">product.price</span> instead of <span class="ic">price</span>.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Start with INNER JOIN when in doubt. Reach for LEFT JOIN when you must keep unmatched rows, then filter on NULLs to find missing references.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000407',
  'B0000000-0000-4000-8000-000000000310',
  1,
  'Aggregation with GROUP BY',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aggregation with GROUP BY</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Aggregation with GROUP BY</h1>
  <p>Aggregates collapse many rows into a single summary value — the total of a column, the average score, the largest amount. Combined with <span class="ic">GROUP BY</span>, they turn raw detail into the reports businesses actually use.</p>
  <h2>The core aggregates</h2>
  <pre class="code-block">SELECT
  COUNT(*)          AS payments,
  SUM(amount)       AS total,
  AVG(amount)       AS average,
  MIN(amount)       AS smallest,
  MAX(amount)       AS largest
FROM payment;</pre>
  <h2>Grouping by a column</h2>
  <pre class="code-block">SELECT customer_id,
       COUNT(*)              AS orders,
       ROUND(SUM(amount), 2) AS total_spent
FROM payment
GROUP BY customer_id
ORDER BY total_spent DESC;</pre>
  <p>GROUP BY collapses all rows sharing a customer into one group; every aggregate then runs once per group.</p>
  <h2>HAVING filters groups</h2>
  <pre class="code-block">SELECT customer_id, COUNT(*) AS orders
FROM payment
GROUP BY customer_id
HAVING COUNT(*) &gt; 5;</pre>
  <div class="callout callout-info">
    <strong>WHERE vs HAVING</strong>
    <p>WHERE discards rows <em>before</em> grouping. HAVING discards groups <em>after</em> aggregation. For example, HAVING COUNT(*) &gt; 5 cannot be expressed in WHERE at all.</p>
  </div>
  <h2>Targeted counts with FILTER</h2>
  <pre class="code-block">SELECT
  COUNT(*) FILTER (WHERE returned_on IS NULL) AS on_loan,
  COUNT(*) FILTER (WHERE returned_on IS NOT NULL) AS returned
FROM loan;</pre>
  <h2>NULL and aggregates</h2>
  <p>SUM, AVG, MIN, and MAX all skip NULLs; COUNT(column) skips NULLs while COUNT(*) does not. A column with only NULLs therefore aggregates to NULL, not zero.</p>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Prefer <span class="ic">FILTER</span> over CASE inside an aggregate when counting conditional rows — it reads more cleanly and performs the same.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000408',
  'B0000000-0000-4000-8000-000000000311',
  1,
  'Subqueries & CTEs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subqueries &amp; CTEs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Subqueries &amp; CTEs</h1>
  <p>Occasionally one query is not enough: you need the result of a calculation as an input to another query. PostgreSQL gives you two tools — inline <strong>subqueries</strong> and named <strong>common table expressions</strong> (CTEs).</p>
  <h2>Scalar subqueries</h2>
  <pre class="code-block">SELECT name,
       (SELECT AVG(price) FROM product) AS avg_price
FROM product;</pre>
  <p>A scalar subquery returns a single value and can sit anywhere a value is allowed.</p>
  <h2>IN and EXISTS</h2>
  <pre class="code-block">-- Which authors wrote a long book?
SELECT name
FROM author
WHERE id IN (SELECT author_id FROM book WHERE pages &gt; 400);

-- Same idea using EXISTS (stops at the first match)
SELECT name
FROM author a
WHERE EXISTS (SELECT 1 FROM book b WHERE b.author_id = a.id);</pre>
  <h2>Common table expressions</h2>
  <p>A CTE names a temporary result set you can reference by name. It makes multi-step logic read top to bottom:</p>
  <pre class="code-block">WITH top_authors AS (
  SELECT author_id, COUNT(*) AS books
  FROM book
  GROUP BY author_id
)
SELECT a.name, t.books
FROM top_authors t
JOIN author a ON a.id = t.author_id
ORDER BY t.books DESC;</pre>
  <h2>Several CTEs in one query</h2>
  <pre class="code-block">WITH
active_members AS (
  SELECT member_id, COUNT(*) AS loans
  FROM loan
  WHERE returned_on IS NULL
  GROUP BY member_id
),
overdue AS (
  SELECT member_id FROM active_members WHERE loans &gt; 3
)
SELECT m.name
FROM member m
JOIN overdue o ON o.member_id = m.id;</pre>
  <table>
    <thead>
      <tr><th>Tool</th><th>Best for</th></tr>
    </thead>
    <tbody>
      <tr><td>Subquery</td><td>Short, inline filters and computed values.</td></tr>
      <tr><td>CTE</td><td>Named, reusable, readable multi-step pipelines.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Performance</strong>
    <p>EXISTS stops scanning at the first match, which often beats IN over very large result sets. Let EXPLAIN ANALYZE confirm the difference on your data.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>When a query trips you up, break it apart into CTEs. Named steps turn invisible debugging into a readable plan you can reason about line by line.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000409',
  'B0000000-0000-4000-8000-000000000313',
  1,
  'Creating & Altering Tables',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Creating &amp; Altering Tables</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Creating &amp; Altering Tables</h1>
  <p>Tables are where your data lives, and <strong>data definition language</strong> (DDL) is how you build them. This lesson covers CREATE, ALTER, and DROP — plus the schemas that organize groups of tables.</p>
  <h2>CREATE TABLE</h2>
  <pre class="code-block">CREATE TABLE product (
  id         BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name       TEXT        NOT NULL,
  price      NUMERIC(10, 2) NOT NULL CHECK (price &gt;= 0),
  in_stock   BOOLEAN     NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);</pre>
  <h2>Schemas and IF NOT EXISTS</h2>
  <p>A schema is a namespace for tables. Re-running a seed or migration should never fail, so guard it:</p>
  <pre class="code-block">CREATE SCHEMA IF NOT EXISTS sales;

CREATE TABLE IF NOT EXISTS sales.invoice (
  id        BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  amount    NUMERIC(12, 2) NOT NULL,
  issued_at TIMESTAMPTZ    NOT NULL DEFAULT NOW()
);</pre>
  <h2>ALTER TABLE</h2>
  <pre class="code-block">-- Add a column
ALTER TABLE product ADD COLUMN sku TEXT;

-- Make a column required
ALTER TABLE product ALTER COLUMN sku SET NOT NULL;

-- Rename a column
ALTER TABLE product RENAME COLUMN sku TO sku_code;

-- Remove a column
ALTER TABLE product DROP COLUMN sku_code;</pre>
  <h2>DROP and TRUNCATE</h2>
  <pre class="code-block">-- Remove a table and its definition
DROP TABLE IF EXISTS staging;

-- Also drop anything that depends on it (use with care)
DROP TABLE IF EXISTS staging CASCADE;</pre>
  <table>
    <thead>
      <tr><th>Command</th><th>Effect</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">TRUNCATE</span></td><td>Removes all rows; keeps the table definition.</td></tr>
      <tr><td><span class="ic">DROP</span></td><td>Removes the table and its definition entirely.</td></tr>
    </tbody>
  </table>
  <div class="callout">
    <strong>Careful</strong>
    <p>ALTER and DROP lock the table and can bloat it under heavy traffic. Prefer cheap migrations, and rehearse DROP against a development copy before touching production.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Make every DDL statement idempotent with <span class="ic">IF NOT EXISTS</span> / <span class="ic">IF EXISTS</span>. Idempotent migrations can be re-run safely anywhere — including your CI pipeline.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000410',
  'B0000000-0000-4000-8000-000000000314',
  1,
  'Keys, Constraints & Sequences',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Keys, Constraints &amp; Sequences</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Keys, Constraints &amp; Sequences</h1>
  <p>Keys and constraints are how PostgreSQL keeps your data <em>honest</em>: a primary key identifies every row, a foreign key links tables, and checks reject bad values before they ever land in storage.</p>
  <h2>Primary keys</h2>
  <pre class="code-block">CREATE TABLE author (
  id        BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name      TEXT NOT NULL,
  born_year INT
);</pre>
  <p>A primary key is unique and never NULL, and PostgreSQL builds an index behind it automatically.</p>
  <h2>Foreign keys</h2>
  <pre class="code-block">CREATE TABLE loan (
  id        BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  book_id   BIGINT NOT NULL REFERENCES book(id) ON DELETE RESTRICT,
  member_id BIGINT NOT NULL REFERENCES member(id) ON DELETE CASCADE,
  due_date  DATE NOT NULL
);</pre>
  <p>The REFERENCES clause guarantees every <span class="ic">book_id</span> points at a real book.</p>
  <h2>Reference actions</h2>
  <table>
    <thead>
      <tr><th>Action</th><th>What happens when a parent row is deleted</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">RESTRICT</span></td><td>Refuses the delete while children exist.</td></tr>
      <tr><td><span class="ic">CASCADE</span></td><td>Deletes the child rows along with the parent.</td></tr>
      <tr><td><span class="ic">SET NULL</span></td><td>Sets child references to NULL.</td></tr>
      <tr><td><span class="ic">NO ACTION</span></td><td>Default; checks at the end for a clean bulk delete.</td></tr>
    </tbody>
  </table>
  <h2>Sequences and identity</h2>
  <p>PostgreSQL assigns new keys from a <strong>sequence</strong>. The modern syntax is IDENTITY; the older shorthand is SERIAL:</p>
  <pre class="code-block">-- Modern: managed by the server, clean to reason about
id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY

-- Legacy shorthand: an integer plus an implicit sequence
id SERIAL PRIMARY KEY</pre>
  <h2>Other useful constraints</h2>
  <pre class="code-block">CREATE TABLE member (
  id       BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email    TEXT    NOT NULL UNIQUE,
  age      INT     CHECK (age &gt;= 13),
  joined_on DATE   DEFAULT CURRENT_DATE
);</pre>
  <div class="callout callout-info">
    <strong>Integrity</strong>
    <p>A foreign key rejects rows that point nowhere. That single rule eliminates a whole class of application bugs and is why ORMs still rely on the database for safety.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Choose the ON DELETE action deliberately for every relationship. CASCADE reads great on paper but can quietly erase data — RESTRICT forces you to think first.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000411',
  'B0000000-0000-4000-8000-000000000316',
  1,
  'Normalization & Database Design',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Normalization &amp; Database Design</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Normalization &amp; Database Design</h1>
  <p>Normalization is the systematic removal of <em>redundancy</em>. A well-normalized schema stores each fact in exactly one place, so updates cannot tear it out of sync. The rules come in normal forms, applied one after another.</p>
  <h2>First normal form (1NF)</h2>
  <p>Each cell must hold a single, atomic value. A column like <span class="ic">authors 'Bram Stoker, Mary Shelley'</span> is a repeating group — the hallmark of a 1NF violation.</p>
  <pre class="code-block">-- Violation: comma-separated list in one column
CREATE TABLE bad_book (id INT, title TEXT, authors TEXT);

-- Fixed: one author per row
CREATE TABLE book_author (
  book_id   BIGINT NOT NULL REFERENCES book(id),
  author_id BIGINT NOT NULL REFERENCES author(id),
  PRIMARY KEY (book_id, author_id)
);</pre>
  <h2>Second normal form (2NF)</h2>
  <p>In a composite-key table, every non-key column must depend on the <em>whole</em> key, not just part of it. Split partial dependencies into their own tables.</p>
  <h2>Third normal form (3NF)</h2>
  <p>Non-key columns must not depend on other non-key columns. Storing <span class="ic">author_country</span> next to <span class="ic">author_name</span> in the book table stores the same fact again through an author.</p>
  <table>
    <thead>
      <tr><th>Form</th><th>Rule of thumb</th></tr>
    </thead>
    <tbody>
      <tr><td>1NF</td><td>Atomic values, no repeating groups.</td></tr>
      <tr><td>2NF</td><td>No partial key dependencies.</td></tr>
      <tr><td>3NF</td><td>No transitive dependencies.</td></tr>
    </tbody>
  </table>
  <h2>Design practice</h2>
  <p>Sketch entity-relationship diagrams first: name every entity (member, book, author), the attributes it owns, and the cardinality between them (one-to-many, many-to-many). Many-to-many always becomes a junction table.</p>
  <div class="callout callout-info">
    <strong>Denormalization</strong>
    <p>Sometimes you deliberately trade normalization for speed, such as caching a running total. That is a performance decision you evaluate with evidence — not a shortcut you take by default.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Normalize for correctness first, then optimize where EXPLAIN shows real cost. Clean schemas are easier to index, tune, and explain to the next engineer on call.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000412',
  'B0000000-0000-4000-8000-000000000317',
  1,
  'Indexes & Query Performance',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Indexes &amp; Query Performance</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Indexes &amp; Query Performance</h1>
  <p>An index is like the index of a book: a compact structure that tells the database where to find rows instead of scanning everything. Used well, indexes turn slow queries into instant lookups.</p>
  <h2>Creating indexes</h2>
  <pre class="code-block">-- Plain index for equality and range lookups
CREATE INDEX idx_book_title ON book (title);

-- Unique index to guarantee distinct values
CREATE UNIQUE INDEX idx_member_email ON member (email);

-- Composite index covering several filter columns
CREATE INDEX idx_copy_book_status ON copy (book_id, status);

-- Partial index that only covers the rows that matter
CREATE INDEX idx_loan_unreturned ON loan (due_date)
WHERE returned_on IS NULL;</pre>
  <h2>Default type: B-tree</h2>
  <p>PostgreSQL uses a <strong>B-tree</strong> by default — ideal for <span class="ic">=</span>, <span class="ic">&gt;</span>, <span class="ic">BETWEEN</span>, and <span class="ic">ORDER BY</span>. Hash indexes serve equality lookups; GIN helps full-text and JSONB; GiST handles ranges and geometric data.</p>
  <h2>Reading execution plans</h2>
  <pre class="code-block">EXPLAIN ANALYZE
SELECT * FROM book WHERE title = 'The Raven';</pre>
  <p>EXPLAIN shows the plan; ANALYZE actually runs it and reports real timings. Watch for <span class="ic">Seq Scan</span> (full table scan) versus <span class="ic">Index Scan</span> — the latter is usually the sign of a healthy lookup.</p>
  <h2>Pitfalls</h2>
  <ul>
    <li>Indexes speed reads but slow every write — keep only the useful ones.</li>
    <li>Composite index columns should match the filters, in order.</li>
    <li>Wrapping an indexed column in a function (such as <span class="ic">LOWER(title)</span>) disables the plain index.</li>
    <li>Very selective or hot-running queries deserve an index; tiny tables do not.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Measure first</strong>
    <p>Add an index only after EXPLAIN ANALYZE shows a scan you want to eliminate. Unused indexes are pure write overhead and disk space.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Use a partial index (<span class="ic">WHERE …</span> clause) for filters that only touch a subset of rows — the most common case wins with a fraction of the size.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000413',
  'B0000000-0000-4000-8000-000000000319',
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
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Transactions &amp; ACID</h1>
  <p>A <strong>transaction</strong> groups several statements into one all-or-nothing unit. Moving money between two accounts is the classic example: both balances must change, or neither may.</p>
  <h2>Begin, commit, rollback</h2>
  <pre class="code-block">BEGIN;

UPDATE account SET balance = balance - 100 WHERE id = 1;
UPDATE account SET balance = balance + 100 WHERE id = 2;

COMMIT;   -- make both changes permanent</pre>
  <pre class="code-block">BEGIN;

DELETE FROM temporary_rows WHERE processed = TRUE;

ROLLBACK;  -- change your mind: nothing above is saved</pre>
  <h2>The ACID guarantees</h2>
  <table>
    <thead>
      <tr><th>Property</th><th>Guarantee</th></tr>
    </thead>
    <tbody>
      <tr><td>Atomicity</td><td>Every statement succeeds, or none of them do.</td></tr>
      <tr><td>Consistency</td><td>A valid transaction leaves the database valid.</td></tr>
      <tr><td>Isolation</td><td>Concurrent transactions do not see each other partially.</td></tr>
      <tr><td>Durability</td><td>Committed changes survive crashes.</td></tr>
    </tbody>
  </table>
  <h2>Savepoints</h2>
  <p>Rollback the whole transaction with <span class="ic">ROLLBACK</span>, or only part of it with a savepoint:</p>
  <pre class="code-block">BEGIN;

UPDATE account SET balance = balance - 150 WHERE id = 1;
SAVEPOINT before_second_leg;

UPDATE account SET balance = balance + 99 WHERE id = 2;
ROLLBACK TO SAVEPOINT before_second_leg;   -- undo the second leg only

COMMIT;</pre>
  <p>After the rollback-to, the first UPDATE is still in effect and the second is discarded — handy when a batch partially fails.</p>
  <div class="callout callout-info">
    <strong>Mental model</strong>
    <p>Think of COMMIT as sealing an envelope: until you seal it, nothing inside is delivered. If you tear it up (ROLLBACK), the outside world never knows anything happened.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Keep transactions short. Holding a transaction open longer than necessary keeps locks and snapshot data alive, which raises the cost for every other session.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000414',
  'B0000000-0000-4000-8000-000000000320',
  1,
  'Concurrency & Isolation Levels',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Concurrency &amp; Isolation Levels</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Concurrency &amp; Isolation Levels</h1>
  <p>Many users write at once, yet each must never see a half-finished transaction. PostgreSQL solves this with <strong>MVCC</strong> (Multiversion Concurrency Control): every transaction works against a <em>snapshot</em>, and old versions of rows are kept until nobody needs them.</p>
  <h2>Why snapshots matter</h2>
  <ul>
    <li>Readers never block writers and writers never block readers.</li>
    <li>Each transaction sees a consistent view of committed data.</li>
    <li>Conflicts surface only at write time, as errors you can retry.</li>
  </ul>
  <h2>Anomalies that isolation prevents</h2>
  <table>
    <thead>
      <tr><th>Anomaly</th><th>Description</th></tr>
    </thead>
    <tbody>
      <tr><td>Dirty read</td><td>Seeing another transaction uncommitted data.</td></tr>
      <tr><td>Non-repeatable read</td><td>A row value changes between two reads in the same transaction.</td></tr>
      <tr><td>Phantom read</td><td>New rows appear between two reads of the same filter.</td></tr>
    </tbody>
  </table>
  <h2>Isolation levels</h2>
  <table>
    <thead>
      <tr><th>Level</th><th>Default</th><th>Guards against</th></tr>
    </thead>
    <tbody>
      <tr><td>READ COMMITTED</td><td>Yes</td><td>Dirty reads.</td></tr>
      <tr><td>REPEATABLE READ</td><td>—</td><td>Dirty and non-repeatable reads.</td></tr>
      <tr><td>SERIALIZABLE</td><td>—</td><td>All of the above plus phantom issues.</td></tr>
    </tbody>
  </table>
  <pre class="code-block">BEGIN ISOLATION LEVEL REPEATABLE READ;

SELECT total FROM account_summary WHERE account_id = 7;

COMMIT;</pre>
  <h2>Locking rows explicitly</h2>
  <p>For critical read-then-write workflows such as reserving one of a limited set of items, lock the rows you will change:</p>
  <pre class="code-block">BEGIN;

SELECT * FROM seat WHERE flight_id = 42 AND is_free FOR UPDATE;

-- another session will now wait for this transaction

UPDATE seat SET is_free = FALSE WHERE id = 12;
COMMIT;</pre>
  <div class="callout callout-info">
    <strong>Write conflicts</strong>
    <p>Under REPEATABLE READ or SERIALIZABLE, PostgreSQL aborts a transaction the moment it hits a conflicted write — the application must retry. This is normal, so build retry logic at the boundary.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Stay on the default READ COMMITTED until a concrete anomaly appears in testing. Raising isolation costs concurrency; raise it only with a real problem in hand.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000415',
  'B0000000-0000-4000-8000-000000000322',
  1,
  'Functions & Triggers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Functions &amp; Triggers</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Functions &amp; Triggers</h1>
  <p>Stored functions let you put reusable logic inside the database, next to the data. Triggers run that logic automatically when rows change — keeping the rules applied no matter which application writes.</p>
  <h2>A simple PL/pgSQL function</h2>
  <pre class="code-block">CREATE FUNCTION full_name(first_name TEXT, last_name TEXT)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN first_name || ' ' || last_name;
END;
$$;</pre>
  <p>PL/pgSQL adds procedural power — IF, loops, variables — on top of plain SQL.</p>
  <h2>A function returning a table</h2>
  <pre class="code-block">CREATE FUNCTION books_in_stock()
RETURNS SETOF book
LANGUAGE sql
AS $$
  SELECT * FROM book WHERE copies_available &gt; 0;
$$;</pre>
  <h2>Triggers</h2>
  <p>A trigger needs a trigger function, then the trigger itself. The records <span class="ic">NEW</span> (new row) and <span class="ic">OLD</span> (previous row) let you respond to each change:</p>
  <pre class="code-block">CREATE FUNCTION touch_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at := NOW();
  RETURN NEW;
END;
$$;

CREATE TRIGGER books_touch_updated
BEFORE UPDATE ON book
FOR EACH ROW
EXECUTE FUNCTION touch_updated_at();</pre>
  <h2>Trigger timing</h2>
  <table>
    <thead>
      <tr><th>Timing</th><th>Runs</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">BEFORE</span></td><td>Before the change; can modify NEW or raise an error.</td></tr>
      <tr><td><span class="ic">AFTER</span></td><td>After the change; good for audit logging.</td></tr>
      <tr><td><span class="ic">INSTEAD OF</span></td><td>Replaces the operation, mainly for views.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>NEW vs OLD</strong>
    <p>In an UPDATE, <span class="ic">OLD</span> holds the row as it was and <span class="ic">NEW</span> the row as it will be. In INSERT only NEW exists; in DELETE only OLD.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Triggers are powerful and silent. Prefer them for tamper-proof rules like audit timestamps, and keep their bodies small — every write pays the trigger cost.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000416',
  'B0000000-0000-4000-8000-000000000323',
  1,
  'Views & Materialized Views',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Views &amp; Materialized Views</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Views &amp; Materialized Views</h1>
  <p>A <strong>view</strong> stores a query under a name. Every time you query the view, PostgreSQL runs the query lazily against the current data. Views encapsulate complex joins so applications stay simple.</p>
  <h2>Creating a view</h2>
  <pre class="code-block">CREATE VIEW member_summary AS
SELECT m.id, m.name, COUNT(l.id) AS loan_count
FROM member m
LEFT JOIN loan l ON l.member_id = m.id
GROUP BY m.id, m.name;</pre>
  <p>Applications can now read it like a table:</p>
  <pre class="code-block">SELECT * FROM member_summary ORDER BY loan_count DESC;</pre>
  <h2>Guarding updates</h2>
  <p>Simple views are updatable. Add <span class="ic">WITH CHECK OPTION</span> so UPDATE or INSERT cannot smuggle rows that the view would hide:</p>
  <pre class="code-block">CREATE VIEW active_members AS
SELECT * FROM member WHERE is_active = TRUE
WITH CHECK OPTION;</pre>
  <h2>Materialized views</h2>
  <p>Heavy aggregates rerun on every read. A <strong>materialized view</strong> stores the result on disk and refreshes it when you ask:</p>
  <pre class="code-block">CREATE MATERIALIZED VIEW top_books AS
SELECT b.title, COUNT(l.id) AS borrows
FROM book b
JOIN loan l ON l.book_id = b.id
GROUP BY b.title
ORDER BY borrows DESC;

-- Later, bring it up to date
REFRESH MATERIALIZED VIEW top_books;</pre>
  <h2>View vs materialized view</h2>
  <table>
    <thead>
      <tr><th>Aspect</th><th>Regular view</th><th>Materialized view</th></tr>
    </thead>
    <tbody>
      <tr><td>Data</td><td>Always live</td><td>Cached until refreshed</td></tr>
      <tr><td>Speed</td><td>Recomputes each read</td><td>Instant reads</td></tr>
      <tr><td>Indexable</td><td>No</td><td>Yes</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Staleness</strong>
    <p>A materialized view answers with the data as of its last refresh. Refresh it when a meaningful staleness window is acceptable — nightly for dashboards, immediate after bulk loads.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Views are the cheapest way to share a complex query with the whole team. Start with a view; graduate to a materialized view only when EXPLAIN shows the recompute is worth caching.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000417',
  'B0000000-0000-4000-8000-000000000325',
  1,
  'Designing the Library Schema',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Designing the Library Schema</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Designing the Library Schema</h1>
  <p>Your capstone is a system for a small library: cataloging books, tracking their physical copies, registering members, and managing loans with due dates. This lesson plans the design; the next two build and query it.</p>
  <h2>Requirements</h2>
  <ul>
    <li>Store books (title, publication year) and their authors.</li>
    <li>A book may have several authors; an author may write several books.</li>
    <li>Each book exists as one or more physical copies.</li>
    <li>Members borrow copies and return them on or after the due date.</li>
    <li>Queries will report what is out, what is overdue, and what is popular.</li>
  </ul>
  <h2>The entities</h2>
  <table>
    <thead>
      <tr><th>Entity</th><th>Key attributes</th></tr>
    </thead>
    <tbody>
      <tr><td>author</td><td>name, born_year</td></tr>
      <tr><td>book</td><td>title, publication_year</td></tr>
      <tr><td>book_author</td><td>junction: book_id, author_id</td></tr>
      <tr><td>copy</td><td>book_id, status</td></tr>
      <tr><td>member</td><td>name, email</td></tr>
      <tr><td>loan</td><td>copy_id, member_id, due_date, returned_on</td></tr>
    </tbody>
  </table>
  <h2>Relationships</h2>
  <pre class="code-block">author      1 ─── * book_author * ─── 1 book
book        1 ─── * copy
member      1 ─── * loan
copy        1 ─── * loan</pre>
  <p>Authors and books connect through a junction table (many-to-many). Copies and members connect through loans (one-to-many each way).</p>
  <h2>Key design decisions</h2>
  <ul>
    <li>Copies keep their own status so one copy of the same book can be on loan while another sits on the shelf.</li>
    <li>A loan holds <span class="ic">returned_on</span>, so history survives and overdue means returned_on IS NULL plus a past due date.</li>
    <li>REFERENCES actions: a member delete cascades to loans; a book delete is restricted while copies exist.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Normalization payoff</strong>
    <p>Because this schema is 3NF, changing an author name updates exactly one row — no book rows drift out of sync.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Sketch relationships on paper before writing DDL. An hour of planning here saves days of repair after the data arrives.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000418',
  'B0000000-0000-4000-8000-000000000326',
  1,
  'Building the Library Database',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building the Library Database</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Building the Library Database</h1>
  <p>Time to create the schema from the previous lesson, then seed it with enough data to make interesting queries. Follow along on your own instance — every statement is runnable.</p>
  <h2>Core tables</h2>
  <pre class="code-block">CREATE TABLE author (
  id           BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name         TEXT NOT NULL,
  born_year    INT
);

CREATE TABLE book (
  id               BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title            TEXT NOT NULL,
  publication_year INT
);</pre>
  <h2>Junction table</h2>
  <pre class="code-block">CREATE TABLE book_author (
  book_id   BIGINT NOT NULL REFERENCES book(id)   ON DELETE CASCADE,
  author_id BIGINT NOT NULL REFERENCES author(id) ON DELETE CASCADE,
  PRIMARY KEY (book_id, author_id)
);</pre>
  <h2>Copies and members</h2>
  <pre class="code-block">CREATE TABLE copy (
  id      BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  book_id BIGINT NOT NULL REFERENCES book(id) ON DELETE RESTRICT,
  status  TEXT   NOT NULL DEFAULT 'available'
);

CREATE TABLE member (
  id    BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name  TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE
);</pre>
  <h2>Loans</h2>
  <pre class="code-block">CREATE TABLE loan (
  id          BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  copy_id     BIGINT NOT NULL REFERENCES copy(id)   ON DELETE RESTRICT,
  member_id   BIGINT NOT NULL REFERENCES member(id) ON DELETE CASCADE,
  due_date    DATE NOT NULL,
  returned_on DATE
);</pre>
  <h2>Seed data</h2>
  <pre class="code-block">INSERT INTO author (name, born_year) VALUES
  ('Bram Stoker',    1847),
  ('Mary Shelley',   1797),
  ('Isaac Asimov',   1920),
  ('Agatha Christie', 1890);

INSERT INTO book (title, publication_year) VALUES
  ('Dracula',                       1897),
  ('Frankenstein',                  1818),
  ('Foundation',                    1951),
  ('Murder on the Orient Express',  1934);</pre>
  <pre class="code-block">-- Link books to authors
INSERT INTO book_author (book_id, author_id)
SELECT b.id, a.id
FROM book b
JOIN author a ON a.name = 'Bram Stoker'
WHERE b.title = 'Dracula';</pre>
  <p>Add a few copies and members, then run your first loan query. In the next lesson you will turn this data into reports.</p>
  <div class="callout callout-info">
    <strong>Checkpoint</strong>
    <p>Run <span class="ic">\dt</span> — you should see six tables. Then \d each table and confirm the foreign keys point where planned.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Seed data is code. Keep it idempotent and versioned so any colleague can rebuild the same starting database on demand.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  'B0000000-0000-4000-8000-000000000419',
  'B0000000-0000-4000-8000-000000000327',
  1,
  'Querying & Tuning the Library',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Querying &amp; Tuning the Library</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Querying &amp; Tuning the Library</h1>
  <p>The database is built and seeded. Now it earns its keep: reports that take every concept from this course — joins, aggregation, CTEs, views, and index tuning — and answer real library questions.</p>
  <h2>Which books are currently out</h2>
  <pre class="code-block">WITH out_copies AS (
  SELECT c.book_id, COUNT(*) AS count
  FROM copy c
  JOIN loan l ON l.copy_id = c.id
  WHERE l.returned_on IS NULL
  GROUP BY c.book_id
)
SELECT b.title, o.count
FROM out_copies o
JOIN book b ON b.id = o.book_id
ORDER BY o.count DESC;</pre>
  <h2>Overdue loans</h2>
  <pre class="code-block">SELECT m.name, b.title, l.due_date
FROM loan l
JOIN member m ON m.id = l.member_id
JOIN copy   c ON c.id = l.copy_id
JOIN book   b ON b.id = c.book_id
WHERE l.returned_on IS NULL
  AND l.due_date &lt; CURRENT_DATE
ORDER BY l.due_date;</pre>
  <h2>Most popular authors</h2>
  <pre class="code-block">SELECT a.name, COUNT(l.id) AS borrows
FROM author a
JOIN book_author ba ON ba.author_id = a.id
JOIN book       b  ON b.id = ba.book_id
JOIN copy       c  ON c.book_id = b.id
JOIN loan       l  ON l.copy_id = c.id
GROUP BY a.name
ORDER BY borrows DESC;</pre>
  <h2>Turning it into a view</h2>
  <pre class="code-block">CREATE VIEW popular_authors AS
SELECT a.id, a.name, COUNT(l.id) AS borrows
FROM author a
JOIN book_author ba ON ba.author_id = a.id
JOIN book       b  ON b.id = ba.book_id
JOIN copy       c  ON c.book_id = b.id
JOIN loan       l  ON l.copy_id = c.id
GROUP BY a.id, a.name;

SELECT * FROM popular_authors ORDER BY borrows DESC;</pre>
  <h2>Tuning it</h2>
  <pre class="code-block">-- Speed up the joins used by the reports above
CREATE INDEX idx_copy_book     ON copy (book_id);
CREATE INDEX idx_loan_copy     ON loan (copy_id);
CREATE INDEX idx_loan_member   ON loan (member_id);
CREATE INDEX idx_loan_unreturned ON loan (due_date) WHERE returned_on IS NULL;</pre>
  <pre class="code-block">EXPLAIN ANALYZE
SELECT * FROM popular_authors ORDER BY borrows DESC;</pre>
  <h2>Wrap-up</h2>
  <p>Your library system demonstrates the whole arc of this course: normalized schema, keys and constraints, efficient joins and aggregation, views for clean access, and indexes backed by EXPLAIN. You are ready for the final assessment.</p>
  <div class="callout callout-info">
    <strong>Practice loop</strong>
    <p>Change a member due date, watch the overdue report change, run EXPLAIN ANALYZE before and after each index, and note the plan difference.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>A tuned database is a cycle, not a one-off: measure, index, re-measure. Keep the reports that prove a change actually helped.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES (9 quiz lessons, 29 questions)
--    Q1 → lesson L3  (501) · Q2 → L6 (504) · Q3 → L9 (507) · Q4 → L12 (510)
--    Q5 → L15 (513)  · Q6 → L18 (516) · Q7 → L21 (519) · Q8 → L24 (522)
--    Q9 → L28 (525-529, final assessment with 5 questions)
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('B0000000-0000-4000-8000-000000000501', 'B0000000-0000-4000-8000-000000000303',
   'What type of database is PostgreSQL?',
   'PostgreSQL is a relational database that stores data in tables with rows and columns.', 1),
  ('B0000000-0000-4000-8000-000000000502', 'B0000000-0000-4000-8000-000000000303',
   'Which client tool is installed together with a PostgreSQL server?',
   'psql is the interactive terminal client that ships with PostgreSQL.', 2),
  ('B0000000-0000-4000-8000-000000000503', 'B0000000-0000-4000-8000-000000000303',
   'Which data type stores binary JSON in PostgreSQL?',
   'JSONB stores JSON in a binary format and supports indexing.', 3),
  ('B0000000-0000-4000-8000-000000000504', 'B0000000-0000-4000-8000-000000000306',
   'Which statement adds new rows to a table?',
   'INSERT INTO adds one or more rows to a table.', 1),
  ('B0000000-0000-4000-8000-000000000505', 'B0000000-0000-4000-8000-000000000306',
   'Which clause filters rows after grouping?',
   'HAVING filters groups, while WHERE filters rows before grouping.', 2),
  ('B0000000-0000-4000-8000-000000000506', 'B0000000-0000-4000-8000-000000000306',
   'Which aggregate function counts the rows in a group?',
   'COUNT returns the number of rows (or non-NULL values) in a group.', 3),
  ('B0000000-0000-4000-8000-000000000507', 'B0000000-0000-4000-8000-000000000309',
   'Which JOIN keeps every row from the left table even without a match?',
   'LEFT JOIN returns all left rows and fills unmatched columns with NULL.', 1),
  ('B0000000-0000-4000-8000-000000000508', 'B0000000-0000-4000-8000-000000000309',
   'Which operator does simple pattern matching in a WHERE clause?',
   'LIKE matches patterns using the % and _ wildcards.', 2),
  ('B0000000-0000-4000-8000-000000000509', 'B0000000-0000-4000-8000-000000000309',
   'Which clause sorts the result set?',
   'ORDER BY sorts rows by one or more columns, ascending or descending.', 3),
  ('B0000000-0000-4000-8000-000000000510', 'B0000000-0000-4000-8000-000000000312',
   'Which clause groups rows that share a value so aggregates can run?',
   'GROUP BY collapses rows into groups; every aggregate then runs per group.', 1),
  ('B0000000-0000-4000-8000-000000000511', 'B0000000-0000-4000-8000-000000000312',
   'Which aggregate function returns the average of a numeric column?',
   'AVG computes the arithmetic mean of the non-NULL values.', 2),
  ('B0000000-0000-4000-8000-000000000512', 'B0000000-0000-4000-8000-000000000312',
   'What does a common table expression (WITH clause) allow you to do?',
   'A CTE names a temporary result set that the rest of the query can reference.', 3),
  ('B0000000-0000-4000-8000-000000000513', 'B0000000-0000-4000-8000-000000000315',
   'Which constraint guarantees all values in a column are different?',
   'UNIQUE rejects duplicate values in the constrained column or combination.', 1),
  ('B0000000-0000-4000-8000-000000000514', 'B0000000-0000-4000-8000-000000000315',
   'Which keyword creates an auto-incrementing key in modern PostgreSQL?',
   'GENERATED ALWAYS AS IDENTITY creates a self-managing integer column.', 2),
  ('B0000000-0000-4000-8000-000000000515', 'B0000000-0000-4000-8000-000000000315',
   'Which constraint enforces an arbitrary condition on column values?',
   'CHECK validates that each value satisfies a boolean expression.', 3),
  ('B0000000-0000-4000-8000-000000000516', 'B0000000-0000-4000-8000-000000000318',
   'Storing a comma-separated list of authors inside one column violates which normal form?',
   'First normal form requires atomic values, so each cell must hold one fact.', 1),
  ('B0000000-0000-4000-8000-000000000517', 'B0000000-0000-4000-8000-000000000318',
   'Which is the default index type in PostgreSQL?',
   'B-tree is the default and works well for equality and range comparisons.', 2),
  ('B0000000-0000-4000-8000-000000000518', 'B0000000-0000-4000-8000-000000000318',
   'Which command shows how PostgreSQL plans and runs a query?',
   'EXPLAIN ANALYZE actually executes the query and reports the plan with timings.', 3),
  ('B0000000-0000-4000-8000-000000000519', 'B0000000-0000-4000-8000-000000000321',
   'Which statement permanently saves the current transaction?',
   'COMMIT ends the transaction and makes its changes visible to other sessions.', 1),
  ('B0000000-0000-4000-8000-000000000520', 'B0000000-0000-4000-8000-000000000321',
   'Which ACID property guarantees that a transaction is all or nothing?',
   'Atomicity means every statement in the transaction succeeds or none of them do.', 2),
  ('B0000000-0000-4000-8000-000000000521', 'B0000000-0000-4000-8000-000000000321',
   'Which isolation level is the default in PostgreSQL?',
   'READ COMMITTED is the default: queries see only committed data from before the statement started.', 3),
  ('B0000000-0000-4000-8000-000000000522', 'B0000000-0000-4000-8000-000000000324',
   'Inside an UPDATE trigger, which record holds the new version of the row?',
   'NEW contains the row values after the change while OLD holds the previous version.', 1),
  ('B0000000-0000-4000-8000-000000000523', 'B0000000-0000-4000-8000-000000000324',
   'Which timing option fires a trigger before the change is applied?',
   'BEFORE triggers run first and can still modify or block the operation.', 2),
  ('B0000000-0000-4000-8000-000000000524', 'B0000000-0000-4000-8000-000000000324',
   'Which object stores a pre-computed result set that you refresh manually?',
   'A materialized view keeps a cached copy of a query result until you REFRESH it.', 3),
  ('B0000000-0000-4000-8000-000000000525', 'B0000000-0000-4000-8000-000000000328',
   'Which statement aborts a transaction and discards its changes?',
   'ROLLBACK undoes everything done inside the current transaction.', 1),
  ('B0000000-0000-4000-8000-000000000526', 'B0000000-0000-4000-8000-000000000328',
   'Which JOIN returns only rows with matches in both tables?',
   'INNER JOIN keeps only the rows where the join condition matches on both sides.', 2),
  ('B0000000-0000-4000-8000-000000000527', 'B0000000-0000-4000-8000-000000000328',
   'Which clause works like WHERE but filters aggregated groups?',
   'HAVING filters the groups produced by GROUP BY.', 3),
  ('B0000000-0000-4000-8000-000000000528', 'B0000000-0000-4000-8000-000000000328',
   'Which statement defines a read-only virtual table from a query?',
   'CREATE VIEW stores the query; its result is evaluated each time the view is queried.', 4),
  ('B0000000-0000-4000-8000-000000000529', 'B0000000-0000-4000-8000-000000000328',
   'What does MVCC stand for in PostgreSQL?',
   'Multiversion Concurrency Control keeps row versions so that readers and writers do not block each other.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the correct one is flagged with
--    is_correct = TRUE (listed first at position 1 in every 4-option block).
--    Q1 (501) options 1001-1004 · Q2 (502) 1005-1008 · Q3 (503) 1009-1012
--    Q4 (504) 1013-1016 · Q5 (505) 1017-1020 · ... · Q29 (529) 1113-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): What type of database is PostgreSQL?
  ('B0000000-0000-4000-8000-000000001001', 'B0000000-0000-4000-8000-000000000501', 'Relational database', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001002', 'B0000000-0000-4000-8000-000000000501', 'Key-value database', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001003', 'B0000000-0000-4000-8000-000000000501', 'Document-only database', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001004', 'B0000000-0000-4000-8000-000000000501', 'Graph database', FALSE, 4),
  -- Q1 (501)q2: client tool
  ('B0000000-0000-4000-8000-000000001005', 'B0000000-0000-4000-8000-000000000502', 'psql', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001006', 'B0000000-0000-4000-8000-000000000502', 'mysql', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001007', 'B0000000-0000-4000-8000-000000000502', 'sqlcmd', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001008', 'B0000000-0000-4000-8000-000000000502', 'mongosh', FALSE, 4),
  -- Q1 (501)q3: binary JSON type
  ('B0000000-0000-4000-8000-000000001009', 'B0000000-0000-4000-8000-000000000503', 'JSONB', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001010', 'B0000000-0000-4000-8000-000000000503', 'TEXT', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001011', 'B0000000-0000-4000-8000-000000000503', 'XML', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001012', 'B0000000-0000-4000-8000-000000000503', 'ARRAY', FALSE, 4),
  -- Q2 (504): statement that adds rows
  ('B0000000-0000-4000-8000-000000001013', 'B0000000-0000-4000-8000-000000000504', 'INSERT', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001014', 'B0000000-0000-4000-8000-000000000504', 'SELECT', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001015', 'B0000000-0000-4000-8000-000000000504', 'UPDATE', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001016', 'B0000000-0000-4000-8000-000000000504', 'DELETE', FALSE, 4),
  -- Q2 (504)q2: clause after grouping
  ('B0000000-0000-4000-8000-000000001017', 'B0000000-0000-4000-8000-000000000505', 'HAVING', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001018', 'B0000000-0000-4000-8000-000000000505', 'WHERE', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001019', 'B0000000-0000-4000-8000-000000000505', 'ORDER BY', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001020', 'B0000000-0000-4000-8000-000000000505', 'LIMIT', FALSE, 4),
  -- Q2 (504)q3: row counter
  ('B0000000-0000-4000-8000-000000001021', 'B0000000-0000-4000-8000-000000000506', 'COUNT', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001022', 'B0000000-0000-4000-8000-000000000506', 'SUM', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001023', 'B0000000-0000-4000-8000-000000000506', 'ROUND', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001024', 'B0000000-0000-4000-8000-000000000506', 'LENGTH', FALSE, 4),
  -- Q3 (507): left-keeping join
  ('B0000000-0000-4000-8000-000000001025', 'B0000000-0000-4000-8000-000000000507', 'LEFT JOIN', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001026', 'B0000000-0000-4000-8000-000000000507', 'INNER JOIN', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001027', 'B0000000-0000-4000-8000-000000000507', 'CROSS JOIN', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001028', 'B0000000-0000-4000-8000-000000000507', 'RIGHT JOIN', FALSE, 4),
  -- Q3 (507)q2: pattern operator
  ('B0000000-0000-4000-8000-000000001029', 'B0000000-0000-4000-8000-000000000508', 'LIKE', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001030', 'B0000000-0000-4000-8000-000000000508', 'MATCH', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001031', 'B0000000-0000-4000-8000-000000000508', 'FIND', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001032', 'B0000000-0000-4000-8000-000000000508', 'CONTAINS', FALSE, 4),
  -- Q3 (507)q3: sorting clause
  ('B0000000-0000-4000-8000-000000001033', 'B0000000-0000-4000-8000-000000000509', 'ORDER BY', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001034', 'B0000000-0000-4000-8000-000000000509', 'GROUP BY', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001035', 'B0000000-0000-4000-8000-000000000509', 'SORT', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001036', 'B0000000-0000-4000-8000-000000000509', 'HAVING', FALSE, 4),
  -- Q4 (510): grouping clause
  ('B0000000-0000-4000-8000-000000001037', 'B0000000-0000-4000-8000-000000000510', 'GROUP BY', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001038', 'B0000000-0000-4000-8000-000000000510', 'ORDER BY', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001039', 'B0000000-0000-4000-8000-000000000510', 'WHERE', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001040', 'B0000000-0000-4000-8000-000000000510', 'LIMIT', FALSE, 4),
  -- Q4 (510)q2: average
  ('B0000000-0000-4000-8000-000000001041', 'B0000000-0000-4000-8000-000000000511', 'AVG', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001042', 'B0000000-0000-4000-8000-000000000511', 'SUM', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001043', 'B0000000-0000-4000-8000-000000000511', 'COUNT', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001044', 'B0000000-0000-4000-8000-000000000511', 'MEDIAN', FALSE, 4),
  -- Q4 (510)q3: CTE purpose
  ('B0000000-0000-4000-8000-000000001045', 'B0000000-0000-4000-8000-000000000512', 'Name a reusable temporary result set', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001046', 'B0000000-0000-4000-8000-000000000512', 'Create a permanent table', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001047', 'B0000000-0000-4000-8000-000000000512', 'Delete duplicate rows automatically', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001048', 'B0000000-0000-4000-8000-000000000512', 'Change column data types', FALSE, 4),
  -- Q5 (513): uniqueness constraint
  ('B0000000-0000-4000-8000-000000001049', 'B0000000-0000-4000-8000-000000000513', 'UNIQUE', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001050', 'B0000000-0000-4000-8000-000000000513', 'NOT NULL', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001051', 'B0000000-0000-4000-8000-000000000513', 'CHECK', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001052', 'B0000000-0000-4000-8000-000000000513', 'DEFAULT', FALSE, 4),
  -- Q5 (513)q2: auto-increment key
  ('B0000000-0000-4000-8000-000000001053', 'B0000000-0000-4000-8000-000000000514', 'GENERATED ALWAYS AS IDENTITY', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001054', 'B0000000-0000-4000-8000-000000000514', 'AUTO NUMBER', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001055', 'B0000000-0000-4000-8000-000000000514', 'ROW NUMBER', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001056', 'B0000000-0000-4000-8000-000000000514', 'SEQUENCE KEY', FALSE, 4),
  -- Q5 (513)q3: arbitrary condition
  ('B0000000-0000-4000-8000-000000001057', 'B0000000-0000-4000-8000-000000000515', 'CHECK', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001058', 'B0000000-0000-4000-8000-000000000515', 'FOREIGN KEY', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001059', 'B0000000-0000-4000-8000-000000000515', 'INDEX', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001060', 'B0000000-0000-4000-8000-000000000515', 'TRIGGER', FALSE, 4),
  -- Q6 (516): atomic values (1NF)
  ('B0000000-0000-4000-8000-000000001061', 'B0000000-0000-4000-8000-000000000516', 'First normal form (1NF)', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001062', 'B0000000-0000-4000-8000-000000000516', 'Second normal form (2NF)', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001063', 'B0000000-0000-4000-8000-000000000516', 'Third normal form (3NF)', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001064', 'B0000000-0000-4000-8000-000000000516', 'Boyce-Codd normal form (BCNF)', FALSE, 4),
  -- Q6 (516)q2: default index type
  ('B0000000-0000-4000-8000-000000001065', 'B0000000-0000-4000-8000-000000000517', 'B-tree', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001066', 'B0000000-0000-4000-8000-000000000517', 'Hash', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001067', 'B0000000-0000-4000-8000-000000000517', 'GIN', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001068', 'B0000000-0000-4000-8000-000000000517', 'GiST', FALSE, 4),
  -- Q6 (516)q3: execution plan tool
  ('B0000000-0000-4000-8000-000000001069', 'B0000000-0000-4000-8000-000000000518', 'EXPLAIN ANALYZE', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001070', 'B0000000-0000-4000-8000-000000000518', 'SHOW PLAN', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001071', 'B0000000-0000-4000-8000-000000000518', 'DESCRIBE', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001072', 'B0000000-0000-4000-8000-000000000518', 'TRACE', FALSE, 4),
  -- Q7 (519): save transaction
  ('B0000000-0000-4000-8000-000000001073', 'B0000000-0000-4000-8000-000000000519', 'COMMIT', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001074', 'B0000000-0000-4000-8000-000000000519', 'ROLLBACK', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001075', 'B0000000-0000-4000-8000-000000000519', 'SAVEPOINT', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001076', 'B0000000-0000-4000-8000-000000000519', 'BEGIN', FALSE, 4),
  -- Q7 (519)q2: atomicity
  ('B0000000-0000-4000-8000-000000001077', 'B0000000-0000-4000-8000-000000000520', 'Atomicity', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001078', 'B0000000-0000-4000-8000-000000000520', 'Consistency', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001079', 'B0000000-0000-4000-8000-000000000520', 'Isolation', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001080', 'B0000000-0000-4000-8000-000000000520', 'Durability', FALSE, 4),
  -- Q7 (519)q3: default isolation level
  ('B0000000-0000-4000-8000-000000001081', 'B0000000-0000-4000-8000-000000000521', 'READ COMMITTED', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001082', 'B0000000-0000-4000-8000-000000000521', 'READ UNCOMMITTED', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001083', 'B0000000-0000-4000-8000-000000000521', 'SERIALIZABLE', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001084', 'B0000000-0000-4000-8000-000000000521', 'REPEATABLE READ', FALSE, 4),
  -- Q8 (522): NEW record
  ('B0000000-0000-4000-8000-000000001085', 'B0000000-0000-4000-8000-000000000522', 'NEW', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001086', 'B0000000-0000-4000-8000-000000000522', 'OLD', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001087', 'B0000000-0000-4000-8000-000000000522', 'CURRENT', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001088', 'B0000000-0000-4000-8000-000000000522', 'ROW', FALSE, 4),
  -- Q8 (522)q2: trigger timing
  ('B0000000-0000-4000-8000-000000001089', 'B0000000-0000-4000-8000-000000000523', 'BEFORE', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001090', 'B0000000-0000-4000-8000-000000000523', 'AFTER', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001091', 'B0000000-0000-4000-8000-000000000523', 'INSTEAD OF', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001092', 'B0000000-0000-4000-8000-000000000523', 'ON COMMIT', FALSE, 4),
  -- Q8 (522)q3: cached result object
  ('B0000000-0000-4000-8000-000000001093', 'B0000000-0000-4000-8000-000000000524', 'Materialized view', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001094', 'B0000000-0000-4000-8000-000000000524', 'Regular view', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001095', 'B0000000-0000-4000-8000-000000000524', 'Index', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001096', 'B0000000-0000-4000-8000-000000000524', 'Sequence', FALSE, 4),
  -- Q9 (525): abort transaction
  ('B0000000-0000-4000-8000-000000001097', 'B0000000-0000-4000-8000-000000000525', 'ROLLBACK', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001098', 'B0000000-0000-4000-8000-000000000525', 'COMMIT', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001099', 'B0000000-0000-4000-8000-000000000525', 'CHECKPOINT', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001100', 'B0000000-0000-4000-8000-000000000525', 'CANCEL', FALSE, 4),
  -- Q9 (525)q2: matching rows only
  ('B0000000-0000-4000-8000-000000001101', 'B0000000-0000-4000-8000-000000000526', 'INNER JOIN', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001102', 'B0000000-0000-4000-8000-000000000526', 'LEFT JOIN', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001103', 'B0000000-0000-4000-8000-000000000526', 'FULL JOIN', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001104', 'B0000000-0000-4000-8000-000000000526', 'CROSS JOIN', FALSE, 4),
  -- Q9 (525)q3: group filter
  ('B0000000-0000-4000-8000-000000001105', 'B0000000-0000-4000-8000-000000000527', 'HAVING', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001106', 'B0000000-0000-4000-8000-000000000527', 'WHERE', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001107', 'B0000000-0000-4000-8000-000000000527', 'FILTER', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001108', 'B0000000-0000-4000-8000-000000000527', 'LIMIT', FALSE, 4),
  -- Q9 (525)q4: virtual table
  ('B0000000-0000-4000-8000-000000001109', 'B0000000-0000-4000-8000-000000000528', 'CREATE VIEW', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001110', 'B0000000-0000-4000-8000-000000000528', 'CREATE TABLE', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001111', 'B0000000-0000-4000-8000-000000000528', 'CREATE INDEX', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001112', 'B0000000-0000-4000-8000-000000000528', 'CREATE TRIGGER', FALSE, 4),
  -- Q9 (525)q5: MVCC meaning
  ('B0000000-0000-4000-8000-000000001113', 'B0000000-0000-4000-8000-000000000529', 'Multiversion Concurrency Control', TRUE,  1),
  ('B0000000-0000-4000-8000-000000001114', 'B0000000-0000-4000-8000-000000000529', 'Multi-Value Column Cache', FALSE, 2),
  ('B0000000-0000-4000-8000-000000001115', 'B0000000-0000-4000-8000-000000000529', 'Managed Virtual Column Catalog', FALSE, 3),
  ('B0000000-0000-4000-8000-000000001116', 'B0000000-0000-4000-8000-000000000529', 'Memory Virtualized Constraint Check', FALSE, 4)
ON CONFLICT (id) DO NOTHING;