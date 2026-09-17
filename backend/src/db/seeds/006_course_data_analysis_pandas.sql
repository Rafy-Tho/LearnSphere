-- ============================================================================
-- SEED 006: Complete course — "Data Analysis with Pandas"
-- ----------------------------------------------------------------------------
-- Instructor : Anita Patel        (10000000-0000-4000-8000-000000000003)
-- Category   : Data Science       (20000000-0000-4000-8000-000000000003)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Pandas Foundations          → C1 Introducing pandas & DataFrames · C2 Reading & Exploring Data
--   M2 Cleaning Data               → C3 Handling Missing Values · C4 Filtering & Transforming
--   M3 Analysis & Aggregation      → C5 GroupBy & Aggregation · C6 Merging & Joining DataFrames
--   M4 Time Series & Visualization → C7 Working with Dates & Time Series · C8 Visualizing with Matplotlib
--   M5 Capstone: Sales Dashboard   → C9 Project Setup & Data Prep · C10 Building Insights & Reporting
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
  '60000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000003',
  '20000000-0000-4000-8000-000000000003',
  'Data Analysis with Pandas',
  'data-analysis-with-pandas',
  'Stop guessing and start analyzing. Load real datasets into pandas DataFrames, clean messy data with confidence, filter and transform rows like a pro, summarize them with groupby, and bring the story to life with Matplotlib charts — then prove it all by building a complete sales dashboard from scratch.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  4
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('60000000-0000-4000-8000-000000000011', '60000000-0000-4000-8000-000000000001', 'Build and inspect pandas Series and DataFrames with confidence.',                      1),
  ('60000000-0000-4000-8000-000000000012', '60000000-0000-4000-8000-000000000001', 'Read and explore real datasets from CSV, Excel, and JSON files.',                    2),
  ('60000000-0000-4000-8000-000000000013', '60000000-0000-4000-8000-000000000001', 'Clean messy data: handle missing values, dtypes, and transformations.',              3),
  ('60000000-0000-4000-8000-000000000014', '60000000-0000-4000-8000-000000000001', 'Aggregate and combine data with groupby, merges, and pivot tables.',                4),
  ('60000000-0000-4000-8000-000000000015', '60000000-0000-4000-8000-000000000001', 'Analyze time series and present your findings with Matplotlib charts.',             5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('60000000-0000-4000-8000-000000000101', '60000000-0000-4000-8000-000000000001', 1, 'Pandas Foundations',          'Build the core skills: DataFrames, loading data, and quick exploration.',              'PUBLISHED'),
  ('60000000-0000-4000-8000-000000000102', '60000000-0000-4000-8000-000000000001', 2, 'Cleaning Data',               'Find missing values and transform messy data into analysis-ready shape.',               'PUBLISHED'),
  ('60000000-0000-4000-8000-000000000103', '60000000-0000-4000-8000-000000000001', 3, 'Analysis & Aggregation',      'Summarize and combine data with groupby, pivot tables, and merges.',                    'PUBLISHED'),
  ('60000000-0000-4000-8000-000000000104', '60000000-0000-4000-8000-000000000001', 4, 'Time Series & Visualization', 'Work with dates and turn your findings into Matplotlib charts.',                        'PUBLISHED'),
  ('60000000-0000-4000-8000-000000000105', '60000000-0000-4000-8000-000000000001', 5, 'Capstone: Sales Dashboard',   'Bring it all together and build a complete sales reporting dashboard.',                  'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('60000000-0000-4000-8000-000000000201', '60000000-0000-4000-8000-000000000101', 1, 'Introducing pandas & DataFrames',   'Install pandas and meet the Series and DataFrame objects.',            'PUBLISHED'),
  ('60000000-0000-4000-8000-000000000202', '60000000-0000-4000-8000-000000000101', 2, 'Reading & Exploring Data',          'Load real files and inspect them with built-in pandas methods.',        'PUBLISHED'),
  ('60000000-0000-4000-8000-000000000203', '60000000-0000-4000-8000-000000000102', 1, 'Handling Missing Values',           'Detect missing data and decide between removing and filling.',          'PUBLISHED'),
  ('60000000-0000-4000-8000-000000000204', '60000000-0000-4000-8000-000000000102', 2, 'Filtering & Transforming',          'Select the rows and columns you need and reshape values.',              'PUBLISHED'),
  ('60000000-0000-4000-8000-000000000205', '60000000-0000-4000-8000-000000000103', 1, 'GroupBy & Aggregation',             'Summarize groups and build pivot tables for insight.',                  'PUBLISHED'),
  ('60000000-0000-4000-8000-000000000206', '60000000-0000-4000-8000-000000000103', 2, 'Merging & Joining DataFrames',      'Combine multiple tables with concat, merge, and join.',                 'PUBLISHED'),
  ('60000000-0000-4000-8000-000000000207', '60000000-0000-4000-8000-000000000104', 1, 'Working with Dates & Time Series',  'Parse dates and analyze data that changes over time.',                  'PUBLISHED'),
  ('60000000-0000-4000-8000-000000000208', '60000000-0000-4000-8000-000000000104', 2, 'Visualizing with Matplotlib',       'Create clear charts and multi-panel figures from pandas.',              'PUBLISHED'),
  ('60000000-0000-4000-8000-000000000209', '60000000-0000-4000-8000-000000000105', 1, 'Project Setup & Data Prep',         'Scaffold the capstone and prepare the raw sales data.',                 'PUBLISHED'),
  ('60000000-0000-4000-8000-000000000210', '60000000-0000-4000-8000-000000000105', 2, 'Building Insights & Reporting',     'Answer business questions and publish a clean report.',                 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 60000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('60000000-0000-4000-8000-000000000301', '60000000-0000-4000-8000-000000000201', 1, 'Introducing pandas',                 'Learn what pandas is, how to install it, and the two core objects: Series and DataFrame.',  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('60000000-0000-4000-8000-000000000302', '60000000-0000-4000-8000-000000000201', 2, 'The DataFrame Structure',            'Understand the index, columns, dtypes, and values that make up a DataFrame.',               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('60000000-0000-4000-8000-000000000303', '60000000-0000-4000-8000-000000000201', 3, 'Pandas Foundations Quiz',             'Check your understanding of pandas fundamentals.',                                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('60000000-0000-4000-8000-000000000304', '60000000-0000-4000-8000-000000000202', 1, 'Reading Data from Files',            'Load CSVs, Excel files, and JSON into DataFrames with pandas readers.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('60000000-0000-4000-8000-000000000305', '60000000-0000-4000-8000-000000000202', 2, 'Exploring a DataFrame',              'Inspect your data fast with head, tail, info, describe, and shape.',                         'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('60000000-0000-4000-8000-000000000306', '60000000-0000-4000-8000-000000000202', 3, 'Reading & Exploring Quiz',           'Test your data loading and exploration skills.',                                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('60000000-0000-4000-8000-000000000307', '60000000-0000-4000-8000-000000000203', 1, 'Detecting Missing Values',           'Find missing and null entries with isna, isnull, and notna.',                               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('60000000-0000-4000-8000-000000000308', '60000000-0000-4000-8000-000000000203', 2, 'Filling Missing Values',             'Remove gaps or fill them in with dropna, fillna, ffill, and bfill.',                         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('60000000-0000-4000-8000-000000000309', '60000000-0000-4000-8000-000000000203', 3, 'Missing Values Quiz',                'Check your missing value handling knowledge.',                                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('60000000-0000-4000-8000-000000000310', '60000000-0000-4000-8000-000000000204', 1, 'Filtering Rows & Columns',           'Select rows and columns with loc, iloc, and boolean masks.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('60000000-0000-4000-8000-000000000311', '60000000-0000-4000-8000-000000000204', 2, 'Transforming Data',                  'Cast types, clean text, and apply functions with astype, map, and apply.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('60000000-0000-4000-8000-000000000312', '60000000-0000-4000-8000-000000000204', 3, 'Filtering & Transforming Quiz',      'Verify your filtering and transforming skills.',                                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('60000000-0000-4000-8000-000000000313', '60000000-0000-4000-8000-000000000205', 1, 'GroupBy Fundamentals',               'Summarize groups with the split-apply-combine pattern.',                                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('60000000-0000-4000-8000-000000000314', '60000000-0000-4000-8000-000000000205', 2, 'Aggregations & Pivot Tables',        'Combine statistics with agg, pivot_table, and crosstab.',                                   'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('60000000-0000-4000-8000-000000000315', '60000000-0000-4000-8000-000000000205', 3, 'GroupBy & Aggregation Quiz',         'Test your groupby and aggregation knowledge.',                                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('60000000-0000-4000-8000-000000000316', '60000000-0000-4000-8000-000000000206', 1, 'Concatenation',                      'Stack DataFrames together with pd.concat in either direction.',                              'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('60000000-0000-4000-8000-000000000317', '60000000-0000-4000-8000-000000000206', 2, 'Merge & Join',                       'Combine tables on key columns with pd.merge and join.',                                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('60000000-0000-4000-8000-000000000318', '60000000-0000-4000-8000-000000000206', 3, 'Merging & Joining Quiz',             'Check your merging and joining knowledge.',                                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('60000000-0000-4000-8000-000000000319', '60000000-0000-4000-8000-000000000207', 1, 'Dates & Datetimes',                  'Convert strings to datetimes and slice by time with the dt accessor.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('60000000-0000-4000-8000-000000000320', '60000000-0000-4000-8000-000000000207', 2, 'Time Series Analysis',               'Resample, roll, and shift time-based data for deeper insight.',                              'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('60000000-0000-4000-8000-000000000321', '60000000-0000-4000-8000-000000000207', 3, 'Date & Time Series Quiz',            'Test your datetime and time-series skills.',                                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('60000000-0000-4000-8000-000000000322', '60000000-0000-4000-8000-000000000208', 1, 'Plotting Basics with Matplotlib',    'Create line, bar, and histogram charts right from pandas data.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('60000000-0000-4000-8000-000000000323', '60000000-0000-4000-8000-000000000208', 2, 'Customizing & Combining Charts',     'Style axes, labels, subplots, and save your figures as images.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('60000000-0000-4000-8000-000000000324', '60000000-0000-4000-8000-000000000208', 3, 'Visualization Quiz',                 'Verify your Matplotlib charting knowledge.',                                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('60000000-0000-4000-8000-000000000325', '60000000-0000-4000-8000-000000000209', 1, 'Project Setup & Data Prep',           'Create the capstone project and turn raw sales files into one clean DataFrame.',             'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('60000000-0000-4000-8000-000000000326', '60000000-0000-4000-8000-000000000210', 1, 'Building Insights with GroupBy & Plots','Answer business questions with groupby summaries and charts.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('60000000-0000-4000-8000-000000000327', '60000000-0000-4000-8000-000000000210', 2, 'Reporting Findings',                 'Turn your tables and charts into a clear, shareable report.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('60000000-0000-4000-8000-000000000328', '60000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                   'Prove what you learned across the whole course.',                                            'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 60000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '60000000-0000-4000-8000-000000000401',
  '60000000-0000-4000-8000-000000000301',
  1,
  'Introducing pandas',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Introducing pandas</title>
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
  <h1>Introducing pandas</h1>
  <p>pandas is the Python library that makes tabular data analysis fast and expressive. Nearly every real pipeline — loading a sales export, cleaning messy server logs, grouping a survey — touches a pandas DataFrame at some point. Here you meet the two objects you will use every single day: the <strong>Series</strong> and the <strong>DataFrame</strong>.</p>
  <p>The name is short for <strong>Python Data Analysis Library</strong> (a nod to the econometrics term "panel data"). pandas is built on top of NumPy, which gives it speed and a rich set of vectorized numeric operations under the hood.</p>
  <h2>Installing pandas</h2>
  <pre class="code-block">pip install pandas</pre>
  <p>Then import it with the conventional alias everywhere — in scripts and notebooks alike:</p>
  <pre class="code-block">import pandas as pd</pre>
  <h2>The two core objects</h2>
  <p>Everything in this course builds on these two workhorses:</p>
  <table>
    <thead>
      <tr><th>Object</th><th>Shape</th><th>Analogy</th><th>You will use it</th></tr>
    </thead>
    <tbody>
      <tr><td>Series</td><td>One-dimensional, labelled</td><td>A single column with labels</td><td>For one column of values</td></tr>
      <tr><td>DataFrame</td><td>Two-dimensional, labelled</td><td>A spreadsheet with named rows and columns</td><td>For whole tables of data</td></tr>
    </tbody>
  </table>
  <pre class="code-block">import pandas as pd

# A Series: one column of values, each with a label
total_sales = pd.Series([120.5, 90.0, 210.75],
                        index=["Mon", "Tue", "Wed"])
print(total_sales)

# A DataFrame: a labelled table with rows and columns
df = pd.DataFrame({
    "product": ["Latte", "Muffin", "Latte"],
    "price":   [4.5, 3.0, 4.5],
    "units":   [3, 2, 5],
})
print(df)</pre>
  <div class="callout callout-info">
    <strong>Note</strong>
    <p>In real analysis you almost always work with DataFrames. Series appear when you reach into a single column, like <span class="ic">df["price"]</span> — and a Series is simply a DataFrame with one column.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Install pandas inside a virtual environment (its own folder per project) so different projects never fight over package versions. In Jupyter, you can also run <span class="ic">!pip install pandas</span> directly in a cell.</p>
  </div>
  <p>That single import line, <span class="ic">import pandas as pd</span>, is the doorway into everything you will learn in this course: reading files, cleaning messes, grouping, merging, and charting. Next, you peek inside a DataFrame to see exactly how it stores your data.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000402',
  '60000000-0000-4000-8000-000000000302',
  1,
  'The DataFrame Structure',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The DataFrame Structure</title>
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
  <h1>The DataFrame Structure</h1>
  <p>A DataFrame is a labelled, two-dimensional table. To use it well you need to know its three moving parts: the <strong>index</strong> (row labels), the <strong>columns</strong> (names), and the <strong>values</strong> (the data itself, stored column by column).</p>
  <pre class="code-block">import pandas as pd

df = pd.DataFrame({
    "product": ["Latte", "Muffin", "Espresso"],
    "price":   [4.5, 3.0, 2.5],
    "units":   [3, 2, 4],
})
print(df)
print("Index:  ", df.index)
print("Columns:", df.columns)
print("Shape:  ", df.shape)
print("dtypes: ", df.dtypes)</pre>
  <h2>The three parts</h2>
  <ul>
    <li><span class="ic">index</span> — the row labels. pandas auto-generates <span class="ic">RangeIndex(0..n-1)</span> unless you tell it otherwise.</li>
    <li><span class="ic">columns</span> — the column names, like <em>product</em> or <em>price</em>.</li>
    <li><span class="ic">values</span> — the underlying data grid, which you access with <span class="ic">df.values</span>.</li>
  </ul>
  <h2>Every column has a dtype</h2>
  <table>
    <thead>
      <tr><th>dtype</th><th>What it holds</th><th>Example</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">int64</span></td><td>Whole numbers</td><td>3, 42, -7</td></tr>
      <tr><td><span class="ic">float64</span></td><td>Decimal numbers</td><td>4.5, 2.75</td></tr>
      <tr><td><span class="ic">object</span></td><td>Strings / mixed</td><td>Latte, Muffin</td></tr>
      <tr><td><span class="ic">bool</span></td><td>True / False</td><td>True, False</td></tr>
      <tr><td><span class="ic">datetime64</span></td><td>Dates and times</td><td>2026-01-15</td></tr>
    </tbody>
  </table>
  <p>In the example above, <span class="ic">product</span> is <span class="ic">object</span>, while <span class="ic">price</span> and <span class="ic">units</span> are numeric. Getting these types right matters: you will fix them in the Cleaning Data module.</p>
  <h2>Why a good index helps</h2>
  <p>A meaningful index can make selection much friendlier. Instead of remembering row numbers, label the rows with something real:</p>
  <pre class="code-block">df = df.set_index("product")
print(df)

print(df.loc["Latte"])   # a row looked up by its label</pre>
  <div class="callout callout-info">
    <strong>Mental model</strong>
    <p>Think of a DataFrame as a spreadsheet: the top row is the header (columns), the leftmost column or numbers are the index, and everything else is values. pandas adds superpowers like dtypes and fast selection.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Always check <span class="ic">df.shape</span> and <span class="ic">df.dtypes</span> right after loading a file. Two lines tell you the size and the types of your data, which drives almost every later decision.</p>
  </div>
  <p>You now know the anatomy of a DataFrame. In the next chapter you load real files into one and start exploring them.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000403',
  '60000000-0000-4000-8000-000000000304',
  1,
  'Reading Data from Files',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reading Data from Files</title>
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
  <h1>Reading Data from Files</h1>
  <p>Real data rarely arrives as a Python dictionary. It arrives as CSVs, Excel workbooks, and JSON exports — and pandas ships with one-line readers for all of them. This lesson covers the three you will use most in this course.</p>
  <h2>read_csv — the workhorse</h2>
  <pre class="code-block">import pandas as pd

sales = pd.read_csv("sales.csv")
print(sales.head())</pre>
  <p>CSV (comma-separated values) is the most common plain-text table format. If your file uses another separator — a semicolon, a tab — tell pandas:</p>
  <pre class="code-block">pd.read_csv("sales.csv", sep=";")
pd.read_csv("sales.tsv", sep="\t")</pre>
  <h2>read_excel and read_json</h2>
  <pre class="code-block"># Excel: you can pick a specific sheet
orders = pd.read_excel("orders.xlsx", sheet_name="2026")

# JSON: nested records become rows automatically
api_export = pd.read_json("products.json")</pre>
  <p>For SQL databases, <span class="ic">pd.read_sql(query, connection)</span> runs a query and returns a DataFrame. Construction on that requires a driver, but the pattern is the same: read, then analyze.</p>
  <h2>Which reader do you need?</h2>
  <table>
    <thead>
      <tr><th>Function</th><th>File type</th><th>Handy arguments</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">pd.read_csv()</span></td><td>CSV or delimited text</td><td><span class="ic">sep</span>, <span class="ic">header</span>, <span class="ic">encoding</span></td></tr>
      <tr><td><span class="ic">pd.read_excel()</span></td><td>Excel workbook</td><td><span class="ic">sheet_name</span>, <span class="ic">usecols</span></td></tr>
      <tr><td><span class="ic">pd.read_json()</span></td><td>JSON text</td><td><span class="ic">orient</span> for different shapes</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Path trouble</strong>
    <p>If a reader raises FileNotFoundError, the path is wrong or the file is in another folder. Pass an absolute path, or use <span class="ic">pathlib</span> to build paths safely, like <span class="ic">pd.read_csv(Path("data") / "sales.csv")</span>.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Use <span class="ic">encoding="utf-8"</span> when a CSV throws a UnicodeDecodeError, and try <span class="ic">encoding="latin-1"</span> for older Windows exports. Your future self will thank you.</p>
  </div>
  <p>Loading a file is only the first step. Next you learn the exploration methods that tell you, within seconds, what you just loaded.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000404',
  '60000000-0000-4000-8000-000000000305',
  1,
  'Exploring a DataFrame',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exploring a DataFrame</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
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
  <h1>Exploring a DataFrame</h1>
  <p>Good analysts never dive into a dataset blind. A handful of pandas methods tell you the shape, the types, the summary statistics, and the shape of the distribution in seconds. This little toolkit is your first pass over any file.</p>
  <pre class="code-block">import pandas as pd

df = pd.read_csv("sales.csv")

print(df.head())         # first 5 rows
print(df.tail())         # last 5 rows
print(df.sample(3))      # 3 random rows
print(df.shape)          # (rows, columns)
print(df.columns)        # column names
print(df.dtypes)         # per-column type</pre>
  <h2>info and describe — the power duo</h2>
  <pre class="code-block">df.info()       # shape, non-null counts, dtypes, memory
df.describe()   # count, mean, std, min, quartiles, max</pre>
  <p><span class="ic">df.info()</span> shows how many non-null values live in each column — a fast spotter for missing data. <span class="ic">df.describe()</span> computes summary statistics for the numeric columns.</p>
  <h2>Counting categories</h2>
  <p>For text columns, <span class="ic">value_counts()</span> shows every unique value with its frequency — perfect for finding typos and dominant categories:</p>
  <pre class="code-block">print(df["region"].value_counts())
print(df["region"].nunique())   # number of distinct values</pre>
  <h2>The exploration toolkit</h2>
  <table>
    <thead>
      <tr><th>Method</th><th>What it tells you</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">head() / tail()</span></td><td>First / last few rows by content</td></tr>
      <tr><td><span class="ic">sample(n)</span></td><td>Random rows for a peek at the whole</td></tr>
      <tr><td><span class="ic">info()</span></td><td>Sizes, non-null counts, dtypes</td></tr>
      <tr><td><span class="ic">describe()</span></td><td>Numeric summary statistics</td></tr>
      <tr><td><span class="ic">value_counts()</span></td><td>Frequencies of text values</td></tr>
      <tr><td><span class="ic">nunique()</span></td><td>How many distinct values per column</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Why sample instead of head</strong>
    <p>Data is often sorted, so the first rows may all look alike. <span class="ic">sample(n)</span> pulls random rows that represent the whole dataset — a much better first impression.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Chain them: <span class="ic">df.head(10).to_string()</span> prints a clean text table even with many columns, and <span class="ic">df.describe(include="all")</span> also summarizes text columns instead of skipping them.</p>
  </div>
  <p>You now know what you loaded. In the next module you deal with the mess that every real dataset contains: missing values.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000405',
  '60000000-0000-4000-8000-000000000307',
  1,
  'Detecting Missing Values',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Detecting Missing Values</title>
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
  <h1>Detecting Missing Values</h1>
  <p>Missing data is not an exception — it is the default. Databases allow nulls, spreadsheets have empty cells, and APIs return blanks. Before you can choose a fix, you must first <em>find</em> the problem precisely.</p>
  <p>In pandas, a missing value is represented by <span class="ic">NaN</span> (Not a Number). Two methods — <span class="ic">isna()</span> and its alias <span class="ic">isnull()</span> — return True everywhere a value is missing. They are strictly identical; use whichever reads better to you.</p>
  <pre class="code-block">import pandas as pd

print(df.isna().sum())              # missing count per column
print(df.notna().sum())             # present count per column

# WHERE exactly are the gaps? inspect a slice
print(df[df["price"].isna()].head())</pre>
  <p><span class="ic">df.isna()</span> builds a DataFrame of True/False values, one per cell. Summing each column gives the total number of missing values per column — the classic one-liner for a first audit of any dataset.</p>
  <h2>Order of operations</h2>
  <ul>
    <li>Count missing per column with <span class="ic">isna().sum()</span>.</li>
    <li>Look at the percentage: <span class="ic">df.isna().mean().round(3)</span>.</li>
    <li>Decide per column: remove, fill, or leave.</li>
  </ul>
  <h2>Missing is not always NaN</h2>
  <table>
    <thead>
      <tr><th>Value</th><th>pandas treats it as missing?</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">NaN</span> / <span class="ic">None</span></td><td>Yes</td></tr>
      <tr><td>Empty string <span class="ic">""</span></td><td>No — it is a real string</td></tr>
      <tr><td><span class="ic">pd.NA</span></td><td>Yes (modern nullable type)</td></tr>
      <tr><td>Placeholder like <span class="ic">"N/A"</span> or <span class="ic">"-"</span></td><td>No — you must convert it yourself</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Placeholder strings</strong>
    <p>Files often encode missing as <span class="ic">"N/A"</span> or <span class="ic">"-"</span>. Tell pandas at load time: <span class="ic">pd.read_csv("file.csv", na_values=["N/A", "-", ""])</span>. That converts the placeholders into real NaN while loading.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>When missingness is high, look at <em>where</em> the data is missing. If only one machine fills a column, gaps there tell a story — and the next lesson helps you pick between removing and filling.</p>
  </div>
  <p>Now that every gap has a name, the next lesson clears them: remove with <span class="ic">dropna</span> or fill with <span class="ic">fillna</span>.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000406',
  '60000000-0000-4000-8000-000000000308',
  1,
  'Filling Missing Values',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Filling Missing Values</title>
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
  <h1>Filling Missing Values</h1>
  <p>Once you know where the gaps are, you decide: <strong>remove</strong> the rows or <strong>fill</strong> the blanks. There is no universal right answer — the two tools you learn here let you express whichever decision your data deserves.</p>
  <h2>Removing with dropna</h2>
  <pre class="code-block">df.dropna()                      # drop rows with ANY missing value
df.dropna(how="all")             # drop rows that are entirely empty
df.dropna(subset=["price"])      # only look at the price column
df.dropna(axis=1, thresh=900)    # drop columns with fewer than 900 real values</pre>
  <p><span class="ic">dropna()</span> never edits the original unless you ask — it returns a new DataFrame. Use <span class="ic">inplace=True</span> carefully, or simply reassign.</p>
  <h2>Filling with fillna</h2>
  <pre class="code-block">df["price"].fillna(0)                                    # fixed value
df["price"].fillna(df["price"].mean())                   # column mean
df["rating"].fillna(df["rating"].median())               # robust to outliers
df["temperature"].ffill()                                # carry previous value
df["temperature"].bfill()                                # pull next value
df["score"].interpolate()                                # smooth linear fill</pre>
  <ul>
    <li><span class="ic">ffill()</span> (also <span class="ic">method="ffill"</span>) repeats the last valid value — perfect for temperature readings logged every minute.</li>
    <li><span class="ic">bfill()</span> fills with the following value — good when a sensor reboots at the start of a gap.</li>
    <li><span class="ic">interpolate()</span> draws a straight line between the two surrounding values.</li>
  </ul>
  <h2>Choosing a strategy</h2>
  <table>
    <thead>
      <tr><th>Situation</th><th>Best move</th></tr>
    </thead>
    <tbody>
      <tr><td>A few rows missing, few columns</td><td><span class="ic">dropna()</span></td></tr>
      <tr><td>Most rows missing a key column</td><td>Drop the <em>column</em> instead</td></tr>
      <tr><td>Numeric column, gaps are noise</td><td>Fill with median or mean</td></tr>
      <tr><td>Regular time series, sensor gaps</td><td><span class="ic">ffill()</span> / <span class="ic">interpolate()</span></td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Filling is a choice, not a fix</strong>
    <p>Every filled value is an assumption. Record that assumption — in a comment or a README — so the person reading your code knows that those means were invented, not measured.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Fill with the <em>group</em> mean, not the global mean, for mixed populations: <span class="ic">df["price"] = df.groupby("region")["price"].transform("median")</span>. That keeps each region closer to its own typical price.</p>
  </div>
  <p>Missing values are handled. Next you learn how to select exactly the rows and columns you need — and reshape what does not fit.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000407',
  '60000000-0000-4000-8000-000000000310',
  1,
  'Filtering Rows & Columns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Filtering Rows &amp; Columns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
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
  <h1>Filtering Rows &amp; Columns</h1>
  <p>Analysis is a conversation with a table. You keep asking "show me only the rows where this is true, only these columns, only the first ten". In pandas, two families of selectors run that conversation: the bracket style and the explicit <span class="ic">.loc</span> / <span class="ic">.iloc</span> selectors.</p>
  <h2>Selecting columns</h2>
  <pre class="code-block">df["price"]            # one column as a Series
df[["price", "units"]] # many columns as a DataFrame</pre>
  <h2>Boolean masks — the heart of filtering</h2>
  <p>A boolean mask is a Series of True/False with the same index as your DataFrame. Stack it inside brackets and pandas keeps only the rows that are True.</p>
  <pre class="code-block">expensive = df["price"] > 4
print(df[expensive])                  # rows with price above 4

print(df[df["region"] == "North"])    # one condition
print(df[(df["region"] == "North") &amp; (df["price"] > 6)])   # AND
print(df[(df["region"] == "North") | (df["region"] == "South")]) # OR</pre>
  <div class="callout callout-info">
    <strong>Use &amp; and |, not and and or</strong>
    <p>Python keywords <span class="ic">and</span>/<span class="ic">or</span> cannot combine pandas masks because a mask has many values. Always use the bitwise operators, and wrap each comparison in parentheses.</p>
  </div>
  <h2>.loc and .iloc — labels and positions</h2>
  <pre class="code-block">df.loc[0]                       # row by label (here: position 0)
df.loc[2:4, ["product", "price"]]   # rows and columns by label
df.loc[df["units"] &gt; 3, "product"] # mask rows, one column

df.iloc[0]                       # first row by position
df.iloc[1:4, 0:2]                # sliced like a list</pre>
  <table>
    <thead>
      <tr><th>Selector</th><th>Rows by</th><th>Columns by</th><th>Best for</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">df[...]</span></td><td>Mask or slices</td><td>Names</td><td>Quick column grabs</td></tr>
      <tr><td><span class="ic">df.loc</span></td><td>Labels / masks</td><td>Labels</td><td>Readable, logic-based selection</td></tr>
      <tr><td><span class="ic">df.iloc</span></td><td>Positions</td><td>Positions</td><td>First rows, mechanical slicing</td></tr>
    </tbody>
  </table>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Prefer <span class="ic">.loc</span> whenever your filter is logical ("show me premium products in the North") — it reads like a sentence, which makes your analysis easy to review.</p>
  </div>
  <p>You can now ask a DataFrame almost anything. Next up: transforming the answers — types, text, and custom functions.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000408',
  '60000000-0000-4000-8000-000000000311',
  1,
  'Transforming Data',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Transforming Data</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
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
  <h1>Transforming Data</h1>
  <p>Real columns arrive with the wrong type, messy casing, and stray spaces. This lesson is the cleanup crew: converting types, tidying text, and applying your own logic to every value.</p>
  <h2>Converting dtypes</h2>
  <pre class="code-block">df["price"] = df["price"].astype(float)          # force a dtype
df["units"] = pd.to_numeric(df["units"], errors="coerce") # bad values become NaN
df["signup"] = pd.to_datetime(df["signup"])      # strings to datetimes</pre>
  <p><span class="ic">astype()</span> asks for a type; <span class="ic">to_numeric(..., errors="coerce")</span> converts what it can and marks the rest missing — ideal when a stray letter hides in a number column.</p>
  <h2>Cleaning text with .str</h2>
  <p>Pandas string methods run under the hood on every value of a column, freeing you from looping:</p>
  <pre class="code-block">df["name"] = df["name"].str.strip()                  # remove edge spaces
df["name"] = df["name"].str.lower()                  # lowercase
df["product_code"] = df["product_code"].str.replace("-", "")
mask = df["notes"].str.contains("urgent", case=False, na=False)</pre>
  <table>
    <thead>
      <tr><th>Method</th><th>What it does</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">.str.strip()</span></td><td>Removes leading and trailing whitespace</td></tr>
      <tr><td><span class="ic">.str.lower() / .upper()</span></td><td>Consistent casing for merging</td></tr>
      <tr><td><span class="ic">.str.replace()</span></td><td>Swaps one text pattern for another</td></tr>
      <tr><td><span class="ic">.str.contains()</span></td><td>Finds rows that contain a phrase</td></tr>
      <tr><td><span class="ic">.str.split()</span></td><td>Breaks text into multiple columns</td></tr>
    </tbody>
  </table>
  <h2>apply and map — your own logic</h2>
  <pre class="code-block">def revenue(row):                       # function over a whole row
    return row["price"] * row["units"]

df["revenue"] = df.apply(revenue, axis=1)

# map: a dictionary rule for one column
df["tier"] = df["spend"].map({1: "Low", 2: "Mid", 3: "High"})</pre>
  <div class="callout callout-info">
    <strong>Vectorized first</strong>
    <p>Before you reach for <span class="ic">apply</span>, look for a built-in vectorized version — pandas and NumPy functions run far faster than Python loops. Multiplication like <span class="ic">df["price"] * df["units"]</span> needs no apply at all.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Chain transformations for a tidy one-liner and a clear audit trail: <span class="ic">df.assign(revenue=df["price"] * df["units"])</span> adds the new column without mutating your source data.</p>
  </div>
  <p>Your data is clean and shaped. Time to draw meaning from it — the next module introduces groupby, the most powerful summarizing tool in pandas.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000409',
  '60000000-0000-4000-8000-000000000313',
  1,
  'GroupBy Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>GroupBy Fundamentals</title>
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
  <h1>GroupBy Fundamentals</h1>
  <p>"What is the average order per region?" "Total sales per month?" Questions like these collapse thousands of rows into a handful of meaning. pandas answers them with one pattern: <strong>split-apply-combine</strong>.</p>
  <ol>
    <li><strong>Split</strong> — rows are grouped by a key column.</li>
    <li><strong>Apply</strong> — a function runs on each group (mean, sum, count...).</li>
    <li><strong>Combine</strong> — the per-group results are joined into one table.</li>
  </ol>
  <pre class="code-block">import pandas as pd

df = pd.DataFrame({
    "region":  ["North", "North", "South", "South", "South"],
    "product": ["Latte", "Muffin", "Latte", "Muffin", "Espresso"],
    "revenue": [120.0, 60.0, 90.0, 45.0, 40.0],
})

print(df.groupby("region").mean())     # average revenue per region
print(df.groupby("region").sum())      # total revenue per region
print(df.groupby("region").count())    # rows per region
print(df.groupby("region").size())     # rows per region, no NaNs counted</pre>
  <h2>Grouping by several columns</h2>
  <p>Pass a list to group by combinations — for example revenue per region <em>and</em> product:</p>
  <pre class="code-block">summary = df.groupby(["region", "product"])["revenue"].sum()
print(summary.head())</pre>
  <h2>Common group operations</h2>
  <table>
    <thead>
      <tr><th>Operation</th><th>Returns</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">.mean()</span></td><td>Average per group</td></tr>
      <tr><td><span class="ic">.sum()</span></td><td>Total per group</td></tr>
      <tr><td><span class="ic">.count()</span></td><td>Non-null count per group</td></tr>
      <tr><td><span class="ic">.min() / .max()</span></td><td>Bounding values per group</td></tr>
      <tr><td><span class="ic">.first() / .last()</span></td><td>First / last row per group</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>The grouped column becomes the index</strong>
    <p>After <span class="ic">groupby()</span>, the grouping column becomes the index of the result. Call <span class="ic">.reset_index()</span> to turn it back into a normal column whenever you need to merge or export the summary.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Group the column first, aggregate later: <span class="ic">df.groupby("region")["revenue"].agg(["mean", "sum"])</span> gives you several statistics at once — the topic of the very next lesson.</p>
  </div>
  <p>That was the one-liner that powers most business reporting. Now you make it even stronger with multiple aggregations and pivot tables.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000410',
  '60000000-0000-4000-8000-000000000314',
  1,
  'Aggregations & Pivot Tables',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aggregations &amp; Pivot Tables</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
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
  <h1>Aggregations &amp; Pivot Tables</h1>
  <p>One statistic is rarely enough. You want the sum <em>and</em> the mean <em>and</em> the count in one clean result — or a whole spreadsheet-like matrix that shows how two dimensions interact. This lesson is the next level of summarizing.</p>
  <h2>Multiple aggregations with agg</h2>
  <pre class="code-block">df.groupby("region")["revenue"].agg(["sum", "mean", "count"])

# different statistics for different columns
df.groupby("region").agg({
    "revenue": ["sum", "mean"],
    "units":   ["sum", "max"],
})</pre>
  <h2>pivot_table — the spreadsheet view</h2>
  <p>Where <span class="ic">groupby</span> prints a long column of groups, <span class="ic">pivot_table()</span> spreads groups across rows <em>and</em> columns. This is the classic matrix: rows are one key, columns another, values the statistic.</p>
  <pre class="code-block">pivot = df.pivot_table(
    index="region",            # rows
    columns="product",         # columns
    values="revenue",          # what to summarize
    aggfunc="sum",             # how to combine
    margins=True,              # add Totals row and column
)
print(pivot)</pre>
  <h2>crosstab — counting pairs</h2>
  <p>When your question is "how many", <span class="ic">pd.crosstab(index, columns)</span> counts the combinations and returns a ready-made matrix:</p>
  <pre class="code-block">print(pd.crosstab(df["region"], df["product"]))</pre>
  <h2>Which one when?</h2>
  <table>
    <thead>
      <tr><th>Goal</th><th>Tool</th></tr>
    </thead>
    <tbody>
      <tr><td>One grouping, several stats</td><td><span class="ic">groupby(...).agg(...)</span></td></tr>
      <tr><td>Row × column summary matrix</td><td><span class="ic">pivot_table()</span></td></tr>
      <tr><td>Just counting pairs of categories</td><td><span class="ic">pd.crosstab()</span></td></tr>
      <tr><td>Add row and column totals</td><td><span class="ic">margins=True</span></td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Fill empty cells</strong>
    <p>Pivot cells with no data become NaN. You can fill them with <span class="ic">fillna(0)</span> — but only if a zero is a meaningful answer for your question. Sometimes a blank cell is itself information.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Pivot tables and groupby results make brilliant chart inputs. This exact pivot will become one of the dashboard plots in the final project.</p>
  </div>
  <p>Summary tables are powerful, but most real questions need data from <em>more than one</em> table. Next: merging and joining.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000411',
  '60000000-0000-4000-8000-000000000316',
  1,
  'Concatenation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Concatenation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
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
  <h1>Concatenation</h1>
  <p>Sometimes combining tables is pure stacking: three CSV exports of the same shape, collected monthly, need to become one table. Or you want to attach extra columns side by side. <span class="ic">pd.concat()</span> is the tool for both.</p>
  <h2>Stacking rows with axis=0</h2>
  <pre class="code-block">import pandas as pd

jan = pd.read_csv("sales_jan.csv")
feb = pd.read_csv("sales_feb.csv")
mar = pd.read_csv("sales_mar.csv")

all_sales = pd.concat([jan, feb, mar], axis=0, ignore_index=True)
print(all_sales.shape)</pre>
  <p><span class="ic">axis=0</span> appends rows. <span class="ic">ignore_index=True</span> discards the repeated old indexes and numbers everything 0..n-1 — almost always what you want when stacking.</p>
  <h2>Attaching columns with axis=1</h2>
  <pre class="code-block">ids = df_existing[["customer_id"]]
scores = df_new[["customer_id", "lifetime_value"]]
combined = pd.concat([ids, scores], axis=1)</pre>
  <h2>Four reading habits for concat</h2>
  <table>
    <thead>
      <tr><th>Pattern</th><th>Code</th></tr>
    </thead>
    <tbody>
      <tr><td>Stack rows, renumber</td><td><span class="ic">axis=0, ignore_index=True</span></td></tr>
      <tr><td>Keep which source each row came from</td><td><span class="ic">keys=["Jan", "Feb"]</span></td></tr>
      <tr><td>Attach columns alongside</td><td><span class="ic">axis=1</span></td></tr>
      <tr><td>Verify column alignment</td><td><span class="ic">join="inner"</span></td></tr>
    </tbody>
  </table>
  <pre class="code-block">with_keys = pd.concat(
    [jan, feb, mar], keys=["Jan", "Feb", "Mar"], ignore_index=False
)
print(with_keys.loc[("Feb", 0)])</pre>
  <div class="callout callout-info">
    <strong>Watch for duplicate headers</strong>
    <p>When stacking, pandas keeps the first header row from each file by default, but only one header should exist. Use <span class="ic">pd.read_csv(file, header=0)</span> consistently — and check <span class="ic">all_sales["product"].isna().any()</span> afterwards to catch stray header rows.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>After any concat, run <span class="ic">all_sales.duplicated().sum()</span>. Rows that appear in two overlapping exports double-count — cleaning duplicates at concat time saves your summary statistics later.</p>
  </div>
  <p>Stacking is simple because every table shares the same columns. But real projects combine tables that <em>differ</em> — with a shared key like a customer id. That is merge, the subject of the next lesson.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000412',
  '60000000-0000-4000-8000-000000000317',
  1,
  'Merge & Join',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Merge &amp; Join</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
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
  <h1>Merge &amp; Join</h1>
  <p>An order table has <span class="ic">customer_id</span> for every sale, and a customer table has all the details. To enrich the orders with customer names and regions, you <em>merge</em> the two on that shared key. This is the heart of relational analysis.</p>
  <pre class="code-block">orders = pd.DataFrame({
    "order_id":   [1, 2, 3],
    "customer_id":["C1", "C2", "C1"],
    "revenue":    [50.0, 30.0, 70.0],
})
customers = pd.DataFrame({
    "customer_id": ["C1", "C2"],
    "name":  ["Anna Lake", "Ben Shore"],
    "region":["North", "South"],
})

enriched = pd.merge(orders, customers, on="customer_id")
print(enriched)</pre>
  <h2>Four ways to join</h2>
  <p>The <span class="ic">how</span> argument controls which rows survive:</p>
  <table>
    <thead>
      <tr><th>how</th><th>Keeps</th><th>Typical use</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">inner</span></td><td>Rows with keys in both frames</td><td>Default; only complete matches</td></tr>
      <tr><td><span class="ic">left</span></td><td>All rows of the left frame</td><td>Keep every order, even without a customer</td></tr>
      <tr><td><span class="ic">right</span></td><td>All rows of the right frame</td><td>Mirror of left</td></tr>
      <tr><td><span class="ic">outer</span></td><td>All rows from both frames</td><td>Full union, find unmatched keys</td></tr>
    </tbody>
  </table>
  <pre class="code-block">pd.merge(orders, customers, on="customer_id", how="left")
pd.merge(orders, customers, on="customer_id", how="outer")

# keys with different names
pd.merge(orders, customers, left_on="customer_id", right_on="id")

# duplicate column names get suffixes
pd.merge(a, b, on="id", suffixes=("_left", "_right"))</pre>
  <h2>Join: merge on the index</h2>
  <p>If your key lives in the index instead of a column, <span class="ic">df.join()</span> is the shorthand:</p>
  <pre class="code-block">revenue_by_id = orders.groupby("customer_id")["revenue"].sum()
result = customers.join(revenue_by_id)</pre>
  <div class="callout callout-info">
    <strong>Dtype mismatch</strong>
    <p>Merging a string key with an integer key quietly fails or duplicates rows. Before merging, confirm the key types match: <span class="ic">orders["customer_id"].dtype == customers["customer_id"].dtype</span>.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>After a merge, check the row count — it should make sense. If orders exploded in size, a key duplicated on the other side. Run <span class="ic">customers["customer_id"].duplicated().any()</span> to catch it.</p>
  </div>
  <p>With concat, merge, and join you can now assemble any dataset. Next: time — parsing dates and understanding data that changes over time.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000413',
  '60000000-0000-4000-8000-000000000319',
  1,
  'Dates & Datetimes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dates &amp; Datetimes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
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
  <h1>Dates &amp; Datetimes</h1>
  <p>Dates arrive as strings — "2026-01-15", "15/01/2026", "Jan 15 2026" — and strings cannot be sorted by time, resampled, or sliced chronologically. The fix is <span class="ic">pd.to_datetime()</span>, which turns them into real datetime values.</p>
  <pre class="code-block">import pandas as pd

df["order_date"] = pd.to_datetime(df["order_date"])
print(df["order_date"].dtype)   # datetime64[ns] — the signal it worked

# non-standard formats
df["date"] = pd.to_datetime(df["date"], format="%d/%m/%Y")

# unparseable rows become NaT (a missing datetime)
df["date"] = pd.to_datetime(df["date"], errors="coerce")</pre>
  <h2>The .dt accessor</h2>
  <p>Once a column is a datetime, the <span class="ic">.dt</span> accessor hands you every part of the calendar:</p>
  <pre class="code-block">df["year"]  = df["order_date"].dt.year
df["month"] = df["order_date"].dt.month
df["day"]   = df["order_date"].dt.day
df["weekday"] = df["order_date"].dt.day_name()   # Monday, Tuesday...
print(df["order_date"].dt.is_month_end)</pre>
  <table>
    <thead>
      <tr><th>Accessor part</th><th>What you get</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">.dt.year / .month / .day</span></td><td>Calendar parts as integers</td></tr>
      <tr><td><span class="ic">.dt.day_name()</span></td><td>Weekday name</td></tr>
      <tr><td><span class="ic">.dt.hour / .minute</span></td><td>Clock parts</td></tr>
      <tr><td><span class="ic">.dt.is_month_end</span></td><td>Boolean flags</td></tr>
    </tbody>
  </table>
  <h2>Slicing by time after setting the index</h2>
  <pre class="code-block">df = df.set_index("order_date")
print(df.loc["2026-01"])              # whole January
print(df.loc["2026-01-01":"2026-01-10"])  # a date range
print(df["2026-01"])                  # bracket slicing also works</pre>
  <div class="callout callout-info">
    <strong>Timezones change everything</strong>
    <p>Datetimes from global systems usually include a timezone. Compare "day" boundaries only after normalizing: <span class="ic">pd.to_datetime(df["ts"]).dt.tz_localize(None)</span> keeps local wall-clock times but drops the zone — fine when all data shares one timezone.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Use the strict <span class="ic">format=</span> argument whenever you know it. Explicit formats are several times faster and silently catch dates parsed to the wrong day.</p>
  </div>
  <p>With a real datetime index you can now look at data by the week, month, or quarter — the superpower of resampling, covered next.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000414',
  '60000000-0000-4000-8000-000000000320',
  1,
  'Time Series Analysis',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Time Series Analysis</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
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
  <h1>Time Series Analysis</h1>
  <p>A daily sales table is overwhelming (365 rows a year) and noisy (weekends, holidays). Analysis hides in the <em>frequency</em>: What happened per month? What is the 7-day trend? Time series methods compress the noise into signal.</p>
  <h2>resample — change the frequency</h2>
  <p><span class="ic">resample()</span> needs a datetime index. Choose a rule, then aggregate exactly like groupby:</p>
  <pre class="code-block">daily = df.set_index("order_date")

monthly = daily["revenue"].resample("M").sum()   # monthly totals
weekly  = daily["revenue"].resample("W").mean()  # weekly averages
quarterly = daily["revenue"].resample("Q").sum()
print(monthly.tail())</pre>
  <table>
    <thead>
      <tr><th>Rule</th><th>Meaning</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">D</span></td><td>Daily</td></tr>
      <tr><td><span class="ic">W</span></td><td>Weekly</td></tr>
      <tr><td><span class="ic">M / MS</span></td><td>Month end / month start</td></tr>
      <tr><td><span class="ic">Q / QS</span></td><td>Quarter end / quarter start</td></tr>
      <tr><td><span class="ic">Y</span></td><td>Year end</td></tr>
      <tr><td><span class="ic">2D, 6h</span></td><td>Multiples, e.g. every 2 days, every 6 hours</td></tr>
    </tbody>
  </table>
  <h2>rolling — moving averages</h2>
  <p>A rolling window slides across the series and applies a function to each window. It smooths volatility and exposes the trend:</p>
  <pre class="code-block">daily["trend_7"] = daily["revenue"].rolling(7, center=True).mean()</pre>
  <h2>shift, diff, and pct_change</h2>
  <pre class="code-block">print(df["revenue"].shift(1))          # yesterday value aligned to today
print(df["revenue"].diff(1))           # change from previous day
print(df["revenue"].pct_change())      # change as a fraction
print(df["revenue"].cumsum())          # running total</pre>
  <div class="callout callout-info">
    <strong>resample needs a real datetime index</strong>
    <p>If resample raises TypeError about the index, your column is not a datetime yet. Turn it first: <span class="ic">df["order_date"] = pd.to_datetime(df["order_date"])</span>, then <span class="ic">set_index</span>.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Compare revenues fairly: daily revenue dips on weekends, so compare week-over-week, or resample to <span class="ic">M</span> and <span class="ic">Q</span> before judging performance. A 7-day rolling mean is your best low-noise view.</p>
  </div>
  <p>Numbers are meaningful now, but nobody reads raw tables. Next chapter: turning these results into charts with Matplotlib.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000415',
  '60000000-0000-4000-8000-000000000322',
  1,
  'Plotting Basics with Matplotlib',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Plotting Basics with Matplotlib</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
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
  <h1>Plotting Basics with Matplotlib</h1>
  <p>Matplotlib is the classic Python plotting library, and pandas plugs straight into it. One call on a DataFrame — <span class="ic">df.plot()</span> — produces a real chart with the axes and labels you expect.</p>
  <pre class="code-block">import pandas as pd
import matplotlib.pyplot as plt

monthly = df.resample("M")["revenue"].sum()

monthly.plot(kind="line")     # or .plot.line()
plt.show()                    # display the figure</pre>
  <h2>Three charts you need now</h2>
  <pre class="code-block">df.plot.line(x="date", y="revenue")            # change over time
df.plot.bar(x="product", y="quantity")         # compare categories
df["price"].plot.hist(bins=20)                 # distribution</pre>
  <table>
    <thead>
      <tr><th>Chart</th><th>Question it answers</th></tr>
    </thead>
    <tbody>
      <tr><td>Line</td><td>How does this change over time?</td></tr>
      <tr><td>Bar</td><td>How do categories compare?</td></tr>
      <tr><td>Histogram</td><td>How is one variable distributed?</td></tr>
      <tr><td>Scatter</td><td>Do two variables move together?</td></tr>
    </tbody>
  </table>
  <h2>Figure and axes</h2>
  <p><span class="ic">plt.show()</span> displays; <span class="ic">plt.savefig()</span> writes a file. Both work on the currently active figure. For full control you grab the <em>axes</em> object:</p>
  <pre class="code-block">ax = df["price"].plot.hist(bins=30, title="Order value distribution")
plt.savefig("price_histogram.png", dpi=150, bbox_inches="tight")</pre>
  <div class="callout callout-info">
    <strong>Notebooks display inline</strong>
    <p>In Jupyter, charts appear automatically below the cell, so <span class="ic">plt.show()</span> is optional there. In plain scripts it is required, otherwise nothing renders on screen.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Make every chart tell one story. A line chart of <em>one</em> metric beats a crowded multi-series plot — your reader understands it ten seconds faster.</p>
  </div>
  <p>Charts exist, and next you make them presentable: titles, labels, legends, grids, and dashboard-ready multi-panel layouts.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000416',
  '60000000-0000-4000-8000-000000000323',
  1,
  'Customizing & Combining Charts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customizing &amp; Combining Charts</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
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
  <h1>Customizing &amp; Combining Charts</h1>
  <p>A plain chart answers a question; a polished chart convinces. Titles, axis labels, legends, and a tidy multi-panel layout turn analysis into a dashboard anyone can read.</p>
  <h2>One figure, full control</h2>
  <pre class="code-block">import matplotlib.pyplot as plt

fig, ax = plt.subplots(figsize=(8, 4))
ax.plot(monthly.index, monthly.values, color="#6366f1", linewidth=2)
ax.set_title("Monthly Revenue", fontsize=14, fontweight="bold")
ax.set_xlabel("Month")
ax.set_ylabel("Revenue (USD)")
ax.grid(True, alpha=0.3)
ax.legend(["revenue"])
plt.tight_layout()
plt.show()</pre>
  <h2>Multiple charts in one figure</h2>
  <p><span class="ic">plt.subplots(1, 2)</span> creates a row of two axes. Each axis is drawn independently:</p>
  <pre class="code-block">fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 4))

top_products.plot.bar(ax=ax1, title="Top products")
regions.plot.line(ax=ax2, title="Revenue by region")

fig.suptitle("Sales Dashboard 2026")
plt.tight_layout()
plt.savefig("dashboard.png", dpi=150)</pre>
  <h2>Workbench of useful tweaks</h2>
  <table>
    <thead>
      <tr><th>Need</th><th>Code</th></tr>
    </thead>
    <tbody>
      <tr><td>Figure size</td><td><span class="ic">figsize=(8, 4)</span></td></tr>
      <tr><td>Rotate crowded x labels</td><td><span class="ic">plt.xticks(rotation=45)</span></td></tr>
      <tr><td>Shared style</td><td><span class="ic">plt.style.use("ggplot")</span></td></tr>
      <tr><td>Percent axis</td><td><span class="ic">ax.yaxis.set_major_formatter(plt.PercentFormatter())</span></td></tr>
      <tr><td>Save without clipping</td><td><span class="ic">bbox_inches="tight"</span></td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Label everything</strong>
    <p>A chart with no axis labels and no title is a mystery. Every dashboard plot in the capstone must carry: a title, labeled axes, and units. Accessibility benefits too.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Pick one color for the primary series and one accent for the comparison. Restraint reads as professionalism — five clashing colors hide the very insight the chart exists to reveal.</p>
  </div>
  <p>You now own the full pipeline: read, clean, transform, aggregate, merge, time-bucket, and chart. Everything consolidates in the final module, where one sales dashboard proves it all.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000417',
  '60000000-0000-4000-8000-000000000325',
  1,
  'Project Setup & Data Prep',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Project Setup &amp; Data Prep</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
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
  <h1>Project Setup &amp; Data Prep</h1>
  <p>The capstone applies everything you learned: orders arrive as three raw files, and your job is to produce one clean, joined DataFrame — then turn it into a sales dashboard in the final chapter.</p>
  <h2>1. Create the project folder</h2>
  <pre class="code-block">sales-dashboard/
├── data/            # raw files live here
├── notebooks/       # your working analyses
├── images/          # exported charts
└── report.md        # your final write-up</pre>
  <h2>2. Load and survey the raw files</h2>
  <p>The raw data: <span class="ic">orders.csv</span> (one row per sale), <span class="ic">products.csv</span> (product catalog), and <span class="ic">customers.csv</span> (customer profile). Audit each one before touching anything:</p>
  <pre class="code-block">import pandas as pd

orders    = pd.read_csv("data/orders.csv")
products  = pd.read_csv("data/products.csv")
customers = pd.read_csv("data/customers.csv")

for name, frame in [("orders", orders), ("products", products),
                    ("customers", customers)]:
    print(name, frame.shape)
    print(frame.isna().sum()[frame.isna().sum() &gt; 0])
    print(frame.dtypes)
    print("-" * 40)</pre>
  <h2>3. Clean and combine</h2>
  <pre class="code-block">orders["order_date"] = pd.to_datetime(orders["order_date"], errors="coerce")
orders = orders.dropna(subset=["order_id", "order_date"])
orders = orders.drop_duplicates()

# fix placeholder missing values at load time
products = pd.read_csv("data/products.csv", na_values=["", "N/A", "-"])

# join product details and customer details onto orders
enriched = orders.merge(products, on="product_id", how="left") \
                 .merge(customers, on="customer_id", how="left")
print(enriched.shape)</pre>
  <h2>4. Ship a clean artifact</h2>
  <pre class="code-block">enriched.to_csv("data/enriched_sales.csv", index=False)</pre>
  <p>From now on every analysis starts from that single clean file — the source of truth for the dashboard.</p>
  <div class="callout callout-info">
    <strong>Order of operations</strong>
    <p>Clean <em>before</em> combining: missing values, then dtypes, then duplicates, then merges. Cleaning after a merge spreads surprises across every downstream query.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Use <span class="ic">na_values=[...]</span> at read time to catch "N/A", "-" and empty strings as missing. It is cheaper than hunting them after the fact.</p>
  </div>
  <p>One clean table is ready. The final lessons turn it into insight — and a report a stakeholder will actually read.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000418',
  '60000000-0000-4000-8000-000000000326',
  1,
  'Building Insights with GroupBy & Plots',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building Insights with GroupBy &amp; Plots</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul { margin: 12px 0; padding-left: 24px; }
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
  <h1>Building Insights with GroupBy &amp; Plots</h1>
  <p>Insight starts with a business question. This lesson walks three classic questions through cleaning-ready data — translated into groupby summaries and charts you can reuse in the final report.</p>
  <h2>Question 1: Revenue by month</h2>
  <pre class="code-block">df["order_date"] = pd.to_datetime(df["order_date"])
monthly = df.set_index("order_date")["revenue"].resample("M").sum()
print(monthly)

monthly.plot.line(title="Monthly Revenue")
plt.savefig("images/monthly_revenue.png", dpi=150)</pre>
  <h2>Question 2: Top products</h2>
  <pre class="code-block">top = df.groupby("product")["quantity"].sum().sort_values(ascending=False)
print(top.head(10))

top.head(10).plot.bar(title="Top 10 products")
plt.xticks(rotation=45)</pre>
  <h2>Question 3: Region x product matrix</h2>
  <pre class="code-block">pivot = df.pivot_table(index="region", columns="product",
                       values="revenue", aggfunc="sum", margins=True)
print(pivot.head())

best_region = df.groupby("region")["revenue"].mean().round(2)
print(best_region)</pre>
  <h2>Interpreting, not just computing</h2>
  <ul>
    <li>Compare highest and lowest months — is the gap seasonal or fixable?</li>
    <li>Check whether the top product is also the most <em>profitable</em>.</li>
    <li>Look at average order value per region, not just totals.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Ask first, compute second</strong>
    <p>Write the question in plain English before writing any code. A precise question ("average order value per region") leads to a precise answer; a vague question leads to a pile of charts nobody asked for.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Save every chart you might use to <span class="ic">images/</span> with a descriptive filename. The report in the next lesson embeds exactly those PNGs.</p>
  </div>
  <p>Insights are computed. The last lesson stitches them — tables, charts, and narratives — into a report worth sharing.</p>
</div>
</body>
</html>
$html$
),
(
  '60000000-0000-4000-8000-000000000419',
  '60000000-0000-4000-8000-000000000327',
  1,
  'Reporting Findings',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reporting Findings</title>
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
  <h1>Reporting Findings</h1>
  <p>Analysis only matters if someone else can understand it. This final lesson turns your computed tables and saved charts into a report with a clear spine: context, method, findings, recommendation.</p>
  <h2>The four-part report spine</h2>
  <ol>
    <li><strong>Executive summary</strong> — three sentences: the question, the headline numbers, the recommendation.</li>
    <li><strong>Data and method</strong> — what files, which cleanup, which aggregations.</li>
    <li><strong>Findings</strong> — one chart or table per finding, each with a caption that names the insight.</li>
    <li><strong>Recommendations</strong> — what to do next, tied to specific evidence.</li>
  </ol>
  <h2>Table-ready formatting</h2>
  <pre class="code-block">summary = df.groupby("region")["revenue"].agg(["sum", "mean", "count"])
summary = summary.round(2).sort_values("sum", ascending=False)
print(summary.to_string())           # clean text table for Markdown
summary.to_csv("images/region_summary.csv")</pre>
  <h2>Embedding the dashboard</h2>
  <p>Compose everything as a dashboard figure for the report header:</p>
  <pre class="code-block">fig, axes = plt.subplots(2, 2, figsize=(10, 7))
monthly.plot.line(ax=axes[0, 0], title="Monthly revenue")
top.head(10).plot.bar(ax=axes[0, 1], title="Top products")
pivot.plot(ax=axes[1, 0], kind="bar", title="Region x product")
price_hist.plot(ax=axes[1, 1], title="Order value distribution")
fig.suptitle("Sales Dashboard 2026")
plt.tight_layout()
plt.savefig("images/dashboard.png", dpi=150)</pre>
  <h2>A caption is a finding</h2>
  <pre class="code-block"># Bad caption : "Monthly revenue chart"
# Good caption: "Revenue peaked in December; spring months run ~35% below it."</pre>
  <div class="callout callout-info">
    <strong>Name the audience</strong>
    <p>A finance lead wants money totals and variance. A product lead wants customer behavior. Shape the report to the decision at hand — not to everything you computed.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Put the recommendation at the very top. Busy readers decide in the first ten seconds and dive into evidence only when they need to.</p>
  </div>
  <p>That completes the pipeline: data in, insight out, decisions armed. Take the final assessment to earn your certificate of completion for this course.</p>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES (9 quiz lessons, 29 questions)
--    Q1 → lesson L3  (501) · Q2 → L6 (502) · Q3 → L9 (503) · Q4 → L12 (504)
--    Q5 → L15 (505)  · Q6 → L18 (506) · Q7 → L21 (507) · Q8 → L24 (508)
--    Q9 → L28 (509)
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('60000000-0000-4000-8000-000000000501', '60000000-0000-4000-8000-000000000303',
   'Which library provides the DataFrame object used throughout this course?',
   'pandas provides the Series and DataFrame objects at the heart of this course.', 1),
  ('60000000-0000-4000-8000-000000000502', '60000000-0000-4000-8000-000000000303',
   'What do we call a one-dimensional labelled array in pandas?',
   'A Series is a one-dimensional labelled array in pandas.', 2),
  ('60000000-0000-4000-8000-000000000503', '60000000-0000-4000-8000-000000000303',
   'What does the index of a DataFrame represent?',
   'The index labels the rows so you can select individual records.', 3),
  ('60000000-0000-4000-8000-000000000504', '60000000-0000-4000-8000-000000000306',
   'Which function reads a CSV file into a DataFrame?',
   'pd.read_csv() loads a CSV file into a DataFrame.', 1),
  ('60000000-0000-4000-8000-000000000505', '60000000-0000-4000-8000-000000000306',
   'Which method shows the first few rows of a DataFrame?',
   '.head() shows the first n rows, five by default.', 2),
  ('60000000-0000-4000-8000-000000000506', '60000000-0000-4000-8000-000000000306',
   'Which method summarizes numeric columns with count, mean, and quartiles?',
   '.describe() reports count, mean, standard deviation, and quartiles.', 3),
  ('60000000-0000-4000-8000-000000000507', '60000000-0000-4000-8000-000000000309',
   'How do you detect missing values inside a DataFrame?',
   'isna() and its alias isnull() return True wherever a value is missing.', 1),
  ('60000000-0000-4000-8000-000000000508', '60000000-0000-4000-8000-000000000309',
   'Which method removes rows that contain any missing value?',
   'dropna() removes any row that contains at least one missing value.', 2),
  ('60000000-0000-4000-8000-000000000509', '60000000-0000-4000-8000-000000000309',
   'Which method fills missing values with the previous valid value?',
   'ffill() propagates the previous valid value forward into the gaps.', 3),
  ('60000000-0000-4000-8000-000000000510', '60000000-0000-4000-8000-000000000312',
   'Which attribute stores the row labels of a DataFrame?',
   '.index holds the row labels, like row numbers.', 1),
  ('60000000-0000-4000-8000-000000000511', '60000000-0000-4000-8000-000000000312',
   'Which method selects rows and columns by label or by a boolean Series?',
   '.loc[] selects by labels or by a boolean Series. Use .iloc[] for positions.', 2),
  ('60000000-0000-4000-8000-000000000512', '60000000-0000-4000-8000-000000000312',
   'Which method converts a column to a different dtype?',
   'astype() casts a Series to another dtype such as int64 or float64.', 3),
  ('60000000-0000-4000-8000-000000000513', '60000000-0000-4000-8000-000000000315',
   'What pattern does groupby() implement?',
   'groupby() splits the data, applies a function per group, and combines the results.', 1),
  ('60000000-0000-4000-8000-000000000514', '60000000-0000-4000-8000-000000000315',
   'Which function reshapes long data into a spreadsheet-like summary table?',
   'pivot_table() reshapes long data into a summary matrix with rows and columns.', 2),
  ('60000000-0000-4000-8000-000000000515', '60000000-0000-4000-8000-000000000315',
   'What does .agg(["mean", "sum"]) do to each group?',
   'agg() with a list applies every listed function to each group.', 3),
  ('60000000-0000-4000-8000-000000000516', '60000000-0000-4000-8000-000000000318',
   'Which function stacks DataFrames along rows or columns?',
   'pd.concat() stacks DataFrames along rows (axis 0) or columns (axis 1).', 1),
  ('60000000-0000-4000-8000-000000000517', '60000000-0000-4000-8000-000000000318',
   'Which argument of pd.merge() names the key column to join on?',
   'The on argument names the common key column used for the merge.', 2),
  ('60000000-0000-4000-8000-000000000518', '60000000-0000-4000-8000-000000000318',
   'Which merge type keeps only rows whose keys match in both frames?',
   'An inner merge keeps only rows whose keys match in both frames.', 3),
  ('60000000-0000-4000-8000-000000000519', '60000000-0000-4000-8000-000000000321',
   'Which function turns strings into datetime values?',
   'pd.to_datetime() parses strings into datetime64 values.', 1),
  ('60000000-0000-4000-8000-000000000520', '60000000-0000-4000-8000-000000000321',
   'Which accessor exposes parts like year, month, and day on a datetime Series?',
   'The .dt accessor exposes year, month, day, and other parts.', 2),
  ('60000000-0000-4000-8000-000000000521', '60000000-0000-4000-8000-000000000321',
   'Which method changes the frequency of a time series, such as daily to monthly?',
   'resample() groups by a new time frequency before you aggregate.', 3),
  ('60000000-0000-4000-8000-000000000522', '60000000-0000-4000-8000-000000000324',
   'Which method plots a chart directly from a pandas Series or DataFrame?',
   '.plot() wraps Matplotlib for quick charts on Series and DataFrames.', 1),
  ('60000000-0000-4000-8000-000000000523', '60000000-0000-4000-8000-000000000324',
   'Which chart is best for showing how a single continuous variable is distributed?',
   'A histogram shows how often a continuous variable falls into each bin.', 2),
  ('60000000-0000-4000-8000-000000000524', '60000000-0000-4000-8000-000000000324',
   'Which function creates a grid of subplots in one figure?',
   'plt.subplots() creates a grid of axes for multiple charts.', 3),
  ('60000000-0000-4000-8000-000000000525', '60000000-0000-4000-8000-000000000328',
   'Which function reads a CSV file into a pandas DataFrame?',
   'pd.read_csv() is the standard way to load CSV data into memory.', 1),
  ('60000000-0000-4000-8000-000000000526', '60000000-0000-4000-8000-000000000328',
   'Which method removes rows that contain missing values?',
   'dropna() removes rows that contain missing values.', 2),
  ('60000000-0000-4000-8000-000000000527', '60000000-0000-4000-8000-000000000328',
   'Which function reshapes grouped data into a summary matrix with rows and columns?',
   'pivot_table() reshapes grouped data into a summary matrix.', 3),
  ('60000000-0000-4000-8000-000000000528', '60000000-0000-4000-8000-000000000328',
   'Which method changes the frequency of a time series from daily to monthly?',
   'resample() changes the frequency of a time series before aggregating.', 4),
  ('60000000-0000-4000-8000-000000000529', '60000000-0000-4000-8000-000000000328',
   'Which pandas method creates a chart directly from a DataFrame?',
   'DataFrame.plot() produces charts directly from your data.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the first listed (position of the correct
--    answer) is the correct one and is flagged with is_correct = TRUE.
--    Q1 options 1001-1004 · Q2 1005-1008 · Q3 1009-1012 · Q4 1013-1016
--    Q5 1017-1020 · Q6 1021-1024 · Q7 1025-1028 · Q8 1029-1032
--    Q9 1033-1036 · Q10 1037-1040 · Q11 1041-1044 · Q12 1045-1048
--    Q13 1049-1052 · Q14 1053-1056 · Q15 1057-1060 · Q16 1061-1064
--    Q17 1065-1068 · Q18 1069-1072 · Q19 1073-1076 · Q20 1077-1080
--    Q21 1081-1084 · Q22 1085-1088 · Q23 1089-1092 · Q24 1093-1096
--    Q25 1097-1100 · Q26 1101-1104 · Q27 1105-1108 · Q28 1109-1112
--    Q29 1113-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): the DataFrame library
  ('60000000-0000-4000-8000-000000001001', '60000000-0000-4000-8000-000000000501', 'pandas', TRUE,  1),
  ('60000000-0000-4000-8000-000000001002', '60000000-0000-4000-8000-000000000501', 'numpy', FALSE, 2),
  ('60000000-0000-4000-8000-000000001003', '60000000-0000-4000-8000-000000000501', 'seaborn', FALSE, 3),
  ('60000000-0000-4000-8000-000000001004', '60000000-0000-4000-8000-000000000501', 'statsmodels', FALSE, 4),
  -- Q2 (502): one-dimensional labelled array
  ('60000000-0000-4000-8000-000000001005', '60000000-0000-4000-8000-000000000502', 'Series', TRUE,  1),
  ('60000000-0000-4000-8000-000000001006', '60000000-0000-4000-8000-000000000502', 'List', FALSE, 2),
  ('60000000-0000-4000-8000-000000001007', '60000000-0000-4000-8000-000000000502', 'Matrix', FALSE, 3),
  ('60000000-0000-4000-8000-000000001008', '60000000-0000-4000-8000-000000000502', 'Vector', FALSE, 4),
  -- Q3 (503): the DataFrame index
  ('60000000-0000-4000-8000-000000001009', '60000000-0000-4000-8000-000000000503', 'The row labels that let you look up individual rows', TRUE,  1),
  ('60000000-0000-4000-8000-000000001010', '60000000-0000-4000-8000-000000000503', 'The column names of the DataFrame', FALSE, 2),
  ('60000000-0000-4000-8000-000000001011', '60000000-0000-4000-8000-000000000503', 'The data types of each column', FALSE, 3),
  ('60000000-0000-4000-8000-000000001012', '60000000-0000-4000-8000-000000000503', 'The memory used by the DataFrame', FALSE, 4),
  -- Q4 (504): read_csv
  ('60000000-0000-4000-8000-000000001013', '60000000-0000-4000-8000-000000000504', 'pd.read_csv()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001014', '60000000-0000-4000-8000-000000000504', 'pd.load_csv()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001015', '60000000-0000-4000-8000-000000000504', 'pd.parse_csv()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001016', '60000000-0000-4000-8000-000000000504', 'pd.import_csv()', FALSE, 4),
  -- Q5 (505): head method
  ('60000000-0000-4000-8000-000000001017', '60000000-0000-4000-8000-000000000505', '.head()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001018', '60000000-0000-4000-8000-000000000505', '.top()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001019', '60000000-0000-4000-8000-000000000505', '.front()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001020', '60000000-0000-4000-8000-000000000505', '.first()', FALSE, 4),
  -- Q6 (506): describe method
  ('60000000-0000-4000-8000-000000001021', '60000000-0000-4000-8000-000000000506', '.describe()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001022', '60000000-0000-4000-8000-000000000506', '.summary()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001023', '60000000-0000-4000-8000-000000000506', '.info()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001024', '60000000-0000-4000-8000-000000000506', '.stats()', FALSE, 4),
  -- Q7 (507): detecting missing values
  ('60000000-0000-4000-8000-000000001025', '60000000-0000-4000-8000-000000000507', 'isna() or isnull()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001026', '60000000-0000-4000-8000-000000000507', 'empty()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001027', '60000000-0000-4000-8000-000000000507', 'dropna()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001028', '60000000-0000-4000-8000-000000000507', 'clean()', FALSE, 4),
  -- Q8 (508): dropna
  ('60000000-0000-4000-8000-000000001029', '60000000-0000-4000-8000-000000000508', 'dropna()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001030', '60000000-0000-4000-8000-000000000508', 'fillna()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001031', '60000000-0000-4000-8000-000000000508', 'remove()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001032', '60000000-0000-4000-8000-000000000508', 'drop()', FALSE, 4),
  -- Q9 (509): ffill
  ('60000000-0000-4000-8000-000000001033', '60000000-0000-4000-8000-000000000509', 'ffill()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001034', '60000000-0000-4000-8000-000000000509', 'bfill()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001035', '60000000-0000-4000-8000-000000000509', 'fillup()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001036', '60000000-0000-4000-8000-000000000509', 'previous()', FALSE, 4),
  -- Q10 (510): the index attribute
  ('60000000-0000-4000-8000-000000001037', '60000000-0000-4000-8000-000000000510', '.index', TRUE,  1),
  ('60000000-0000-4000-8000-000000001038', '60000000-0000-4000-8000-000000000510', '.labels', FALSE, 2),
  ('60000000-0000-4000-8000-000000001039', '60000000-0000-4000-8000-000000000510', '.keys', FALSE, 3),
  ('60000000-0000-4000-8000-000000001040', '60000000-0000-4000-8000-000000000510', '.names', FALSE, 4),
  -- Q11 (511): .loc selector
  ('60000000-0000-4000-8000-000000001041', '60000000-0000-4000-8000-000000000511', '.loc[]', TRUE,  1),
  ('60000000-0000-4000-8000-000000001042', '60000000-0000-4000-8000-000000000511', '.col[]', FALSE, 2),
  ('60000000-0000-4000-8000-000000001043', '60000000-0000-4000-8000-000000000511', '.find()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001044', '60000000-0000-4000-8000-000000000511', '.search()', FALSE, 4),
  -- Q12 (512): astype
  ('60000000-0000-4000-8000-000000001045', '60000000-0000-4000-8000-000000000512', '.astype()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001046', '60000000-0000-4000-8000-000000000512', '.convert()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001047', '60000000-0000-4000-8000-000000000512', '.cast()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001048', '60000000-0000-4000-8000-000000000512', '.to_type()', FALSE, 4),
  -- Q13 (513): split-apply-combine
  ('60000000-0000-4000-8000-000000001049', '60000000-0000-4000-8000-000000000513', 'Split-apply-combine', TRUE,  1),
  ('60000000-0000-4000-8000-000000001050', '60000000-0000-4000-8000-000000000513', 'Map-reduce-shuffle', FALSE, 2),
  ('60000000-0000-4000-8000-000000001051', '60000000-0000-4000-8000-000000000513', 'Group-shift-merge', FALSE, 3),
  ('60000000-0000-4000-8000-000000001052', '60000000-0000-4000-8000-000000000513', 'Fold-unfold-flatten', FALSE, 4),
  -- Q14 (514): pivot_table
  ('60000000-0000-4000-8000-000000001053', '60000000-0000-4000-8000-000000000514', 'pivot_table()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001054', '60000000-0000-4000-8000-000000000514', 'groupby_frame()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001055', '60000000-0000-4000-8000-000000000514', 'summarize()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001056', '60000000-0000-4000-8000-000000000514', 'spread()', FALSE, 4),
  -- Q15 (515): agg with a list
  ('60000000-0000-4000-8000-000000001057', '60000000-0000-4000-8000-000000000515', 'Applies both mean and sum to each group', TRUE,  1),
  ('60000000-0000-4000-8000-000000001058', '60000000-0000-4000-8000-000000000515', 'Applies mean only', FALSE, 2),
  ('60000000-0000-4000-8000-000000001059', '60000000-0000-4000-8000-000000000515', 'Applies sum only', FALSE, 3),
  ('60000000-0000-4000-8000-000000001060', '60000000-0000-4000-8000-000000000515', 'Merges mean and sum into one column', FALSE, 4),
  -- Q16 (516): concat
  ('60000000-0000-4000-8000-000000001061', '60000000-0000-4000-8000-000000000516', 'pd.concat()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001062', '60000000-0000-4000-8000-000000000516', 'pd.stack()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001063', '60000000-0000-4000-8000-000000000516', 'pd.bind()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001064', '60000000-0000-4000-8000-000000000516', 'pd.append()', FALSE, 4),
  -- Q17 (517): on argument
  ('60000000-0000-4000-8000-000000001065', '60000000-0000-4000-8000-000000000517', 'on', TRUE,  1),
  ('60000000-0000-4000-8000-000000001066', '60000000-0000-4000-8000-000000000517', 'by', FALSE, 2),
  ('60000000-0000-4000-8000-000000001067', '60000000-0000-4000-8000-000000000517', 'match', FALSE, 3),
  ('60000000-0000-4000-8000-000000001068', '60000000-0000-4000-8000-000000000517', 'join_on', FALSE, 4),
  -- Q18 (518): inner merge
  ('60000000-0000-4000-8000-000000001069', '60000000-0000-4000-8000-000000000518', 'inner', TRUE,  1),
  ('60000000-0000-4000-8000-000000001070', '60000000-0000-4000-8000-000000000518', 'outer', FALSE, 2),
  ('60000000-0000-4000-8000-000000001071', '60000000-0000-4000-8000-000000000518', 'left', FALSE, 3),
  ('60000000-0000-4000-8000-000000001072', '60000000-0000-4000-8000-000000000518', 'right', FALSE, 4),
  -- Q19 (519): to_datetime
  ('60000000-0000-4000-8000-000000001073', '60000000-0000-4000-8000-000000000519', 'pd.to_datetime()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001074', '60000000-0000-4000-8000-000000000519', 'pd.as_date()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001075', '60000000-0000-4000-8000-000000000519', 'pd.date_parse()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001076', '60000000-0000-4000-8000-000000000519', 'pd.convert_date()', FALSE, 4),
  -- Q20 (520): dt accessor
  ('60000000-0000-4000-8000-000000001077', '60000000-0000-4000-8000-000000000520', '.dt', TRUE,  1),
  ('60000000-0000-4000-8000-000000001078', '60000000-0000-4000-8000-000000000520', '.time', FALSE, 2),
  ('60000000-0000-4000-8000-000000001079', '60000000-0000-4000-8000-000000000520', '.parts', FALSE, 3),
  ('60000000-0000-4000-8000-000000001080', '60000000-0000-4000-8000-000000000520', '.date', FALSE, 4),
  -- Q21 (521): resample
  ('60000000-0000-4000-8000-000000001081', '60000000-0000-4000-8000-000000000521', 'resample()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001082', '60000000-0000-4000-8000-000000000521', 'refactor()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001083', '60000000-0000-4000-8000-000000000521', 'reformat()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001084', '60000000-0000-4000-8000-000000000521', 'reindex()', FALSE, 4),
  -- Q22 (522): .plot method
  ('60000000-0000-4000-8000-000000001085', '60000000-0000-4000-8000-000000000522', '.plot()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001086', '60000000-0000-4000-8000-000000000522', '.chart()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001087', '60000000-0000-4000-8000-000000000522', '.graph()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001088', '60000000-0000-4000-8000-000000000522', '.draw()', FALSE, 4),
  -- Q23 (523): histogram
  ('60000000-0000-4000-8000-000000001089', '60000000-0000-4000-8000-000000000523', 'Histogram', TRUE,  1),
  ('60000000-0000-4000-8000-000000001090', '60000000-0000-4000-8000-000000000523', 'Pie chart', FALSE, 2),
  ('60000000-0000-4000-8000-000000001091', '60000000-0000-4000-8000-000000000523', 'Scatter plot', FALSE, 3),
  ('60000000-0000-4000-8000-000000001092', '60000000-0000-4000-8000-000000000523', 'Bar chart', FALSE, 4),
  -- Q24 (524): subplots
  ('60000000-0000-4000-8000-000000001093', '60000000-0000-4000-8000-000000000524', 'plt.subplots()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001094', '60000000-0000-4000-8000-000000000524', 'plt.figures()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001095', '60000000-0000-4000-8000-000000000524', 'plt.panels()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001096', '60000000-0000-4000-8000-000000000524', 'plt.arrays()', FALSE, 4),
  -- Q25 (525): final - read_csv
  ('60000000-0000-4000-8000-000000001097', '60000000-0000-4000-8000-000000000525', 'pd.read_csv()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001098', '60000000-0000-4000-8000-000000000525', 'pd.open_csv()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001099', '60000000-0000-4000-8000-000000000525', 'pd.load()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001100', '60000000-0000-4000-8000-000000000525', 'pd.fetch_csv()', FALSE, 4),
  -- Q26 (526): final - dropna
  ('60000000-0000-4000-8000-000000001101', '60000000-0000-4000-8000-000000000526', 'dropna()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001102', '60000000-0000-4000-8000-000000000526', 'clean_missing()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001103', '60000000-0000-4000-8000-000000000526', 'remove()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001104', '60000000-0000-4000-8000-000000000526', 'erase()', FALSE, 4),
  -- Q27 (527): final - pivot_table
  ('60000000-0000-4000-8000-000000001105', '60000000-0000-4000-8000-000000000527', 'pivot_table()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001106', '60000000-0000-4000-8000-000000000527', 'unpivot()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001107', '60000000-0000-4000-8000-000000000527', 'melt()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001108', '60000000-0000-4000-8000-000000000527', 'crosstab_stack()', FALSE, 4),
  -- Q28 (528): final - resample
  ('60000000-0000-4000-8000-000000001109', '60000000-0000-4000-8000-000000000528', 'resample()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001110', '60000000-0000-4000-8000-000000000528', 'reindex()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001111', '60000000-0000-4000-8000-000000000528', 'roll()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001112', '60000000-0000-4000-8000-000000000528', 'shift()', FALSE, 4),
  -- Q29 (529): final - DataFrame.plot
  ('60000000-0000-4000-8000-000000001113', '60000000-0000-4000-8000-000000000529', 'DataFrame.plot()', TRUE,  1),
  ('60000000-0000-4000-8000-000000001114', '60000000-0000-4000-8000-000000000529', 'DataFrame.chart()', FALSE, 2),
  ('60000000-0000-4000-8000-000000001115', '60000000-0000-4000-8000-000000000529', 'DataFrame.canvas()', FALSE, 3),
  ('60000000-0000-4000-8000-000000001116', '60000000-0000-4000-8000-000000000529', 'DataFrame.figure()', FALSE, 4)
ON CONFLICT (id) DO NOTHING;