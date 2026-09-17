-- ============================================================================
-- SEED 036: Complete course — "Statistics for Data Science"
-- ----------------------------------------------------------------------------
-- Instructor : Anita Patel        (10000000-0000-4000-8000-000000000003)
-- Category   : Data Science        (20000000-0000-4000-8000-000000000003)
-- Level      : BEGINNER · Access : FREE · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Foundations of Descriptive Statistics → C1 Data & Variable Types · C2 Describing Distributions
--   M2 Probability & Distributions            → C3 Probability Basics · C4 Probability Distributions
--   M3 Sampling & Inference                   → C5 Sampling & the Central Limit Theorem · C6 Estimation & Confidence Intervals
--   M4 Testing & Relationships                → C7 Hypothesis Testing · C8 Correlation & Regression
--   M5 Capstone: Data Analysis Project        → C9 Project Setup · C10 Running the Analysis
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
  '02400000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000003',
  '20000000-0000-4000-8000-000000000003',
  'Statistics for Data Science',
  'statistics-for-data-science',
  'Master the statistics every data scientist needs: descriptive summaries, probability, sampling, hypothesis testing, confidence intervals, and regression — then apply it all to a capstone analysis.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  34
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02400000-0000-4000-8000-000000000011', '02400000-0000-4000-8000-000000000001', 'Classify variables and produce accurate descriptive summaries of any dataset.',                1),
  ('02400000-0000-4000-8000-000000000012', '02400000-0000-4000-8000-000000000001', 'Model uncertainty with probability rules and the normal distribution.',                   2),
  ('02400000-0000-4000-8000-000000000013', '02400000-0000-4000-8000-000000000001', 'Use sampling and the central limit theorem to justify claims about a population.',         3),
  ('02400000-0000-4000-8000-000000000014', '02400000-0000-4000-8000-000000000001', 'Run hypothesis tests and interpret p-values and confidence intervals honestly.',            4),
  ('02400000-0000-4000-8000-000000000015', '02400000-0000-4000-8000-000000000001', 'Measure relationships with correlation and regression and report a complete analysis.',    5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02400000-0000-4000-8000-000000000101', '02400000-0000-4000-8000-000000000001', 1, 'Foundations of Descriptive Statistics', 'Summarize data with the right measures of center and spread.',           'PUBLISHED'),
  ('02400000-0000-4000-8000-000000000102', '02400000-0000-4000-8000-000000000001', 2, 'Probability & Distributions',          'Model uncertainty with probability rules and continuous distributions.',  'PUBLISHED'),
  ('02400000-0000-4000-8000-000000000103', '02400000-0000-4000-8000-000000000001', 3, 'Sampling & Inference',                'Learn how random samples support claims about whole populations.',        'PUBLISHED'),
  ('02400000-0000-4000-8000-000000000104', '02400000-0000-4000-8000-000000000001', 4, 'Testing & Relationships',             'Run hypothesis tests and explore correlation and regression.',            'PUBLISHED'),
  ('02400000-0000-4000-8000-000000000105', '02400000-0000-4000-8000-000000000001', 5, 'Capstone: Data Analysis Project',     'Apply the full workflow to a realistic analysis and report.',             'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02400000-0000-4000-8000-000000000201', '02400000-0000-4000-8000-000000000101', 1, 'Data & Variable Types',                'How raw observations become structured datasets.',            'PUBLISHED'),
  ('02400000-0000-4000-8000-000000000202', '02400000-0000-4000-8000-000000000101', 2, 'Describing Distributions',             'The measures of center and spread that summarize data.',      'PUBLISHED'),
  ('02400000-0000-4000-8000-000000000203', '02400000-0000-4000-8000-000000000102', 1, 'Probability Basics',                   'The rules for measuring uncertainty and chance.',             'PUBLISHED'),
  ('02400000-0000-4000-8000-000000000204', '02400000-0000-4000-8000-000000000102', 2, 'Probability Distributions',            'A framework for every outcome and its likelihood.',           'PUBLISHED'),
  ('02400000-0000-4000-8000-000000000205', '02400000-0000-4000-8000-000000000103', 1, 'Sampling & the Central Limit Theorem', 'Why small random samples stand in for a population.',         'PUBLISHED'),
  ('02400000-0000-4000-8000-000000000206', '02400000-0000-4000-8000-000000000103', 2, 'Estimation & Confidence Intervals',    'Quantify the uncertainty around sample estimates.',           'PUBLISHED'),
  ('02400000-0000-4000-8000-000000000207', '02400000-0000-4000-8000-000000000104', 1, 'Hypothesis Testing',                   'Formal decisions with nulls, p-values, and significance.',    'PUBLISHED'),
  ('02400000-0000-4000-8000-000000000208', '02400000-0000-4000-8000-000000000104', 2, 'Correlation & Regression',             'Measure and model the relationships between variables.',      'PUBLISHED'),
  ('02400000-0000-4000-8000-000000000209', '02400000-0000-4000-8000-000000000105', 1, 'Project Setup',                        'Structure an analysis and define the question.',              'PUBLISHED'),
  ('02400000-0000-4000-8000-000000000210', '02400000-0000-4000-8000-000000000105', 2, 'Running the Analysis',                 'Execute, validate, and report the results.',                  'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02400000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02400000-0000-4000-8000-000000000301', '02400000-0000-4000-8000-000000000201', 1, 'What is Statistics for Data Science?',   'The role of statistics inside a data science workflow.',              'TEXT',  'PUBLISHED', 'FREE', 10,  6),
  ('02400000-0000-4000-8000-000000000302', '02400000-0000-4000-8000-000000000201', 2, 'Variables & Levels of Measurement',     'Classify every column in a dataset before you compute anything.',      'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02400000-0000-4000-8000-000000000303', '02400000-0000-4000-8000-000000000201', 3, 'Describing Data Quiz',                  'Check your grasp of variables and levels of measurement.',            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02400000-0000-4000-8000-000000000304', '02400000-0000-4000-8000-000000000202', 1, 'Measures of Central Tendency',          'Mean, median, and mode — and when each one lies.',                     'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02400000-0000-4000-8000-000000000305', '02400000-0000-4000-8000-000000000202', 2, 'Measures of Spread',                    'Range, IQR, variance, and standard deviation.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02400000-0000-4000-8000-000000000306', '02400000-0000-4000-8000-000000000202', 3, 'Center & Spread Quiz',                  'Test your understanding of summary measures.',                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02400000-0000-4000-8000-000000000307', '02400000-0000-4000-8000-000000000203', 1, 'Probability Rules',                     'Sample spaces, events, and the axioms of probability.',                'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02400000-0000-4000-8000-000000000308', '02400000-0000-4000-8000-000000000203', 2, 'Conditional Probability & Bayes Rule',  'Update beliefs when new evidence arrives.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02400000-0000-4000-8000-000000000309', '02400000-0000-4000-8000-000000000203', 3, 'Probability Quiz',                      'Verify the rules of probability and conditioning.',                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02400000-0000-4000-8000-000000000310', '02400000-0000-4000-8000-000000000204', 1, 'Discrete & Continuous Distributions',   'Model random counts with binomial and more.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02400000-0000-4000-8000-000000000311', '02400000-0000-4000-8000-000000000204', 2, 'The Normal Distribution',               'The bell curve: properties, z-scores, and the 68-95-99.7 rule.',       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02400000-0000-4000-8000-000000000312', '02400000-0000-4000-8000-000000000204', 3, 'Distributions Quiz',                    'Check your knowledge of random variables and the normal curve.',       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02400000-0000-4000-8000-000000000313', '02400000-0000-4000-8000-000000000205', 1, 'Sampling Methods & Bias',               'Random samples, stratified designs, and common bias traps.',            'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02400000-0000-4000-8000-000000000314', '02400000-0000-4000-8000-000000000205', 2, 'The Central Limit Theorem',             'Why sample means become normal even when the population is not.',       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02400000-0000-4000-8000-000000000315', '02400000-0000-4000-8000-000000000205', 3, 'Sampling & CLT Quiz',                   'Test sampling and the central limit theorem.',                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02400000-0000-4000-8000-000000000316', '02400000-0000-4000-8000-000000000206', 1, 'Point Estimates & Standard Error',      'Estimators, sampling variability, and the standard error.',            'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02400000-0000-4000-8000-000000000317', '02400000-0000-4000-8000-000000000206', 2, 'Confidence Intervals',                  'Build a margin of error around an estimate.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02400000-0000-4000-8000-000000000318', '02400000-0000-4000-8000-000000000206', 3, 'Estimation Quiz',                       'Check point estimates and confidence intervals.',                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02400000-0000-4000-8000-000000000319', '02400000-0000-4000-8000-000000000207', 1, 'Hypothesis Testing Basics',             'Nulls, alternatives, test statistics, and decisions.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02400000-0000-4000-8000-000000000320', '02400000-0000-4000-8000-000000000207', 2, 'p-values in Practice',                  'Interpret p-values honestly and avoid common traps.',                   'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02400000-0000-4000-8000-000000000321', '02400000-0000-4000-8000-000000000207', 3, 'Hypothesis Testing Quiz',               'Test hypothesis testing and p-value interpretation.',                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02400000-0000-4000-8000-000000000322', '02400000-0000-4000-8000-000000000208', 1, 'Correlation & Causation',               'Measure and interpret the strength of a linear relationship.',          'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02400000-0000-4000-8000-000000000323', '02400000-0000-4000-8000-000000000208', 2, 'Simple Linear Regression',              'Model one variable as a line through another.',                         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02400000-0000-4000-8000-000000000324', '02400000-0000-4000-8000-000000000208', 3, 'Relationships Quiz',                    'Check correlation and regression concepts.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02400000-0000-4000-8000-000000000325', '02400000-0000-4000-8000-000000000209', 1, 'Structuring a Data Analysis',           'A repeatable workflow for any data project.',                           'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02400000-0000-4000-8000-000000000326', '02400000-0000-4000-8000-000000000210', 1, 'Exploratory Data Analysis',             'Describe, visualize, and sanity-check a new dataset.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02400000-0000-4000-8000-000000000327', '02400000-0000-4000-8000-000000000210', 2, 'Reporting & Communicating Results',     'Turn numbers into a clear story for stakeholders.',                     'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02400000-0000-4000-8000-000000000328', '02400000-0000-4000-8000-000000000210', 3, 'Final Assessment',                      'Prove the full statistics workflow from data to decision.',             'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02400000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02400000-0000-4000-8000-000000000401',
  '02400000-0000-4000-8000-000000000301',
  1,
  'What is Statistics for Data Science?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is Statistics for Data Science?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>What is Statistics for Data Science?</h1>
  <p>Statistics is the science of <strong>learning from data</strong>. In a data science project, statistics supplies the rules that turn a pile of raw observations into trustworthy conclusions: what to compute, how unsure you should be, and whether a pattern is real or just a coincidence.</p>
  <p>Data science and statistics are two halves of one practice. Statistics provides the theory; data science adds the engineering — collecting data, cleaning it, and putting results into products and dashboards.</p>
  <h2>The workflow at a glance</h2>
  <ol>
    <li><strong>Ask</strong> — turn a business problem into a statistical question.</li>
    <li><strong>Collect</strong> — gather data with a plan that avoids bias.</li>
    <li><strong>Explore</strong> — summarize and visualize before any modeling.</li>
    <li><strong>Infer</strong> — use samples to make claims about the larger population.</li>
    <li><strong>Communicate</strong> — report uncertainty along with the answer.</li>
  </ol>
  <h2>Describe, infer, predict</h2>
  <table>
    <tr><th>Branch</th><th>Question it answers</th><th>Typical tools</th></tr>
    <tr><td>Descriptive</td><td>What does the data look like?</td><td>mean, median, IQR, histograms</td></tr>
    <tr><td>Inferential</td><td>What does the sample tell us about the whole?</td><td>confidence intervals, hypothesis tests</td></tr>
    <tr><td>Predictive</td><td>What will happen next?</td><td>regression, machine learning</td></tr>
  </table>
  <h2>Statistics runs on samples</h2>
  <p>You rarely measure an entire population. A marketer cannot call every customer, so a <strong>sample</strong> stands in for the whole group. The rest of this course explains when that shortcut is safe and how large the resulting uncertainty is.</p>
  <div class="callout callout-tip">
    <strong>Mindset</strong>
    <p>Every number from a sample carries error. A good analyst reports the number <strong>and</strong> the uncertainty around it. Later lessons turn that instinct into formulas.</p>
  </div>
  <div class="callout callout-info">
    <strong>Prerequisites</strong>
    <p>You need basic algebra and a little Python. We will explain every formula word by word, so do not worry if math class was long ago.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000402',
  '02400000-0000-4000-8000-000000000302',
  1,
  'Variables & Levels of Measurement',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Variables & Levels of Measurement</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Variables &amp; Levels of Measurement</h1>
  <p>A <strong>variable</strong> is any characteristic that takes different values across the units you study: income, blood type, clicks per day, country. Before computing anything, classify every column — the right summary depends on the variable type.</p>
  <h2>Numeric vs categorical</h2>
  <ul>
    <li><strong>Numeric</strong> variables give numbers with real meaning, so you can compute a mean. Example: age, price, temperature.</li>
    <li><strong>Categorical</strong> variables place units into named groups. Example: region, department, funnel step.</li>
  </ul>
  <h2>Four levels of measurement</h2>
  <table>
    <tr><th>Level</th><th>Allows</th><th>Example</th></tr>
    <tr><td>Nominal</td><td>grouping by name</td><td>transport: car, train, bike</td></tr>
    <tr><td>Ordinal</td><td>ranking, order matters</td><td>satisfaction: low, medium, high</td></tr>
    <tr><td>Interval</td><td>differences, no true zero</td><td>temperature in Celsius</td></tr>
    <tr><td>Ratio</td><td>differences and ratios</td><td>revenue, height, time</td></tr>
  </table>
  <div class="callout">
    <strong>Why it matters</strong>
    <p>You cannot average flight class codes, but you can average revenue. Choosing a chart or a model starts here, before any code runs.</p>
  </div>
  <h2>Discrete vs continuous numeric</h2>
  <p>Numeric variables split further: <strong>discrete</strong> values come from counting (clicks, orders), <strong>continuous</strong> values come from measuring (revenue, weight). Module 2 leans on this distinction when it introduces distributions.</p>
  <h2>Inspect before you compute</h2>
  <pre class="code-block">import pandas as pd

df = pd.read_csv('customers.csv')
print(df.dtypes)          # every column and its type
print(df.nunique())       # distinct values per column</pre>
  <div class="callout callout-tip">
    <strong>Check the raw values</strong>
    <p>Read the first rows with <span class="ic">df.head()</span>. A column typed as a number can still hide text like &ldquo;unknown&rdquo;, which will break statistics silently.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000404',
  '02400000-0000-4000-8000-000000000304',
  1,
  'Measures of Central Tendency',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Measures of Central Tendency</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Measures of Central Tendency</h1>
  <p>Central tendency answers the question &ldquo;what is a typical value?&rdquo; Three measures compete for that job — the <strong>mean</strong>, the <strong>median</strong>, and the <strong>mode</strong> — and each fails in a different way.</p>
  <h2>The three contenders</h2>
  <table>
    <tr><th>Measure</th><th>Definition</th><th>Weakness</th></tr>
    <tr><td>Mean</td><td>sum of values divided by count</td><td>dragged by extreme values</td></tr>
    <tr><td>Median</td><td>middle value once sorted</td><td>ignores much of the data</td></tr>
    <tr><td>Mode</td><td>most frequent value</td><td>can be many or none</td></tr>
  </table>
  <h2>Worked example</h2>
  <pre class="code-block">salaries = [45, 50, 52, 55, 160]   # thousands

import statistics
statistics.mean(salaries)      # 72.4  — inflated by the 160
statistics.median(salaries)    # 52    — reflects the typical value</pre>
  <h2>Mean vs median is a diagnostic</h2>
  <p>When the mean sits far above the median, the data is <strong>right-skewed</strong> and the tail carries large values. That gap is interesting in itself — income, house prices, and session lengths all behave this way.</p>
  <h2>Choosing the right one</h2>
  <ul>
    <li>Use the <strong>median</strong> for income, rents, and anything with strong outliers.</li>
    <li>Use the <strong>mean</strong> when values are symmetric and you need further math.</li>
    <li>Use the <strong>mode</strong> for categorical data and store assortments.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Report both</strong>
    <p>Dashboard best practice is mean <strong>and</strong> median together. The gap between them tells your audience whether the &ldquo;typical&rdquo; number is trustworthy.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Trim or transform</strong>
    <p>If you must keep a mean that resists outliers, report a trimmed mean or analyze the log scale, and describe what you did so the number stays honest.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000405',
  '02400000-0000-4000-8000-000000000305',
  1,
  'Measures of Spread',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Measures of Spread</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Measures of Spread</h1>
  <p>Center is only half the story. Two datasets can share the same mean yet look completely different — one tight cluster, one wide cloud. <strong>Spread</strong> quantifies that difference.</p>
  <h2>Range and IQR</h2>
  <p>The <strong>range</strong> is the largest value minus the smallest. It is simple and brittle — one extreme value rewrites it. The <strong>interquartile range (IQR)</strong> is more robust: it measures the span of the middle 50% of the data.</p>
  <pre class="code-block">import numpy as np

x = np.array([2, 4, 6, 8, 10, 12, 14])
q1 = np.percentile(x, 25)
q3 = np.percentile(x, 75)

print(q3 - q1)        # IQR = 8.0</pre>
  <h2>Variance and standard deviation</h2>
  <p>The <strong>variance</strong> averages the squared distances from the mean; the <strong>standard deviation</strong> is its square root, back on the original scale. A larger standard deviation means more dispersion.</p>
  <pre class="code-block">a = [50, 51, 49, 52, 48]     # tiny spread
b = [10, 40, 60, 90, 20]      # huge spread

import statistics
statistics.stdev(a)   # about 1.58
statistics.stdev(b)   # about 33.9</pre>
  <div class="callout">
    <strong>Why square?</strong>
    <p>Deviations from the mean sum to zero, so negatives would cancel positives. Squaring makes every deviation count and connects variance cleanly to the rest of the course.</p>
  </div>
  <h2>Whiskers and outliers</h2>
  <p>A box plot draws the median, the <span class="ic">Q1</span>, the <span class="ic">Q3</span>, and whiskers extended to data still inside <span class="ic">1.5 &times; IQR</span>. Points beyond are flagged as potential outliers worth investigating, not deleting.</p>
  <table>
    <tr><th>Measure</th><th>Robust to outliers?</th><th>Best for</th></tr>
    <tr><td>Standard deviation</td><td>No</td><td>symmetric data, further math</td></tr>
    <tr><td>IQR</td><td>Yes</td><td>skewed data, box plots</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Investigate, never delete</strong>
    <p>An outlier can be a typo, a fraud, or the most valuable finding in the dataset. Trace it before you decide whether it stays.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000407',
  '02400000-0000-4000-8000-000000000307',
  1,
  'Probability Rules',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Probability Rules</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Probability Rules</h1>
  <p>Probability is the language of uncertainty. It assigns a number between 0 and 1 to outcomes, and every inference in this course is built on top of those numbers.</p>
  <h2>The basics</h2>
  <ul>
    <li>The <strong>sample space</strong> is the set of all possible outcomes.</li>
    <li>An <strong>event</strong> is any set of outcomes you care about.</li>
    <li>The probability of an event is its share of equally likely outcomes — favorable outcomes divided by total outcomes.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Sum rule</strong>
    <p>Probabilities of all possible outcomes add to 1. So an event <span class="ic">A</span> and its complement <span class="ic">not A</span> also add to 1: <span class="ic">P(A) = 1 - P(not A)</span>.</p>
  </div>
  <h2>The addition rule</h2>
  <p>For events that cannot occur together (<strong>mutually exclusive</strong>), the probability of either one is the sum of the individual probabilities:</p>
  <pre class="code-block">P(die shows 1 or 2) = P(1) + P(2) = 1/6 + 1/6 = 2/6</pre>
  <p>When events overlap, subtract the double-counted part:</p>
  <pre class="code-block">P(A or B) = P(A) + P(B) - P(A and B)</pre>
  <p>Example: a card being a face card or a heart. Face cards and hearts share the jack, queen, and king of hearts, so those three are counted twice without the subtraction.</p>
  <h2>Independence</h2>
  <p>Two events are <strong>independent</strong> when knowing one happened gives no information about the other. Independent events multiply:</p>
  <pre class="code-block">P(A and B) = P(A) &times; P(B)     # only when independent</pre>
  <p>Rolling a die then flipping a coin is independent — the die has no memory of the coin.</p>
  <div class="callout callout-tip">
    <strong>Round responsibly</strong>
    <p>Report 0.167 rather than a fraction when comparing models, and never round to 0 or 1 casually. The difference between 0.01 and 0 is often the entire business decision.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000408',
  '02400000-0000-4000-8000-000000000308',
  1,
  'Conditional Probability & Bayes Rule',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Conditional Probability & Bayes Rule</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Conditional Probability &amp; Bayes Rule</h1>
  <p>Most real questions are conditional: what is the chance of a disease given a positive test? What is the chance of churn given three support visits? Conditional probability updates beliefs with new information.</p>
  <h2>Definition</h2>
  <pre class="code-block">P(A | B) = P(A and B) / P(B)   if P(B) &gt; 0</pre>
  <p>Read <span class="ic">P(A | B)</span> as &ldquo;the probability of A given B.&rdquo; We restrict attention to the cases where B happened, then ask what fraction of those cases are also A.</p>
  <h2>Worked example</h2>
  <p>Of 1,000 emails, 100 are spam and 80 of those contain the word &ldquo;buy&rdquo;. Ten legitimate emails also contain &ldquo;buy&rdquo;.</p>
  <pre class="code-block">P(spam          ) = 100 / 1000 = 0.10
P(&quot;buy&quot; | spam  ) =   80 /  100 = 0.80
P(spam | &quot;buy&quot;  ) =   80 / (80 + 10) = 0.889</pre>
  <p>The last line is what a filter cares about: given the word &ldquo;buy&rdquo;, 88.9% of those emails are spam.</p>
  <h2>Bayes rule</h2>
  <p>Bayes rule formalizes the reversal — getting from <span class="ic">P(B | A)</span> to <span class="ic">P(A | B)</span>:</p>
  <pre class="code-block">P(A | B) = P(B | A) &times; P(A) / P(B)</pre>
  <p>The pieces have names: <span class="ic">P(A)</span> is the <strong>prior</strong>, <span class="ic">P(A | B)</span> is the <strong>posterior</strong>, and <span class="ic">P(B | A)</span> is the likelihood of the evidence under A.</p>
  <div class="callout">
    <strong>The base rate trap</strong>
    <p>A test that is 99% accurate still produces many false positives when the condition is rare. With a disease present in 1% of people, most positive results come from healthy people. Base rates matter, and Bayes rule keeps them in the calculation.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Practical shortcut</strong>
    <p>For filter decisions, compare the <strong>posteriors</strong>, not just the likelihoods: <span class="ic">P(A | B)</span> versus <span class="ic">P(not A | B)</span>. Whichever is larger wins.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000410',
  '02400000-0000-4000-8000-000000000310',
  1,
  'Discrete & Continuous Distributions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Discrete & Continuous Distributions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Discrete &amp; Continuous Distributions</h1>
  <p>A <strong>probability distribution</strong> describes, for a random variable, which values are possible and how likely each one is. The shape of that distribution decides which statistical tools you can use.</p>
  <h2>Random variables</h2>
  <ul>
    <li><strong>Discrete</strong> random variable — count outcomes such as the number of support tickets. You can list every value with its probability.</li>
    <li><strong>Continuous</strong> random variable — measured outcomes such as waiting time. Probabilities live over intervals, and any single exact value has probability zero.</li>
  </ul>
  <h2>The binomial distribution</h2>
  <p>It counts successes in a fixed number of independent yes or no trials: clicks out of 100 deliveries, heads out of 10 flips.</p>
  <pre class="code-block">from scipy.stats import binom

# 10 trials, success probability 0.3
binomial = binom(n=10, p=0.3)
print(binomial.pmf(3))     # P(exactly 3 successes)</pre>
  <p>Properties: the mean is <span class="ic">n &times; p</span> and the variance is <span class="ic">n &times; p &times; (1 - p)</span>.</p>
  <h2>Density curves</h2>
  <p>For continuous variables we draw a <strong>density curve</strong>. The total area under the curve is 1, and the probability of falling between two bounds is the area between them. Taller regions of the curve are more probable.</p>
  <h2>Two more classics</h2>
  <table>
    <tr><th>Distribution</th><th>Use it for</th><th>Shape</th></tr>
    <tr><td>Uniform</td><td>equally likely outcomes</td><td>flat rectangle</td></tr>
    <tr><td>Exponential</td><td>time between events</td><td>decaying toward zero</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Why distributions matter</strong>
    <p>Every statistical formula in later modules carries a hidden assumption about the shape of your data. Checking the shape first prevents formulas that quietly produce nonsense.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pandas vs probability</strong>
    <p><span class="ic">scipy.stats</span> models distributions for math work; <span class="ic">pandas</span> describes observed data. The central limit theorem in module 3 is the bridge between them.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000411',
  '02400000-0000-4000-8000-000000000311',
  1,
  'The Normal Distribution',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Normal Distribution</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>The Normal Distribution</h1>
  <p>The normal (Gaussian) distribution is the bell curve. It describes data whose values cluster symmetrically around a center: heights, test scores, measurement errors. It also appears whenever we average many small independent effects.</p>
  <h2>Two parameters describe it</h2>
  <ul>
    <li><strong>Mean</strong> (<span class="ic">&mu;</span>) centers the curve on the horizontal axis.</li>
    <li><strong>Standard deviation</strong> (<span class="ic">&sigma;</span>) sets the width of the bell.</li>
  </ul>
  <p>Larger <span class="ic">&sigma;</span> makes a flatter, wider bell; smaller <span class="ic">&sigma;</span> makes a tall, narrow one.</p>
  <h2>The 68-95-99.7 rule</h2>
  <p>For a normal distribution, fixed shares of the data live within each number of standard deviations of the mean:</p>
  <table>
    <tr><th>Interval</th><th>Share of data</th></tr>
    <tr><td>&mu; &plusmn; &sigma;</td><td>about 68%</td></tr>
    <tr><td>&mu; &plusmn; 2&sigma;</td><td>about 95%</td></tr>
    <tr><td>&mu; &plusmn; 3&sigma;</td><td>about 99.7%</td></tr>
  </table>
  <h2>Z-scores</h2>
  <p>A <strong>z-score</strong> re-centers and rescales any normal value so it can be compared to the standard normal:</p>
  <pre class="code-block">z = (x - mean) / std</pre>
  <p>A z-score of 1.5 means the value sits 1.5 standard deviations above the mean. Z-scores make different scales comparable — zipping weight, revenue, and wait time into one fair framework.</p>
  <pre class="code-block">from scipy.stats import norm

# value 30 from a normal with mean 25, std 5
mean, std, x = 25, 5, 30
z = (x - mean) / std                 # 1.0
norm.cdf(z)                          # about 0.84
# about 84% of values fall below 30</pre>
  <div class="callout">
    <strong>Not everything is normal</strong>
    <p>Income, wait times, and popularity counts are usually skewed. Check with a histogram and a normal quantile plot before applying normal-based tools.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Central role</strong>
    <p>Module 3 shows that even skewed data produces normal <em>sample means</em>. That link — not the shape of the raw data — is why the normal distribution dominates inference.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000413',
  '02400000-0000-4000-8000-000000000313',
  1,
  'Sampling Methods & Bias',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sampling Methods & Bias</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Sampling Methods &amp; Bias</h1>
  <p>A sample saves time and money, but only a <strong>representative</strong> sample lets you generalize to the population. The sampling design decides whether the numbers you compute mean what you hope they mean.</p>
  <h2>Randomization is the key</h2>
  <p>Random sampling gives each member of the population a known, non-zero chance of selection. That known chance is what makes probability statements about the sample possible. Convenience samples carry unknown bias that no formula can repair.</p>
  <h2>Common designs</h2>
  <table>
    <tr><th>Design</th><th>How it works</th><th>Best for</th></tr>
    <tr><td>Simple random</td><td>everyone equally likely</td><td>homogeneous populations</td></tr>
    <tr><td>Stratified</td><td>divide by group, sample each</td><td>guaranteeing subgroup coverage</td></tr>
    <tr><td>Systematic</td><td>select every kth unit</td><td>large ordered lists</td></tr>
    <tr><td>Cluster</td><td>sample whole groups</td><td>geographically spread units</td></tr>
  </table>
  <h2>Sources of bias</h2>
  <ul>
    <li><strong>Selection bias</strong> — volunteers, early respondents, or a sampling frame that omits part of the population.</li>
    <li><strong>Survivorship bias</strong> — only surviving units are visible, hiding the ones that dropped out.</li>
    <li><strong>Response bias</strong> — wording, ordering, or leading questions distort honest answers.</li>
    <li><strong>Non-response</strong> — the people who refuse often differ from those who answer.</li>
  </ul>
  <div class="callout">
    <strong>Bias vs variability</strong>
    <p>Bias pushes estimates away from the truth in a fixed direction. Variability is random wobble that shrinks with more data. More data fixes variability; it never fixes bias.</p>
  </div>
  <h2>A quick self-check</h2>
  <pre class="code-block"># 1000 customers polled from a panel of app users
#   → does the panel cover your whole user base?
#   → did it skip offline segments?
# Ask before averaging: "Who is missing?"</pre>
  <div class="callout callout-tip">
    <strong>Document the design</strong>
    <p>Write a two-line sampling note with every dataset: who was eligible and how they were chosen. Six months later, that note decides whether your analysis is still valid.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000414',
  '02400000-0000-4000-8000-000000000314',
  1,
  'The Central Limit Theorem',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Central Limit Theorem</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>The Central Limit Theorem</h1>
  <p>The central limit theorem (CLT) is the bridge from raw data to inference. It says that if you draw samples repeatedly and compute the mean each time, the <strong>distribution of those sample means</strong> approaches a normal distribution — no matter how skewed the original population is.</p>
  <h2>What the theorem claims</h2>
  <ul>
    <li>Sample means cluster around the true population mean.</li>
    <li>Their spread shrinks as the sample size grows.</li>
    <li>The shape converges to normal for sufficiently large samples.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Watch the object</strong>
    <p>The CLT concerns the distribution of <em>sample means</em>, not the distribution of the data. A heavily skewed variable can still produce normally distributed sample means once n is large enough.</p>
  </div>
  <h2>Why n matters</h2>
  <table>
    <tr><th>Sample size</th><th>Sampling distribution</th></tr>
    <tr><td>Small (n &le; 10)</td><td>mirrors the population shape</td></tr>
    <tr><td>Medium (around 30)</td><td>near normal for most shapes</td></tr>
    <tr><td>Large (100+)</td><td>essentially normal</td></tr>
  </table>
  <p>The magic number <span class="ic">30</span> is folklore, not law — strongly skewed or heavy-tailed populations need larger n. When in doubt, check with a bootstrap simulation.</p>
  <h2>A tiny simulation</h2>
  <pre class="code-block">import numpy as np

# extremely skewed population
population = np.random.exponential(1, size=100000)

means = []
for _ in range(2000):
    sample = np.random.choice(population, size=50, replace=False)
    means.append(sample.mean())

print(np.mean(means))      # near the population mean of ~1
print(np.std(means))       # standard error, far below the raw sd</pre>
  <div class="callout callout-tip">
    <strong>Consequence for sampling</strong>
    <p>Because sample means spread like <span class="ic">&sigma; / &radic;n</span>, quadrupling the sample size cuts the width of the error roughly in half. That trade-off drives every sample size decision in this course.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000416',
  '02400000-0000-4000-8000-000000000316',
  1,
  'Point Estimates & Standard Error',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Point Estimates & Standard Error</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Point Estimates &amp; Standard Error</h1>
  <p>Inference starts with a single best guess: the <strong>point estimate</strong>. The sample mean is a point estimate of the population mean; the sample standard deviation estimates the population one. But a guess with no measure of reliability is dangerous, so we also measure how shaky it is.</p>
  <h2>Sampling variability</h2>
  <p>Take ten different samples from the same population and you get ten different means. The <strong>sampling distribution</strong> of the mean describes all those values and their spread — that spread is the uncertainty of your guess.</p>
  <h2>The standard error</h2>
  <p>The standard error of the mean measures exactly that spread:</p>
  <pre class="code-block">SE = s / &radic;n</pre>
  <p>where <span class="ic">s</span> is the sample standard deviation and <span class="ic">n</span> the sample size. It answers: how far from the true mean are sample means typically?</p>
  <h2>Reading the formula</h2>
  <ul>
    <li>More variable data (larger <span class="ic">s</span>) gives larger error.</li>
    <li>More observations (larger <span class="ic">n</span>) gives smaller error.</li>
    <li>Doubling precision requires about four times the sample size.</li>
  </ul>
  <h2>Properties of good estimators</h2>
  <table>
    <tr><th>Property</th><th>Meaning</th></tr>
    <tr><td>Unbiased</td><td>on average hits the true parameter</td></tr>
    <tr><td>Consistent</td><td>improves as the sample grows</td></tr>
    <tr><td>Efficient</td><td>small variance among competing unbiased estimators</td></tr>
  </table>
  <div class="callout">
    <strong>Standard deviation is not standard error</strong>
    <p>The standard deviation describes the data; the standard error describes your <em>estimate</em> of the mean. Mixing them up is the most common statistics mistake in dashboards.</p>
  </div>
  <pre class="code-block">import numpy as np

sample = np.array([12, 9, 11, 14, 13, 10, 8, 12, 9, 13])

mean = sample.mean()
s    = sample.std(ddof=1)        # sample standard deviation
n    = sample.size
se   = s / np.sqrt(n)

print(mean, se)                  # about 11.1 and 0.63</pre>
  <div class="callout callout-tip">
    <strong>Report estimate and error together</strong>
    <p>Write &ldquo;mean 11.1 &plusmn; 0.63&rdquo; instead of &ldquo;mean 11.1&rdquo;. The second form hides the fact that your guess has an error bar attached.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000417',
  '02400000-0000-4000-8000-000000000317',
  1,
  'Confidence Intervals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Confidence Intervals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Confidence Intervals</h1>
  <p>A point estimate is a single number; a confidence interval is the same number wrapped in honest uncertainty. It answers: given the sample, which range of values for the population parameter is consistent with the data?</p>
  <h2>Building a 95% interval</h2>
  <pre class="code-block">CI = estimate &plusmn; margin of error
margin of error = critical value &times; standard error</pre>
  <p>For large samples from a normal sampling distribution, the critical value for 95% is about <span class="ic">1.96</span>:</p>
  <pre class="code-block">lower = mean - 1.96 * se
upper = mean + 1.96 * se</pre>
  <h2>What 95% really means</h2>
  <div class="callout">
    <strong>Read it as a process, not a single interval</strong>
    <p>If you drew sample after sample and built an interval from each, about 95% of those intervals would contain the true parameter. For one realized interval, the true mean either is or is not inside — so avoid the phrase &ldquo;95% probability it holds for this interval.&rdquo;</p>
  </div>
  <h2>Wiggle room</h2>
  <table>
    <tr><th>Confidence</th><th>Critical value</th><th>Interval width</th></tr>
    <tr><td>90%</td><td>1.645</td><td>narrowest</td></tr>
    <tr><td>95%</td><td>1.96</td><td>standard</td></tr>
    <tr><td>99%</td><td>2.576</td><td>widest</td></tr>
  </table>
  <h2>What shrinks an interval</h2>
  <ul>
    <li>A larger sample size — shrinks the standard error.</li>
    <li>Less variable data — smaller s.</li>
    <li>A lower confidence level — smaller critical value.</li>
  </ul>
  <h2>Verify with a simulation</h2>
  <pre class="code-block">import numpy as np

rng = np.random.default_rng(42)
covered = 0
for _ in range(2000):
    sample = rng.normal(loc=100, scale=15, size=40)
    se   = sample.std(ddof=1) / np.sqrt(40)
    lo   = sample.mean() - 1.96 * se
    hi   = sample.mean() + 1.96 * se
    if lo &lt;= 100 &lt;= hi:
        covered += 1

print(covered / 2000)      # close to 0.95</pre>
  <div class="callout callout-tip">
    <strong>Use intervals for decisions</strong>
    <p>Compare groups by building intervals and checking overlap. If two 95% intervals barely overlap, the difference deserves a formal test — the next module provides the machinery.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000419',
  '02400000-0000-4000-8000-000000000319',
  1,
  'Hypothesis Testing Basics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hypothesis Testing Basics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Hypothesis Testing Basics</h1>
  <p>A hypothesis test is a formal decision procedure. It starts with a default assumption, gathers evidence, and decides whether the evidence is strong enough to overturn that default.</p>
  <h2>The null and the alternative</h2>
  <ul>
    <li><strong>Null hypothesis</strong> (<span class="ic">H0</span>) — the default: no effect, no difference. Example: the new checkout changes conversion not at all.</li>
    <li><strong>Alternative hypothesis</strong> (<span class="ic">H1</span>) — what you suspect: there is an effect. Example: the new checkout changes conversion.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Framing matters</strong>
    <p>You can never &ldquo;prove&rdquo; the null. A test either rejects it or fails to reject it. &ldquo;Fail to reject&rdquo; is not &ldquo;the null is true&rdquo; — it means the evidence was not strong enough.</p>
  </div>
  <h2>The logic of the test</h2>
  <p>Compute how extreme the sample result is <em>assuming the null is true</em>. If the sample would be very unlikely under the null (<span class="ic">p &lt; &alpha;</span>), reject the null in favor of the alternative.</p>
  <p>The <strong>significance level</strong> <span class="ic">&alpha;</span> is the error rate you accept: at <span class="ic">&alpha; = 0.05</span>, you tolerate being wrong about 5% of the time when the null is actually true.</p>
  <h2>The machinery</h2>
  <pre class="code-block">from scipy.stats import ttest_1samp

# past average checkout total: 42
# new observed sample:
sample = [45, 39, 48, 44, 41, 47, 46, 43, 49, 40]

t_stat, p_value = ttest_1samp(sample, popmean=42)
print(t_stat, p_value)      # decide: p_value &lt; 0.05 ?</pre>
  <h2>The two error types</h2>
  <table>
    <tr><th></th><th>Null is true</th><th>Null is false</th></tr>
    <tr><td>You reject</td><td>Type I error (&alpha;)</td><td>correct</td></tr>
    <tr><td>You fail to reject</td><td>correct</td><td>Type II error (&beta;)</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Power</strong>
    <p>Power is <span class="ic">1 - &beta;</span>: the chance of detecting an effect that is really there. Low power explains many &ldquo;no significant difference&rdquo; results — the study was simply too small.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000420',
  '02400000-0000-4000-8000-000000000320',
  1,
  'p-values in Practice',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>p-values in Practice</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>p-values in Practice</h1>
  <p>The p-value is the most quoted and most misunderstood number in statistics. Precisely: it is the probability of observing a result at least as extreme as yours, <em>assuming the null hypothesis is true</em>.</p>
  <h2>A precise reading</h2>
  <p>A p-value of 0.03 does not mean &ldquo;there is a 3% chance the null is true.&rdquo; It means: if the null were true, results this extreme would appear about 3% of the time under repeated sampling. Your data — that one realized sample — is fixed, not a random event.</p>
  <div class="callout">
    <strong>Three common misreadings</strong>
    <ul>
      <li>p is not the probability that the null is true.</li>
      <li>p is not the probability of a wrong conclusion.</li>
      <li>p above 0.05 is not proof of no effect.</li>
    </ul>
  </div>
  <h2>The decision rule</h2>
  <table>
    <tr><th>Condition</th><th>Action</th><th>Wording</th></tr>
    <tr><td>p &lt; &alpha;</td><td>reject the null</td><td>evidence is unlikely under the null</td></tr>
    <tr><td>p &ge; &alpha;</td><td>fail to reject</td><td>insufficient evidence, not no effect</td></tr>
  </table>
  <h2>Effect size matters more</h2>
  <p>Significance answers &ldquo;is the result unlikely to be chance?&rdquo; It says nothing about importance. A huge sample can declare a 0.1% lift &ldquo;significant&rdquo;; a tiny sample can label a real 20% effect &ldquo;not significant.&rdquo; Report the effect size and its confidence interval with every p-value.</p>
  <h2>Multiple comparisons</h2>
  <p>Run 20 tests at <span class="ic">&alpha; = 0.05</span> and expect one false positive by chance. Adjust the threshold when testing many hypotheses at once — for example the Bonferroni correction divides alpha by the number of tests:</p>
  <pre class="code-block"># Bonferroni: divide alpha by the number of tests
alpha_corrected = 0.05 / 20   # 0.0025 for 20 comparisons</pre>
  <div class="callout callout-tip">
    <strong>A healthy sentence</strong>
    <p>Write conclusions like: &ldquo;The lift was 1.2% with a 95% interval of 0.4% to 2.0% and p = 0.003 — modest but reliable.&rdquo; That sentence uses the interval, the p-value, and the effect size honestly.</p>
  </div>
  <div class="callout callout-info">
    <strong>Preregister when possible</strong>
    <p>Deciding the hypothesis after seeing the data quietly inflates false positives. Define the test and the success metric before you run it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000422',
  '02400000-0000-4000-8000-000000000322',
  1,
  'Correlation & Causation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Correlation & Causation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Correlation &amp; Causation</h1>
  <p>Correlation measures how two variables move together in your data. It is the first signal that a relationship exists — and the most dangerous number to over-interpret, because correlation alone never proves cause and effect.</p>
  <h2>The correlation coefficient</h2>
  <p>The Pearson coefficient <span class="ic">r</span> runs from -1 to +1:</p>
  <table>
    <tr><th>r value</th><th>Interpretation</th></tr>
    <tr><td>+1</td><td>perfect positive linear relationship</td></tr>
    <tr><td>0</td><td>no linear relationship</td></tr>
    <tr><td>-1</td><td>perfect negative linear relationship</td></tr>
  </table>
  <p>The sign gives the direction and the magnitude gives the strength. An r of 0.9 is strong, 0.3 is weak, and r only describes <em>linear</em> patterns.</p>
  <pre class="code-block">import numpy as np

x = np.array([1, 2, 3, 4, 5, 6, 7, 8])
y = np.array([2, 4, 6, 8, 10, 12, 14, 16]) + np.random.normal(0, 2, 8)

print(np.corrcoef(x, y)[0, 1])     # close to +1</pre>
  <h2>Always plot first</h2>
  <div class="callout">
    <strong>The Anscombe traps</strong>
    <p>The Anscombe quartet: four very different data clouds with identical means, correlation, and regression lines. One is a straight line, one is curved, one is hijacked by a single outlier, and one is a vertical strip. Only scatterplots reveal the truth.</p>
  </div>
  <h2>Correlation is not causation</h2>
  <ul>
    <li><strong>Confounding</strong> — a third variable drives both (ice cream and drownings share &ldquo;summer&rdquo;).</li>
    <li><strong>Reverse causation</strong> — the outcome causes the predictor (well-paid workers buy gym memberships).</li>
    <li><strong>Coincidence</strong> — many time series drift upward together with no link at all.</li>
  </ul>
  <h2>How causation gets established</h2>
  <p>Randomized experiments with a control group are the gold standard because randomization balances confounders. Observational studies must control and argue carefully. In both cases, replication decides the matter, not any single r.</p>
  <div class="callout callout-tip">
    <strong>Three questions per correlation</strong>
    <p>Is it linear? Is it driven by outliers? Is there a plausible confounder? Answer all three before writing a headline.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000423',
  '02400000-0000-4000-8000-000000000323',
  1,
  'Simple Linear Regression',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Simple Linear Regression</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Simple Linear Regression</h1>
  <p>Regression goes one step beyond correlation: it models the relationship as a formula so you can predict <span class="ic">y</span> from <span class="ic">x</span> and describe how much <span class="ic">y</span> changes per unit of <span class="ic">x</span>.</p>
  <h2>The model</h2>
  <pre class="code-block">y = b0 + b1 * x + error</pre>
  <p>where <span class="ic">b0</span> is the intercept (predicted y when x is zero) and <span class="ic">b1</span> is the slope (predicted change in y per one-unit change in x).</p>
  <h2>Fit by least squares</h2>
  <p>The line is chosen to minimize the sum of squared residuals — the vertical gaps between points and line. Squaring gives equal weight to positive and negative gaps and yields a unique, well-understood solution.</p>
  <h2>Reading a fitted model</h2>
  <pre class="code-block">import numpy as np

# marketing spend (x) and sales (y), in thousands
x = np.array([10, 15, 20, 25, 30, 35, 40])
y = np.array([22, 31, 33, 45, 51, 57, 63])

beta1, beta0 = np.polyfit(x, y, 1)
print(beta0, beta1)
# sales = 7.5 + 1.4 * spend  (roughly)
# 1 more unit of spend adds about 1.4 units of sales</pre>
  <h2>Goodness of fit</h2>
  <p><span class="ic">R-squared</span> (<span class="ic">R&sup2;</span>) is the share of the variation in y explained by the model, from 0 to 1. An R&sup2; of 0.85 means the line explains 85% of the variance in sales; the other 15% lives in the residuals.</p>
  <table>
    <tr><th>Diagnostic</th><th>What it checks</th></tr>
    <tr><td>Residual plot</td><td>no leftover curvature or funnel shape</td></tr>
    <tr><td>Outliers</td><td>points far above or below the line</td></tr>
    <tr><td>Extrapolation</td><td>predictions only inside the observed x range</td></tr>
  </table>
  <div class="callout">
    <strong>Watch the intercept</strong>
    <p>When x never reaches zero, the intercept is only a mathematical anchor, not a business fact. Report slopes — they survive recentering.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Regression needs a question</strong>
    <p>Choose x and y from your hypothesis, not by scanning every column pair. Regression finds a relationship in whatever you feed it, meaningful or not.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000425',
  '02400000-0000-4000-8000-000000000325',
  1,
  'Structuring a Data Analysis',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Structuring a Data Analysis</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Structuring a Data Analysis</h1>
  <p>A good analysis is a repeatable process, not a lucky discovery. This lesson lays out the workflow you will follow in the capstone: a clear question, an honest design, and a report someone can trust.</p>
  <h2>The five stages</h2>
  <ol>
    <li><strong>Question</strong> — a concrete, answerable problem with a measurable outcome.</li>
    <li><strong>Data</strong> — a dataset chosen or collected with a known sampling story.</li>
    <li><strong>Explore</strong> — distributions, missing values, and plots before any modeling.</li>
    <li><strong>Model</strong> — the statistical tool matched to the question and data type.</li>
    <li><strong>Report</strong> — the answer with its uncertainty, assumptions, and limits.</li>
  </ol>
  <div class="callout callout-info">
    <strong>Write the question down</strong>
    <p>A vague question (&ldquo;analyze the customers&rdquo;) produces a vague report. A precise one (&ldquo;do longer sessions predict higher spending?&rdquo;) selects the variables, the test, and the plot for you.</p>
  </div>
  <h2>Planning checklist</h2>
  <table>
    <tr><th>Check</th><th>Why it matters</th></tr>
    <tr><td>Unit of analysis</td><td>what a single row means</td></tr>
    <tr><td>Outcome variable</td><td>success defined before modeling</td></tr>
    <tr><td>Sample and frame</td><td>who is included and who is missing</td></tr>
    <tr><td>Analysis plan</td><td>which test or model, decided in advance</td></tr>
  </table>
  <h2>Repository discipline</h2>
  <pre class="code-block">analysis/
  00_read.py       # load and define paths
  01_clean.py      # types, missing data, outliers
  02_explore.py    # summaries and plots
  03_model.py      # test or regression
  04_report.py     # tables and figures</pre>
  <div class="callout callout-tip">
    <strong>Run order as a pipeline</strong>
    <p>Number the scripts so each stage reruns cleanly. Reproducibility is the difference between an analysis and a one-off anecdote.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000426',
  '02400000-0000-4000-8000-000000000326',
  1,
  'Exploratory Data Analysis',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exploratory Data Analysis</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Exploratory Data Analysis</h1>
  <p>Exploratory data analysis (EDA) is where statistics and judgment meet. Before any test, you describe the data, look for surprises, and decide whether your planned tool is even appropriate.</p>
  <h2>Start with the five-number survey</h2>
  <p>For every numeric column, capture <strong>min</strong>, <strong>Q1</strong>, <strong>median</strong>, <strong>Q3</strong>, and <strong>max</strong> — the five numbers behind a box plot.</p>
  <pre class="code-block">print(df.describe())       # count, mean, std, and the five numbers
df.hist(figsize=(10, 6))   # shape of each numeric column</pre>
  <h2>Checks before modeling</h2>
  <ul>
    <li><strong>Missing data</strong> — where, how much, and is it random?</li>
    <li><strong>Outliers</strong> — data errors or real extreme events?</li>
    <li><strong>Skewness</strong> — does a transform such as log belong first?</li>
    <li><strong>Dependency</strong> — do rows repeat or group by design?</li>
  </ul>
  <div class="callout">
    <strong>With and without</strong>
    <p>Classic check: compute your key summary with and without the outliers. If the conclusion flips, the summary was fragile — and that fragility needs reporting, not hiding.</p>
  </div>
  <h2>Pairwise relationships</h2>
  <pre class="code-block">import seaborn as sns
sns.pairplot(df)                      # scatter matrix of numeric columns</pre>
  <p>Pair plots expose curvature, funnels (heteroscedasticity), and nonlinear links that a single correlation number hides.</p>
  <h2>Match the tool to the data</h2>
  <table>
    <tr><th>Question</th><th>Type of data</th><th>Tool</th></tr>
    <tr><td>Is the mean different?</td><td>numeric outcome, two groups</td><td>t-test</td></tr>
    <tr><td>Are proportions different?</td><td>two proportions</td><td>proportion test</td></tr>
    <tr><td>Do two variables move together?</td><td>two numeric columns</td><td>correlation</td></tr>
    <tr><td>Predict y from x?</td><td>numeric outcome, numeric predictor</td><td>linear regression</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Keep an EDA punch list</strong>
    <p>Write every suspicion into a notes file. Ten small notes made during EDA are more valuable than one big model — they decide how you clean data before anyone reads a p-value.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02400000-0000-4000-8000-000000000427',
  '02400000-0000-4000-8000-000000000327',
  1,
  'Reporting & Communicating Results',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reporting & Communicating Results</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0d9488; padding-bottom: 10px; margin-bottom: 20px; }
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
  <h1>Reporting &amp; Communicating Results</h1>
  <p>An analysis nobody can act on is an analysis that did not happen. The final stage is translation: turn estimates, intervals, and p-values into a decision-ready story that respects the uncertainty underneath.</p>
  <h2>Lead with the answer</h2>
  <ul>
    <li>State the conclusion in the first sentence.</li>
    <li>Give the effect size, not just the p-value.</li>
    <li>Attach a confidence interval to every headline number.</li>
    <li>Save the methods detail for an appendix.</li>
  </ul>
  <h2>A before-and-after</h2>
  <pre class="code-block">Weak:  "p = 0.03, so the change is statistically significant."
Strong: "Conversion rose from 4.1% to 4.6% (95% interval
         4.3% to 4.9%, p = 0.03): a small but reliable lift."</pre>
  <h2>Number grammar</h2>
  <table>
    <tr><th>Do</th><th>Avoid</th></tr>
    <tr><td>mean 12.4, 95% CI 11.2 to 13.6</td><td>mean = 12.40 with fake precision</td></tr>
    <tr><td>say n = 480</td><td>hide the sample size</td></tr>
    <tr><td>report effect with caveats</td><td>report only significant or not</td></tr>
  </table>
  <h2>Charts that respect the data</h2>
  <ul>
    <li>Start bar charts at zero; truncated axes invent drama.</li>
    <li>Show the spread with error bars or box plots, never bare points.</li>
    <li>Label units, sample size, and the source on every figure.</li>
  </ul>
  <div class="callout">
    <strong>State assumptions out loud</strong>
    <p>Say what could break the conclusion: the sampling frame, missing segments, measurement drift, multiple tests. A limitations section costs one paragraph and protects your credibility for years.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Audience is the metric</strong>
    <p>Run the report past one person from the business side. If they can restate your recommendation, the report worked. If they quote the p-value back at you, it failed.</p>
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
  ('02400000-0000-4000-8000-000000000501', '02400000-0000-4000-8000-000000000303',
   'Which statement best describes a population in statistics?',
   'A population is the full set of units a conclusion is about; a sample is the measured subset.', 1),
  ('02400000-0000-4000-8000-000000000502', '02400000-0000-4000-8000-000000000303',
   'Which statement best describes the goal of inferential statistics?',
   'Inference uses sample evidence to draw conclusions about the larger population.', 2),
  ('02400000-0000-4000-8000-000000000503', '02400000-0000-4000-8000-000000000303',
   'Hair color recorded as brown, black, blonde, or red is which variable type?',
   'The categories have no natural order, so the variable is nominal categorical.', 3),
  ('02400000-0000-4000-8000-000000000504', '02400000-0000-4000-8000-000000000306',
   'Which measure of central tendency is most sensitive to extreme outliers?',
   'The mean uses every observation, so a single extreme value pulls it strongly.', 1),
  ('02400000-0000-4000-8000-000000000505', '02400000-0000-4000-8000-000000000306',
   'What does the interquartile range describe?',
   'The IQR spans the middle 50% of the data and resists outliers.', 2),
  ('02400000-0000-4000-8000-000000000506', '02400000-0000-4000-8000-000000000306',
   'In a right-skewed distribution, which relationship usually holds?',
   'The long tail pulls the mean above the median.', 3),
  ('02400000-0000-4000-8000-000000000507', '02400000-0000-4000-8000-000000000309',
   'Rolling a fair six-sided die, what is the probability of rolling a 4?',
   'One outcome out of six equally likely faces gives a probability of 1/6.', 1),
  ('02400000-0000-4000-8000-000000000508', '02400000-0000-4000-8000-000000000309',
   'Two events that cannot happen at the same time are called what?',
   'Mutually exclusive events cannot occur together.', 2),
  ('02400000-0000-4000-8000-000000000509', '02400000-0000-4000-8000-000000000309',
   'What does the notation P(A|B) represent?',
   'It reads as the probability of A given that B has occurred.', 3),
  ('02400000-0000-4000-8000-000000000510', '02400000-0000-4000-8000-000000000312',
   'Which distribution counts successes in a fixed number of independent trials?',
   'The binomial distribution counts yes or no outcomes over fixed trials.', 1),
  ('02400000-0000-4000-8000-000000000511', '02400000-0000-4000-8000-000000000312',
   'Which property must a valid probability distribution satisfy?',
   'The probabilities of all possible outcomes sum to 1.', 2),
  ('02400000-0000-4000-8000-000000000512', '02400000-0000-4000-8000-000000000312',
   'What are the mean and standard deviation of the standard normal distribution?',
   'The standard normal distribution has mean 0 and standard deviation 1.', 3),
  ('02400000-0000-4000-8000-000000000513', '02400000-0000-4000-8000-000000000315',
   'What does sampling without replacement mean?',
   'Each drawn item is removed, so the probabilities of later draws change.', 1),
  ('02400000-0000-4000-8000-000000000514', '02400000-0000-4000-8000-000000000315',
   'Why does random sampling help reduce bias?',
   'Random sampling gives every member a known chance of selection.', 2),
  ('02400000-0000-4000-8000-000000000515', '02400000-0000-4000-8000-000000000315',
   'What does the central limit theorem say about sample means as n grows?',
   'The sampling distribution of the mean approaches a normal distribution.', 3),
  ('02400000-0000-4000-8000-000000000516', '02400000-0000-4000-8000-000000000318',
   'What does the standard error of the mean measure?',
   'It measures how much sample means vary around the population mean.', 1),
  ('02400000-0000-4000-8000-000000000517', '02400000-0000-4000-8000-000000000318',
   'Which statement correctly describes a 95% confidence interval?',
   'In the long run, 95% of such intervals will contain the true parameter.', 2),
  ('02400000-0000-4000-8000-000000000518', '02400000-0000-4000-8000-000000000318',
   'How do you make a confidence interval narrower?',
   'A larger sample size shrinks the standard error and the margin of error.', 3),
  ('02400000-0000-4000-8000-000000000519', '02400000-0000-4000-8000-000000000321',
   'What does the null hypothesis typically claim?',
   'The null is the default claim that there is no effect or difference.', 1),
  ('02400000-0000-4000-8000-000000000520', '02400000-0000-4000-8000-000000000321',
   'When the p-value is below the significance level, you...',
   'A small p-value leads us to reject the null hypothesis.', 2),
  ('02400000-0000-4000-8000-000000000521', '02400000-0000-4000-8000-000000000321',
   'What does a statistically significant result indicate in practice?',
   'The observed result would be unusual if the null hypothesis were true.', 3),
  ('02400000-0000-4000-8000-000000000522', '02400000-0000-4000-8000-000000000324',
   'What does the correlation coefficient r measure?',
   'It summarizes the strength and direction of a linear relationship.', 1),
  ('02400000-0000-4000-8000-000000000523', '02400000-0000-4000-8000-000000000324',
   'A correlation coefficient near +1 indicates what?',
   'A value near 1 indicates a strong positive linear relationship.', 2),
  ('02400000-0000-4000-8000-000000000524', '02400000-0000-4000-8000-000000000324',
   'What cannot be concluded from correlation alone?',
   'Correlation alone cannot establish a cause and effect link.', 3),
  ('02400000-0000-4000-8000-000000000525', '02400000-0000-4000-8000-000000000328',
   'What does a histogram reveal most directly?',
   'Histograms reveal the shape, center, and spread of a single variable.', 1),
  ('02400000-0000-4000-8000-000000000526', '02400000-0000-4000-8000-000000000328',
   'Which tool connects sample evidence to a claim about the population?',
   'Confidence intervals and hypothesis tests make the link from sample to population.', 2),
  ('02400000-0000-4000-8000-000000000527', '02400000-0000-4000-8000-000000000328',
   'Why is the IQR robust to extreme values?',
   'It ignores the outer 25% on each side, so extreme values have limited influence.', 3),
  ('02400000-0000-4000-8000-000000000528', '02400000-0000-4000-8000-000000000328',
   'What happens to the standard error as the sample size increases?',
   'Larger samples produce smaller standard errors and narrower intervals.', 4),
  ('02400000-0000-4000-8000-000000000529', '02400000-0000-4000-8000-000000000328',
   'After an experiment, the p-value is 0.01 and alpha is 0.05. What is the decision?',
   'A small p-value makes the result unlikely to be chance, so we reject the null.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): population definition
  ('02400000-0000-4000-8000-000000001001', '02400000-0000-4000-8000-000000000501', 'Every individual or unit a question is about', TRUE,  1),
  ('02400000-0000-4000-8000-000000001002', '02400000-0000-4000-8000-000000000501', 'A random subset of a larger group', FALSE, 2),
  ('02400000-0000-4000-8000-000000001003', '02400000-0000-4000-8000-000000000501', 'The rows of a spreadsheet', FALSE, 3),
  ('02400000-0000-4000-8000-000000001004', '02400000-0000-4000-8000-000000000501', 'Only the data that was actually measured', FALSE, 4),
  -- Q1 (501) q2: inferential goal
  ('02400000-0000-4000-8000-000000001005', '02400000-0000-4000-8000-000000000502', 'It only summarizes collected data', FALSE, 1),
  ('02400000-0000-4000-8000-000000001006', '02400000-0000-4000-8000-000000000502', 'It converts data into charts', FALSE, 2),
  ('02400000-0000-4000-8000-000000001007', '02400000-0000-4000-8000-000000000502', 'It draws conclusions about a population from a sample', TRUE,  3),
  ('02400000-0000-4000-8000-000000001008', '02400000-0000-4000-8000-000000000502', 'It removes all measurement error', FALSE, 4),
  -- Q1 (501) q3: hair color type
  ('02400000-0000-4000-8000-000000001009', '02400000-0000-4000-8000-000000000503', 'Continuous numeric', FALSE, 1),
  ('02400000-0000-4000-8000-000000001010', '02400000-0000-4000-8000-000000000503', 'Categorical (nominal)', TRUE,  2),
  ('02400000-0000-4000-8000-000000001011', '02400000-0000-4000-8000-000000000503', 'Discrete numeric', FALSE, 3),
  ('02400000-0000-4000-8000-000000001012', '02400000-0000-4000-8000-000000000503', 'Ratio scale', FALSE, 4),
  -- Q2 (504): outlier-sensitive
  ('02400000-0000-4000-8000-000000001013', '02400000-0000-4000-8000-000000000504', 'The median', FALSE, 1),
  ('02400000-0000-4000-8000-000000001014', '02400000-0000-4000-8000-000000000504', 'The mode', FALSE, 2),
  ('02400000-0000-4000-8000-000000001015', '02400000-0000-4000-8000-000000000504', 'The midpoint', FALSE, 3),
  ('02400000-0000-4000-8000-000000001016', '02400000-0000-4000-8000-000000000504', 'The mean', TRUE,  4),
  -- Q2 (504) q2: IQR
  ('02400000-0000-4000-8000-000000001017', '02400000-0000-4000-8000-000000000505', 'The spread of the middle 50% of observations', TRUE,  1),
  ('02400000-0000-4000-8000-000000001018', '02400000-0000-4000-8000-000000000505', 'The smallest value in the dataset', FALSE, 2),
  ('02400000-0000-4000-8000-000000001019', '02400000-0000-4000-8000-000000000505', 'The average distance from the mean', FALSE, 3),
  ('02400000-0000-4000-8000-000000001020', '02400000-0000-4000-8000-000000000505', 'The most frequent value', FALSE, 4),
  -- Q2 (504) q3: right skew
  ('02400000-0000-4000-8000-000000001021', '02400000-0000-4000-8000-000000000506', 'The median is larger than the mean', FALSE, 1),
  ('02400000-0000-4000-8000-000000001022', '02400000-0000-4000-8000-000000000506', 'The median equals the mean', FALSE, 2),
  ('02400000-0000-4000-8000-000000001023', '02400000-0000-4000-8000-000000000506', 'The mean is typically larger than the median', TRUE,  3),
  ('02400000-0000-4000-8000-000000001024', '02400000-0000-4000-8000-000000000506', 'The mode is always zero', FALSE, 4),
  -- Q3 (507): die roll
  ('02400000-0000-4000-8000-000000001025', '02400000-0000-4000-8000-000000000507', 'One in two (0.5)', FALSE, 1),
  ('02400000-0000-4000-8000-000000001026', '02400000-0000-4000-8000-000000000507', 'One in six (about 0.167)', TRUE,  2),
  ('02400000-0000-4000-8000-000000001027', '02400000-0000-4000-8000-000000000507', 'One in four (0.25)', FALSE, 3),
  ('02400000-0000-4000-8000-000000001028', '02400000-0000-4000-8000-000000000507', 'One in three (about 0.333)', FALSE, 4),
  -- Q3 (507) q2: mutually exclusive
  ('02400000-0000-4000-8000-000000001029', '02400000-0000-4000-8000-000000000508', 'Independent events', FALSE, 1),
  ('02400000-0000-4000-8000-000000001030', '02400000-0000-4000-8000-000000000508', 'Complementary events', FALSE, 2),
  ('02400000-0000-4000-8000-000000001031', '02400000-0000-4000-8000-000000000508', 'Conditional events', FALSE, 3),
  ('02400000-0000-4000-8000-000000001032', '02400000-0000-4000-8000-000000000508', 'Mutually exclusive events', TRUE,  4),
  -- Q3 (507) q3: P(A|B)
  ('02400000-0000-4000-8000-000000001033', '02400000-0000-4000-8000-000000000509', 'The probability of A given that B occurred', TRUE,  1),
  ('02400000-0000-4000-8000-000000001034', '02400000-0000-4000-8000-000000000509', 'The probability that A and B both occur', FALSE, 2),
  ('02400000-0000-4000-8000-000000001035', '02400000-0000-4000-8000-000000000509', 'The probability that neither occurs', FALSE, 3),
  ('02400000-0000-4000-8000-000000001036', '02400000-0000-4000-8000-000000000509', 'The probability of B given A', FALSE, 4),
  -- Q4 (510): binomial
  ('02400000-0000-4000-8000-000000001037', '02400000-0000-4000-8000-000000000510', 'The normal distribution', FALSE, 1),
  ('02400000-0000-4000-8000-000000001038', '02400000-0000-4000-8000-000000000510', 'The uniform distribution', FALSE, 2),
  ('02400000-0000-4000-8000-000000001039', '02400000-0000-4000-8000-000000000510', 'The binomial distribution', TRUE,  3),
  ('02400000-0000-4000-8000-000000001040', '02400000-0000-4000-8000-000000000510', 'The t distribution', FALSE, 4),
  -- Q4 (510) q2: valid distribution
  ('02400000-0000-4000-8000-000000001041', '02400000-0000-4000-8000-000000000511', 'Every probability is different for each outcome', FALSE, 1),
  ('02400000-0000-4000-8000-000000001042', '02400000-0000-4000-8000-000000000511', 'The probabilities of all outcomes sum to 1', TRUE,  2),
  ('02400000-0000-4000-8000-000000001043', '02400000-0000-4000-8000-000000000511', 'Probabilities can exceed 1 when n is large', FALSE, 3),
  ('02400000-0000-4000-8000-000000001044', '02400000-0000-4000-8000-000000000511', 'The sum of probabilities is always 0.5', FALSE, 4),
  -- Q4 (510) q3: standard normal
  ('02400000-0000-4000-8000-000000001045', '02400000-0000-4000-8000-000000000512', 'Mean 1 and standard deviation 0', FALSE, 1),
  ('02400000-0000-4000-8000-000000001046', '02400000-0000-4000-8000-000000000512', 'Mean 100 and standard deviation 15', FALSE, 2),
  ('02400000-0000-4000-8000-000000001047', '02400000-0000-4000-8000-000000000512', 'Mean 0 and standard deviation 0.5', FALSE, 3),
  ('02400000-0000-4000-8000-000000001048', '02400000-0000-4000-8000-000000000512', 'Mean 0 and standard deviation 1', TRUE,  4),
  -- Q5 (513): without replacement
  ('02400000-0000-4000-8000-000000001049', '02400000-0000-4000-8000-000000000513', 'Each drawn item is removed, so later draws change', TRUE,  1),
  ('02400000-0000-4000-8000-000000001050', '02400000-0000-4000-8000-000000000513', 'The same item can be chosen repeatedly', FALSE, 2),
  ('02400000-0000-4000-8000-000000001051', '02400000-0000-4000-8000-000000000513', 'Every draw is fully independent', FALSE, 3),
  ('02400000-0000-4000-8000-000000001052', '02400000-0000-4000-8000-000000000513', 'The sample order never matters', FALSE, 4),
  -- Q5 (513) q2: random sampling bias
  ('02400000-0000-4000-8000-000000001053', '02400000-0000-4000-8000-000000000514', 'It guarantees the sample matches the population exactly', FALSE, 1),
  ('02400000-0000-4000-8000-000000001054', '02400000-0000-4000-8000-000000000514', 'It removes the need for large samples', FALSE, 2),
  ('02400000-0000-4000-8000-000000001055', '02400000-0000-4000-8000-000000000514', 'It gives every member a known chance of selection', TRUE,  3),
  ('02400000-0000-4000-8000-000000001056', '02400000-0000-4000-8000-000000000514', 'It always produces no outliers', FALSE, 4),
  -- Q5 (513) q3: CLT
  ('02400000-0000-4000-8000-000000001057', '02400000-0000-4000-8000-000000000515', 'It always stays right-skewed', FALSE, 1),
  ('02400000-0000-4000-8000-000000001058', '02400000-0000-4000-8000-000000000515', 'It becomes bimodal', FALSE, 2),
  ('02400000-0000-4000-8000-000000001059', '02400000-0000-4000-8000-000000000515', 'It approaches a normal distribution', TRUE,  3),
  ('02400000-0000-4000-8000-000000001060', '02400000-0000-4000-8000-000000000515', 'It matches the population shape exactly', FALSE, 4),
  -- Q6 (516): standard error
  ('02400000-0000-4000-8000-000000001061', '02400000-0000-4000-8000-000000000516', 'The spread of the raw data values', FALSE, 1),
  ('02400000-0000-4000-8000-000000001062', '02400000-0000-4000-8000-000000000516', 'The bias of the estimator', FALSE, 2),
  ('02400000-0000-4000-8000-000000001063', '02400000-0000-4000-8000-000000000516', 'The size of the population', FALSE, 3),
  ('02400000-0000-4000-8000-000000001064', '02400000-0000-4000-8000-000000000516', 'How much sample means vary around the true mean', TRUE,  4),
  -- Q6 (516) q2: 95% CI
  ('02400000-0000-4000-8000-000000001065', '02400000-0000-4000-8000-000000000517', 'About 95% of repeated-sample intervals contain the parameter', TRUE,  1),
  ('02400000-0000-4000-8000-000000001066', '02400000-0000-4000-8000-000000000517', '95% of the data values fall inside it', FALSE, 2),
  ('02400000-0000-4000-8000-000000001067', '02400000-0000-4000-8000-000000000517', 'Every sample produces 95 valid intervals', FALSE, 3),
  ('02400000-0000-4000-8000-000000001068', '02400000-0000-4000-8000-000000000517', 'The interval is always wider than a 99% interval', FALSE, 4),
  -- Q6 (516) q3: narrower interval
  ('02400000-0000-4000-8000-000000001069', '02400000-0000-4000-8000-000000000518', 'Decrease the sample size', FALSE, 1),
  ('02400000-0000-4000-8000-000000001070', '02400000-0000-4000-8000-000000000518', 'Raise the confidence level', FALSE, 2),
  ('02400000-0000-4000-8000-000000001071', '02400000-0000-4000-8000-000000000518', 'Increase the sample size', TRUE,  3),
  ('02400000-0000-4000-8000-000000001072', '02400000-0000-4000-8000-000000000518', 'Remove the standard error entirely', FALSE, 4),
  -- Q7 (519): null hypothesis
  ('02400000-0000-4000-8000-000000001073', '02400000-0000-4000-8000-000000000519', 'The suspected effect is real', FALSE, 1),
  ('02400000-0000-4000-8000-000000001074', '02400000-0000-4000-8000-000000000519', 'There is no effect or no difference', TRUE,  2),
  ('02400000-0000-4000-8000-000000001075', '02400000-0000-4000-8000-000000000519', 'The sample was collected perfectly', FALSE, 3),
  ('02400000-0000-4000-8000-000000001076', '02400000-0000-4000-8000-000000000519', 'The p-value will always be large', FALSE, 4),
  -- Q7 (519) q2: small p
  ('02400000-0000-4000-8000-000000001077', '02400000-0000-4000-8000-000000000520', 'Accept the alternative unconditionally', FALSE, 1),
  ('02400000-0000-4000-8000-000000001078', '02400000-0000-4000-8000-000000000520', 'Reject the null hypothesis', TRUE,  2),
  ('02400000-0000-4000-8000-000000001079', '02400000-0000-4000-8000-000000000520', 'Double the sample size', FALSE, 3),
  ('02400000-0000-4000-8000-000000001080', '02400000-0000-4000-8000-000000000520', 'Ignore the p-value', FALSE, 4),
  -- Q7 (519) q3: significance
  ('02400000-0000-4000-8000-000000001081', '02400000-0000-4000-8000-000000000521', 'The result is unlikely if the null were true', TRUE,  1),
  ('02400000-0000-4000-8000-000000001082', '02400000-0000-4000-8000-000000000521', 'The effect is certainly caused by the treatment', FALSE, 2),
  ('02400000-0000-4000-8000-000000001083', '02400000-0000-4000-8000-000000000521', 'The p-value equals the effect size', FALSE, 3),
  ('02400000-0000-4000-8000-000000001084', '02400000-0000-4000-8000-000000000521', 'No further studies are needed', FALSE, 4),
  -- Q8 (522): r measures
  ('02400000-0000-4000-8000-000000001085', '02400000-0000-4000-8000-000000000522', 'Whether the relationship is causal', FALSE, 1),
  ('02400000-0000-4000-8000-000000001086', '02400000-0000-4000-8000-000000000522', 'The slope of any curve', FALSE, 2),
  ('02400000-0000-4000-8000-000000001087', '02400000-0000-4000-8000-000000000522', 'Strength and direction of a linear relationship', TRUE,  3),
  ('02400000-0000-4000-8000-000000001088', '02400000-0000-4000-8000-000000000522', 'The mean difference between two groups', FALSE, 4),
  -- Q8 (522) q2: r near 1
  ('02400000-0000-4000-8000-000000001089', '02400000-0000-4000-8000-000000000523', 'A weak negative relationship', FALSE, 1),
  ('02400000-0000-4000-8000-000000001090', '02400000-0000-4000-8000-000000000523', 'A strong positive linear relationship', TRUE,  2),
  ('02400000-0000-4000-8000-000000001091', '02400000-0000-4000-8000-000000000523', 'No relationship at all', FALSE, 3),
  ('02400000-0000-4000-8000-000000001092', '02400000-0000-4000-8000-000000000523', 'A perfect negative relationship', FALSE, 4),
  -- Q8 (522) q3: correlation is not causation
  ('02400000-0000-4000-8000-000000001093', '02400000-0000-4000-8000-000000000524', 'Independent variables', FALSE, 1),
  ('02400000-0000-4000-8000-000000001094', '02400000-0000-4000-8000-000000000524', 'Confounding variables', FALSE, 2),
  ('02400000-0000-4000-8000-000000001095', '02400000-0000-4000-8000-000000000524', 'The regression intercept', FALSE, 3),
  ('02400000-0000-4000-8000-000000001096', '02400000-0000-4000-8000-000000000524', 'Causation', TRUE,  4),
  -- Q9 (525): histogram
  ('02400000-0000-4000-8000-000000001097', '02400000-0000-4000-8000-000000000525', 'The shape of the distribution', TRUE,  1),
  ('02400000-0000-4000-8000-000000001098', '02400000-0000-4000-8000-000000000525', 'The exact value of every observation', FALSE, 2),
  ('02400000-0000-4000-8000-000000001099', '02400000-0000-4000-8000-000000000525', 'Whether two variables correlate', FALSE, 3),
  ('02400000-0000-4000-8000-000000001100', '02400000-0000-4000-8000-000000000525', 'The p-value of a test', FALSE, 4),
  -- Q9 (525) q2: inference tools
  ('02400000-0000-4000-8000-000000001101', '02400000-0000-4000-8000-000000000526', 'A bar chart of raw counts', FALSE, 1),
  ('02400000-0000-4000-8000-000000001102', '02400000-0000-4000-8000-000000000526', 'The raw standard deviation only', FALSE, 2),
  ('02400000-0000-4000-8000-000000001103', '02400000-0000-4000-8000-000000000526', 'A confidence interval or hypothesis test', TRUE,  3),
  ('02400000-0000-4000-8000-000000001104', '02400000-0000-4000-8000-000000000526', 'Sorting the data alphabetically', FALSE, 4),
  -- Q9 (525) q3: IQR robust
  ('02400000-0000-4000-8000-000000001105', '02400000-0000-4000-8000-000000000527', 'It ignores the median', FALSE, 1),
  ('02400000-0000-4000-8000-000000001106', '02400000-0000-4000-8000-000000000527', 'It focuses on the middle 50% of the data', TRUE,  2),
  ('02400000-0000-4000-8000-000000001107', '02400000-0000-4000-8000-000000000527', 'It always equals the variance', FALSE, 3),
  ('02400000-0000-4000-8000-000000001108', '02400000-0000-4000-8000-000000000527', 'It removes skewness completely', FALSE, 4),
  -- Q9 (525) q4: larger n
  ('02400000-0000-4000-8000-000000001109', '02400000-0000-4000-8000-000000000528', 'Increases bias in the estimate', FALSE, 1),
  ('02400000-0000-4000-8000-000000001110', '02400000-0000-4000-8000-000000000528', 'Always cuts the confidence level', FALSE, 2),
  ('02400000-0000-4000-8000-000000001111', '02400000-0000-4000-8000-000000000528', 'Has no effect on the estimate', FALSE, 3),
  ('02400000-0000-4000-8000-000000001112', '02400000-0000-4000-8000-000000000528', 'Shrinks the standard error and narrows intervals', TRUE,  4),
  -- Q9 (525) q5: final decision
  ('02400000-0000-4000-8000-000000001113', '02400000-0000-4000-8000-000000000529', 'Accept the alternative as proven', FALSE, 1),
  ('02400000-0000-4000-8000-000000001114', '02400000-0000-4000-8000-000000000529', 'Reject the null and treat the effect as unlikely to be chance', TRUE,  2),
  ('02400000-0000-4000-8000-000000001115', '02400000-0000-4000-8000-000000000529', 'Conclude the p-value is irrelevant', FALSE, 3),
  ('02400000-0000-4000-8000-000000001116', '02400000-0000-4000-8000-000000000529', 'Automatically endorse the bigger effect size', FALSE, 4)
ON CONFLICT (id) DO NOTHING;