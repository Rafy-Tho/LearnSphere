-- ============================================================================
-- SEED 056: Complete course â€” "SQL for Data Analysis"
-- ----------------------------------------------------------------------------
-- Instructor : Anita Patel        (10000000-0000-4000-8000-000000000003)
-- Category   : Data Science       (20000000-0000-4000-8000-000000000003)
-- Level      : BEGINNER Â· Access : FREE Â· Status : PUBLISHED
--
-- Structure (5 modules â†’ 10 chapters â†’ 28 lessons):
--   M1 SQL Query Foundations      â†’ C1 Querying Data with SELECT Â· C2 Filtering & Sorting
--   M2 Aggregation & Grouping     â†’ C3 Aggregate Functions Â· C4 Conditional Logic & NULLs
--   M3 Joins & Combining Data     â†’ C5 Relational Joins Â· C6 Subqueries & CTEs
--   M4 Advanced Analysis          â†’ C7 Window Functions Â· C8 Dates & Reporting
--   M5 Capstone: Analytics Project â†’ C9 Defining the Questions Â· C10 Building & Presenting
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
  '03800000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000003',
  '20000000-0000-4000-8000-000000000003',
  'SQL for Data Analysis',
  'sql-for-data-analysis',
  'Turn raw tables into answers. Learn to query, filter, aggregate, and join data, then apply CASE expressions, CTEs, window functions, and date logic to a complete analytics capstone project.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  54
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03800000-0000-4000-8000-000000000011', '03800000-0000-4000-8000-000000000001', 'Write SELECT queries that filter, sort, and limit rows confidently.',           1),
  ('03800000-0000-4000-8000-000000000012', '03800000-0000-4000-8000-000000000001', 'Summarize data with aggregate functions, GROUP BY, and HAVING.',                 2),
  ('03800000-0000-4000-8000-000000000013', '03800000-0000-4000-8000-000000000001', 'Combine tables with joins and shape results with CASE and NULL handling.',       3),
  ('03800000-0000-4000-8000-000000000014', '03800000-0000-4000-8000-000000000001', 'Use subqueries, CTEs, and window functions for advanced analysis.',              4),
  ('03800000-0000-4000-8000-000000000015', '03800000-0000-4000-8000-000000000001', 'Deliver a complete analytics project from business question to exported insight.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03800000-0000-4000-8000-000000000101', '03800000-0000-4000-8000-000000000001', 1, 'SQL Query Foundations',     'Write SELECT queries and control exactly which rows you see.',       'PUBLISHED'),
  ('03800000-0000-4000-8000-000000000102', '03800000-0000-4000-8000-000000000001', 2, 'Aggregation & Grouping',    'Summarize data by group and handle missing values.',                'PUBLISHED'),
  ('03800000-0000-4000-8000-000000000103', '03800000-0000-4000-8000-000000000001', 3, 'Joins & Combining Data',    'Bring multiple tables together and reuse logic with CTEs.',         'PUBLISHED'),
  ('03800000-0000-4000-8000-000000000104', '03800000-0000-4000-8000-000000000001', 4, 'Advanced Analysis',         'Rank rows, compute running totals, and work with dates.',           'PUBLISHED'),
  ('03800000-0000-4000-8000-000000000105', '03800000-0000-4000-8000-000000000001', 5, 'Capstone: Analytics Project', 'Answer real questions end to end and present your insights.',     'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03800000-0000-4000-8000-000000000201', '03800000-0000-4000-8000-000000000101', 1, 'Querying Data with SELECT',  'Read tables and choose the columns you need.',                      'PUBLISHED'),
  ('03800000-0000-4000-8000-000000000202', '03800000-0000-4000-8000-000000000101', 2, 'Filtering & Sorting',        'Keep the right rows and order the result.',                         'PUBLISHED'),
  ('03800000-0000-4000-8000-000000000203', '03800000-0000-4000-8000-000000000102', 1, 'Aggregate Functions',        'Count, sum, and average across rows.',                              'PUBLISHED'),
  ('03800000-0000-4000-8000-000000000204', '03800000-0000-4000-8000-000000000102', 2, 'Conditional Logic & NULLs',  'Branch values with CASE and tame missing data.',                    'PUBLISHED'),
  ('03800000-0000-4000-8000-000000000205', '03800000-0000-4000-8000-000000000103', 1, 'Relational Joins',           'Match rows across related tables.',                                 'PUBLISHED'),
  ('03800000-0000-4000-8000-000000000206', '03800000-0000-4000-8000-000000000103', 2, 'Subqueries & CTEs',          'Nest queries and name intermediate results.',                       'PUBLISHED'),
  ('03800000-0000-4000-8000-000000000207', '03800000-0000-4000-8000-000000000104', 1, 'Window Functions',           'Rank rows and compute running totals.',                             'PUBLISHED'),
  ('03800000-0000-4000-8000-000000000208', '03800000-0000-4000-8000-000000000104', 2, 'Dates & Reporting',          'Group by time and export your findings.',                           'PUBLISHED'),
  ('03800000-0000-4000-8000-000000000209', '03800000-0000-4000-8000-000000000105', 1, 'Defining the Questions',     'Frame the analysis before writing a query.',                        'PUBLISHED'),
  ('03800000-0000-4000-8000-000000000210', '03800000-0000-4000-8000-000000000105', 2, 'Building & Presenting',      'Assemble, validate, and communicate insights.',                     'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03800000-â€¦-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03800000-0000-4000-8000-000000000301', '03800000-0000-4000-8000-000000000201', 1, 'Why SQL for Data Analysis?',          'See how SQL fits into the analytics workflow and where data lives.',      'TEXT',  'PUBLISHED', 'FREE', 10,  5),
  ('03800000-0000-4000-8000-000000000302', '03800000-0000-4000-8000-000000000201', 2, 'SELECT & Column Expressions',         'Read tables, alias columns, and compute derived values.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03800000-0000-4000-8000-000000000303', '03800000-0000-4000-8000-000000000201', 3, 'Query Basics Quiz',                   'Check your understanding of SELECT and rows.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03800000-0000-4000-8000-000000000304', '03800000-0000-4000-8000-000000000202', 1, 'Filtering Rows with WHERE',           'Keep only the rows that answer your question.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03800000-0000-4000-8000-000000000305', '03800000-0000-4000-8000-000000000202', 2, 'Sorting & Limiting Results',          'Order output meaningfully and return the top rows.',                      'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03800000-0000-4000-8000-000000000306', '03800000-0000-4000-8000-000000000202', 3, 'Filtering & Sorting Quiz',            'Test your grasp of WHERE, ORDER BY, and LIMIT.',                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03800000-0000-4000-8000-000000000307', '03800000-0000-4000-8000-000000000203', 1, 'Aggregate Functions',                 'Count, sum, and average with COUNT, SUM, AVG, MIN, MAX.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03800000-0000-4000-8000-000000000308', '03800000-0000-4000-8000-000000000203', 2, 'GROUP BY & HAVING',                   'Summarize one row per group and filter those groups.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03800000-0000-4000-8000-000000000309', '03800000-0000-4000-8000-000000000203', 3, 'Aggregation Quiz',                    'Verify your aggregation and grouping skills.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03800000-0000-4000-8000-000000000310', '03800000-0000-4000-8000-000000000204', 1, 'Conditional Logic with CASE',         'Build categories and conditional values row by row.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03800000-0000-4000-8000-000000000311', '03800000-0000-4000-8000-000000000204', 2, 'Handling NULL Values',                'Detect, replace, and compare missing values safely.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03800000-0000-4000-8000-000000000312', '03800000-0000-4000-8000-000000000204', 3, 'CASE & NULLs Quiz',                   'Check your conditional logic and NULL handling.',                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03800000-0000-4000-8000-000000000313', '03800000-0000-4000-8000-000000000205', 1, 'Combining Tables with JOINs',         'Match rows across tables using INNER and LEFT joins.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03800000-0000-4000-8000-000000000314', '03800000-0000-4000-8000-000000000205', 2, 'LEFT, RIGHT & FULL Joins',            'Keep unmatched rows and understand every join type.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03800000-0000-4000-8000-000000000315', '03800000-0000-4000-8000-000000000205', 3, 'Joins Quiz',                          'Prove you can combine tables correctly.',                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03800000-0000-4000-8000-000000000316', '03800000-0000-4000-8000-000000000206', 1, 'Subqueries & Derived Tables',         'Use a query as an input to another query.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03800000-0000-4000-8000-000000000317', '03800000-0000-4000-8000-000000000206', 2, 'Common Table Expressions',            'Name intermediate results with WITH for readable SQL.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03800000-0000-4000-8000-000000000318', '03800000-0000-4000-8000-000000000206', 3, 'Subqueries & CTEs Quiz',              'Test your ability to structure complex queries.',                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03800000-0000-4000-8000-000000000319', '03800000-0000-4000-8000-000000000207', 1, 'Window Functions: ROW_NUMBER & RANK', 'Number and rank rows without collapsing them.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03800000-0000-4000-8000-000000000320', '03800000-0000-4000-8000-000000000207', 2, 'Running Totals & Moving Averages',    'Compute cumulative and rolling metrics over a window.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03800000-0000-4000-8000-000000000321', '03800000-0000-4000-8000-000000000207', 3, 'Window Functions Quiz',               'Check your windowing and ranking knowledge.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03800000-0000-4000-8000-000000000322', '03800000-0000-4000-8000-000000000208', 1, 'Date & Time Functions',               'Extract, truncate, and compare dates for time analysis.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03800000-0000-4000-8000-000000000323', '03800000-0000-4000-8000-000000000208', 2, 'Formatting & Exporting Insights',     'Round, format, and export results for stakeholders.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03800000-0000-4000-8000-000000000324', '03800000-0000-4000-8000-000000000208', 3, 'Dates & Export Quiz',                 'Verify your date handling and reporting skills.',                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03800000-0000-4000-8000-000000000325', '03800000-0000-4000-8000-000000000209', 1, 'Capstone: Defining the Questions',    'Translate a business prompt into analytical questions.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03800000-0000-4000-8000-000000000326', '03800000-0000-4000-8000-000000000210', 1, 'Capstone: Building the Analysis',     'Write the queries that answer each question.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03800000-0000-4000-8000-000000000327', '03800000-0000-4000-8000-000000000210', 2, 'Capstone: Presenting Results',        'Validate your numbers and communicate the insight.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03800000-0000-4000-8000-000000000328', '03800000-0000-4000-8000-000000000210', 3, 'Final Assessment',                    'Prove what you learned across the whole course.',                         'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03800000-â€¦-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03800000-0000-4000-8000-000000000401',
  '03800000-0000-4000-8000-000000000301',
  1,
  'Why SQL for Data Analysis?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Why SQL for Data Analysis?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Why SQL for Data Analysis?</h1>
  <p>Data analysis turns raw records into decisions. Before you can chart, model, or forecast anything, you must <strong>extract</strong> the right rows and <strong>shape</strong> them into the right form â€” and the universal language for that job is SQL (Structured Query Language).</p>
  <p>SQL is <em>declarative</em>: you describe the result you want, and the database engine works out how to produce it. That single idea is why SQL has survived for fifty years and remains the backbone of every analytics stack, from a small Postgres instance to a cloud data warehouse.</p>
  <h2>The analytics workflow</h2>
  <ol>
    <li><strong>Ask</strong> a clear question that maps to a decision.</li>
    <li><strong>Query</strong> â€” write SQL that pulls only the needed data.</li>
    <li><strong>Transform</strong> â€” aggregate, join, and label to build a metric.</li>
    <li><strong>Interpret</strong> â€” read the result in context, check for surprises.</li>
    <li><strong>Share</strong> â€” export or visualize so others can act.</li>
  </ol>
  <p>This course is about steps 2â€“3 across situations you will meet every day as an analyst.</p>
  <h2>Where your data lives</h2>
  <p>Businesses rarely keep one giant table. Facts are split into small, related tables:</p>
  <table>
    <tr><th>Table</th><th>What each row holds</th><th>Sample columns</th></tr>
    <tr><td>customers</td><td>one customer</td><td>customer_id, country, signup_date</td></tr>
    <tr><td>orders</td><td>one purchase</td><td>order_id, customer_id, total, status</td></tr>
    <tr><td>products</td><td>one product for sale</td><td>product_id, name, price</td></tr>
    <tr><td>orders_products</td><td>one product line inside an order</td><td>order_id, product_id, quantity</td></tr>
  </table>
  <p>Because the tables share key columns, you can <em>join</em> them to answer questions that span the business.</p>
  <h2>Your first analytical query</h2>
  <p>Most analyst days begin with a quick count. Every SQL query you will write follows the same spine:</p>
  <pre class="code-block">SELECT COUNT(*) AS customer_count
FROM customers;</pre>
  <p>The <span class="ic">SELECT</span> lists what to return, <span class="ic">FROM</span> chooses the source table, and everything else narrows or reshapes that result.</p>
  <div class="callout callout-tip">
    <strong>Read queries as sentence templates</strong>
    <p>&ldquo;From customers, give me the count of rows.&rdquo; When SQL reads like an English sentence it is almost always correct â€” and easy to explain at review.</p>
  </div>
  <div class="callout callout-info">
    <strong>Prerequisites</strong>
    <p>No prior SQL is assumed. If you can think in rows and columns â€” like a spreadsheet â€” you already have the mental model. This course adds the precise vocabulary.</p>
  </div>
  <h2>What you will build</h2>
  <p>By the end, you will complete a <strong>capstone analytics project</strong>: a board of questions about an e-commerce store, answered with joins, aggregations, window functions, and clean exported reports â€” the same skills used in day-to-day analytics roles.</p>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000402',
  '03800000-0000-4000-8000-000000000302',
  1,
  'SELECT & Column Expressions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SELECT & Column Expressions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>SELECT &amp; Column Expressions</h1>
  <p>The <span class="ic">SELECT</span> list decides <em>which columns</em> come back and in what order. It is the most literal part of SQL â€” and where you first translate business terms into columns.</p>
  <h2>Choosing columns</h2>
  <p>Ask for exactly the columns you need. Returning everything with <span class="ic">*</span> is fine for exploration, but reports should be explicit:</p>
  <pre class="code-block">-- exploration
SELECT *
FROM customers;

-- precise report output
SELECT customer_id, first_name, last_name, country
FROM customers;</pre>
  <h2>Aliases</h2>
  <p>Use <span class="ic">AS</span> to rename a column in the result. Aliases make reports readable and give expressions a name:</p>
  <pre class="code-block">SELECT
  first_name  AS given_name,
  last_name   AS family_name
FROM customers;</pre>
  <h2>Column expressions</h2>
  <p>Any value in the SELECT list may be an <em>expression</em> â€” arithmetic on columns works row by row:</p>
  <pre class="code-block">SELECT
  order_id,
  total,
  total * 0.2  AS tax_estimate,
  total * 0.8  AS revenue_after_ship
FROM orders;</pre>
  <div class="callout callout-info">
    <strong>Expressions never change the table</strong>
    <p>Computed columns exist only in the result. The stored data stays untouched â€” expressions are read-only, which makes them perfectly safe for exploration.</p>
  </div>
  <h2>String helpers you will use constantly</h2>
  <table>
    <tr><th>Function</th><th>Does</th><th>Example</th></tr>
    <tr><td>UPPER / LOWER</td><td>change case</td><td>UPPER(country)</td></tr>
    <tr><td>CONCAT</td><td>join strings</td><td>CONCAT(first_name, ' ', last_name)</td></tr>
    <tr><td>LENGTH</td><td>character count</td><td>LENGTH(email)</td></tr>
    <tr><td>TRIM</td><td>strip spaces</td><td>TRIM(city)</td></tr>
  </table>
  <pre class="code-block">SELECT
  CONCAT(first_name, ' ', last_name) AS full_name,
  LENGTH(email)                      AS email_length
FROM customers;</pre>
  <h2>DISTINCT â€” unique values</h2>
  <p>When a column repeats, <span class="ic">DISTINCT</span> collapses to one row per unique value:</p>
  <pre class="code-block">SELECT DISTINCT country
FROM customers
ORDER BY country;</pre>
  <div class="callout">
    <strong>DISTINCT is a filter, not a summary</strong>
    <p>Use <span class="ic">DISTINCT</span> to list unique values, not to compute totals. Real counting happens with aggregation in module 2.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Alias for every expression</strong>
    <p>A bare expression is named after its source text in the output. Giving it a real name â€” <span class="ic">AS tax_estimate</span> â€” prevents confusion when the report reaches a stakeholder.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000404',
  '03800000-0000-4000-8000-000000000304',
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
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Filtering Rows with WHERE</h1>
  <p>Most questions apply to a <em>slice</em> of your data: this quarter, these countries, those orders. The <span class="ic">WHERE</span> clause keeps only the rows that satisfy a condition.</p>
  <h2>The basic shape</h2>
  <pre class="code-block">SELECT customer_id, first_name, country
FROM customers
WHERE country = 'Portugal';</pre>
  <p>Text and dates are wrapped in single quotes; numbers and booleans are not.</p>
  <h2>Comparison operators</h2>
  <table>
    <tr><th>Operator</th><th>Matches</th></tr>
    <tr><td>=</td><td>equal to</td></tr>
    <tr><td>&lt;&gt; or !=</td><td>not equal to</td></tr>
    <tr><td>&gt; &gt;=</td><td>greater than / at least</td></tr>
    <tr><td>&lt; &lt;=</td><td>less than / at most</td></tr>
  </table>
  <pre class="code-block">SELECT order_id, total
FROM orders
WHERE total &gt;= 100
  AND status &lt;&gt; 'cancelled';</pre>
  <h2>Combining conditions</h2>
  <ul>
    <li><span class="ic">AND</span> â€” both sides must be true.</li>
    <li><span class="ic">OR</span> â€” at least one side must be true.</li>
    <li><span class="ic">NOT</span> â€” flips a condition.</li>
  </ul>
  <pre class="code-block">SELECT order_id, total
FROM orders
WHERE total &gt;= 100
  AND (status = 'paid' OR status = 'shipped');</pre>
  <div class="callout">
    <strong>AND binds tighter than OR</strong>
    <p>Just like arithmetic precedence, SQL evaluates AND before OR. Use parentheses the moment you combine them â€” it reads exactly the way you intend.</p>
  </div>
  <h2>BETWEEN, IN, LIKE</h2>
  <pre class="code-block">-- inclusive range
WHERE order_date BETWEEN '2024-01-01' AND '2024-06-30'

-- any value from a short list
WHERE country IN ('Portugal', 'Spain', 'France')

-- pattern: % any run of characters, _ exactly one
WHERE email LIKE '%@example.com'

-- negation of all of the above
WHERE country NOT IN ('Portugal', 'Spain')</pre>
  <div class="callout callout-tip">
    <strong>Quote the literals</strong>
    <p>Dates are strings in SQL text: <span class="ic">'2024-01-01'</span>. The single quotes are part of the syntax, not decoration â€” dropping them is a classic beginner error.</p>
  </div>
  <div class="callout callout-info">
    <strong>Filter as early as you can</strong>
    <p>WHERE runs before grouping, sorting, and limiting. Shrinking the row set early makes everything downstream faster and the answer easier to reason about.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000405',
  '03800000-0000-4000-8000-000000000305',
  1,
  'Sorting & Limiting Results',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sorting & Limiting Results</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Sorting &amp; Limiting Results</h1>
  <p>An unsorted result is a random slice of your data. Analysts almost always need <em>order</em> â€” the latest, the largest, the worst. Two clauses deliver that: <span class="ic">ORDER BY</span> and <span class="ic">LIMIT</span>.</p>
  <h2>ORDER BY</h2>
  <p>Every reach of the result is placed by column value. Ascending (<span class="ic">ASC</span>) is the default; descending is <span class="ic">DESC</span>:</p>
  <pre class="code-block">SELECT order_id, order_date, total
FROM orders
ORDER BY order_date DESC;</pre>
  <p>Multiple keys sort left to right â€” the second one breaks ties in the first:</p>
  <pre class="code-block">SELECT country, total
FROM orders
ORDER BY country ASC, total DESC;</pre>
  <h2>Sorting by expressions</h2>
  <p>You can order by any expression, not just a stored column:</p>
  <pre class="code-block">SELECT order_id, total
FROM orders
ORDER BY total * 0.2 DESC;</pre>
  <h2>LIMIT and OFFSET</h2>
  <p><span class="ic">LIMIT</span> keeps the first N rows of the ordered result; <span class="ic">OFFSET</span> skips M rows first:</p>
  <pre class="code-block">-- the 10 highest-total orders
SELECT order_id, total
FROM orders
ORDER BY total DESC
LIMIT 10;

-- rows 11-20 of the same ranking (page 2)
SELECT order_id, total
FROM orders
ORDER BY total DESC
LIMIT 10 OFFSET 10;</pre>
  <div class="callout">
    <strong>LIMIT without ORDER BY is a lie</strong>
    <p>Without ordering, the database may return any rows â€” there is no &ldquo;first.&rdquo; Every time you want &ldquo;top N,&rdquo; write the ORDER BY first.</p>
  </div>
  <h2>NULLs in sort order</h2>
  <p>Postgres sorts NULLs last when ascending by default; you can force the behavior explicitly:</p>
  <pre class="code-block">SELECT product_id, discounted_price
FROM products
ORDER BY discounted_price ASC NULLS LAST;</pre>
  <div class="callout callout-tip">
    <strong>Tie-break explicitly</strong>
    <p>Two equal values can come back in any order. Adding a stable tie-breaker such as <span class="ic">ORDER BY total DESC, order_id</span> makes repeated runs return identical lists.</p>
  </div>
  <div class="callout callout-info">
    <strong>Performance note</strong>
    <p>Sorting a huge result costs time. Combine WHERE with ORDER BY and LIMIT so the database works with the smallest useful row set â€” and your reports stay responsive.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000407',
  '03800000-0000-4000-8000-000000000307',
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
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Aggregate Functions</h1>
  <p>Aggregates collapse many rows into one summary number. They are the numerical heart of analytics: total revenue, average order, newest signup, worst month.</p>
  <h2>The core five</h2>
  <table>
    <tr><th>Function</th><th>Answers</th><th>Notes</th></tr>
    <tr><td>COUNT(*)</td><td>How many rows?</td><td>counts every row</td></tr>
    <tr><td>COUNT(col)</td><td>How many non-NULL values?</td><td>ignores NULLs</td></tr>
    <tr><td>SUM(col)</td><td>What is the total?</td><td>numeric only</td></tr>
    <tr><td>AVG(col)</td><td>What is the average?</td><td>ignores NULLs</td></tr>
    <tr><td>MIN / MAX</td><td>Smallest / largest?</td><td>works on text too</td></tr>
  </table>
  <pre class="code-block">SELECT
  COUNT(*)             AS order_count,
  SUM(total)           AS revenue,
  ROUND(AVG(total), 2) AS average_order,
  MIN(total)           AS smallest_order,
  MAX(total)           AS largest_order
FROM orders;</pre>
  <div class="callout">
    <strong>COUNT(*) vs COUNT(column)</strong>
    <p><span class="ic">COUNT(*)</span> counts every row, even rows full of NULLs. <span class="ic">COUNT(some_column)</span> skips NULLs â€” a subtle but crucial difference when columns are missing data.</p>
  </div>
  <h2>Aggregates ignore rows you filtered away</h2>
  <p>WHERE runs first, so every aggregate reflects only the surviving rows:</p>
  <pre class="code-block">SELECT
  COUNT(*)   AS paid_orders,
  SUM(total) AS paid_revenue
FROM orders
WHERE status = 'paid'
  AND order_date &gt;= '2024-01-01';</pre>
  <h2>Aggregating expressions</h2>
  <p>You can aggregate a calculated value â€” useful when the stored column is coarse:</p>
  <pre class="code-block">SELECT
  ROUND(AVG(quantity * unit_price), 2) AS avg_line_value,
  SUM(quantity * unit_price)           AS total_catalog_value
FROM products;</pre>
  <div class="callout callout-tip">
    <strong>Name every aggregate</strong>
    <p>An unnamed aggregate shows up as a cryptic column header. Aliases like <span class="ic">AS revenue</span> turn query output into a readable report.</p>
  </div>
  <div class="callout callout-info">
    <strong>One row â€” unless you group</strong>
    <p>A pure aggregate query returns exactly one row for the whole table. To see totals per country, per month, per product â€” the real analyst job â€” you must add GROUP BY, the next lesson.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000408',
  '03800000-0000-4000-8000-000000000308',
  1,
  'GROUP BY & HAVING',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GROUP BY & HAVING</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>GROUP BY &amp; HAVING</h1>
  <p><span class="ic">GROUP BY</span> splits rows into buckets and runs the aggregate once per bucket. That single clause produces every &ldquo;by dimension&rdquo; report: revenue by country, sales by month, orders by product.</p>
  <h2>The pattern</h2>
  <pre class="code-block">SELECT
  country,
  COUNT(*)   AS order_count,
  SUM(total) AS revenue
FROM orders
GROUP BY country
ORDER BY revenue DESC;</pre>
  <div class="callout">
    <strong>The golden rule</strong>
    <p>Every column in the SELECT list must be either an aggregate or listed in GROUP BY. Pulling an ungrouped plain column into SELECT is an error â€” the database will refuse.</p>
  </div>
  <h2>Grouping by more than one column</h2>
  <p>Each combination of group columns becomes its own bucket:</p>
  <pre class="code-block">SELECT
  country,
  status,
  COUNT(*)   AS order_count,
  SUM(total) AS revenue
FROM orders
GROUP BY country, status
ORDER BY country, revenue DESC;</pre>
  <h2>Grouping by an expression</h2>
  <p>The grouping key may itself be an expression â€” classic for bucketing time or values:</p>
  <pre class="code-block">SELECT
  DATE_TRUNC('month', order_date) AS month,
  SUM(total)                      AS revenue
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;</pre>
  <h2>HAVING â€” filter the groups</h2>
  <p>WHERE filters rows before grouping; HAVING filters groups after aggregation:</p>
  <pre class="code-block">SELECT
  country,
  COUNT(*)   AS order_count,
  SUM(total) AS revenue
FROM orders
WHERE status = 'paid'        -- filters rows first
GROUP BY country
HAVING SUM(total) &gt; 50000     -- filters groups after
ORDER BY revenue DESC;</pre>
  <div class="callout callout-tip">
    <strong>WHERE vs HAVING â€” the shortcut</strong>
    <p>Can you write the condition against a plain column? Then it belongs in WHERE. Does it use an aggregate result like <span class="ic">SUM(total)&gt;50000</span>? Then it is HAVING.</p>
  </div>
  <div class="callout callout-info">
    <strong>HAVING without aggregates is legal but odd</strong>
    <p>You may filter on a group column in HAVING, but plain column filters belong in WHERE â€” clearer and usually faster.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000410',
  '03800000-0000-4000-8000-000000000310',
  1,
  'Conditional Logic with CASE',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Conditional Logic with CASE</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Conditional Logic with CASE</h1>
  <p>Real questions need labels, not just numbers: which orders are &ldquo;small,&rdquo; which customers are &ldquo;VIP,&rdquo; which month was &ldquo;the slow season.&rdquo; The <span class="ic">CASE</span> expression assigns values conditionally, row by row.</p>
  <h2>Structure of CASE</h2>
  <pre class="code-block">CASE
  WHEN condition1 THEN result1
  WHEN condition2 THEN result2
  ELSE             result_default
END</pre>
  <ul>
    <li>Conditions are evaluated in order; the <em>first true</em> one wins.</li>
    <li><span class="ic">ELSE</span> is optional â€” a missing ELSE yields NULL.</li>
    <li><span class="ic">END</span> is mandatory â€” it closes the expression.</li>
  </ul>
  <h2>Bucketing values</h2>
  <pre class="code-block">SELECT
  order_id,
  total,
  CASE
    WHEN total &gt;= 300 THEN 'high value'
    WHEN total &gt;= 100 THEN 'standard'
    ELSE                  'low value'
  END AS order_tier
FROM orders;</pre>
  <div class="callout">
    <strong>Order the conditions carefully</strong>
    <p>The top-down rule matters: if the <span class="ic">&gt;=100</span> branch came before <span class="ic">&gt;=300</span>, no order could ever reach &ldquo;high value.&rdquo; Write the most restrictive condition first.</p>
  </div>
  <h2>Combining CASE with aggregation</h2>
  <p>The most powerful pattern: conditionally include rows inside an aggregate using <span class="ic">FILTER</span> or CASE-in-aggregate. Postgres&rsquo;s FILTER is the cleanest:</p>
  <pre class="code-block">SELECT
  country,
  COUNT(*)                                    AS total_orders,
  COUNT(*) FILTER (WHERE status = 'paid')     AS paid_orders,
  SUM(total) FILTER (WHERE status = 'paid')   AS paid_revenue
FROM orders
GROUP BY country
ORDER BY paid_revenue DESC;</pre>
  <p>The classic portable alternative uses CASE inside the aggregate:</p>
  <pre class="code-block">SELECT
  country,
  SUM(CASE WHEN status = 'cancelled' THEN total ELSE 0 END) AS lost_revenue
FROM orders
GROUP BY country;</pre>
  <h2>Turning rows into columns (pivot shape)</h2>
  <p>Each summary becomes a column, giving a one-row-per-dimension comparison:</p>
  <pre class="code-block">SELECT
  country,
  COUNT(*) FILTER (WHERE total &gt;= 300) AS big_orders,
  COUNT(*) FILTER (WHERE total &lt; 100)  AS small_orders
FROM orders
GROUP BY country;</pre>
  <div class="callout callout-tip">
    <strong>FILTER when available</strong>
    <p><span class="ic">&lt;aggregate&gt; FILTER (WHERE ...)</span> is PostgreSQL&rsquo;s purpose-built conditional aggregate â€” clearer than CASE, and easier to add new columns to.</p>
  </div>
  <div class="callout callout-info">
    <strong>WHERE vs CASE-in-aggregate</strong>
    <p>WHERE removes rows entirely. CASE keeps the row but gives the aggregate a zero or a NULL â€” so other aggregates in the same query still see the row. Choose with intent.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000411',
  '03800000-0000-4000-8000-000000000311',
  1,
  'Handling NULL Values',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Handling NULL Values</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Handling NULL Values</h1>
  <p>NULL is SQL&rsquo;s way of saying &ldquo;no value here&rdquo; â€” not zero, not an empty string. It quietly changes how comparisons, arithmetic, and aggregates behave, and it is the number one cause of wrong-looking results.</p>
  <h2>NULL is not equal to anything</h2>
  <pre class="code-block">-- this NEVER matches, even for missing values
WHERE discounted_price = NULL;

-- this is how you actually test for missing
WHERE discounted_price IS NULL;
WHERE discounted_price IS NOT NULL;</pre>
  <div class="callout">
    <strong>Why filtering NULL fails</strong>
    <p>Comparing anything to NULL yields a third truth value: <em>unknown</em>, which WHERE treats as false. Always test with <span class="ic">IS NULL</span> / <span class="ic">IS NOT NULL</span>.</p>
  </div>
  <h2>NULL spreads through expressions</h2>
  <pre class="code-block">SELECT
  total,
  total + 0     AS total_plus_zero,   -- NULL keeps being NULL
  total * 2     AS doubled,           -- NULL in, NULL out
  '#' || total  AS prefixed           -- NULL concatenates to NULL
FROM orders;</pre>
  <p>Any arithmetic or concatenation that touches NULL returns NULL.</p>
  <h2>COALESCE â€” the missing-value fallback</h2>
  <p><span class="ic">COALESCE(a, b, c, ...)</span> returns the first non-NULL argument. It is the standard way to supply a default:</p>
  <pre class="code-block">SELECT
  order_id,
  COALESCE(shipped_at, 'not yet shipped') AS shipping_status
FROM orders;

SELECT
  customer_id,
  COALESCE(phone, email, 'no contact info') AS primary_contact
FROM customers;</pre>
  <h2>NULLIF â€” convert a value into NULL</h2>
  <p><span class="ic">NULLIF(a, b)</span> returns NULL when the two arguments are equal:</p>
  <pre class="code-block">-- avoid divide-by-zero crashes
SELECT
  revenue / NULLIF(order_count, 0) AS avg_order_value
FROM monthly_totals;</pre>
  <h2>Aggregates and NULL</h2>
  <table>
    <tr><th>Function</th><th>Behavior with NULL</th></tr>
    <tr><td>COUNT(*)</td><td>counts NULL rows too</td></tr>
    <tr><td>COUNT(col)</td><td>skips NULL rows</td></tr>
    <tr><td>SUM / AVG / MIN / MAX</td><td>ignore NULL rows</td></tr>
  </table>
  <pre class="code-block">SELECT
  COUNT(*)                 AS rows_total,
  COUNT(discounted_price)  AS priced_rows,
  AVG(discounted_price)    AS avg_priced_only
FROM products;</pre>
  <div class="callout callout-tip">
    <strong>Audit your NULLs early</strong>
    <p>Before trusting a metric, check the missing rate: <span class="ic">SELECT COUNT(*) FILTER (WHERE col IS NULL) FROM t</span>. Knowing how much is missing tells you whether the answer is even meaningful.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000413',
  '03800000-0000-4000-8000-000000000313',
  1,
  'Combining Tables with JOINs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Combining Tables with JOINs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Combining Tables with JOINs</h1>
  <p>Few useful questions live inside a single table. &ldquo;Who bought the most?&rdquo; needs customers and orders. A <strong>join</strong> combines rows from two tables wherever a key column matches.</p>
  <h2>INNER JOIN â€” only the matches</h2>
  <pre class="code-block">SELECT
  o.order_id,
  o.total,
  c.first_name,
  c.country
FROM orders AS o
INNER JOIN customers AS c
  ON c.customer_id = o.customer_id;</pre>
  <p>Each order row is paired with its customer row. Orders with no matching customer â€” and customers with no orders â€” do not appear at all.</p>
  <div class="callout callout-tip">
    <strong>Table aliases</strong>
    <p>Short aliases (<span class="ic">o</span>, <span class="ic">c</span>) keep long queries readable. Every column is qualified with its table so there is no ambiguity, and the ON clause names the linking key explicitly.</p>
  </div>
  <h2>Joining three tables</h2>
  <p>Add joins one at a time down a chain of keys:</p>
  <pre class="code-block">SELECT
  o.order_id,
  c.first_name,
  p.name        AS product_name,
  oi.quantity,
  oi.quantity * p.price AS line_total
FROM orders        AS o
JOIN customers     AS c  ON c.customer_id = o.customer_id
JOIN orders_items  AS oi ON oi.order_id   = o.order_id
JOIN products      AS p  ON p.product_id  = oi.product_id;</pre>
  <h2>Joining then aggregating</h2>
  <p>Analysts constantly join dimensions, then group:</p>
  <pre class="code-block">SELECT
  c.country,
  COUNT(DISTINCT o.order_id)            AS order_count,
  SUM(oi.quantity * p.price) AS revenue
FROM orders AS o
JOIN customers AS c ON c.customer_id = o.customer_id
JOIN orders_items AS oi ON oi.order_id = o.order_id
JOIN products AS p ON p.product_id = oi.product_id
GROUP BY c.country
ORDER BY revenue DESC;</pre>
  <div class="callout">
    <strong>The row-multiplication trap</strong>
    <p>Joining to a detail table multiplies rows â€” one order becomes several lines. That inflates <span class="ic">COUNT(o.order_id)</span>. Use <span class="ic">COUNT(DISTINCT ...)</span> for order-level figures after such a join.</p>
  </div>
  <div class="callout callout-info">
    <strong>Wait â€” a fourth table? No.</strong>
    <p>An e-commerce schema is often normalized further (shipping, payments). The lesson: JOIN follows relationships. You only ever join what your question needs.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000414',
  '03800000-0000-4000-8000-000000000314',
  1,
  'LEFT, RIGHT & FULL Joins',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>LEFT, RIGHT & FULL Joins</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>LEFT, RIGHT &amp; FULL Joins</h1>
  <p>INNER JOIN silently drops rows that lack a match. Sometimes you want to keep them all â€” every product even if nothing sold, every customer even if no order. Outer joins exist exactly for that.</p>
  <h2>LEFT JOIN â€” keep the left table whole</h2>
  <pre class="code-block">SELECT
  c.customer_id,
  c.first_name,
  o.order_id,
  o.total
FROM customers AS c
LEFT JOIN orders AS o
  ON o.customer_id = c.customer_id;</pre>
  <p>Every customer appears. Customers without orders still get a row, but the order columns are NULL.</p>
  <h2>Finding the unmatched rows</h2>
  <p>Because missing matches surface as NULL, filtering on NULL finds them â€” a classic analyst move:</p>
  <pre class="code-block">-- customers who have never placed an order
SELECT
  c.customer_id,
  c.first_name
FROM customers AS c
LEFT JOIN orders AS o
  ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;</pre>
  <div class="callout">
    <strong>WHERE on the joined table flips the join</strong>
    <p>Once you add <span class="ic">WHERE o.status = ...</span>, unmatched customers drop out and you are back to inner-join behavior. Put the filter in the ON clause instead:</p>
  </div>
  <pre class="code-block">-- left join, but only attach paid orders
FROM customers AS c
LEFT JOIN orders AS o
  ON o.customer_id = c.customer_id
 AND o.status = 'paid';</pre>
  <h2>RIGHT JOIN</h2>
  <p>The mirror image: keep every row of the right table:</p>
  <pre class="code-block">FROM orders AS o
RIGHT JOIN customers AS c
  ON o.customer_id = c.customer_id;</pre>
  <div class="callout callout-tip">
    <strong>You can live without RIGHT JOIN</strong>
    <p>Every RIGHT JOIN is a LEFT JOIN with the tables swapped. Most analysts standardize on LEFT JOIN so the query reads top-to-bottom from the main table.</p>
  </div>
  <h2>FULL OUTER JOIN â€” keep both sides</h2>
  <p>Everything from both tables, matched where possible:</p>
  <pre class="code-block">SELECT
  COALESCE(p.id,  oi.product_id) AS product_id,
  p.name,
  SUM(oi.quantity)               AS units_sold
FROM products AS p
FULL OUTER JOIN orders_items AS oi
  ON oi.product_id = p.id
GROUP BY COALESCE(p.id, oi.product_id), p.name;</pre>
  <p>Used for reconciliation â€” comparing inventory records, matching exports against the source â€” where rows may exist on either side.</p>
  <div class="callout callout-info">
    <strong>When outer joins surprise you</strong>
    <p>Outer joins multiply rows when there are multiple matches too, and they keep rows for the non-matching side. Always sanity-check the row count of a new join before trusting the numbers.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000416',
  '03800000-0000-4000-8000-000000000316',
  1,
  'Subqueries & Derived Tables',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subqueries & Derived Tables</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Subqueries &amp; Derived Tables</h1>
  <p>Sometimes one query is not enough â€” you need to compute something, then use that result. A <strong>subquery</strong> is a SELECT nested inside another SELECT, and it expands your analytical vocabulary dramatically.</p>
  <h2>A scalar subquery in WHERE</h2>
  <pre class="code-block">-- orders larger than the overall average
SELECT order_id, total
FROM orders
WHERE total &gt; (SELECT AVG(total) FROM orders);</pre>
  <p>A subquery that returns a single value can sit anywhere a value is allowed.</p>
  <h2>IN with a list subquery</h2>
  <pre class="code-block">-- customers from countries that appear in the vip_countries table
SELECT customer_id, first_name, country
FROM customers
WHERE country IN (
  SELECT country FROM vip_countries
);</pre>
  <h2>Derived tables: a subquery in FROM</h2>
  <p>A subquery in the FROM clause behaves like a temporary table. Postgres requires an alias:</p>
  <pre class="code-block">SELECT
  region,
  ROUND(AVG(spend)) AS avg_customer_spend
FROM (
  SELECT
    customer_id,
    CASE
      WHEN country IN ('Portugal', 'Spain') THEN 'europe'
      ELSE 'rest_of_world'
    END AS region,
    SUM(total) AS spend
  FROM orders
  GROUP BY customer_id, region
) AS customer_spend
GROUP BY region
ORDER BY avg_customer_spend DESC;</pre>
  <div class="callout callout-tip">
    <strong>Alias every derived table</strong>
    <p><span class="ic">AS customer_spend</span> is not optional in Postgres â€” without an alias the query fails to parse. Name it meaningfully for easy reading.</p>
  </div>
  <h2>Correlated subqueries</h2>
  <p>A subquery can reference the outer row â€” running once per row. Useful, but heavy:</p>
  <pre class="code-block">SELECT
  p.product_id,
  p.name,
  (SELECT COUNT(*)
   FROM orders_items AS oi
   WHERE oi.product_id = p.product_id) AS times_ordered
FROM products AS p
ORDER BY times_ordered DESC;</pre>
  <div class="callout callout-info">
    <strong>Subquery vs join â€” which wins?</strong>
    <p>For the same question, a JOIN and a subquery can produce the same answer. Joins shine for combining many columns of detail; subqueries shine for single aggregated comparisons. Next lesson&rsquo;s CTEs give you a third, often clearer, option.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Read it inside-out</strong>
    <p>When a nested query confuses you, run the subquery first, look at its output, then read the outer query against that concrete result.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000417',
  '03800000-0000-4000-8000-000000000317',
  1,
  'Common Table Expressions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Common Table Expressions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Common Table Expressions</h1>
  <p>A Common Table Expression (CTE) is a named subquery declared at the top with <span class="ic">WITH</span>. It is the closest SQL comes to local variables â€” and the single best readability tool for multi-step analytics.</p>
  <h2>Anatomy of a CTE</h2>
  <pre class="code-block">WITH customer_spend AS (
  SELECT
    customer_id,
    SUM(total) AS spend
  FROM orders
  WHERE status = 'paid'
  GROUP BY customer_id
)
SELECT
  c.first_name,
  cs.spend
FROM customers AS c
JOIN customer_spend AS cs ON cs.customer_id = c.customer_id
ORDER BY cs.spend DESC
LIMIT 10;</pre>
  <p>The CTE is defined once, then used exactly like a table in the main query.</p>
  <h2>Chaining CTEs</h2>
  <p>Each WITH-name can reference earlier ones, chaining a whole analysis into readable steps:</p>
  <pre class="code-block">WITH
monthly AS (
  SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(total)                      AS revenue
  FROM orders
  WHERE status = 'paid'
  GROUP BY DATE_TRUNC('month', order_date)
),
ranked AS (
  SELECT
    month,
    revenue,
    ROW_NUMBER() OVER (ORDER BY revenue DESC) AS rank
  FROM monthly
)
SELECT month::date AS month, revenue, rank
FROM ranked
ORDER BY month;</pre>
  <div class="callout callout-tip">
    <strong>Name each step after its meaning</strong>
    <p><span class="ic">monthly</span>, <span class="ic">ranked</span> â€” a chain of well-named CTEs reads like a written analysis, top to bottom, and is far easier to review than a tower of nested parens.</p>
  </div>
  <h2>CTEs vs subqueries</h2>
  <table>
    <tr><th></th><th>CTE</th><th>Derived table</th></tr>
    <tr><td>Readability</td><td>named, sequential</td><td>inline, nested</td></tr>
    <tr><td>Reuse</td><td>reference multiple times</td><td>must paste again</td></tr>
    <tr><td>One-time</td><td>define once</td><td>re-query each place</td></tr>
    <tr><td>Recursion</td><td>supports WITH RECURSIVE</td><td>not directly</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>CTEs are not magic</strong>
    <p>A CTE can be materialized by Postgres, meaning it is computed once â€” great for reuse. For huge tables, be mindful that materializing a big CTE is real work the planner chooses.</p>
  </div>
  <div class="callout callout-tip">
    <strong>The analyst default</strong>
    <p>Rule of thumb: if your query has more than one grouping or a subquery in FROM, reach for a CTE. Your future self â€” and your reviewers â€” will thank you.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000419',
  '03800000-0000-4000-8000-000000000319',
  1,
  'Window Functions: ROW_NUMBER & RANK',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Window Functions: ROW_NUMBER & RANK</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Window Functions: ROW_NUMBER &amp; RANK</h1>
  <p>Aggregates collapse rows; sometimes you want a ranking <em>while keeping every row</em>. Window functions compute a value across a &ldquo;window&rdquo; of related rows without merging them â€” the engine behind &ldquo;give me the top 3 per category.&rdquo;</p>
  <h2>The OVER() that changes everything</h2>
  <pre class="code-block">SELECT
  order_id,
  customer_id,
  total,
  ROW_NUMBER() OVER (ORDER BY total DESC) AS overall_rank
FROM orders;</pre>
  <p>Every row stays, and a rank is attached per its order-by position.</p>
  <h2>PARTITION BY â€” rank within groups</h2>
  <p><span class="ic">PARTITION BY</span> restarts the numbering inside each group â€” the classic &ldquo;by customer&rdquo; ranking:</p>
  <pre class="code-block">SELECT
  customer_id,
  order_id,
  total,
  ROW_NUMBER() OVER (
    PARTITION BY customer_id
    ORDER BY total DESC
  ) AS customer_order_rank
FROM orders;</pre>
  <h2>ROW_NUMBER vs RANK vs DENSE_RANK</h2>
  <table>
    <tr><th>Function</th><th>Ties</th><th>Sequence</th></tr>
    <tr><td>ROW_NUMBER()</td><td>arbitrary order</td><td>1, 2, 3, 4</td></tr>
    <tr><td>RANK()</td><td>same rank, gaps</td><td>1, 1, 3, 4</td></tr>
    <tr><td>DENSE_RANK()</td><td>same rank, no gaps</td><td>1, 1, 2, 3</td></tr>
  </table>
  <pre class="code-block">SELECT
  product_id,
  revenue,
  ROW_NUMBER() OVER (ORDER BY revenue DESC) AS row_num,
  RANK()        OVER (ORDER BY revenue DESC) AS rank,
  DENSE_RANK()  OVER (ORDER BY revenue DESC) AS dense_rank
FROM products;</pre>
  <h2>Top-N per group with ROW_NUMBER</h2>
  <p>The workhorse recipe: number rows inside a CTE, then filter:</p>
  <pre class="code-block">WITH ranked AS (
  SELECT
    customer_id,
    order_id,
    total,
    ROW_NUMBER() OVER (
      PARTITION BY customer_id
      ORDER BY total DESC
    ) AS rn
  FROM orders
)
SELECT customer_id, order_id, total
FROM ranked
WHERE rn &lt;= 3   -- keep each customer&rsquo;s top 3 orders
ORDER BY customer_id, rn;</pre>
  <div class="callout">
    <strong>ROW_NUMBER is dense and arbitrary on ties</strong>
    <p>If two rows tie on the sort key, ROW_NUMBER picks an order nondeterministically. Add a tie-breaker column â€” <span class="ic">ORDER BY total DESC, order_id</span> â€” for stable, reproducible results.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Window vs GROUP BY</strong>
    <p>GROUP BY collapses rows to one per group; window functions keep every row and add a computed column. Choose by whether you need the detail rows underneath.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000420',
  '03800000-0000-4000-8000-000000000320',
  1,
  'Running Totals & Moving Averages',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Running Totals & Moving Averages</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Running Totals &amp; Moving Averages</h1>
  <p>Two window staples appear in almost every time-series analysis: the <strong>running total</strong> (cumulative sum up to each row) and the <strong>moving average</strong> (average over a sliding window). Both keep every row â€” they just look &ldquo;backward&rdquo; in time.</p>
  <h2>Running total with SUM ... OVER</h2>
  <pre class="code-block">SELECT
  DATE_TRUNC('month', order_date)          AS month,
  SUM(total)                               AS monthly_revenue,
  SUM(SUM(total)) OVER (ORDER BY DATE_TRUNC('month', order_date))
                                           AS running_total
FROM orders
WHERE status = 'paid'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;</pre>
  <div class="callout">
    <strong>Aggregate within an aggregate</strong>
    <p>After GROUP BY, <span class="ic">SUM(total)</span> is the monthly value. Wrapping it in a window <span class="ic">SUM(...) OVER (ORDER BY month)</span> makes a cumulative sum over the ordered months.</p>
  </div>
  <h2>Moving average (rolling window)</h2>
  <p>The frame clause <span class="ic">ROWS BETWEEN ... PRECEDING AND CURRENT ROW</span> defines the sliding window:</p>
  <pre class="code-block">WITH daily AS (
  SELECT
    order_date::date AS day,
    SUM(total)       AS revenue
  FROM orders
  WHERE status = 'paid'
  GROUP BY order_date::date
)
SELECT
  day,
  revenue,
  ROUND(AVG(revenue) OVER (
    ORDER BY day
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ), 2) AS seven_day_avg
FROM daily
ORDER BY day;</pre>
  <h2>LAG and LEAD â€” the previous and next row</h2>
  <p><span class="ic">LAG(col)</span> reaches back one row; <span class="ic">LEAD(col)</span> reaches forward. Growth analysis runs on these:</p>
  <pre class="code-block">WITH monthly AS (
  SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(total)                      AS revenue
  FROM orders
  WHERE status = 'paid'
  GROUP BY 1
)
SELECT
  month,
  revenue,
  LAG(revenue) OVER (ORDER BY month)                     AS prev_month,
  ROUND(
    100.0 * (revenue - LAG(revenue) OVER (ORDER BY month))
    / NULLIF(LAG(revenue) OVER (ORDER BY month), 0), 2
  ) AS pct_change
FROM monthly
ORDER BY month;</pre>
  <div class="callout callout-tip">
    <strong>LAG over NULLIF â€” the growth safe-guard</strong>
    <p>Dividing by a zero or NULL previous month crashes or yields NULL. <span class="ic">NULLIF(prev, 0)</span> makes the whole ratio NULL instead of an explosion.</p>
  </div>
  <div class="callout callout-info">
    <strong>Default frame</strong>
    <p><span class="ic">SUM(x) OVER (ORDER BY y)</span> defaults to a frame from the start to the current row â€” exactly the running total. Explicit frames only appear when you need a bounded window.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000422',
  '03800000-0000-4000-8000-000000000322',
  1,
  'Date & Time Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Date & Time Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Date &amp; Time Functions</h1>
  <p>&ldquo;How does the business trend over time?&rdquo; is the most common analytical question. Answering it requires slicing, extracting, and comparing dates â€” a toolkit Postgres provides richly.</p>
  <h2>Extracting parts of a date</h2>
  <p><span class="ic">EXTRACT</span> pulls one component out of a timestamp:</p>
  <pre class="code-block">SELECT
  order_date,
  EXTRACT(YEAR  FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  EXTRACT(DOW   FROM order_date) AS dow   -- 0 = Sunday
FROM orders;</pre>
  <div class="callout callout-tip">
    <strong>When one part is not enough, cast to date</strong>
    <p><span class="ic">order_date::date</span> strips the time component, collapsing rows that share a day. It is the fastest way to build daily aggregates from timestamps.</p>
  </div>
  <h2>GROUP BY ranges of time</h2>
  <p>Grouping by a raw timestamp creates one bucket per second. Truncate to the unit you actually want:</p>
  <pre class="code-block">SELECT
  DATE_TRUNC('month', order_date) AS month,
  COUNT(*)                        AS orders,
  SUM(total)                      AS revenue
FROM orders
WHERE status = 'paid'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;</pre>
  <table>
    <tr><th>Unit</th><th>What DATE_TRUNC gives you</th></tr>
    <tr><td>'hour'</td><td>top of each hour</td></tr>
    <tr><td>'day'</td><td>midnight of each day</td></tr>
    <tr><td>'week'</td><td>Monday of each week</td></tr>
    <tr><td>'month'</td><td>1st of each month</td></tr>
    <tr><td>'year'</td><td>Jan 1 of each year</td></tr>
  </table>
  <h2>Comparing and filtering dates</h2>
  <pre class="code-block">-- the last 30 days
WHERE order_date &gt;= CURRENT_DATE - INTERVAL '30 days'

-- this calendar year
WHERE order_date &gt;= DATE_TRUNC('year', CURRENT_DATE)

-- between two moments (inclusive)
WHERE order_date BETWEEN '2024-01-01' AND '2024-06-30'</pre>
  <div class="callout">
    <strong>BETWEEN on timestamps hides the last moment</strong>
    <p><span class="ic">BETWEEN date AND date</span> with a timestamp column misses everything after 00:00 on the end date. Use <span class="ic">&lt; end_date + INTERVAL '1 day'</span> or truncate to date first.</p>
  </div>
  <h2>Age and intervals</h2>
  <pre class="code-block">SELECT
  customer_id,
  signup_date,
  AGE(CURRENT_DATE, signup_date) AS customer_age
FROM customers
ORDER BY customer_age DESC;</pre>
  <p><span class="ic">AGE(a, b)</span> returns years/months/days text; arithmetic <span class="ic">order_date + INTERVAL '7 days'</span> re-anchors a date forward or backward.</p>
  <div class="callout callout-tip">
    <strong>Be explicit about zones</strong>
    <p>Store timestamps with timezone, compare with <span class="ic">AT TIME ZONE</span>, and use <span class="ic">CURRENT_DATE</span> for day-anchored logic. Vague zones produce eight-hour drifts in exported reports.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000423',
  '03800000-0000-4000-8000-000000000323',
  1,
  'Formatting & Exporting Insights',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Formatting & Exporting Insights</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Formatting &amp; Exporting Insights</h1>
  <p>An answer nobody can read is not an insight. The last mile of every analysis is presentation: rounding digits, labelling cleanly, and moving the result out of the database into a tool humans consume.</p>
  <h2>Rounding without lies</h2>
  <pre class="code-block">-- round to 2 decimals
SELECT ROUND(AVG(total), 2) AS avg_order FROM orders;

-- truncate toward zero instead
SELECT TRUNC(AVG(total), 2) AS avg_order FROM orders;</pre>
  <div class="callout callout-info">
    <strong>ROUND vs TRUNC</strong>
    <p><span class="ic">ROUND</span> rounds half away from zero; <span class="ic">TRUNC</span> chops digits off. Choose per the audience â€” totals that must foot exactly use TRUNC.</p>
  </div>
  <h2>Formatting text and numbers</h2>
  <p><span class="ic">TO_CHAR</span> converts a value into a formatted string â€” handy for labels and exports:</p>
  <pre class="code-block">SELECT
  order_id,
  TO_CHAR(order_date, 'YYYY-MM-DD')             AS order_day,
  TO_CHAR(total, 'FM$999,999.00')               AS total_usd
FROM orders
ORDER BY order_date;</pre>
  <h2>Coalescing report-friendly labels</h2>
  <pre class="code-block">SELECT
  COALESCE(city, 'unknown')  AS city,
  COALESCE(region, country)  AS region_label
FROM customers;</pre>
  <h2>Exporting results</h2>
  <p>Every session tool has an export path â€” in raw SQL clients it is usually <span class="ic">\copy</span>:</p>
  <pre class="code-block">\copy (SELECT country, SUM(total) AS revenue FROM orders GROUP BY country ORDER BY revenue DESC) TO 'revenue_by_country.csv' WITH CSV HEADER;  -- psql</pre>
  <ul>
    <li><strong>CSV</strong> â€” the universal interchange format; open in Excel, Sheets, or any dashboard tool.</li>
    <li><strong>Name columns</strong> â€” aliases become headers; make them human.</li>
    <li><strong>Order the rows</strong> â€” exports should arrive ready to read.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Export the query, not just the rows</strong>
    <p>Save the SQL next to the CSV (in a project folder or a query notebook). A number without its producing query is impossible to audit or reproduce next month.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Consistency beats cleverness</strong>
    <p>Use one date format, one number format, and one NULL convention across your exports. A single consistent style is what makes a report feel professional.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000425',
  '03800000-0000-4000-8000-000000000325',
  1,
  'Capstone: Defining the Questions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Defining the Questions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Defining the Questions</h1>
  <p>Time to combine everything. Your mission: analyze the fictional <strong>AquaShop</strong> e-commerce store and hand stakeholders an executive summary. As in real work, the querying starts <em>after</em> the framing.</p>
  <h2>The business brief</h2>
  <p>The store owner asks three things:</p>
  <ol>
    <li><strong>How healthy is the business?</strong> â€” overall revenue, order count, and average order, plus the current month vs the prior month.</li>
    <li><strong>Where does growth come from?</strong> â€” revenue and customer count by country, ranked.</li>
    <li><strong>Are customers coming back?</strong> â€” repeat-purchase share by cohort (signup month).</li>
  </ol>
  <h2>Turning a brief into questions</h2>
  <p>Every ambition becomes several concrete, queryable questions. During this capstone, keep a running list:</p>
  <table>
    <tr><th>Brief</th><th>Concrete question</th></tr>
    <tr><td>How healthy?</td><td>What are SUM, COUNT, AVG over all paid orders?</td></tr>
    <tr><td>Month-over-month</td><td>Paid revenue this month vs last month, with % change.</td></tr>
    <tr><td>Where growth?</td><td>Revenue and new customers per country, top 5.</td></tr>
    <tr><td>Repeat behavior?</td><td>Of customers with &gt;1 order, share by signup month.</td></tr>
  </table>
  <h2>The schema you will use</h2>
  <pre class="code-block">customers (id, first_name, country, signup_date)
orders    (id, customer_id, total, status, order_date)
orders_items (id, order_id, product_id, quantity)
products  (id, name, price, category)</pre>
  <div class="callout callout-info">
    <strong>Sketch before you SELECT</strong>
    <p>Write the JOIN chain and grouping keys on paper first: &ldquo;orders JOIN customers on customer_id; revenue by country via GROUP BY country.&rdquo; A 30-second sketch saves a 30-minute fix.</p>
  </div>
  <h2>Your first deliverable</h2>
  <p>Complete two queries before moving on â€” the business health summary and the top countries list. Keep them as CTE-friendly, aliased queries, ready to expand in the next lesson.</p>
  <pre class="code-block">-- deliverable 1: overall health
SELECT
  COUNT(*)                                                        AS order_count,
  SUM(total)                                                      AS revenue,
  ROUND(AVG(total), 2)                                            AS avg_order,
  COUNT(DISTINCT customer_id)                                     AS customers
FROM orders
WHERE status = 'paid';</pre>
  <div class="callout callout-tip">
    <strong>One question, one query</strong>
    <p>A single query per question keeps output legible and lets you reuse building blocks. Over-stuffing one SELECT is the classic beginner trap on capstone projects.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000426',
  '03800000-0000-4000-8000-000000000326',
  1,
  'Capstone: Building the Analysis',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Building the Analysis</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Building the Analysis</h1>
  <p>Now the questions become SQL. This lesson walks you through the capstone queries using every technique from the course â€” joins, aggregation, CASE, CTEs, and window functions.</p>
  <h2>1. Month-over-month growth</h2>
  <p>LAG compares consecutive months; NULLIF keeps the math safe:</p>
  <pre class="code-block">WITH monthly_revenue AS (
  SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(total)                      AS revenue
  FROM orders
  WHERE status = 'paid'
  GROUP BY DATE_TRUNC('month', order_date)
)
SELECT
  month::date                         AS month,
  revenue,
  LAG(revenue) OVER (ORDER BY month)  AS prev_month,
  ROUND(100.0 * (revenue - LAG(revenue) OVER (ORDER BY month))
        / NULLIF(LAG(revenue) OVER (ORDER BY month), 0), 2) AS pct_change
FROM monthly_revenue
ORDER BY month;</pre>
  <h2>2. Revenue by country</h2>
  <pre class="code-block">SELECT
  c.country,
  COUNT(DISTINCT o.id)                AS orders,
  COUNT(DISTINCT c.id)                AS customers,
  SUM(o.total)                        AS revenue
FROM orders AS o
JOIN customers AS c ON c.id = o.customer_id
WHERE o.status = 'paid'
GROUP BY c.country
ORDER BY revenue DESC
LIMIT 5;</pre>
  <h2>3. Repeat-purchase share by signup month</h2>
  <p>First count orders per customer, then classify, then aggregate by cohort:</p>
  <pre class="code-block">WITH order_counts AS (
  SELECT
    customer_id,
    COUNT(*) AS order_count
  FROM orders
  WHERE status = 'paid'
  GROUP BY customer_id
),
cohorts AS (
  SELECT
    DATE_TRUNC('month', c.signup_date)       AS signup_month,
    CASE WHEN oc.order_count &gt;= 2 THEN 'repeat' ELSE 'one_time' END AS customer_type
  FROM customers AS c
  JOIN order_counts AS oc ON oc.customer_id = c.id
)
SELECT
  signup_month::date AS signup_month,
  customer_type,
  COUNT(*)           AS customers
FROM cohorts
GROUP BY signup_month, customer_type
ORDER BY signup_month, customer_type;</pre>
  <div class="callout callout-tip">
    <strong>Reuse the CTE skeleton</strong>
    <p>Structure each answer as WITH â†’ main query. When you pivot or add a metric later, you edit one named step instead of untangling a giant nested query.</p>
  </div>
  <div class="callout callout-info">
    <strong>Sanity-check row counts</strong>
    <p>Run <span class="ic">SELECT COUNT(*), COUNT(DISTINCT customer_id) FROM orders</span> to confirm you understand the grain before trusting aggregates.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03800000-0000-4000-8000-000000000427',
  '03800000-0000-4000-8000-000000000327',
  1,
  'Capstone: Presenting Results',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Presenting Results</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ccfbf1; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ccfbf1; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Presenting Results</h1>
  <p>Numbers gain meaning in context. This final lesson turns your query output into a concise, trustworthy report â€” and shows how to make the presentation itself faster.</p>
  <h2>1. Verify before you present</h2>
  <ul>
    <li>Rows that should be equal actually are (health query vs manual spot-check).</li>
    <li>NULLs are understood and either labelled or filled.</li>
    <li>Aggregates match the grain â€” no double-counted orders after joins.</li>
  </ul>
  <pre class="code-block">-- spot-check: does the country list match raw data?
SELECT COUNT(*) AS total, COUNT(DISTINCT customer_id) AS distinct_customers
FROM orders WHERE status = 'paid';</pre>
  <div class="callout callout-tip">
    <strong>Rule of thumb: one reconciliation per analysis</strong>
    <p>Recompute one headline number from raw rows a different way. If the two agree, confidence in the rest rises sharply.</p>
  </div>
  <h2>2. Shape the final report</h2>
  <pre class="code-block">-- clean, rounded, labelled export
SELECT
  c.country,
  COUNT(DISTINCT o.id)    AS orders,
  SUM(o.total)            AS raw_revenue,
  ROUND(SUM(o.total), 2)  AS revenue
FROM orders AS o
JOIN customers AS c ON c.id = o.customer_id
WHERE o.status = 'paid'
GROUP BY c.country
ORDER BY revenue DESC;</pre>
  <ul>
    <li>Keep headers human: aliases, not raw expressions.</li>
    <li>Round to a sensible precision; sort by the metric that matters.</li>
    <li>Export with <span class="ic">\copy ... WITH CSV HEADER</span> for stakeholders.</li>
  </ul>
  <h2>3. Write the insight, not the table</h2>
  <p>The final deliverable is a short narrative:</p>
  <blockquote>Overall revenue grew 12% month-on-month to $48,200, driven by Portugal (+$5,400) and Spain (+$3,100). Repeat-purchase share by signup cohort is stable at 31%, with the most recent cohorts yet to mature.</blockquote>
  <p>Three sentences quoting three numbers beats a wall of tables every time.</p>
  <div class="callout callout-info">
    <strong>The analyst&rsquo;s loop</strong>
    <p>Question â†’ query â†’ sanity check â†’ present. Presenting always uncovers a new question, which starts the loop again â€” treat it as a feature, not a failure.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Save your work</strong>
    <p>Keep the finished SQL and the export together in one folder. Next month the same analysis is a rerun away â€” that is the whole point of reproducible analytics.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES  (29 questions)
--    Q1-3 for lesson 303 Â· Q4-6 for 306 Â· Q7-9 for 309 Â· Q10-12 for 312
--    Q13-15 for 315 Â· Q16-18 for 318 Â· Q19-21 for 321 Â· Q22-24 for 324
--    Q25-29 for final assessment 328.
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('03800000-0000-4000-8000-000000000501', '03800000-0000-4000-8000-000000000303',
   'Which SELECT clause decides which columns appear in the result?',
   'The SELECT list names the columns (and expressions) returned for each row.', 1),
  ('03800000-0000-4000-8000-000000000502', '03800000-0000-4000-8000-000000000303',
   'What does the WHERE clause do?',
   'WHERE keeps only rows that satisfy a condition.', 2),
  ('03800000-0000-4000-8000-000000000503', '03800000-0000-4000-8000-000000000303',
   'How do you return only distinct values of a column?',
   'DISTINCT collapses repeated values to one of each.', 3),
  ('03800000-0000-4000-8000-000000000504', '03800000-0000-4000-8000-000000000306',
   'Which operator tests equality with a text literal?',
   '= compares a column to a quoted literal such as ''Portugal''.', 1),
  ('03800000-0000-4000-8000-000000000505', '03800000-0000-4000-8000-000000000306',
   'Which clause returns only the first 10 rows?',
   'LIMIT caps the number of rows returned.', 2),
  ('03800000-0000-4000-8000-000000000506', '03800000-0000-4000-8000-000000000306',
   'Which ORDER BY keyword sorts largest values first?',
   'DESC sorts descending; ASC (the default) sorts ascending.', 3),
  ('03800000-0000-4000-8000-000000000507', '03800000-0000-4000-8000-000000000309',
   'Which aggregate counts the non-NULL values of a column?',
   'COUNT(column) ignores NULLs; COUNT(*) counts every row.', 1),
  ('03800000-0000-4000-8000-000000000508', '03800000-0000-4000-8000-000000000309',
   'Which clause filters groups AFTER aggregation?',
   'HAVING runs after GROUP BY; WHERE runs before grouping.', 2),
  ('03800000-0000-4000-8000-000000000509', '03800000-0000-4000-8000-000000000309',
   'In GROUP BY, what must every non-aggregated SELECT column be?',
   'Each plain column in SELECT must appear in GROUP BY.', 3),
  ('03800000-0000-4000-8000-000000000510', '03800000-0000-4000-8000-000000000312',
   'What does CASE ... END produce?',
   'CASE evaluates conditions top-down and returns a value per row.', 1),
  ('03800000-0000-4000-8000-000000000511', '03800000-0000-4000-8000-000000000312',
   'Which function returns the first non-NULL argument?',
   'COALESCE(a, b) yields a when a is not NULL, otherwise b.', 2),
  ('03800000-0000-4000-8000-000000000512', '03800000-0000-4000-8000-000000000312',
   'How do you test that a column IS missing a value?',
   'Use IS NULL; equals comparisons with NULL never match.', 3),
  ('03800000-0000-4000-8000-000000000513', '03800000-0000-4000-8000-000000000315',
   'Which join keeps only rows that match in BOTH tables?',
   'INNER JOIN returns only the matching rows on both sides.', 1),
  ('03800000-0000-4000-8000-000000000514', '03800000-0000-4000-8000-000000000315',
   'Which join keeps every row of a left table?',
   'LEFT JOIN preserves all left rows; unmatched right values are NULL.', 2),
  ('03800000-0000-4000-8000-000000000515', '03800000-0000-4000-8000-000000000315',
   'What does the ON clause of a JOIN specify?',
   'ON names the key columns used to match rows between tables.', 3),
  ('03800000-0000-4000-8000-000000000516', '03800000-0000-4000-8000-000000000318',
   'What is a CTE?',
   'A CTE is a named result set defined with WITH for the current query.', 1),
  ('03800000-0000-4000-8000-000000000517', '03800000-0000-4000-8000-000000000318',
   'Which keyword introduces a Common Table Expression?',
   'WITH begins every CTE block before the main SELECT.', 2),
  ('03800000-0000-4000-8000-000000000518', '03800000-0000-4000-8000-000000000318',
   'Where can a subquery appear in a SELECT statement?',
   'Subqueries can appear in WHERE, FROM, and SELECT clauses.', 3),
  ('03800000-0000-4000-8000-000000000519', '03800000-0000-4000-8000-000000000321',
   'Which window function assigns 1, 2, 3, ... to rows in order?',
   'ROW_NUMBER() numbers rows sequentially within the window.', 1),
  ('03800000-0000-4000-8000-000000000520', '03800000-0000-4000-8000-000000000321',
   'Which function leaves gaps when values tie?',
   'RANK() gives tied rows the same rank, then skips ahead.', 2),
  ('03800000-0000-4000-8000-000000000521', '03800000-0000-4000-8000-000000000321',
   'What does PARTITION BY do in a window function?',
   'It restarts the window calculation for each group of rows.', 3),
  ('03800000-0000-4000-8000-000000000522', '03800000-0000-4000-8000-000000000324',
   'Which function pulls the year out of a date column?',
   'EXTRACT(YEAR FROM col) returns the year component.', 1),
  ('03800000-0000-4000-8000-000000000523', '03800000-0000-4000-8000-000000000324',
   'How do you group rows into whole months for a time trend?',
   'DATE_TRUNC(''month'', col) buckets each timestamp to its month.', 2),
  ('03800000-0000-4000-8000-000000000524', '03800000-0000-4000-8000-000000000324',
   'Why keep full precision when computing before exporting?',
   'Round only for final display; keep full precision through calculations.', 3),
  ('03800000-0000-4000-8000-000000000525', '03800000-0000-4000-8000-000000000328',
   'Which clause runs FIRST during logical query execution?',
   'FROM is evaluated first, then WHERE, GROUP BY, HAVING, SELECT, ORDER BY.', 1),
  ('03800000-0000-4000-8000-000000000526', '03800000-0000-4000-8000-000000000328',
   'Which clause produces one row per group?',
   'GROUP BY creates one summary row for each distinct grouping key.', 2),
  ('03800000-0000-4000-8000-000000000527', '03800000-0000-4000-8000-000000000328',
   'How do you compute a running total over a date-ordered set?',
   'SUM(col) OVER (ORDER BY date) accumulates row by row.', 3),
  ('03800000-0000-4000-8000-000000000528', '03800000-0000-4000-8000-000000000328',
   'Which join keeps unmatched rows on BOTH sides?',
   'FULL OUTER JOIN retains every row from both tables.', 4),
  ('03800000-0000-4000-8000-000000000529', '03800000-0000-4000-8000-000000000328',
   'What is the safest way to avoid divide-by-zero in a ratio?',
   'NULLIF(denominator, 0) turns zero into NULL so the ratio is safe.', 5)
ON CONFLICT (id) DO NOTHING;
-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 Â· Q2 1013-1024 Â· Q3 1025-1036 Â· Q4 1037-1048
--    Q5 1049-1060 Â· Q6 1061-1072 Â· Q7 1073-1084 Â· Q8 1085-1096 Â· Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): SELECT list
  ('03800000-0000-4000-8000-000000001001', '03800000-0000-4000-8000-000000000501', 'SELECT list', TRUE,  1),
  ('03800000-0000-4000-8000-000000001002', '03800000-0000-4000-8000-000000000501', 'WHERE clause', FALSE, 2),
  ('03800000-0000-4000-8000-000000001003', '03800000-0000-4000-8000-000000000501', 'ORDER BY clause', FALSE, 3),
  ('03800000-0000-4000-8000-000000001004', '03800000-0000-4000-8000-000000000501', 'GROUP BY clause', FALSE, 4),
  -- Q1 (501)q2: WHERE
  ('03800000-0000-4000-8000-000000001005', '03800000-0000-4000-8000-000000000502', 'Keeps only rows that satisfy a condition', TRUE,  1),
  ('03800000-0000-4000-8000-000000001006', '03800000-0000-4000-8000-000000000502', 'Sorts the result set', FALSE, 2),
  ('03800000-0000-4000-8000-000000001007', '03800000-0000-4000-8000-000000000502', 'Groups rows into buckets', FALSE, 3),
  ('03800000-0000-4000-8000-000000001008', '03800000-0000-4000-8000-000000000502', 'Renames columns in output', FALSE, 4),
  -- Q1 (501)q3: DISTINCT
  ('03800000-0000-4000-8000-000000001009', '03800000-0000-4000-8000-000000000503', 'SELECT DISTINCT column', TRUE,  1),
  ('03800000-0000-4000-8000-000000001010', '03800000-0000-4000-8000-000000000503', 'SELECT UNIQUE column', FALSE, 2),
  ('03800000-0000-4000-8000-000000001011', '03800000-0000-4000-8000-000000000503', 'SELECT ONLY column', FALSE, 3),
  ('03800000-0000-4000-8000-000000001012', '03800000-0000-4000-8000-000000000503', 'SELECT NEW column', FALSE, 4),
  -- Q2 (504): equals literal
  ('03800000-0000-4000-8000-000000001013', '03800000-0000-4000-8000-000000000504', '= (equal)', TRUE,  1),
  ('03800000-0000-4000-8000-000000001014', '03800000-0000-4000-8000-000000000504', '<> (not equal)', FALSE, 2),
  ('03800000-0000-4000-8000-000000001015', '03800000-0000-4000-8000-000000000504', 'BETWEEN', FALSE, 3),
  ('03800000-0000-4000-8000-000000001016', '03800000-0000-4000-8000-000000000504', 'IS NULL', FALSE, 4),
  -- Q2 (504)q2: LIMIT
  ('03800000-0000-4000-8000-000000001017', '03800000-0000-4000-8000-000000000505', 'LIMIT 10', TRUE,  1),
  ('03800000-0000-4000-8000-000000001018', '03800000-0000-4000-8000-000000000505', 'TOP 10', FALSE, 2),
  ('03800000-0000-4000-8000-000000001019', '03800000-0000-4000-8000-000000000505', 'OFFSET 10', FALSE, 3),
  ('03800000-0000-4000-8000-000000001020', '03800000-0000-4000-8000-000000000505', 'FIRST 10', FALSE, 4),
  -- Q2 (504)q3: DESC
  ('03800000-0000-4000-8000-000000001021', '03800000-0000-4000-8000-000000000506', 'DESC', TRUE,  1),
  ('03800000-0000-4000-8000-000000001022', '03800000-0000-4000-8000-000000000506', 'ASC', FALSE, 2),
  ('03800000-0000-4000-8000-000000001023', '03800000-0000-4000-8000-000000000506', 'REVERSE', FALSE, 3),
  ('03800000-0000-4000-8000-000000001024', '03800000-0000-4000-8000-000000000506', 'DESCENDING KEY', FALSE, 4),
  -- Q3 (507): COUNT column
  ('03800000-0000-4000-8000-000000001025', '03800000-0000-4000-8000-000000000507', 'COUNT(column)', TRUE,  1),
  ('03800000-0000-4000-8000-000000001026', '03800000-0000-4000-8000-000000000507', 'COUNT(ALL)', FALSE, 2),
  ('03800000-0000-4000-8000-000000001027', '03800000-0000-4000-8000-000000000507', 'COUNT(NULL)', FALSE, 3),
  ('03800000-0000-4000-8000-000000001028', '03800000-0000-4000-8000-000000000507', 'COUNT(VALUES)', FALSE, 4),
  -- Q3 (507)q2: HAVING
  ('03800000-0000-4000-8000-000000001029', '03800000-0000-4000-8000-000000000508', 'HAVING', TRUE,  1),
  ('03800000-0000-4000-8000-000000001030', '03800000-0000-4000-8000-000000000508', 'WHERE', FALSE, 2),
  ('03800000-0000-4000-8000-000000001031', '03800000-0000-4000-8000-000000000508', 'BEFORE', FALSE, 3),
  ('03800000-0000-4000-8000-000000001032', '03800000-0000-4000-8000-000000000508', 'FILTER BY', FALSE, 4),
  -- Q3 (507)q3: GROUP BY rule
  ('03800000-0000-4000-8000-000000001033', '03800000-0000-4000-8000-000000000509', 'It must appear in GROUP BY too', TRUE,  1),
  ('03800000-0000-4000-8000-000000001034', '03800000-0000-4000-8000-000000000509', 'It must be in ORDER BY', FALSE, 2),
  ('03800000-0000-4000-8000-000000001035', '03800000-0000-4000-8000-000000000509', 'It must be filtered by WHERE', FALSE, 3),
  ('03800000-0000-4000-8000-000000001036', '03800000-0000-4000-8000-000000000509', 'It must not appear at all', FALSE, 4),
  -- Q4 (510): CASE result
  ('03800000-0000-4000-8000-000000001037', '03800000-0000-4000-8000-000000000510', 'A conditional value for each row', TRUE,  1),
  ('03800000-0000-4000-8000-000000001038', '03800000-0000-4000-8000-000000000510', 'A sorted result set', FALSE, 2),
  ('03800000-0000-4000-8000-000000001039', '03800000-0000-4000-8000-000000000510', 'A new database table', FALSE, 3),
  ('03800000-0000-4000-8000-000000001040', '03800000-0000-4000-8000-000000000510', 'A delete of matching rows', FALSE, 4),
  -- Q4 (510)q2: COALESCE
  ('03800000-0000-4000-8000-000000001041', '03800000-0000-4000-8000-000000000511', 'COALESCE(a, b)', TRUE,  1),
  ('03800000-0000-4000-8000-000000001042', '03800000-0000-4000-8000-000000000511', 'NVL2(a, b)', FALSE, 2),
  ('03800000-0000-4000-8000-000000001043', '03800000-0000-4000-8000-000000000511', 'ISNULL(a)', FALSE, 3),
  ('03800000-0000-4000-8000-000000001044', '03800000-0000-4000-8000-000000000511', 'EMPTY(a, b)', FALSE, 4),
  -- Q4 (510)q3: IS NULL
  ('03800000-0000-4000-8000-000000001045', '03800000-0000-4000-8000-000000000512', 'col IS NULL', TRUE,  1),
  ('03800000-0000-4000-8000-000000001046', '03800000-0000-4000-8000-000000000512', 'col = NULL', FALSE, 2),
  ('03800000-0000-4000-8000-000000001047', '03800000-0000-4000-8000-000000000512', 'col == NULL', FALSE, 3),
  ('03800000-0000-4000-8000-000000001048', '03800000-0000-4000-8000-000000000512', 'col IN (NULL)', FALSE, 4),
  -- Q5 (513): INNER JOIN
  ('03800000-0000-4000-8000-000000001049', '03800000-0000-4000-8000-000000000513', 'INNER JOIN', TRUE,  1),
  ('03800000-0000-4000-8000-000000001050', '03800000-0000-4000-8000-000000000513', 'LEFT JOIN', FALSE, 2),
  ('03800000-0000-4000-8000-000000001051', '03800000-0000-4000-8000-000000000513', 'FULL OUTER JOIN', FALSE, 3),
  ('03800000-0000-4000-8000-000000001052', '03800000-0000-4000-8000-000000000513', 'CROSS JOIN', FALSE, 4),
  -- Q5 (513)q2: LEFT JOIN
  ('03800000-0000-4000-8000-000000001053', '03800000-0000-4000-8000-000000000514', 'LEFT JOIN', TRUE,  1),
  ('03800000-0000-4000-8000-000000001054', '03800000-0000-4000-8000-000000000514', 'INNER JOIN', FALSE, 2),
  ('03800000-0000-4000-8000-000000001055', '03800000-0000-4000-8000-000000000514', 'RIGHT JOIN', FALSE, 3),
  ('03800000-0000-4000-8000-000000001056', '03800000-0000-4000-8000-000000000514', 'SELF JOIN', FALSE, 4),
  -- Q5 (513)q3: ON clause
  ('03800000-0000-4000-8000-000000001057', '03800000-0000-4000-8000-000000000515', 'Names the key columns for matching', TRUE,  1),
  ('03800000-0000-4000-8000-000000001058', '03800000-0000-4000-8000-000000000515', 'Sorts the combined rows', FALSE, 2),
  ('03800000-0000-4000-8000-000000001059', '03800000-0000-4000-8000-000000000515', 'Counts the matched rows', FALSE, 3),
  ('03800000-0000-4000-8000-000000001060', '03800000-0000-4000-8000-000000000515', 'Creates an index for speed', FALSE, 4),
  -- Q6 (516): CTE
  ('03800000-0000-4000-8000-000000001061', '03800000-0000-4000-8000-000000000516', 'A named result set valid for one query', TRUE,  1),
  ('03800000-0000-4000-8000-000000001062', '03800000-0000-4000-8000-000000000516', 'A permanent stored table', FALSE, 2),
  ('03800000-0000-4000-8000-000000001063', '03800000-0000-4000-8000-000000000516', 'A database view saved forever', FALSE, 3),
  ('03800000-0000-4000-8000-000000001064', '03800000-0000-4000-8000-000000000516', 'A stored function with arguments', FALSE, 4),
  -- Q6 (516)q2: WITH
  ('03800000-0000-4000-8000-000000001065', '03800000-0000-4000-8000-000000000517', 'WITH', TRUE,  1),
  ('03800000-0000-4000-8000-000000001066', '03800000-0000-4000-8000-000000000517', 'CREATE', FALSE, 2),
  ('03800000-0000-4000-8000-000000001067', '03800000-0000-4000-8000-000000000517', 'DEFINE', FALSE, 3),
  ('03800000-0000-4000-8000-000000001068', '03800000-0000-4000-8000-000000000517', 'DECLARE', FALSE, 4),
  -- Q6 (516)q3: subquery locations
  ('03800000-0000-4000-8000-000000001069', '03800000-0000-4000-8000-000000000518', 'FROM, WHERE, and SELECT', TRUE,  1),
  ('03800000-0000-4000-8000-000000001070', '03800000-0000-4000-8000-000000000518', 'Only in ORDER BY', FALSE, 2),
  ('03800000-0000-4000-8000-000000001071', '03800000-0000-4000-8000-000000000518', 'Only in LIMIT', FALSE, 3),
  ('03800000-0000-4000-8000-000000001072', '03800000-0000-4000-8000-000000000518', 'Only after GROUP BY', FALSE, 4),
  -- Q7 (519): ROW_NUMBER
  ('03800000-0000-4000-8000-000000001073', '03800000-0000-4000-8000-000000000519', 'ROW_NUMBER()', TRUE,  1),
  ('03800000-0000-4000-8000-000000001074', '03800000-0000-4000-8000-000000000519', 'ROWNUM()', FALSE, 2),
  ('03800000-0000-4000-8000-000000001075', '03800000-0000-4000-8000-000000000519', 'COUNT()', FALSE, 3),
  ('03800000-0000-4000-8000-000000001076', '03800000-0000-4000-8000-000000000519', 'ROWCOUNT()', FALSE, 4),
  -- Q7 (519)q2: RANK gaps
  ('03800000-0000-4000-8000-000000001077', '03800000-0000-4000-8000-000000000520', 'RANK()', TRUE,  1),
  ('03800000-0000-4000-8000-000000001078', '03800000-0000-4000-8000-000000000520', 'DENSE_RANK()', FALSE, 2),
  ('03800000-0000-4000-8000-000000001079', '03800000-0000-4000-8000-000000000520', 'ROW_NUMBER()', FALSE, 3),
  ('03800000-0000-4000-8000-000000001080', '03800000-0000-4000-8000-000000000520', 'NTILE()', FALSE, 4),
  -- Q7 (519)q3: PARTITION BY
  ('03800000-0000-4000-8000-000000001081', '03800000-0000-4000-8000-000000000521', 'Restarts the window per group', TRUE,  1),
  ('03800000-0000-4000-8000-000000001082', '03800000-0000-4000-8000-000000000521', 'Filters rows before the window', FALSE, 2),
  ('03800000-0000-4000-8000-000000001083', '03800000-0000-4000-8000-000000000521', 'Joins the window to a CTE', FALSE, 3),
  ('03800000-0000-4000-8000-000000001084', '03800000-0000-4000-8000-000000000521', 'Sorts the final output', FALSE, 4),
  -- Q8 (522): EXTRACT
  ('03800000-0000-4000-8000-000000001085', '03800000-0000-4000-8000-000000000522', 'EXTRACT(YEAR FROM col)', TRUE,  1),
  ('03800000-0000-4000-8000-000000001086', '03800000-0000-4000-8000-000000000522', 'YEAR(col)', FALSE, 2),
  ('03800000-0000-4000-8000-000000001087', '03800000-0000-4000-8000-000000000522', 'GETYEAR(col)', FALSE, 3),
  ('03800000-0000-4000-8000-000000001088', '03800000-0000-4000-8000-000000000522', 'ROUND(col, year)', FALSE, 4),
  -- Q8 (522)q2: DATE_TRUNC
  ('03800000-0000-4000-8000-000000001089', '03800000-0000-4000-8000-000000000523', 'DATE_TRUNC(''month'', col)', TRUE,  1),
  ('03800000-0000-4000-8000-000000001090', '03800000-0000-4000-8000-000000000523', 'MONTH(col)', FALSE, 2),
  ('03800000-0000-4000-8000-000000001091', '03800000-0000-4000-8000-000000000523', 'TRUNCATE(col)', FALSE, 3),
  ('03800000-0000-4000-8000-000000001092', '03800000-0000-4000-8000-000000000523', 'FORMAT(col)', FALSE, 4),
  -- Q8 (522)q3: precision
  ('03800000-0000-4000-8000-000000001093', '03800000-0000-4000-8000-000000000524', 'Keep precision; round only for display', TRUE,  1),
  ('03800000-0000-4000-8000-000000001094', '03800000-0000-4000-8000-000000000524', 'Always round in the database', FALSE, 2),
  ('03800000-0000-4000-8000-000000001095', '03800000-0000-4000-8000-000000000524', 'Round every intermediate step', FALSE, 3),
  ('03800000-0000-4000-8000-000000001096', '03800000-0000-4000-8000-000000000524', 'Never use ROUND at all', FALSE, 4),
  -- Q9 (525): FROM first
  ('03800000-0000-4000-8000-000000001097', '03800000-0000-4000-8000-000000000525', 'FROM', TRUE,  1),
  ('03800000-0000-4000-8000-000000001098', '03800000-0000-4000-8000-000000000525', 'SELECT', FALSE, 2),
  ('03800000-0000-4000-8000-000000001099', '03800000-0000-4000-8000-000000000525', 'GROUP BY', FALSE, 3),
  ('03800000-0000-4000-8000-000000001100', '03800000-0000-4000-8000-000000000525', 'LIMIT', FALSE, 4),
  -- Q9 (525)q2: one row per group
  ('03800000-0000-4000-8000-000000001101', '03800000-0000-4000-8000-000000000526', 'GROUP BY', TRUE,  1),
  ('03800000-0000-4000-8000-000000001102', '03800000-0000-4000-8000-000000000526', 'DISTINCT', FALSE, 2),
  ('03800000-0000-4000-8000-000000001103', '03800000-0000-4000-8000-000000000526', 'ORDER BY', FALSE, 3),
  ('03800000-0000-4000-8000-000000001104', '03800000-0000-4000-8000-000000000526', 'LIMIT', FALSE, 4),
  -- Q9 (525)q3: running total
  ('03800000-0000-4000-8000-000000001105', '03800000-0000-4000-8000-000000000527', 'SUM(col) OVER (ORDER BY date)', TRUE,  1),
  ('03800000-0000-4000-8000-000000001106', '03800000-0000-4000-8000-000000000527', 'SUM(col) GROUP BY date', FALSE, 2),
  ('03800000-0000-4000-8000-000000001107', '03800000-0000-4000-8000-000000000527', 'COUNT(*) OVER date', FALSE, 3),
  ('03800000-0000-4000-8000-000000001108', '03800000-0000-4000-8000-000000000527', 'TOTAL(col) BY date', FALSE, 4),
  -- Q9 (525)q4: FULL OUTER JOIN
  ('03800000-0000-4000-8000-000000001109', '03800000-0000-4000-8000-000000000528', 'FULL OUTER JOIN', TRUE,  1),
  ('03800000-0000-4000-8000-000000001110', '03800000-0000-4000-8000-000000000528', 'INNER JOIN', FALSE, 2),
  ('03800000-0000-4000-8000-000000001111', '03800000-0000-4000-8000-000000000528', 'LEFT JOIN', FALSE, 3),
  ('03800000-0000-4000-8000-000000001112', '03800000-0000-4000-8000-000000000528', 'CROSS JOIN', FALSE, 4),
  -- Q9 (525)q5: divide by zero
  ('03800000-0000-4000-8000-000000001113', '03800000-0000-4000-8000-000000000529', 'Use NULLIF(denominator, 0)', TRUE,  1),
  ('03800000-0000-4000-8000-000000001114', '03800000-0000-4000-8000-000000000529', 'Add 1 to the denominator', FALSE, 2),
  ('03800000-0000-4000-8000-000000001115', '03800000-0000-4000-8000-000000000529', 'Use an inner join', FALSE, 3),
  ('03800000-0000-4000-8000-000000001116', '03800000-0000-4000-8000-000000000529', 'Sort before dividing', FALSE, 4)
ON CONFLICT (id) DO NOTHING;
