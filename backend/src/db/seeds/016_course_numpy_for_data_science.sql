-- ============================================================================
-- SEED 016: Complete course — "NumPy for Data Science"
-- ----------------------------------------------------------------------------
-- Instructor : Anita Patel        (10000000-0000-4000-8000-000000000003)
-- Category   : Data Science       (20000000-0000-4000-8000-000000000003)
-- Level      : BEGINNER · Access : FREE · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 NumPy Fundamentals        → C1 Introduction & Creating Arrays · C2 Data Types & Reshaping
--   M2 Indexing & Operations     → C3 Indexing & Slicing · C4 Broadcasting & Vectorized Math
--   M3 Aggregation & Statistics  → C5 Aggregations & Statistics · C6 ufuncs & Performance
--   M4 Data Handling             → C7 Random & File I/O · C8 Missing Data & Advanced Techniques
--   M5 Capstone                  → C9 Capstone Setup · C10 Capstone Analysis
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
  '01000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000003',
  '20000000-0000-4000-8000-000000000003',
  'NumPy for Data Science',
  'numpy-for-data-science',
  'NumPy is the engine of Python data science. This beginner course takes you from your first ndarray to a complete real-world capstone: arrays, dtypes, indexing, broadcasting, vectorized math, aggregations, statistics, random numbers, file I/O, and missing-data handling — all in concise, industry-accurate lessons.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  14
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01000000-0000-4000-8000-000000000011', '01000000-0000-4000-8000-000000000001', 'Explain what ndarrays are and how they differ from Python lists.',      1),
  ('01000000-0000-4000-8000-000000000012', '01000000-0000-4000-8000-000000000001', 'Create, inspect, reshape, and convert NumPy arrays confidently.',       2),
  ('01000000-0000-4000-8000-000000000013', '01000000-0000-4000-8000-000000000001', 'Index, slice, and filter arrays with positions, conditions, and masks.', 3),
  ('01000000-0000-4000-8000-000000000014', '01000000-0000-4000-8000-000000000001', 'Perform vectorized math, broadcasting, and aggregations without loops.',  4),
  ('01000000-0000-4000-8000-000000000015', '01000000-0000-4000-8000-000000000001', 'Load data from files, clean missing values, and deliver a real capstone analysis.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01000000-0000-4000-8000-000000000101', '01000000-0000-4000-8000-000000000001', 1, 'NumPy Fundamentals',              'Understand what NumPy is, create arrays in every common way, and control dtypes and shapes.', 'PUBLISHED'),
  ('01000000-0000-4000-8000-000000000102', '01000000-0000-4000-8000-000000000001', 2, 'Indexing & Vectorized Operations', 'Select precisely from arrays, then do math without loops using broadcasting and ufuncs.',    'PUBLISHED'),
  ('01000000-0000-4000-8000-000000000103', '01000000-0000-4000-8000-000000000001', 3, 'Aggregation & Statistics',         'Summarize data with aggregations, measure spread, and harness universal functions.',         'PUBLISHED'),
  ('01000000-0000-4000-8000-000000000104', '01000000-0000-4000-8000-000000000001', 4, 'Random, File I/O & Advanced Data Work', 'Generate randomness, read real files, clean missing values, and apply advanced logic.',  'PUBLISHED'),
  ('01000000-0000-4000-8000-000000000105', '01000000-0000-4000-8000-000000000001', 5, 'Capstone: Sales Analysis Project', 'Load a real dataset, clean it, and deliver a clear analysis built entirely on NumPy.',      'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01000000-0000-4000-8000-000000000201', '01000000-0000-4000-8000-000000000101', 1, 'Introduction & Creating Arrays', 'What NumPy is, how to create arrays, and how they store data.',  'PUBLISHED'),
  ('01000000-0000-4000-8000-000000000202', '01000000-0000-4000-8000-000000000101', 2, 'Data Types & Reshaping',         'Control dtypes, inspect attributes, and reshape arrays to any layout.', 'PUBLISHED'),
  ('01000000-0000-4000-8000-000000000203', '01000000-0000-4000-8000-000000000102', 1, 'Indexing & Slicing',             'Reach into arrays with row and column indexes, slices, and masks.',     'PUBLISHED'),
  ('01000000-0000-4000-8000-000000000204', '01000000-0000-4000-8000-000000000102', 2, 'Broadcasting & Vectorized Math', 'Write loop-free math with broadcasting and universal functions.',        'PUBLISHED'),
  ('01000000-0000-4000-8000-000000000205', '01000000-0000-4000-8000-000000000103', 1, 'Aggregations & Statistics',      'Collapse arrays into totals, averages, and confident metrics.',          'PUBLISHED'),
  ('01000000-0000-4000-8000-000000000206', '01000000-0000-4000-8000-000000000103', 2, 'ufuncs & Performance',           'Go deeper with universal functions and learn what makes vectorized code fast.', 'PUBLISHED'),
  ('01000000-0000-4000-8000-000000000207', '01000000-0000-4000-8000-000000000104', 1, 'Random Numbers & File I/O',      'Generate reproducible randomness and read and write real datasets.',     'PUBLISHED'),
  ('01000000-0000-4000-8000-000000000208', '01000000-0000-4000-8000-000000000104', 2, 'Missing Data & Advanced Techniques', 'Clean NaNs and combine advanced filters for production data work.', 'PUBLISHED'),
  ('01000000-0000-4000-8000-000000000209', '01000000-0000-4000-8000-000000000105', 1, 'Capstone Setup',                 'Set up the dataset and the environment for the final project.',          'PUBLISHED'),
  ('01000000-0000-4000-8000-000000000210', '01000000-0000-4000-8000-000000000105', 2, 'Capstone Analysis',              'Run a complete exploratory analysis and present your findings.',         'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01000000-0000-4000-8000-000000000301', '01000000-0000-4000-8000-000000000201', 1, 'What is NumPy?',                    'Meet NumPy, the foundation of Python data science, and learn how ndarrays work.', 'TEXT',  'PUBLISHED', 'FREE', 10,  6),
  ('01000000-0000-4000-8000-000000000302', '01000000-0000-4000-8000-000000000201', 2, 'Creating Arrays',                    'Build arrays with np.array, np.zeros, np.ones, np.arange, and np.linspace.',     'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01000000-0000-4000-8000-000000000303', '01000000-0000-4000-8000-000000000201', 3, 'NumPy Fundamentals Quiz',            'Check your grasp of arrays and how to create them.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01000000-0000-4000-8000-000000000304', '01000000-0000-4000-8000-000000000202', 1, 'Data Types & dtype Control',         'Understand NumPy dtypes and convert between them with astype.',                  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01000000-0000-4000-8000-000000000305', '01000000-0000-4000-8000-000000000202', 2, 'Reshaping & Array Attributes',       'Inspect shape, ndim, and size, then reshape and flatten arrays.',                'TEXT',  'PUBLISHED', 'FREE', 10,  7),
  ('01000000-0000-4000-8000-000000000306', '01000000-0000-4000-8000-000000000202', 3, 'Arrays & Data Types Quiz',           'Test your knowledge of dtypes, shapes, and reshaping.',                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01000000-0000-4000-8000-000000000307', '01000000-0000-4000-8000-000000000203', 1, 'Indexing & Slicing',                 'Select elements and slices from one and two-dimensional arrays.',                'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01000000-0000-4000-8000-000000000308', '01000000-0000-4000-8000-000000000203', 2, 'Boolean Masks & Fancy Indexing',     'Filter arrays with conditions and select rows and columns by index arrays.',     'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01000000-0000-4000-8000-000000000309', '01000000-0000-4000-8000-000000000203', 3, 'Indexing & Slicing Quiz',            'Verify your indexing and slicing skills.',                                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01000000-0000-4000-8000-000000000310', '01000000-0000-4000-8000-000000000204', 1, 'Vectorized Math & Broadcasting',     'Apply math across arrays without loops and master the broadcasting rules.',      'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01000000-0000-4000-8000-000000000311', '01000000-0000-4000-8000-000000000204', 2, 'Universal Functions & Comparisons',  'Use ufuncs for element-wise math and create boolean filters.',                   'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01000000-0000-4000-8000-000000000312', '01000000-0000-4000-8000-000000000204', 3, 'Vectorized Math Quiz',               'Check your understanding of broadcasting and universal functions.',              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01000000-0000-4000-8000-000000000313', '01000000-0000-4000-8000-000000000205', 1, 'Aggregations: sum, mean, min, max',  'Summarize arrays along any axis with the classic aggregation functions.',       'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01000000-0000-4000-8000-000000000314', '01000000-0000-4000-8000-000000000205', 2, 'Descriptive Statistics & Correlation', 'Measure spread, percentiles, and correlations with NumPy.',                     'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01000000-0000-4000-8000-000000000315', '01000000-0000-4000-8000-000000000205', 3, 'Aggregations Quiz',                  'Verify your aggregation and statistics knowledge.',                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01000000-0000-4000-8000-000000000316', '01000000-0000-4000-8000-000000000206', 1, 'ufuncs, Math & Trig Functions',      'Explore more universal functions and their vectorized power.',                  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01000000-0000-4000-8000-000000000317', '01000000-0000-4000-8000-000000000206', 2, 'Vectorization Performance',          'See why vectorized NumPy dwarfs pure-Python loops and how to write fast code.',  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01000000-0000-4000-8000-000000000318', '01000000-0000-4000-8000-000000000206', 3, 'ufuncs & Performance Quiz',          'Test your ufunc and performance knowledge.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01000000-0000-4000-8000-000000000319', '01000000-0000-4000-8000-000000000207', 1, 'Random Number Generation',           'Generate reproducible random data with the modern default_rng API.',            'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01000000-0000-4000-8000-000000000320', '01000000-0000-4000-8000-000000000207', 2, 'File I/O: Loading & Saving Data',    'Load CSV and text files with loadtxt and genfromtxt, and save with savetxt.',   'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01000000-0000-4000-8000-000000000321', '01000000-0000-4000-8000-000000000207', 3, 'Random & File I/O Quiz',             'Check your random-number and file I/O skills.',                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01000000-0000-4000-8000-000000000322', '01000000-0000-4000-8000-000000000208', 1, 'Handling Missing Data',              'Detect and clean NaN values with np.isnan, np.where, and nan-aware functions.', 'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01000000-0000-4000-8000-000000000323', '01000000-0000-4000-8000-000000000208', 2, 'Advanced Techniques',                'Power up with np.where, np.select, and boolean logic for real-world cleaning.',  'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01000000-0000-4000-8000-000000000324', '01000000-0000-4000-8000-000000000208', 3, 'Advanced Techniques Quiz',           'Verify your missing-data and filtering skills.',                                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01000000-0000-4000-8000-000000000325', '01000000-0000-4000-8000-000000000209', 1, 'Capstone: Project Setup',            'Load and inspect a real sales dataset as you set up your capstone.',            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01000000-0000-4000-8000-000000000326', '01000000-0000-4000-8000-000000000210', 1, 'Capstone: Exploring the Data',       'Clean the dataset and explore trends with NumPy aggregations.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01000000-0000-4000-8000-000000000327', '01000000-0000-4000-8000-000000000210', 2, 'Capstone: Insights & Communication', 'Turn cleaned arrays into clear, shareable insights.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01000000-0000-4000-8000-000000000328', '01000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                   'Prove what you learned across the whole course.',                               'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01000000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01000000-0000-4000-8000-000000000401',
  '01000000-0000-4000-8000-000000000301',
  1,
  'What is NumPy?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is NumPy?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>What is NumPy?</h1>
  <p>NumPy is the fundamental package for scientific computing in Python. It adds the <strong>ndarray</strong>, a fast, memory-efficient container for homogeneous numeric data, plus the routines that operate on it.</p>
  <p>Almost every modern data stack — pandas, scikit-learn, SciPy, TensorFlow — is built on NumPy. Master the ndarray and you learn the shared language of Python data science.</p>
  <h2>From lists to arrays</h2>
  <p>A Python list stores object references; a NumPy array stores values in one contiguous block of memory. That single design choice buys two things:</p>
  <ul>
    <li><strong>Speed</strong> — operations run vectorized in compiled C, not in a per-element Python loop.</li>
    <li><strong>Memory</strong> — no pointer overhead, so ten million floats use exactly 80 MB as <span class="ic">float64</span>.</li>
  </ul>
  <h2>Your first array</h2>
  <pre class="code-block">import numpy as np

prices = np.array([3.99, 5.25, 12.50, 8.75])
print(prices)          # [3.99 5.25 12.5  8.75]
print(prices.ndim)     # 1
print(prices.shape)    # (4,)
print(prices.dtype)    # float64</pre>
  <div class="callout callout-tip">
    <strong>One dtype per array</strong>
    <p>Arrays hold a single data type. Mixing integers and floats promotes the array to <span class="ic">float64</span> automatically — predictable, but worth knowing.</p>
  </div>
  <h2>What you will build</h2>
  <p>Across five modules you will master arrays, dtypes, indexing, broadcasting, aggregations, randomness, and file I/O. You close the course with a complete sales-analysis capstone built entirely on NumPy.</p>
  <div class="callout callout-info">
    <strong>No prior NumPy needed</strong>
    <p>You only need basic Python. Every concept is introduced from zero and reinforced with runnable examples.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000402',
  '01000000-0000-4000-8000-000000000302',
  1,
  'Creating Arrays',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Creating Arrays</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Creating Arrays</h1>
  <p>NumPy provides a rich family of array-creation routines. You will reach for a different one depending on the shape and values you need.</p>
  <h2>From Python data</h2>
  <p>The most direct route is <span class="ic">np.array</span>. A flat list becomes a 1D array; a list of lists becomes a 2D matrix:</p>
  <pre class="code-block">import numpy as np

row = np.array([1, 2, 3])
grid = np.array([[1, 2, 3],
                 [4, 5, 6]])
print(grid.shape)   # (2, 3)</pre>
  <h2>Fixed shapes and values</h2>
  <p>When you already know the layout, the factories below are idiomatic:</p>
  <pre class="code-block">np.zeros((3, 2))       # all zeros, float64
np.ones((2, 2))        # all ones
np.full((3, 3), 7)     # every cell is 7
np.eye(3)              # 3x3 identity matrix</pre>
  <h2>Sequences of numbers</h2>
  <p>For evenly spaced ranges, use <span class="ic">np.arange</span> (step-based) or <span class="ic">np.linspace</span> (sample-based):</p>
  <pre class="code-block">np.arange(0, 10, 2)     # [0 2 4 6 8]
np.linspace(0, 1, 5)    # [0.   0.25 0.5  0.75 1. ]</pre>
  <table>
    <tr><th>Function</th><th>Result</th></tr>
    <tr><td>np.zeros(shape)</td><td>Shape filled with 0</td></tr>
    <tr><td>np.ones(shape)</td><td>Shape filled with 1</td></tr>
    <tr><td>np.full(shape, v)</td><td>Shape filled with v</td></tr>
    <tr><td>np.arange(start, stop, step)</td><td>Range by step</td></tr>
    <tr><td>np.linspace(a, b, n)</td><td>n samples a to b inclusive</td></tr>
    <tr><td>np.eye(n)</td><td>Identity matrix</td></tr>
  </table>
  <div class="callout">
    <strong>arange vs linspace</strong>
    <p><span class="ic">np.arange</span> is great for integers; for exact counts of floats prefer <span class="ic">np.linspace</span>, which includes the endpoint by default.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Shape argument as a tuple</strong>
    <p>Notice the parentheses: <span class="ic">np.zeros((2, 3))</span>. The shape itself is a tuple, so double up the parens.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000404',
  '01000000-0000-4000-8000-000000000304',
  1,
  'Data Types & dtype Control',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Data Types & dtype Control</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Data Types &amp; dtype Control</h1>
  <p>The <span class="ic">dtype</span> of an array declares the type of every element. It dictates precision, memory, and which operations are available.</p>
  <h2>Common dtypes</h2>
  <table>
    <tr><th>dtype</th><th>Meaning</th><th>Bytes / element</th></tr>
    <tr><td>int64</td><td>Signed 64-bit integer</td><td>8</td></tr>
    <tr><td>int32</td><td>Signed 32-bit integer</td><td>4</td></tr>
    <tr><td>float64</td><td>Double-precision float</td><td>8</td></tr>
    <tr><td>float32</td><td>Single-precision float</td><td>4</td></tr>
    <tr><td>bool</td><td>Boolean</td><td>1</td></tr>
    <tr><td>complex128</td><td>Complex number</td><td>16</td></tr>
  </table>
  <p>Read the current dtype with <span class="ic">arr.dtype</span> and the byte size of each element with <span class="ic">arr.itemsize</span>.</p>
  <h2>Converting between dtypes</h2>
  <p><span class="ic">astype</span> produces a new array in the requested dtype:</p>
  <pre class="code-block">prices = np.array([1.9, 2.7, 3.1])
rounded = prices.astype(np.int32)
print(rounded)      # [1 2 3]  — truncates toward zero</pre>
  <div class="callout">
    <strong>float → int truncates</strong>
    <p>Converting to integers truncates decimals toward zero. Round explicitly first if you need banker-style rounding.</p>
  </div>
  <h2>Why it matters</h2>
  <p>In big data, dtype is memory. Halving precision with <span class="ic">float32</span> halves RAM and speeds up vectorized math. Reserve <span class="ic">int64</span> for true identifiers only.</p>
  <div class="callout callout-tip">
    <strong>Implicit promotion</strong>
    <p>Mixing integers with floats in one array upgrades the result to <span class="ic">float64</span> automatically — make that promotion explicit with <span class="ic">astype</span> when you care about memory.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000405',
  '01000000-0000-4000-8000-000000000305',
  1,
  'Reshaping & Array Attributes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reshaping & Array Attributes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Reshaping &amp; Array Attributes</h1>
  <p>Every ndarray reports its structure through a small set of attributes you will use constantly.</p>
  <table>
    <tr><th>Attribute</th><th>Meaning</th></tr>
    <tr><td>arr.ndim</td><td>Number of dimensions</td></tr>
    <tr><td>arr.shape</td><td>Tuple of lengths per axis</td></tr>
    <tr><td>arr.size</td><td>Total number of elements</td></tr>
    <tr><td>arr.dtype</td><td>Data type of the elements</td></tr>
    <tr><td>arr.itemsize</td><td>Bytes per element</td></tr>
  </table>
  <h2>Reshape</h2>
  <p><span class="ic">reshape</span> gives the same data a new shape, as long as the element count stays constant:</p>
  <pre class="code-block">a = np.arange(12)
grid = a.reshape(3, 4)     # rows, columns
print(grid.shape)          # (3, 4)
print(grid.size)           # 12</pre>
  <div class="callout">
    <strong>Element count is fixed</strong>
    <p><span class="ic">reshape</span> only rearranges — it cannot add or remove values. <span class="ic">12.reshape(3, 5)</span> raises an error.</p>
  </div>
  <h2>Flatten and transpose</h2>
  <pre class="code-block">flat = grid.ravel()        # 1D view of the same memory
row = grid[0]              # first row
col = grid[:, 1]           # second column
swap = grid.T              # transposed view
print(swap.shape)          # (4, 3)</pre>
  <h2>Axis thinking</h2>
  <p>Utils like <span class="ic">-1</span> let NumPy infer a dimension: <span class="ic">grid.reshape(-1)</span> means "whatever it takes to flatten". You will lean on this pattern in the capstone.</p>
  <div class="callout callout-tip">
    <strong>reshaped views stay cheap</strong>
    <p><span class="ic">reshape</span>, <span class="ic">ravel</span>, and <span class="ic">T</span> usually return <em>views</em>, not copies. Changing a view changes the original — call <span class="ic">.copy()</span> when you need independence.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000407',
  '01000000-0000-4000-8000-000000000307',
  1,
  'Indexing & Slicing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Indexing & Slicing</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Indexing &amp; Slicing</h1>
  <p>Indexing is how you reach into arrays. NumPy follows zero-based Python indexing, with a powerful slice syntax on top.</p>
  <h2>1D indexing</h2>
  <pre class="code-block">a = np.array([10, 20, 30, 40, 50])
a[0]        # 10
a[-1]       # 50  — negative counts from the end
a[1:4]      # [20 30 40]  — stop is exclusive
a[::2]      # [10 30 50]  — every second element</pre>
  <h2>2D indexing</h2>
  <p>Use one index per axis, separated by commas: <span class="ic">arr[row, column]</span>.</p>
  <pre class="code-block">grid = np.array([[1, 2, 3],
                 [4, 5, 6],
                 [7, 8, 9]])

grid[0, 0]   # 1
grid[1, 2]   # 6
grid[0, :]   # first row  [1 2 3]
grid[:, 1]   # second column [2 5 8]
grid[:2, :2] # top-left 2x2 block</pre>
  <table>
    <tr><th>Syntax</th><th>Selects</th></tr>
    <tr><td>arr[i]</td><td>Single element (1D)</td></tr>
    <tr><td>arr[i, j]</td><td>Element at row i, column j</td></tr>
    <tr><td>arr[i, :]</td><td>Entire row i</td></tr>
    <tr><td>arr[:, j]</td><td>Entire column j</td></tr>
    <tr><td>arr[a:b, c:d]</td><td>Rectangular block</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Slices are views</strong>
    <p>Sliced sub-arrays share memory with the original. Modifying <span class="ic">grid[0]</span> also edits <span class="ic">grid</span>. Use <span class="ic">.copy()</span> for an independent array.</p>
  </div>
  <div class="callout callout-tip">
    <strong>One pair of brackets</strong>
    <p>Write <span class="ic">arr[1, 0]</span>, not <span class="ic">arr[1][0]</span>. The comma form is faster and reads as row-then-column, keeping your intent explicit.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000408',
  '01000000-0000-4000-8000-000000000308',
  1,
  'Boolean Masks & Fancy Indexing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Boolean Masks & Fancy Indexing</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Boolean Masks &amp; Fancy Indexing</h1>
  <p>Basic slicing selects by position. Boolean masks select by <em>condition</em>, and fancy indexing selects by a list of positions.</p>
  <h2>Boolean masks</h2>
  <p>Compare arrays to scalars and you get a boolean array, which doubles as a filter:</p>
  <pre class="code-block">prices = np.array([3.99, 5.25, 12.50, 8.75])

mask = prices &gt; 6
print(mask)          # [False False  True  True]
print(prices[mask])  # [12.5   8.75]</pre>
  <h2>Combining conditions</h2>
  <p>Combine masks with <span class="ic">&amp;</span> (and), <span class="ic">|</span> (or), and <span class="ic">~</span> (not) — and wrap each condition in parentheses:</p>
  <pre class="code-block">mid = prices[(prices &gt;= 5) &amp; (prices &lt;= 9)]
print(mid)   # [5.25 8.75]</pre>
  <div class="callout">
    <strong>Parentheses are mandatory</strong>
    <p><span class="ic">&amp;</span> binds tighter than comparison operators. Write <span class="ic">(prices &gt;= 5) &amp; (prices &lt;= 9)</span> or Python raises an ambiguity error.</p>
  </div>
  <h2>Fancy indexing</h2>
  <p>Pass an array of indices to pull specific rows or elements in any order:</p>
  <pre class="code-block">grid = np.arange(12).reshape(3, 4)
print(grid[[0, 2]])     # rows 0 and 2
print(grid[[0, 2], [1, 3]])   # (0,1) and (2,3)</pre>
  <div class="callout callout-tip">
    <strong>Filters build copies</strong>
    <p>Boolean masking and fancy indexing return <strong>copies</strong>, not views. That makes them safe to reshape and transform without touching the source data.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000410',
  '01000000-0000-4000-8000-000000000310',
  1,
  'Vectorized Math & Broadcasting',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vectorized Math & Broadcasting</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Vectorized Math &amp; Broadcasting</h1>
  <p>Arithmetic on NumPy arrays is <em>vectorized</em>: one operator applies to the whole array at once, just like a formula in a spreadsheet.</p>
  <h2>Element-wise arithmetic</h2>
  <pre class="code-block">prices = np.array([3.99, 5.25, 12.50])

prices + 1          # add to every element
prices * 2          # double every price
prices - prices     # subtract element-wise
prices ** 2         # square every element</pre>
  <div class="callout callout-tip">
    <strong>No loops needed</strong>
    <p>The expression <span class="ic">prices * 2</span> replaces a whole <span class="ic">for</span> loop in compiled code — faster and far easier to read.</p>
  </div>
  <h2>Broadcasting</h2>
  <p><strong>Broadcasting</strong> applies operations between arrays of <em>different</em> but compatible shapes by virtually stretching the smaller one.</p>
  <pre class="code-block">grid  = np.array([[1, 2, 3],
                  [4, 5, 6]])
row   = np.array([10, 20, 30])

print(grid + row)   # (2,3) + (3,) → each row shifted</pre>
  <table>
    <tr><th>Left shape</th><th>Right shape</th><th>Result</th></tr>
    <tr><td>(3,)</td><td>scalar</td><td>(3,)</td></tr>
    <tr><td>(3, 1)</td><td>(1, 4)</td><td>(3, 4)</td></tr>
    <tr><td>(2, 3)</td><td>(3,)</td><td>(2, 3)</td></tr>
  </table>
  <h2>The rule</h2>
  <p>NumPy aligns shapes from the trailing axis backwards. Dimensions are compatible when they match, or when either is 1 — that axis gets stretched.</p>
  <div class="callout">
    <strong>When broadcasting fails</strong>
    <p><span class="ic">(2, 3) + (4,)</span> raises a shape error: the trailing axes 3 and 4 differ and neither is 1. Reshape to <span class="ic">(4, 1)</span> when the intent is column-wise.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000411',
  '01000000-0000-4000-8000-000000000311',
  1,
  'Universal Functions & Comparisons',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Universal Functions & Comparisons</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Universal Functions &amp; Comparisons</h1>
  <p><strong>Universal functions</strong> (ufuncs) apply familiar math element-wise to entire arrays. Think of them as vectorized versions of <span class="ic">math</span>-module functions.</p>
  <h2>Math ufuncs</h2>
  <pre class="code-block">arr = np.array([1, 4, 9, 16])

np.sqrt(arr)     # [1. 2. 3. 4.]
np.exp(arr)      # e raised to each value
np.log(arr)      # natural log of each value
np.abs([-3, 4])  # [3 4]
np.power(arr, 2) # squares
np.clip(arr, 2, 9)   # clamp values to [2, 9]</pre>
  <h2>Comparison ufuncs and filters</h2>
  <p>Comparisons are ufuncs too — they return boolean arrays ready to index with:</p>
  <pre class="code-block">heights = np.array([170, 182, 165, 189])

mask = heights &gt;= 180
print(mask)              # [False  True False  True]
print(heights[mask])     # [182 189]</pre>
  <table>
    <tr><th>ufunc</th><th>Meaning</th></tr>
    <tr><td>np.add(a, b)</td><td>a + b</td></tr>
    <tr><td>np.subtract(a, b)</td><td>a − b</td></tr>
    <tr><td>np.multiply(a, b)</td><td>a × b</td></tr>
    <tr><td>np.divide(a, b)</td><td>a ÷ b</td></tr>
    <tr><td>np.power(a, b)</td><td>a to the b</td></tr>
    <tr><td>np.mod(a, b)</td><td>Remainder of a ÷ b</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Chain them freely</strong>
    <p>Ufuncs compose: <span class="ic">np.sqrt(np.abs(arr) + 1)</span> works element-wise at full speed. This is the engine behind most data pipelines.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000413',
  '01000000-0000-4000-8000-000000000313',
  1,
  'Aggregations: sum, mean, min, max',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aggregations: sum, mean, min, max</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Aggregations: sum, mean, min, max</h1>
  <p>Aggregations collapse an array down to summary values. They are the data-science answer to "what is this column telling me?"</p>
  <h2>Whole-array aggregates</h2>
  <pre class="code-block">sales = np.array([120, 340, 210, 460, 305])

sales.sum()      # 1435
sales.mean()     # 287.0
sales.min()      # 120
sales.max()      # 460
np.argmax(sales) # 3 — index of the max</pre>
  <h2>The axis parameter</h2>
  <p>On multi-dimensional arrays, <span class="ic">axis</span> picks which dimension collapses. <span class="ic">axis=0</span> collapses rows (down columns); <span class="ic">axis=1</span> collapses columns (across rows).</p>
  <pre class="code-block">grid = np.array([[10, 20, 30],
                 [40, 50, 60]])

grid.sum(axis=0)   # [50 70 90] — one total per column
grid.sum(axis=1)   # [60 150]   — one total per row</pre>
  <div class="callout-info"><strong>Note</strong>
  <p>Keep <span class="ic">keepdims=True</span> when you need the result to keep its shape, e.g. <span class="ic">grid.sum(axis=1, keepdims=True)</span> returns a <span class="ic">(2, 1)</span> array.</p></div>
  <h2>Cumulative views</h2>
  <pre class="code-block">np.cumsum(sales)   # running totals, same shape
# array([120, 460, 670, 1130, 1435])</pre>
  <table>
    <tr><th>Function</th><th>Result</th></tr>
    <tr><td>np.sum</td><td>Sum of elements</td></tr>
    <tr><td>np.mean</td><td>Arithmetic average</td></tr>
    <tr><td>np.min / np.max</td><td>Smallest / largest</td></tr>
    <tr><td>np.argmin / np.argmax</td><td>Index of min / max</td></tr>
    <tr><td>np.cumsum</td><td>Cumulative sum</td></tr>
    <tr><td>np.prod</td><td>Product of elements</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Aggregations respect axis</strong>
    <p>Almost every reduce — <span class="ic">sum</span>, <span class="ic">mean</span>, <span class="ic">min</span>, <span class="ic">max</span>, <span class="ic">std</span> — shares this <span class="ic">axis</span> contract. Master it once, reuse it everywhere.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000414',
  '01000000-0000-4000-8000-000000000314',
  1,
  'Descriptive Statistics & Correlation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Descriptive Statistics & Correlation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Descriptive Statistics &amp; Correlation</h1>
  <p>Beyond the mean, real analysis needs spread: how far values scatter around the center, and how variables move together.</p>
  <h2>Spread and percentiles</h2>
  <pre class="code-block">scores = np.array([64, 72, 78, 85, 90, 95])

scores.std()                    # 10.6 — standard deviation
scores.var()                    # variance
np.median(scores)               # 81.5
np.percentile(scores, 25)       # first quartile
np.percentile(scores, [25, 50, 75])  # box-plot cuts</pre>
  <div class="callout">
    <strong>Sample vs population</strong>
    <p>By default NumPy uses <span class="ic">ddof=0</span> (population). For a statistical sample of a larger population, pass <span class="ic">ddof=1</span>.</p>
  </div>
  <h2>Correlation and covariance</h2>
  <p><span class="ic">np.corrcoef</span> returns a matrix; the off-diagonal entry is the correlation between two variables:</p>
  <pre class="code-block">ads   = np.array([10, 20, 30, 40, 50])
sales = np.array([95, 130, 170, 210, 260])

np.corrcoef(ads, sales)[0, 1]   # ≈ 0.996</pre>
  <table>
    <tr><th>Value</th><th>Meaning</th></tr>
    <tr><td>+1.0</td><td>Perfect positive relationship</td></tr>
    <tr><td>0</td><td>No linear relationship</td></tr>
    <tr><td>−1.0</td><td>Perfect negative relationship</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Correlation is not causality</strong>
    <p>A high correlation tells you two columns move together — it does not prove one causes the other. Always pair the number with domain judgment.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000416',
  '01000000-0000-4000-8000-000000000316',
  1,
  'ufuncs, Math & Trig Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ufuncs, Math & Trig Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>ufuncs, Math &amp; Trig Functions</h1>
  <p>Universal functions cover far more than arithmetic — rounding, remainder, sign, exponential, and trigonometry all arrive element-wise.</p>
  <h2>Rounding, remainder and sign</h2>
  <pre class="code-block">vals = np.array([2.3, -1.8, 4.0, 7.5])

np.floor(vals)     # [ 2. -2.  4.  7.]
np.ceil(vals)      # [ 3. -1.  4.  8.]
np.round(vals)     # [ 2. -2.  4.  8.]
np.trunc(vals)     # [ 2. -1.  4.  7.]
np.mod(vals, 2)    # [0.3 0.2 0.  1.5]
np.sign(vals)      # [ 1. -1.  1.  1.]</pre>
  <h2>Exponential and logarithmic</h2>
  <pre class="code-block">np.exp(np.array([0, 1, 2]))      # [1.  2.72  7.39]
np.log(np.array([1, np.e, 10]))  # [0. 1. 2.30]
np.log2(np.array([1, 2, 8]))     # [0. 1. 3.]
np.square(np.array([2, 3]))      # [4 9]</pre>
  <div class="callout callout-tip">
    <strong>The same function, everywhere</strong>
    <p><span class="ic">np.log</span>, <span class="ic">np.exp</span>, and friends accept scalars, 1D, or N-D input. Write the formula once — the shape never changes the code.</p>
  </div>
  <h2>Trigonometry</h2>
  <p>Angles are in radians; convert with <span class="ic">np.deg2rad</span>:</p>
  <pre class="code-block">deg = np.array([0, 90, 180])
rad = np.deg2rad(deg)
np.sin(rad)    # [0. 1. near zero]
np.cos(rad)    # [1. near zero -1.]</pre>
  <h2>Reductions inside ufuncs</h2>
  <pre class="code-block">np.add.reduce(np.array([1, 2, 3, 4]))   # 10
np.multiply.accumulate(np.array([1, 2, 3]))  # [1 2 6]</pre>
  <div class="callout-info"><strong>Note</strong>
  <p><span class="ic">reduce</span> and <span class="ic">accumulate</span> are built into most ufuncs, giving you elegant one-liners for running products and sums.</p></div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000417',
  '01000000-0000-4000-8000-000000000317',
  1,
  'Vectorization Performance',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vectorization Performance</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Vectorization Performance</h1>
  <p>Why is NumPy so much faster than a plain Python loop? Vectorized code moves the loop into compiled C and skips Python's per-operation overhead.</p>
  <h2>Same math, different speed</h2>
  <pre class="code-block">import numpy as np
import time

data = np.random.default_rng(7).normal(0, 1, 1_000_000)

# Loop version
t0 = time.perf_counter()
total = 0
for x in data:
    total += x
t_loop = time.perf_counter() - t0

# Vectorized version
t0 = time.perf_counter()
vec_total = data.sum()
t_vec = time.perf_counter() - t0

print(t_loop, t_vec)   # loop is typically 50-100x slower</pre>
  <div class="callout">
    <strong>Why loops lag</strong>
    <p>Each iteration pays Python's dynamic-dispatch and type-checking costs. NumPy performs the same addition once, in C, across the whole array.</p>
  </div>
  <h2>Write vectorized code by habit</h2>
  <ul>
    <li>Replace per-element loops with whole-array expressions: <span class="ic">arr * 2</span>, not a <span class="ic">for</span>.</li>
    <li>Use masks for filtering instead of condition branches.</li>
    <li>Prefer <span class="ic">np.sum</span> over manual accumulation.</li>
  </ul>
  <h2>Small data is different</h2>
  <p>For tiny arrays, Python overhead of the call itself can win. Profile with <span class="ic">timeit</span> before optimizing — the win appears at scale, where real data lives.</p>
  <div class="callout callout-tip">
    <strong>Measure, then trust</strong>
    <p>Use <span class="ic">time.perf_counter</span> or <span class="ic">%timeit</span> to confirm gains instead of guessing. Clean vectorized code is usually the readable code too.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000419',
  '01000000-0000-4000-8000-000000000319',
  1,
  'Random Number Generation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Random Number Generation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Random Number Generation</h1>
  <p>Modern NumPy recommends the <span class="ic">Generator</span> class, created with <span class="ic">np.random.default_rng()</span>. It is faster, more flexible, and easier to make reproducible than the legacy <span class="ic">np.random.seed</span> style.</p>
  <h2>Seeds make randomness reproducible</h2>
  <p>Pass an integer seed and the same sequence is produced every run — essential for tests, analysis, and presenting results:</p>
  <pre class="code-block">rng = np.random.default_rng(42)

print(rng.random(3))    # floats in [0, 1)
print(rng.integers(1, 7, size=3))   # dice rolls
print(rng.normal(0, 1, size=3))     # standard normal</pre>
  <div class="callout callout-tip">
    <strong>Always seed in analysis</strong>
    <p>Seeding makes your pipeline reproducible. Without it, every re-run draws a new sample and your "stable" result silently changes.</p>
  </div>
  <h2>Common Generator methods</h2>
  <table>
    <tr><th>Method</th><th>Produces</th></tr>
    <tr><td>rng.random(n)</td><td>Uniform floats in [0, 1)</td></tr>
    <tr><td>rng.integers(lo, hi, size)</td><td>Uniform integers (hi exclusive)</td></tr>
    <tr><td>rng.normal(mu, sd, size)</td><td>Normal draws</td></tr>
    <tr><td>rng.uniform(lo, hi, size)</td><td>Uniform floats in [lo, hi)</td></tr>
    <tr><td>rng.choice(values, size)</td><td>Random picks from an array</td></tr>
    <tr><td>rng.permutation(values)</td><td>Shuffled copy of an array</td></tr>
  </table>
  <h2>Sampling and shuffling</h2>
  <pre class="code-block">items = np.array(["A", "B", "C", "D"])
rng.choice(items, size=8, replace=True)   # with repeats
rng.permutation(items)                    # one shuffle</pre>
  <div class="callout-info"><strong>Note</strong>
  <p>The legacy <span class="ic">np.random.seed</span> and <span class="ic">np.random.rand</span> still function, but the Generator API is the current recommendation for new code.</p></div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000420',
  '01000000-0000-4000-8000-000000000320',
  1,
  'File I/O: Loading & Saving Data',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>File I/O: Loading & Saving Data</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>File I/O: Loading &amp; Saving Data</h1>
  <p>Real projects read data from files. NumPy reads delimited text with <span class="ic">loadtxt</span> and writes it back with <span class="ic">savetxt</span>.</p>
  <h2>Reading CSV-like files</h2>
  <pre class="code-block">data = np.loadtxt("sales.csv", delimiter=",",
                  skiprows=1)   # skip header line
print(data.shape, data.dtype)</pre>
  <p><span class="ic">genfromtxt</span> is the more tolerant cousin — it survives missing values and mixed content:</p>
  <pre class="code-block">data = np.genfromtxt("sales.csv", delimiter=",",
                     skip_header=1,
                     missing_values="NA",
                     filling_values=0)</pre>
  <div class="callout">
    <strong>Text I/O is slow but robust</strong>
    <p>Reading text requires parsing. For large numeric datasets, aim for a binary format (below) once the data is clean.</p>
  </div>
  <h2>Writing arrays</h2>
  <pre class="code-block">np.savetxt("out.csv", data, delimiter=",", fmt="%.2f")</pre>
  <h2>Binary formats: .npy and .npz</h2>
  <pre class="code-block">np.save("matrix.npy", data)     # fast, exact
loaded = np.load("matrix.npy")

np.savez("bundle.npz", a=data, b=grid)   # many arrays
archive = np.load("bundle.npz")
archive["a"], archive["b"]</pre>
  <div class="callout callout-tip">
    <strong>Choose by use-case</strong>
    <p>Text (<span class="ic">CSV</span>) for sharing with other tools; <span class="ic">.npy</span> for fast, lossless reload inside Python; <span class="ic">.npz</span> when one archive must carry several arrays.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000422',
  '01000000-0000-4000-8000-000000000322',
  1,
  'Handling Missing Data',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Handling Missing Data</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Handling Missing Data</h1>
  <p>Real-world data arrives with gaps. NumPy represents them with <span class="ic">NaN</span> (not-a-number) in float arrays.</p>
  <h2>Detecting NaN</h2>
  <p>NaN never equals itself, so compare with <span class="ic">np.isnan</span>, never with <span class="ic">==</span>:</p>
  <pre class="code-block">arr = np.array([1.0, np.nan, 3.0, np.nan])

np.isnan(arr)         # [False  True False  True]
arr[np.isnan(arr)] = 0   # replace with a fill value
np.nan_to_num(arr)    # NaN → 0, inf → big numbers</pre>
  <div class="callout">
    <strong>NaN is sticky</strong>
    <p>Ordinary math on NaN returns NaN — <span class="ic">arr.sum()</span> becomes NaN once a single value is missing. Detect before you aggregate.</p>
  </div>
  <h2>Nan-aware aggregations</h2>
  <pre class="code-block">np.nanmean(arr)     # mean, ignoring NaN
np.nansum(arr)      # sum, ignoring NaN
np.nanmax(arr)      # max, ignoring NaN
np.nanstd(arr)      # standard deviation, ignoring NaN</pre>
  <h2>Filter or fill?</h2>
  <ul>
    <li><strong>Drop</strong> the row if few values are missing and the loss is affordable.</li>
    <li><strong>Fill</strong> with a sensible constant (0, mean, median) when you need every record.</li>
  </ul>
  <pre class="code-block">clean = arr[~np.isnan(col)]      # keep only valid rows</pre>
  <div class="callout callout-tip">
    <strong>Document the choice</strong>
    <p>Whatever you choose — drop, zero-fill, or mean-fill — record it. "The capstone filled missing prices with the column mean" is a decision stakeholders can audit.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000423',
  '01000000-0000-4000-8000-000000000323',
  1,
  'Advanced Techniques',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Advanced Techniques</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Advanced Techniques</h1>
  <p>Two higher-order tools appear constantly in real pipelines: <span class="ic">np.where</span> for element-wise selection and <span class="ic">np.select</span> for multi-condition logic.</p>
  <h2>np.where — pick by condition</h2>
  <pre class="code-block">prices = np.array([3.99, 15.50, 8.25])

labels = np.where(prices &gt;= 10, "premium", "standard")
print(labels)   # ['standard' 'premium' 'standard']</pre>
  <p>The values can be scalars or arrays, giving a fast vectorized replacement for <span class="ic">if</span>-chains.</p>
  <h2>np.select — many conditions</h2>
  <pre class="code-block">scores = np.array([58, 72, 91, 44])

bins = np.select(
    [scores &gt;= 90, scores &gt;= 70, scores &gt;= 50],
    ["A", "B", "C"],
    default="F")
print(bins)   # ['C' 'B' 'A' 'F']</pre>
  <h2>Combining advanced filters</h2>
  <pre class="code-block">units = np.array([10, 50, 5, 90, 30])
valid = (units &gt; 0) &amp; (units &lt; 100)
print(units[valid])   # [10 50 5 90 30] filtered</pre>
  <h2>Membership and uniqueness</h2>
  <pre class="code-block">np.isin(np.array([3, 7, 11]), [3, 11])   # [ True False  True]
np.unique(np.array([2, 2, 1, 3, 3]))     # [1 2 3]
np.unique(np.array([2, 2, 1, 3, 3]), return_counts=True)</pre>
  <div class="callout callout-tip">
    <strong>Vectorize your branches</strong>
    <p>Where you reach for <span class="ic">if</span>/<span class="ic">elif</span> on array values, prefer <span class="ic">np.where</span> or <span class="ic">np.select</span>. The logic stays readable and the speed stays vectorized.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000425',
  '01000000-0000-4000-8000-000000000325',
  1,
  'Capstone: Project Setup',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Project Setup</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Capstone: Project Setup</h1>
  <p>Your final project analyzes a retail <strong>sales dataset</strong> with everything you have learned. The dataset is a CSV of monthly store sales.</p>
  <h2>Columns you will work with</h2>
  <table>
    <tr><th>Column</th><th>Meaning</th></tr>
    <tr><td>month</td><td>Month number 1-12</td></tr>
    <tr><td>store_id</td><td>Store identifier</td></tr>
    <tr><td>region</td><td>Region code</td></tr>
    <tr><td>units</td><td>Units sold</td></tr>
    <tr><td>unit_price</td><td>Price per unit</td></tr>
  </table>
  <h2>Load and inspect</h2>
  <pre class="code-block">import numpy as np

data = np.genfromtxt("sales.csv", delimiter=",",
                     skip_header=1)
print(data.shape)       # (rows, 5)
print(data[0])          # first record
print(data.dtype)</pre>
  <div class="callout">
    <strong>Plan before you code</strong>
    <p>Write three questions before exploring: What is the total revenue? Which region sells most? How does volume vary by month?</p>
  </div>
  <h2>Your workflow</h2>
  <ol>
    <li>Inspect shape, dtype, and a preview of the data.</li>
    <li>Detect and handle missing or impossible values.</li>
    <li>Compute aggregation answers to your three questions.</li>
    <li>Summarize findings clearly in the final lesson.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Keep it reproducible</strong>
    <p>Structure your work as small functions with a seeded RNG where randomness appears. Anyone should be able to rerun your notebook and get identical numbers.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000426',
  '01000000-0000-4000-8000-000000000326',
  1,
  'Capstone: Exploring the Data',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Exploring the Data</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Capstone: Exploring the Data</h1>
  <p>Now the learning pays off — clean the data and answer your three questions with pure NumPy.</p>
  <h2>1. Clean</h2>
  <pre class="code-block">units = data[:, 3]
price = data[:, 4]
ok = (units &gt; 0) &amp; (price &gt; 0) &amp; (~np.isnan(units)) &amp; (~np.isnan(price))
clean = data[ok]</pre>
  <h2>2. Compute revenue</h2>
  <pre class="code-block">revenue = clean[:, 3] * clean[:, 4]
total = revenue.sum()
print("Total revenue:", total)</pre>
  <h2>3. Answer your questions</h2>
  <pre class="code-block"># Best region by revenue
regions = np.unique(clean[:, 2])
best_region = regions[np.argmax([
    revenue[clean[:, 2] == r].sum() for r in regions])]

# Monthly volume trend
months = clean[:, 0]
monthly = np.array([clean[months == m, 3].sum()
                    for m in np.unique(months)])</pre>
  <table>
    <tr><th>Metric</th><th>Expression</th></tr>
    <tr><td>Total revenue</td><td>sum of units * price</td></tr>
    <tr><td>Mean order value</td><td>revenue.mean()</td></tr>
    <tr><td>Best region</td><td>argmax of per-region revenue</td></tr>
    <tr><td>Peak month</td><td>argmax of monthly volume</td></tr>
  </table>
  <div class="callout">
    <strong>Validate before you trust</strong>
    <p>Sanity-check counts: does <span class="ic">clean.shape</span> match what you expect after filtering? An unexpected drop usually means your mask was too aggressive.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Keep the answers, not just code</strong>
    <p>Every question deserves a headline: "Region 2 generated the most revenue in Q3." Numbers without context are just noise.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01000000-0000-4000-8000-000000000427',
  '01000000-0000-4000-8000-000000000327',
  1,
  'Capstone: Insights & Communication',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Insights & Communication</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #14b8a6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ccfbf1; border-left: 4px solid #14b8a6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Capstone: Insights &amp; Communication</h1>
  <p>An analysis is only as good as its delivery. This lesson turns your exploration into a concise, defensible summary.</p>
  <h2>Prepare a summary table</h2>
  <pre class="code-block">stats = np.array([
    revenue.mean(),        # mean revenue
    revenue.std(),         # spread
    revenue.min(),         # worst month
    revenue.max(),         # best month
    revenue.sum(),         # total
])
labels = np.array(["mean", "std", "min", "max", "total"])</pre>
  <h2>Export for sharing</h2>
  <pre class="code-block">np.savetxt("summary.csv",
           np.column_stack([labels, np.round(stats, 2)]),
           delimiter=",", fmt="%s")</pre>
  <h2>Structure your findings</h2>
  <ul>
    <li><strong>Headline</strong> — one sentence with the core answer.</li>
    <li><strong>Evidence</strong> — the exact numbers from your analysis.</li>
    <li><strong>Assumptions</strong> — how you treated missing values and outliers.</li>
    <li><strong>Next steps</strong> — one concrete recommendation.</li>
  </ul>
  <div class="callout callout-info">
    <strong>State your cleaning decisions</strong>
    <p>Mention that missing prices were dropped (or filled) and why. Reproducible analysis survives review; magic numbers do not.</p>
  </div>
  <table>
    <tr><th>Component</th><th>Example</th></tr>
    <tr><td>Headline</td><td>Region 2 leads with 38% of revenue</td></tr>
    <tr><td>Evidence</td><td>total = 1,243,500 currency units</td></tr>
    <tr><td>Assumption</td><td>Rows with price = 0 excluded</td></tr>
    <tr><td>Next step</td><td>Investigate top stores for restocking</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Numbers need units and size</strong>
    <p>Report thousands separators, the currency, and the sample size. "Sales doubled" means little without "from 1,210 to 2,440 across 90 stores."</p>
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
  ('01000000-0000-4000-8000-000000000501', '01000000-0000-4000-8000-000000000303',
   'What analysis-ready data structure does NumPy introduce?',
   'The ndarray is an n-dimensional homogeneous array.', 1),
  ('01000000-0000-4000-8000-000000000502', '01000000-0000-4000-8000-000000000303',
   'How do you import NumPy following the standard convention?',
   'import numpy as np is the widely used convention.', 2),
  ('01000000-0000-4000-8000-000000000503', '01000000-0000-4000-8000-000000000303',
   'Which attribute reports the number of dimensions of an ndarray?',
   'ndim stores the number of axes.', 3),
  ('01000000-0000-4000-8000-000000000504', '01000000-0000-4000-8000-000000000306',
   'Which function builds an array of a fixed value with a given shape?',
   'np.full fills every position with the requested value.', 1),
  ('01000000-0000-4000-8000-000000000505', '01000000-0000-4000-8000-000000000306',
   'What does arr.shape return?',
   'shape is a tuple listing each axis length.', 2),
  ('01000000-0000-4000-8000-000000000506', '01000000-0000-4000-8000-000000000306',
   'Which method converts an array to a different data type?',
   'astype performs a dtype conversion on a new array.', 3),
  ('01000000-0000-4000-8000-000000000507', '01000000-0000-4000-8000-000000000309',
   'In NumPy, what does arr[2:5] select on a 1D array?',
   'Slicing stops before the end index, so it covers indices 2 through 4.', 1),
  ('01000000-0000-4000-8000-000000000508', '01000000-0000-4000-8000-000000000309',
   'What does arr[-1] return in a NumPy array?',
   'Negative indices count from the end, so -1 is the last element.', 2),
  ('01000000-0000-4000-8000-000000000509', '01000000-0000-4000-8000-000000000309',
   'On a 2D array, what does arr[1, 2] select?',
   'The first index is the row and the second is the column.', 3),
  ('01000000-0000-4000-8000-000000000510', '01000000-0000-4000-8000-000000000312',
   'What is broadcasting in NumPy?',
   'Broadcasting virtualizes shape matches for arrays of different but compatible shapes.', 1),
  ('01000000-0000-4000-8000-000000000511', '01000000-0000-4000-8000-000000000312',
   'What is a universal function (ufunc)?',
   'Ufuncs operate element-wise over entire arrays.', 2),
  ('01000000-0000-4000-8000-000000000512', '01000000-0000-4000-8000-000000000312',
   'Which expression is vectorized and avoids a Python loop?',
   'arr + 1 applies the addition to every element at once.', 3),
  ('01000000-0000-4000-8000-000000000513', '01000000-0000-4000-8000-000000000315',
   'On a 2D array, what does arr.sum(axis=0) produce?',
   'axis=0 collapses rows, leaving one sum per column.', 1),
  ('01000000-0000-4000-8000-000000000514', '01000000-0000-4000-8000-000000000315',
   'Which NumPy function returns the index of the maximum value?',
   'np.argmax returns the position of the largest value.', 2),
  ('01000000-0000-4000-8000-000000000515', '01000000-0000-4000-8000-000000000315',
   'What does np.mean() compute?',
   'mean is the arithmetic average of the elements.', 3),
  ('01000000-0000-4000-8000-000000000516', '01000000-0000-4000-8000-000000000318',
   'Why is vectorized code faster than loops on large arrays?',
   'The operation runs in compiled C without per-element Python overhead.', 1),
  ('01000000-0000-4000-8000-000000000517', '01000000-0000-4000-8000-000000000318',
   'Which ufunc computes the square root element-wise?',
   'np.sqrt is the element-wise square root ufunc.', 2),
  ('01000000-0000-4000-8000-000000000518', '01000000-0000-4000-8000-000000000318',
   'What does np.log(arr) compute?',
   'np.log returns the natural logarithm of each element.', 3),
  ('01000000-0000-4000-8000-000000000519', '01000000-0000-4000-8000-000000000321',
   'Which API is recommended for generating random numbers in modern NumPy?',
   'np.random.default_rng gives the modern Generator API.', 1),
  ('01000000-0000-4000-8000-000000000520', '01000000-0000-4000-8000-000000000321',
   'Which function loads a delimited text file into a NumPy array?',
   'np.loadtxt parses text data into an ndarray.', 2),
  ('01000000-0000-4000-8000-000000000521', '01000000-0000-4000-8000-000000000321',
   'What is the purpose of passing a seed to the random generator?',
   'A fixed seed makes the random sequence reproducible.', 3),
  ('01000000-0000-4000-8000-000000000522', '01000000-0000-4000-8000-000000000324',
   'What does np.where(condition, a, b) return?',
   'It picks a where the condition is True and b elsewhere.', 1),
  ('01000000-0000-4000-8000-000000000523', '01000000-0000-4000-8000-000000000324',
   'Which function converts NaN values in a float array into numbers?',
   'np.nan_to_num replaces NaN and infinite values with finite numbers.', 2),
  ('01000000-0000-4000-8000-000000000524', '01000000-0000-4000-8000-000000000324',
   'What does np.ravel() do to a multi-dimensional array?',
   'ravel flattens the array into one dimension.', 3),
  ('01000000-0000-4000-8000-000000000525', '01000000-0000-4000-8000-000000000328',
   'Which type most directly represents a multidimensional numeric array in NumPy?',
   'An ndarray is the core array object.', 1),
  ('01000000-0000-4000-8000-000000000526', '01000000-0000-4000-8000-000000000328',
   'What is a key benefit of broadcasting?',
   'Operations combine arrays of compatible shapes without explicit loops.', 2),
  ('01000000-0000-4000-8000-000000000527', '01000000-0000-4000-8000-000000000328',
   'How do you compute the standard deviation of an array?',
   'np.std returns the standard deviation of the values.', 3),
  ('01000000-0000-4000-8000-000000000528', '01000000-0000-4000-8000-000000000328',
   'Which binary format preserves an array efficiently for reloading?',
   'The .npy file written by np.save is fast and lossless.', 4),
  ('01000000-0000-4000-8000-000000000529', '01000000-0000-4000-8000-000000000328',
   'What is the final step of the capstone workflow?',
   'Communicate the findings with evidence and assumptions.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): ndarray
  ('01000000-0000-4000-8000-000000001001', '01000000-0000-4000-8000-000000000501', 'The ndarray', TRUE,  1),
  ('01000000-0000-4000-8000-000000001002', '01000000-0000-4000-8000-000000000501', 'A Python dict', FALSE, 2),
  ('01000000-0000-4000-8000-000000001003', '01000000-0000-4000-8000-000000000501', 'A pandas DataFrame', FALSE, 3),
  ('01000000-0000-4000-8000-000000001004', '01000000-0000-4000-8000-000000000501', 'A JSON string', FALSE, 4),
  -- Q1 (501) q2: import convention
  ('01000000-0000-4000-8000-000000001005', '01000000-0000-4000-8000-000000000502', 'import numpy as np', TRUE,  1),
  ('01000000-0000-4000-8000-000000001006', '01000000-0000-4000-8000-000000000502', 'import numpy', FALSE, 2),
  ('01000000-0000-4000-8000-000000001007', '01000000-0000-4000-8000-000000000502', 'from numpy import all', FALSE, 3),
  ('01000000-0000-4000-8000-000000001008', '01000000-0000-4000-8000-000000000502', 'include numpy', FALSE, 4),
  -- Q1 (501) q3: ndim
  ('01000000-0000-4000-8000-000000001009', '01000000-0000-4000-8000-000000000503', 'arr.ndim', TRUE,  1),
  ('01000000-0000-4000-8000-000000001010', '01000000-0000-4000-8000-000000000503', 'arr.shape', FALSE, 2),
  ('01000000-0000-4000-8000-000000001011', '01000000-0000-4000-8000-000000000503', 'arr.size', FALSE, 3),
  ('01000000-0000-4000-8000-000000001012', '01000000-0000-4000-8000-000000000503', 'arr.dtype', FALSE, 4),
  -- Q2 (504): np.full
  ('01000000-0000-4000-8000-000000001013', '01000000-0000-4000-8000-000000000504', 'np.full(shape, value)', TRUE,  1),
  ('01000000-0000-4000-8000-000000001014', '01000000-0000-4000-8000-000000000504', 'np.arange(shape)', FALSE, 2),
  ('01000000-0000-4000-8000-000000001015', '01000000-0000-4000-8000-000000000504', 'np.linspace(shape)', FALSE, 3),
  ('01000000-0000-4000-8000-000000001016', '01000000-0000-4000-8000-000000000504', 'np.copy(shape)', FALSE, 4),
  -- Q2 (504) q2: shape attribute
  ('01000000-0000-4000-8000-000000001017', '01000000-0000-4000-8000-000000000505', 'A tuple of axis lengths', TRUE,  1),
  ('01000000-0000-4000-8000-000000001018', '01000000-0000-4000-8000-000000000505', 'The total element count', FALSE, 2),
  ('01000000-0000-4000-8000-000000001019', '01000000-0000-4000-8000-000000000505', 'The data type of elements', FALSE, 3),
  ('01000000-0000-4000-8000-000000001020', '01000000-0000-4000-8000-000000000505', 'A list of all values', FALSE, 4),
  -- Q2 (504) q3: astype
  ('01000000-0000-4000-8000-000000001021', '01000000-0000-4000-8000-000000000506', 'arr.astype(new_dtype)', TRUE,  1),
  ('01000000-0000-4000-8000-000000001022', '01000000-0000-4000-8000-000000000506', 'arr.reshape(new_shape)', FALSE, 2),
  ('01000000-0000-4000-8000-000000001023', '01000000-0000-4000-8000-000000000506', 'arr.flatten()', FALSE, 3),
  ('01000000-0000-4000-8000-000000001024', '01000000-0000-4000-8000-000000000506', 'arr.copy()', FALSE, 4),
  -- Q3 (507): slicing
  ('01000000-0000-4000-8000-000000001025', '01000000-0000-4000-8000-000000000507', 'Indices 2, 3, 4', TRUE,  1),
  ('01000000-0000-4000-8000-000000001026', '01000000-0000-4000-8000-000000000507', 'Indices 2 and 5', FALSE, 2),
  ('01000000-0000-4000-8000-000000001027', '01000000-0000-4000-8000-000000000507', 'Everything from index 5', FALSE, 3),
  ('01000000-0000-4000-8000-000000001028', '01000000-0000-4000-8000-000000000507', 'Two values: 2 and 5', FALSE, 4),
  -- Q3 (507) q2: negative index
  ('01000000-0000-4000-8000-000000001029', '01000000-0000-4000-8000-000000000508', 'The last element', TRUE,  1),
  ('01000000-0000-4000-8000-000000001030', '01000000-0000-4000-8000-000000000508', 'The first element', FALSE, 2),
  ('01000000-0000-4000-8000-000000001031', '01000000-0000-4000-8000-000000000508', 'A ValueError', FALSE, 3),
  ('01000000-0000-4000-8000-000000001032', '01000000-0000-4000-8000-000000000508', 'The second element', FALSE, 4),
  -- Q3 (507) q3: 2D indexing
  ('01000000-0000-4000-8000-000000001033', '01000000-0000-4000-8000-000000000509', 'Row 1, column 2', TRUE,  1),
  ('01000000-0000-4000-8000-000000001034', '01000000-0000-4000-8000-000000000509', 'Column 1, row 2', FALSE, 2),
  ('01000000-0000-4000-8000-000000001035', '01000000-0000-4000-8000-000000000509', 'Rows 1 through 2', FALSE, 3),
  ('01000000-0000-4000-8000-000000001036', '01000000-0000-4000-8000-000000000509', 'A 2x2 slice', FALSE, 4),
  -- Q4 (510): broadcasting
  ('01000000-0000-4000-8000-000000001037', '01000000-0000-4000-8000-000000000510', 'Combining arrays of compatible shapes', TRUE,  1),
  ('01000000-0000-4000-8000-000000001038', '01000000-0000-4000-8000-000000000510', 'Copying arrays into memory', FALSE, 2),
  ('01000000-0000-4000-8000-000000001039', '01000000-0000-4000-8000-000000000510', 'Sorting every array automatically', FALSE, 3),
  ('01000000-0000-4000-8000-000000001040', '01000000-0000-4000-8000-000000000510', 'Converting arrays to lists', FALSE, 4),
  -- Q4 (510) q2: ufunc definition
  ('01000000-0000-4000-8000-000000001041', '01000000-0000-4000-8000-000000000511', 'Element-wise function on arrays', TRUE,  1),
  ('01000000-0000-4000-8000-000000001042', '01000000-0000-4000-8000-000000000511', 'A function for a single scalar only', FALSE, 2),
  ('01000000-0000-4000-8000-000000001043', '01000000-0000-4000-8000-000000000511', 'A builtin Python function', FALSE, 3),
  ('01000000-0000-4000-8000-000000001044', '01000000-0000-4000-8000-000000000511', 'A boolean-only function', FALSE, 4),
  -- Q4 (510) q3: vectorized expression
  ('01000000-0000-4000-8000-000000001045', '01000000-0000-4000-8000-000000000512', 'arr + 1', TRUE,  1),
  ('01000000-0000-4000-8000-000000001046', '01000000-0000-4000-8000-000000000512', '[x + 1 for x in arr]', FALSE, 2),
  ('01000000-0000-4000-8000-000000001047', '01000000-0000-4000-8000-000000000512', 'for i in range(len(arr))', FALSE, 3),
  ('01000000-0000-4000-8000-000000001048', '01000000-0000-4000-8000-000000000512', 'sum(arr)', FALSE, 4),
  -- Q5 (513): axis=0 sum
  ('01000000-0000-4000-8000-000000001049', '01000000-0000-4000-8000-000000000513', 'One sum per column', TRUE,  1),
  ('01000000-0000-4000-8000-000000001050', '01000000-0000-4000-8000-000000000513', 'One sum per row', FALSE, 2),
  ('01000000-0000-4000-8000-000000001051', '01000000-0000-4000-8000-000000000513', 'The whole-array total', FALSE, 3),
  ('01000000-0000-4000-8000-000000001052', '01000000-0000-4000-8000-000000000513', 'The mean of every cell', FALSE, 4),
  -- Q5 (513) q2: argmax
  ('01000000-0000-4000-8000-000000001053', '01000000-0000-4000-8000-000000000514', 'np.argmax()', TRUE,  1),
  ('01000000-0000-4000-8000-000000001054', '01000000-0000-4000-8000-000000000514', 'np.max()', FALSE, 2),
  ('01000000-0000-4000-8000-000000001055', '01000000-0000-4000-8000-000000000514', 'np.maximum()', FALSE, 3),
  ('01000000-0000-4000-8000-000000001056', '01000000-0000-4000-8000-000000000514', 'np.idxmax()', FALSE, 4),
  -- Q5 (513) q3: mean
  ('01000000-0000-4000-8000-000000001057', '01000000-0000-4000-8000-000000000515', 'The arithmetic average', TRUE,  1),
  ('01000000-0000-4000-8000-000000001058', '01000000-0000-4000-8000-000000000515', 'The median value', FALSE, 2),
  ('01000000-0000-4000-8000-000000001059', '01000000-0000-4000-8000-000000000515', 'The standard deviation', FALSE, 3),
  ('01000000-0000-4000-8000-000000001060', '01000000-0000-4000-8000-000000000515', 'The largest value', FALSE, 4),
  -- Q6 (516): vectorized speed
  ('01000000-0000-4000-8000-000000001061', '01000000-0000-4000-8000-000000000516', 'Runs in compiled C code', TRUE,  1),
  ('01000000-0000-4000-8000-000000001062', '01000000-0000-4000-8000-000000000516', 'Uses more memory to be faster', FALSE, 2),
  ('01000000-0000-4000-8000-000000001063', '01000000-0000-4000-8000-000000000516', 'Parallelizes every single loop', FALSE, 3),
  ('01000000-0000-4000-8000-000000001064', '01000000-0000-4000-8000-000000000516', 'Skips parts of the calculation', FALSE, 4),
  -- Q6 (516) q2: sqrt
  ('01000000-0000-4000-8000-000000001065', '01000000-0000-4000-8000-000000000517', 'np.sqrt()', TRUE,  1),
  ('01000000-0000-4000-8000-000000001066', '01000000-0000-4000-8000-000000000517', 'np.abs()', FALSE, 2),
  ('01000000-0000-4000-8000-000000001067', '01000000-0000-4000-8000-000000000517', 'np.power()', FALSE, 3),
  ('01000000-0000-4000-8000-000000001068', '01000000-0000-4000-8000-000000000517', 'np.log()', FALSE, 4),
  -- Q6 (516) q3: log
  ('01000000-0000-4000-8000-000000001069', '01000000-0000-4000-8000-000000000518', 'The natural logarithm of each element', TRUE,  1),
  ('01000000-0000-4000-8000-000000001070', '01000000-0000-4000-8000-000000000518', 'The base-10 logarithm', FALSE, 2),
  ('01000000-0000-4000-8000-000000001071', '01000000-0000-4000-8000-000000000518', 'The exponential of each element', FALSE, 3),
  ('01000000-0000-4000-8000-000000001072', '01000000-0000-4000-8000-000000000518', 'The reciprocal of each element', FALSE, 4),
  -- Q7 (519): default_rng
  ('01000000-0000-4000-8000-000000001073', '01000000-0000-4000-8000-000000000519', 'np.random.default_rng()', TRUE,  1),
  ('01000000-0000-4000-8000-000000001074', '01000000-0000-4000-8000-000000000519', 'np.random.old()', FALSE, 2),
  ('01000000-0000-4000-8000-000000001075', '01000000-0000-4000-8000-000000000519', 'np.rng()', FALSE, 3),
  ('01000000-0000-4000-8000-000000001076', '01000000-0000-4000-8000-000000000519', 'np.random.io()', FALSE, 4),
  -- Q7 (519) q2: loadtxt
  ('01000000-0000-4000-8000-000000001077', '01000000-0000-4000-8000-000000000520', 'np.loadtxt()', TRUE,  1),
  ('01000000-0000-4000-8000-000000001078', '01000000-0000-4000-8000-000000000520', 'np.savetxt()', FALSE, 2),
  ('01000000-0000-4000-8000-000000001079', '01000000-0000-4000-8000-000000000520', 'np.open()', FALSE, 3),
  ('01000000-0000-4000-8000-000000001080', '01000000-0000-4000-8000-000000000520', 'np.read()', FALSE, 4),
  -- Q7 (519) q3: seed purpose
  ('01000000-0000-4000-8000-000000001081', '01000000-0000-4000-8000-000000000521', 'Makes the sequence reproducible', TRUE,  1),
  ('01000000-0000-4000-8000-000000001082', '01000000-0000-4000-8000-000000000521', 'Deletes the random state', FALSE, 2),
  ('01000000-0000-4000-8000-000000001083', '01000000-0000-4000-8000-000000000521', 'Guarantees unique integers', FALSE, 3),
  ('01000000-0000-4000-8000-000000001084', '01000000-0000-4000-8000-000000000521', 'Speeds up the generator', FALSE, 4),
  -- Q8 (522): np.where
  ('01000000-0000-4000-8000-000000001085', '01000000-0000-4000-8000-000000000522', 'a where True, b where False', TRUE,  1),
  ('01000000-0000-4000-8000-000000001086', '01000000-0000-4000-8000-000000000522', 'Only the value of a', FALSE, 2),
  ('01000000-0000-4000-8000-000000001087', '01000000-0000-4000-8000-000000000522', 'Only the value of b', FALSE, 3),
  ('01000000-0000-4000-8000-000000001088', '01000000-0000-4000-8000-000000000522', 'The indices of the condition', FALSE, 4),
  -- Q8 (522) q2: nan_to_num
  ('01000000-0000-4000-8000-000000001089', '01000000-0000-4000-8000-000000000523', 'np.nan_to_num()', TRUE,  1),
  ('01000000-0000-4000-8000-000000001090', '01000000-0000-4000-8000-000000000523', 'np.fillna()', FALSE, 2),
  ('01000000-0000-4000-8000-000000001091', '01000000-0000-4000-8000-000000000523', 'np.dropna()', FALSE, 3),
  ('01000000-0000-4000-8000-000000001092', '01000000-0000-4000-8000-000000000523', 'np.clean()', FALSE, 4),
  -- Q8 (522) q3: ravel
  ('01000000-0000-4000-8000-000000001093', '01000000-0000-4000-8000-000000000524', 'Flattens into one dimension', TRUE,  1),
  ('01000000-0000-4000-8000-000000001094', '01000000-0000-4000-8000-000000000524', 'Rounds to the nearest integer', FALSE, 2),
  ('01000000-0000-4000-8000-000000001095', '01000000-0000-4000-8000-000000000524', 'Transposes the array', FALSE, 3),
  ('01000000-0000-4000-8000-000000001096', '01000000-0000-4000-8000-000000000524', 'Sorts the elements', FALSE, 4),
  -- Q9 (525): ndarray
  ('01000000-0000-4000-8000-000000001097', '01000000-0000-4000-8000-000000000525', 'The ndarray', TRUE,  1),
  ('01000000-0000-4000-8000-000000001098', '01000000-0000-4000-8000-000000000525', 'A Python list', FALSE, 2),
  ('01000000-0000-4000-8000-000000001099', '01000000-0000-4000-8000-000000000525', 'A Python tuple', FALSE, 3),
  ('01000000-0000-4000-8000-000000001100', '01000000-0000-4000-8000-000000000525', 'A dictionary', FALSE, 4),
  -- Q9 (525) q2: broadcasting benefit
  ('01000000-0000-4000-8000-000000001101', '01000000-0000-4000-8000-000000000526', 'Combine shapes without explicit loops', TRUE,  1),
  ('01000000-0000-4000-8000-000000001102', '01000000-0000-4000-8000-000000000526', 'Sort arrays automatically', FALSE, 2),
  ('01000000-0000-4000-8000-000000001103', '01000000-0000-4000-8000-000000000526', 'Compress numeric data', FALSE, 3),
  ('01000000-0000-4000-8000-000000001104', '01000000-0000-4000-8000-000000000526', 'Convert floats to strings', FALSE, 4),
  -- Q9 (525) q3: std
  ('01000000-0000-4000-8000-000000001105', '01000000-0000-4000-8000-000000000527', 'np.std(arr)', TRUE,  1),
  ('01000000-0000-4000-8000-000000001106', '01000000-0000-4000-8000-000000000527', 'np.mean(arr)', FALSE, 2),
  ('01000000-0000-4000-8000-000000001107', '01000000-0000-4000-8000-000000000527', 'np.sum(arr)', FALSE, 3),
  ('01000000-0000-4000-8000-000000001108', '01000000-0000-4000-8000-000000000527', 'np.min(arr)', FALSE, 4),
  -- Q9 (525) q4: npy format
  ('01000000-0000-4000-8000-000000001109', '01000000-0000-4000-8000-000000000528', 'A .npy file from np.save', TRUE,  1),
  ('01000000-0000-4000-8000-000000001110', '01000000-0000-4000-8000-000000000528', 'A CSV text file', FALSE, 2),
  ('01000000-0000-4000-8000-000000001111', '01000000-0000-4000-8000-000000000528', 'A JSON document', FALSE, 3),
  ('01000000-0000-4000-8000-000000001112', '01000000-0000-4000-8000-000000000528', 'A Python pickle of a list', FALSE, 4),
  -- Q9 (525) q5: final step
  ('01000000-0000-4000-8000-000000001113', '01000000-0000-4000-8000-000000000529', 'Communicate findings with evidence', TRUE,  1),
  ('01000000-0000-4000-8000-000000001114', '01000000-0000-4000-8000-000000000529', 'Delete the cleaned dataset', FALSE, 2),
  ('01000000-0000-4000-8000-000000001115', '01000000-0000-4000-8000-000000000529', 'Skip all validation', FALSE, 3),
  ('01000000-0000-4000-8000-000000001116', '01000000-0000-4000-8000-000000000529', 'Hide the cleaning decisions', FALSE, 4)
ON CONFLICT (id) DO NOTHING;