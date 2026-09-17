-- ============================================================================
-- SEED 026: Complete course — "Data Visualization with Matplotlib & Seaborn"
-- ----------------------------------------------------------------------------
-- Instructor : Anita Patel       (10000000-0000-4000-8000-000000000003)
-- Category   : Data Science      (20000000-0000-4000-8000-000000000003)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Matplotlib Foundations          → C1 The Pyplot Interface · C2 Basic Plot Types
--   M2 Customization & Layout          → C3 Styling, Colors & Themes · C4 Subplots & Layouts
--   M3 Statistical Viz with Seaborn    → C5 Distributions · C6 Relational & Categorical Plots
--   M4 Advanced Visualizations         → C7 Heatmaps & Pair Grids · C8 Time Series & Annotation
--   M5 Capstone: Data Report Dashboard → C9 Dashboard Design · C10 Building & Polishing
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
  '01A00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000003',
  '20000000-0000-4000-8000-000000000003',
  'Data Visualization with Matplotlib & Seaborn',
  'data-visualization-matplotlib-seaborn',
  'Turn raw data into insight. Master the Matplotlib figure and axes model, build line, bar, and scatter charts, style them for clarity and accessibility, layer in Seaborn for statistical plots, and assemble a complete multi-panel data report dashboard.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  24
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01A00000-0000-4000-8000-000000000011', '01A00000-0000-4000-8000-000000000001', 'Build charts with the Matplotlib pyplot interface: line, bar, scatter, and histogram plots.', 1),
  ('01A00000-0000-4000-8000-000000000012', '01A00000-0000-4000-8000-000000000001', 'Explain the figure and axes anatomy and control titles, labels, legends, spines, and ticks.', 2),
  ('01A00000-0000-4000-8000-000000000013', '01A00000-0000-4000-8000-000000000001', 'Style and color charts with themes, palettes, and colormaps for clarity and accessibility.', 3),
  ('01A00000-0000-4000-8000-000000000014', '01A00000-0000-4000-8000-000000000001', 'Layer statistical plots with Seaborn: distributions, categorical charts, heatmaps, and pair grids.', 4),
  ('01A00000-0000-4000-8000-000000000015', '01A00000-0000-4000-8000-000000000001', 'Assemble a polished multi-panel data report dashboard with time series and clear annotations.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01A00000-0000-4000-8000-000000000101', '01A00000-0000-4000-8000-000000000001', 1, 'Matplotlib Foundations',                'Master the pyplot interface and the figure and axes object model.',        'PUBLISHED'),
  ('01A00000-0000-4000-8000-000000000102', '01A00000-0000-4000-8000-000000000001', 2, 'Customization & Layout',                'Style, color, and arrange charts into clean, shareable layouts.',           'PUBLISHED'),
  ('01A00000-0000-4000-8000-000000000103', '01A00000-0000-4000-8000-000000000001', 3, 'Statistical Visualization with Seaborn', 'Reveal distributions, relationships, and categories with high-level plots.','PUBLISHED'),
  ('01A00000-0000-4000-8000-000000000104', '01A00000-0000-4000-8000-000000000001', 4, 'Advanced Visualizations',               'Correlations, pair grids, and annotated time series.',                     'PUBLISHED'),
  ('01A00000-0000-4000-8000-000000000105', '01A00000-0000-4000-8000-000000000001', 5, 'Capstone: Data Report Dashboard',        'Plan, build, and export a complete multi-panel dashboard.',                'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01A00000-0000-4000-8000-000000000201', '01A00000-0000-4000-8000-000000000101', 1, 'The Pyplot Interface',         'Two lines of code produce your first chart.',        'PUBLISHED'),
  ('01A00000-0000-4000-8000-000000000202', '01A00000-0000-4000-8000-000000000101', 2, 'Basic Plot Types',             'Line, bar, and scatter: the backbone of exploration.', 'PUBLISHED'),
  ('01A00000-0000-4000-8000-000000000203', '01A00000-0000-4000-8000-000000000102', 1, 'Styling, Colors & Themes',     'Control every visual detail with styles and palettes.', 'PUBLISHED'),
  ('01A00000-0000-4000-8000-000000000204', '01A00000-0000-4000-8000-000000000102', 2, 'Subplots & Layouts',           'Grids, shared axes, and panels that tell a story.',   'PUBLISHED'),
  ('01A00000-0000-4000-8000-000000000205', '01A00000-0000-4000-8000-000000000103', 1, 'Distributions',                'Histograms, KDE, box and violin plots for single and grouped data.', 'PUBLISHED'),
  ('01A00000-0000-4000-8000-000000000206', '01A00000-0000-4000-8000-000000000103', 2, 'Relational & Categorical Plots', 'Scatter, trend lines, and categorical encodings.',   'PUBLISHED'),
  ('01A00000-0000-4000-8000-000000000207', '01A00000-0000-4000-8000-000000000104', 1, 'Heatmaps & Pair Grids',        'Matrices of color and multi-variable overviews.',     'PUBLISHED'),
  ('01A00000-0000-4000-8000-000000000208', '01A00000-0000-4000-8000-000000000104', 2, 'Time Series & Annotation',     'Trends over time with targeted highlights.',          'PUBLISHED'),
  ('01A00000-0000-4000-8000-000000000209', '01A00000-0000-4000-8000-000000000105', 1, 'Dashboard Design',             'Plan the structure before you write code.',           'PUBLISHED'),
  ('01A00000-0000-4000-8000-000000000210', '01A00000-0000-4000-8000-000000000105', 2, 'Building & Polishing',         'Assemble, tune, and export a final deliverable.',     'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01A00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01A00000-0000-4000-8000-000000000301', '01A00000-0000-4000-8000-000000000201', 1, 'What is Matplotlib?',            'See the full pipeline from data to a chart with pyplot.',                    'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10,  5),
  ('01A00000-0000-4000-8000-000000000302', '01A00000-0000-4000-8000-000000000201', 2, 'Figure & Axes Anatomy',           'Tear down a matplotlib chart into its constituent parts.',                   'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000303', '01A00000-0000-4000-8000-000000000201', 3, 'Matplotlib Foundations Quiz',     'Check your understanding of the pyplot interface.',                          'QUIZ', 'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01A00000-0000-4000-8000-000000000304', '01A00000-0000-4000-8000-000000000202', 1, 'Line Plots',                      'Plot trends with plt.plot and tune every detail.',                           'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000305', '01A00000-0000-4000-8000-000000000202', 2, 'Bar Plots',                       'Compare categories with vertical, horizontal, grouped, and stacked bars.',   'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000306', '01A00000-0000-4000-8000-000000000202', 3, 'Basic Plot Types Quiz',           'Test what you know about line and bar charts.',                              'QUIZ', 'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01A00000-0000-4000-8000-000000000307', '01A00000-0000-4000-8000-000000000203', 1, 'Styling & Themes',                'Use styles, rcParams, and object-oriented settings for consistent charts.',  'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000308', '01A00000-0000-4000-8000-000000000203', 2, 'Colors & Colormaps',              'Pick palettes, map values to colors, and keep charts accessible.',           'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000309', '01A00000-0000-4000-8000-000000000203', 3, 'Styling & Color Quiz',            'Verify your styling and color knowledge.',                                   'QUIZ', 'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01A00000-0000-4000-8000-000000000310', '01A00000-0000-4000-8000-000000000204', 1, 'Subplots & Grids',                'Arrange multiple charts with plt.subplots.',                                 'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000311', '01A00000-0000-4000-8000-000000000204', 2, 'Advanced Layouts',                'GridSpec, shared axes, insets, and spacing tricks.',                         'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('01A00000-0000-4000-8000-000000000312', '01A00000-0000-4000-8000-000000000204', 3, 'Subplots & Layout Quiz',          'Check your multi-panel skills.',                                             'QUIZ', 'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01A00000-0000-4000-8000-000000000313', '01A00000-0000-4000-8000-000000000205', 1, 'Histograms & Distributions',      'Understand shape and spread with histograms and KDE curves.',                'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000314', '01A00000-0000-4000-8000-000000000205', 2, 'Box & Violin Plots',              'Summarize distributions with quartiles and density shapes.',                 'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000315', '01A00000-0000-4000-8000-000000000205', 3, 'Distributions Quiz',              'Test your distribution knowledge.',                                           'QUIZ', 'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01A00000-0000-4000-8000-000000000316', '01A00000-0000-4000-8000-000000000206', 1, 'Scatter & Relational Plots',      'Reveal relationships, clusters, and outliers.',                              'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000317', '01A00000-0000-4000-8000-000000000206', 2, 'Seaborn Categorical Plots',       'Bar, count, and point plots that work with categories.',                     'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000318', '01A00000-0000-4000-8000-000000000206', 3, 'Relational & Categorical Quiz',   'Check your relational and categorical skills.',                              'QUIZ', 'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01A00000-0000-4000-8000-000000000319', '01A00000-0000-4000-8000-000000000207', 1, 'Heatmaps & Correlation',          'Show matrix values and correlations in color.',                              'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000320', '01A00000-0000-4000-8000-000000000207', 2, 'Pair Plots & Facet Grids',        'Multi-variable overviews in a single figure.',                               'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('01A00000-0000-4000-8000-000000000321', '01A00000-0000-4000-8000-000000000207', 3, 'Heatmap & Pair Grid Quiz',        'Test your matrix and grid knowledge.',                                       'QUIZ', 'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01A00000-0000-4000-8000-000000000322', '01A00000-0000-4000-8000-000000000208', 1, 'Time Series Visualization',       'Plot dates, resample, and read trends.',                                     'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000323', '01A00000-0000-4000-8000-000000000208', 2, 'Annotations & Fine-Tuning',       'Titles, arrows, text, and tick formatting.',                                 'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000324', '01A00000-0000-4000-8000-000000000208', 3, 'Time Series & Annotation Quiz',   'Check your time series and annotation skills.',                              'QUIZ', 'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01A00000-0000-4000-8000-000000000325', '01A00000-0000-4000-8000-000000000209', 1, 'Designing a Dashboard',           'Plan panels, hierarchy, and color before you write code.',                   'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01A00000-0000-4000-8000-000000000326', '01A00000-0000-4000-8000-000000000210', 1, 'Building the Capstone Dashboard', 'Compose the full multi-panel report with Matplotlib and Seaborn.',           'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('01A00000-0000-4000-8000-000000000327', '01A00000-0000-4000-8000-000000000210', 2, 'Polishing, Exporting & Sharing',  'Tune DPI, exports, and encoding for delivery.',                              'TEXT', 'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01A00000-0000-4000-8000-000000000328', '01A00000-0000-4000-8000-000000000210', 3, 'Final Assessment',                'Prove what you learned across the whole course.',                            'QUIZ', 'PUBLISHED', 'SUBSCRIPTION', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01A00000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01A00000-0000-4000-8000-000000000401',
  '01A00000-0000-4000-8000-000000000301',
  1,
  'What is Matplotlib?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is Matplotlib?</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is Matplotlib?</h1>
  <p>Matplotlib is the foundational plotting library for Python. It gives you total control over every element of a chart: the canvas, the axes, the ticks, the colors, even the arrowheads on annotations. Seaborn builds on top of it, which is why this course starts with the lower-level library.</p>
  <h2>Why learn Matplotlib first</h2>
  <p>Almost every plotting tool in the Python ecosystem eventually draws on Matplotlib. Pandas uses it behind the scenes for <span class="ic">DataFrame.plot()</span>, and Seaborn returns a Matplotlib <span class="ic">Axes</span> object that you can refine afterwards. Master the base layer and everything above becomes easy to customize.</p>
  <h2>Minimal example</h2>
  <p>Plotting follows a three-step recipe: prepare data, choose a plot, then show it.</p>
  <pre class="code-block">import matplotlib.pyplot as plt

months = ['Jan', 'Feb', 'Mar', 'Apr']
sales  = [120, 145, 132, 168]

plt.plot(months, sales, marker='o')
plt.title('Monthly Sales')
plt.show()</pre>
  <div class="callout callout-tip">
    <strong>Two interfaces</strong>
    <p>The snippet above uses the pyplot interface — Matplotlib tracks a "current" figure for you. In the next lesson you will meet the object-oriented style (<span class="ic">fig, ax = plt.subplots()</span>), which is the one to use for anything more than a quick sketch.</p>
  </div>
  <h2>What you will be able to draw</h2>
  <ul>
    <li>Line plots for trends over time.</li>
    <li>Bar plots to compare categories.</li>
    <li>Histograms and KDE curves for distributions.</li>
    <li>Scatter plots for relationships between variables.</li>
    <li>Heatmaps for correlation matrices.</li>
  </ul>
  <h2>How this course is organised</h2>
  <table>
    <tr><th>Module</th><th>You will learn to</th></tr>
    <tr><td>1. Matplotlib Foundations</td><td>Figures, axes, and the basic plot types.</td></tr>
    <tr><td>2. Customization &amp; Layout</td><td>Style, color, and multi-panel grids.</td></tr>
    <tr><td>3. Seaborn Statistics</td><td>Distributions, categoricals, relationships.</td></tr>
    <tr><td>4. Advanced</td><td>Pair grids, time series, annotations.</td></tr>
    <tr><td>5. Capstone</td><td>Build and export a data report dashboard.</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Prerequisite</strong>
    <p>You need Python fundamentals and basic pandas (DataFrames, columns, <span class="ic">groupby</span>). No previous plotting experience is required.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000402',
  '01A00000-0000-4000-8000-000000000302',
  1,
  'Figure & Axes Anatomy',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Figure & Axes Anatomy</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Figure &amp; Axes Anatomy</h1>
  <p>Every Matplotlib chart is a <strong>Figure</strong> that contains one or more <strong>Axes</strong>. The figure is the whole canvas — the outer container that includes margins and any global title. The axes is the plotting area: the region with ticks, spines, labels, and the data itself.</p>
  <h2>Two objects, two jobs</h2>
  <table>
    <tr><th>Object</th><th>Responsibility</th><th>You create it with</th></tr>
    <tr><td>Figure</td><td>Canvas, size, layout, global title</td><td><span class="ic">plt.figure()</span></td></tr>
    <tr><td>Axes</td><td>Data, ticks, spines, labels, legend</td><td><span class="ic">fig.add_subplot()</span></td></tr>
  </table>
  <div class="callout">
    <strong>Axes is not axis</strong>
    <p>A single <span class="ic">Axes</span> object holds an x-axis <em>and</em> a y-axis together with everything drawn between them. "Axis" refers to one coordinate line.</p>
  </div>
  <h2>Create them explicitly</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(8, 4))

ax.plot([1, 4, 9, 16], marker='o')
ax.set_title('Squares of 1 to 4')
ax.set_xlabel('Index')
ax.set_ylabel('Squared value')
plt.show()</pre>
  <p><span class="ic">plt.subplots()</span> returns the figure and its axes in one call — the most common way to work. For a single chart you already get a ready-made axes; for many charts you receive an array (covered in Module 2).</p>
  <h2>The parts of an Axes</h2>
  <ul>
    <li><strong>Title</strong> — headline text above the plot area.</li>
    <li><strong>Axis labels</strong> — <span class="ic">xlabel</span> and <span class="ic">ylabel</span> describe what you are measuring.</li>
    <li><strong>Ticks</strong> — small marks along each axis; tick labels display the values.</li>
    <li><strong>Spines</strong> — the four lines framing the plot area (top, bottom, left, right).</li>
    <li><strong>Legend</strong> — the key linking colors or markers to data series.</li>
    <li><strong>Grid</strong> — optional guide lines that make values easier to read.</li>
  </ul>
  <h2>Addressing the parts</h2>
  <pre class="code-block">ax.spines['top'].set_visible(False)      # remove the top border
ax.spines['right'].set_visible(False)    # and the right border
ax.grid(True, linestyle='--', alpha=0.4) # dashed guide lines
ax.tick_params(axis='x', rotation=45)    # tilt crowded tick labels</pre>
  <div class="callout callout-tip">
    <strong>Handles, not magic</strong>
    <p>Because <span class="ic">fig</span> and <span class="ic">ax</span> are real objects you can query them: <span class="ic">fig.get_size_inches()</span>, <span class="ic">ax.get_ylim()</span>. Right inside a notebook, type <span class="ic">ax.</span> and Tab to browse everything an axes can do.</p>
  </div>
  <div class="callout callout-info">
    <strong>One name to rule them</strong>
    <p>Give your axes one short name, <span class="ic">ax</span>, and reuse it. When a chart reveals a problem later, having a single handle makes the fix a one-line change.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000404',
  '01A00000-0000-4000-8000-000000000304',
  1,
  'Line Plots',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Line Plots</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Line Plots</h1>
  <p>The line plot is the default choice for ordered data — a sequence where the order matters, most often time or an index. Matplotlib connects consecutive <span class="ic">(x, y)</span> points with straight segments.</p>
  <h2>Basic line plot</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(9, 4))
ax.plot([1, 2, 3, 4, 5], [2, 3, 5, 7, 11], marker='o')
ax.set_title('Sample Growth Over Five Steps')
ax.set_xlabel('Step')
ax.set_ylabel('Value')
plt.show()</pre>
  <div class="callout">
    <strong>Pandas shortcut</strong>
    <p>A DataFrame with an index plots directly: <span class="ic">df.plot()</span> sends its columns to <span class="ic">ax.plot()</span>. Series need <span class="ic">.plot()</span> or explicit <span class="ic">ax.plot(s.index, s.values)</span>.</p>
  </div>
  <h2>Common line options</h2>
  <table>
    <tr><th>Parameter</th><th>Effect</th><th>Example</th></tr>
    <tr><td>color</td><td>Line color</td><td>color='#0d9488'</td></tr>
    <tr><td>linewidth</td><td>Thickness</td><td>linewidth=2.5</td></tr>
    <tr><td>linestyle</td><td>Style of the line</td><td>linestyle='--'</td></tr>
    <tr><td>marker</td><td>Point symbol</td><td>marker='s'</td></tr>
    <tr><td>alpha</td><td>Transparency 0-1</td><td>alpha=0.8</td></tr>
    <tr><td>label</td><td>Text for the legend</td><td>label='revenue'</td></tr>
  </table>
  <pre class="code-block">ax.plot(x, revenue, color='#0d9488', linewidth=2.5,
        marker='o', linestyle='--', label='revenue')</pre>
  <h2>Several lines on one axes</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(9, 4))
ax.plot(x, revenue, label='revenue', marker='o')
ax.plot(x, costs,   label='costs',   marker='s')
ax.set_xlabel('Quarter')
ax.set_ylabel('Amount (thousands)')
ax.legend()
plt.show()</pre>
  <p>When lines overlap, adjust <span class="ic">alpha</span> or use distinct <span class="ic">linestyle</span> values. For more than about four lines, a single chart starts to become hard to read — that is when you reach for subplots (Module 2).</p>
  <div class="callout callout-tip">
    <strong>Label once, legend once</strong>
    <p>Pass <span class="ic">label</span> inside each <span class="ic">plot()</span> call and call <span class="ic">ax.legend()</span> a single time. This keeps the legend in sync with the data it describes.</p>
  </div>
  <h2>Reading a line plot</h2>
  <ul>
    <li>Steep segments mean quick change between points.</li>
    <li>Flat segments mean stability.</li>
    <li>Peaks and valleys mark turning points worth investigating.</li>
    <li>A monotonic rise (or fall) suggests a strong trend.</li>
  </ul>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000405',
  '01A00000-0000-4000-8000-000000000305',
  1,
  'Bar Plots',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bar Plots</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Bar Plots</h1>
  <p>Bar plots compare <strong>categories</strong>: each bar height (or length) represents the magnitude of one category. Use them when the x-axis holds named groups rather than an ordered numeric scale.</p>
  <h2>Vertical bars</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(8, 4))
ax.bar(['North', 'South', 'East', 'West'], [120, 145, 132, 168])
ax.set_title('Sales by Region')
ax.set_ylabel('Sales (thousands)')
ax.set_xlabel('Region')
plt.show()</pre>
  <div class="callout">
    <strong>Bar vs histogram</strong>
    <p>A bar plot takes categories; a histogram takes continuous data and groups it into bins automatically. The bars of a histogram are ordered by value; the bars of a bar plot can be in any order.</p>
  </div>
  <h2>Horizontal bars</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(7, 4))
ax.barh(['Rent', 'Payroll', 'Ads', 'Shipping'], [60, 45, 30, 25],
        color='#0d9488')
ax.set_xlabel('Cost (thousands)')
ax.set_title('Costs by Category')
ax.invert_yaxis()   # first category on top
plt.show()</pre>
  <p>Horizontal bars shine when category names are long — they read left to right without tilting.</p>
  <h2>Grouped bars</h2>
  <pre class="code-block">import numpy as np

regions = ['North', 'South', 'East', 'West']
x = np.arange(len(regions))          # [0, 1, 2, 3]
width = 0.35

fig, ax = plt.subplots(figsize=(8, 4))
ax.bar(x - width/2, sales_2025, width, label='2025')
ax.bar(x + width/2, sales_2026, width, label='2026')
ax.set_xticks(x, regions)
ax.legend()
plt.show()</pre>
  <h2>Stacked bars</h2>
  <p>To split each bar into parts, ride one series on another with the <span class="ic">bottom</span> parameter:</p>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(8, 4))
ax.bar(regions, adults,   label='Adults')
ax.bar(regions, children, bottom=adults, label='Children')
ax.set_ylabel('Visitors (hundreds)')
ax.legend()
plt.show()</pre>
  <h2>Tuning tips</h2>
  <ul>
    <li>Add <span class="ic">edgecolor='white'</span> for a crisp outline between bars.</li>
    <li>Sort categories by value (ascending or descending) to make comparisons instant.</li>
    <li>Start the y-axis at zero — chopped axes distort bar lengths.</li>
    <li>Label each bar directly when the numbers matter more than the pattern.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>More than two series?</strong>
    <p>Grouped and stacked bars get busy quickly. For more than two or three series, switch to a line plot, an area plot, or subplots.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000407',
  '01A00000-0000-4000-8000-000000000307',
  1,
  'Styling & Themes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Styling & Themes</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Styling &amp; Themes</h1>
  <p>Sticky parameters set once, reused everywhere. Matplotlib calls its global defaults <span class="ic">rcParams</span>, and style sheets bundle dozens of them into a named look. Set them once at the top of your notebook and every chart inherits the design.</p>
  <h2>Browse available styles</h2>
  <pre class="code-block">import matplotlib.pyplot as plt

print(plt.style.available[:8])</pre>
  <p>Popular choices are <span class="ic">seaborn-v0_8-whitegrid</span> (clean grid), <span class="ic">ggplot</span> (statistical look), and <span class="ic">bmh</span>. Each is a curated set of defaults.</p>
  <h2>Apply a style</h2>
  <pre class="code-block">plt.style.use('seaborn-v0_8-whitegrid')</pre>
  <div class="callout">
    <strong>Style applies to the whole session</strong>
    <p>A style sheet changes the current global defaults, not a single chart. Call it early in the notebook; use <span class="ic">plt.style.use</span> again to switch, or <span class="ic">plt.style.context('ggplot')</span> to apply it only inside a block.</p>
  </div>
  <h2>Common rcParams</h2>
  <table>
    <tr><th>Key</th><th>What it controls</th></tr>
    <tr><td>figure.figsize</td><td>Default canvas size in inches</td></tr>
    <tr><td>figure.dpi</td><td>Resolution of the figure</td></tr>
    <tr><td>font.size</td><td>Base font size for all text</td></tr>
    <tr><td>axes.titlesize</td><td>Size of the axes title</td></tr>
    <tr><td>axes.grid</td><td>Whether grids draw by default</td></tr>
    <tr><td>lines.linewidth</td><td>Default line thickness</td></tr>
  </table>
  <pre class="code-block">plt.rcParams['figure.figsize'] = (9, 5)
plt.rcParams['figure.dpi']     = 110
plt.rcParams['font.size']      = 12
plt.rcParams['axes.grid']      = True</pre>
  <h2>Per-chart overrides</h2>
  <p>Global defaults set the baseline; individual calls refine it. The object-oriented style is explicit:</p>
  <pre class="code-block">fig, ax = plt.subplots()
ax.plot(x, y)
ax.grid(True, color='#cbd5e1', linestyle='--')   # this axes only
ax.set_facecolor('#f8fafc')
ax.spines['top'].set_visible(False)</pre>
  <p>Anything you set on an axes overrides the style sheet for that chart alone.</p>
  <div class="callout callout-tip">
    <strong>Consistency beats cleverness</strong>
    <p>Pick one style, one font size, and one grid feel for a project and keep them everywhere. Charts in a report look professional when they share a visual language, not when each one invents its own.</p>
  </div>
  <div class="callout callout-info">
    <strong>Styles are just dictionaries</strong>
    <p>Under the hood a style sheet is a bundle of rcParams. <span class="ic">plt.rcParams</span> is a dict-like object you can read and modify directly, which makes debugging odd defaults simple.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000408',
  '01A00000-0000-4000-8000-000000000308',
  1,
  'Colors & Colormaps',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Colors & Colormaps</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Colors &amp; Colormaps</h1>
  <p>Color is the strongest visual signal on a chart, so it earns deliberate choices. Matplotlib accepts many color formats; the safest is hex or a well-chosen Colormap.</p>
  <h2>Color formats</h2>
  <table>
    <tr><th>Style</th><th>Example</th><th>Notes</th></tr>
    <tr><td>Hex</td><td>'#0d9488'</td><td>Exact and predictable</td></tr>
    <tr><td>Named</td><td>'teal'</td><td>Limited but readable</td></tr>
    <tr><td>Short code</td><td>'r', 'g', 'b'</td><td>Quick prototypes only</td></tr>
    <tr><td>RGB tuple</td><td>(0.05, 0.58, 0.53)</td><td>Programmatic control</td></tr>
  </table>
  <h2>Swap the default color cycle</h2>
  <pre class="code-block">import matplotlib.pyplot as plt

plt.rcParams['axes.prop_cycle'] = plt.cycler(
    color=['#0d9488', '#f97316', '#6366f1', '#e11d48', '#84cc16'])

fig, ax = plt.subplots()
for i in range(5):
    ax.plot([0, 1], [i, i + 1])   # uses cycle colors in order
plt.show()</pre>
  <p>Every drawn series takes the next color in the cycle, matching the legend automatically.</p>
  <h2>Colormaps map numbers to colors</h2>
  <pre class="code-block">fig, ax = plt.subplots()
sc = ax.scatter(x, y, c=z, s=40, cmap='viridis')
ax.figure.colorbar(sc, ax=ax, label='Z score')</pre>
  <p>The <span class="ic">c</span> argument carries a numeric array, and <span class="ic">cmap</span> turns those numbers into colors. The colorbar communicates the mapping.</p>
  <h2>Choosing the right kind of scale</h2>
  <table>
    <tr><th>Type of data</th><th>Colormap family</th><th>Examples</th></tr>
    <tr><td>Categories</td><td>Qualitative</td><td>tab10, Dark2, Set3</td></tr>
    <tr><td>Ordered magnitudes</td><td>Sequential</td><td>viridis, plasma, cividis</td></tr>
    <tr><td>Positive to negative</td><td>Diverging</td><td>coolwarm, RdBu</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Accessibility first</strong>
    <p>Teach your eye to reach for <span class="ic">viridis</span> or <span class="ic">cividis</span> with sequential data. They are perceptually uniform and colorblind-friendly; rainbow-style palettes like <span class="ic">jet</span> are best avoided.</p>
  </div>
  <div class="callout callout-info">
    <strong>Fewer colors is professional</strong>
    <p>Limit categorical palettes to five or six hues. If a chart needs more colors, split it into subplots instead of stretching a palette until colors blur together.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000410',
  '01A00000-0000-4000-8000-000000000310',
  1,
  'Subplots & Grids',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subplots & Grids</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Subplots &amp; Grids</h1>
  <p>When one chart cannot tell the story, place several charts in the same figure. <span class="ic">plt.subplots()</span> builds the figure and a grid of axes in a single call.</p>
  <h2>Rows and columns</h2>
  <pre class="code-block">fig, axes = plt.subplots(2, 2, figsize=(10, 8))
plt.show()   # four empty panels already laid out</pre>
  <p><span class="ic">axes</span> is a 2-by-2 array of Axes objects. Row-major order means index <span class="ic">[0, 0]</span> is top-left, then <span class="ic">[0, 1]</span>, <span class="ic">[1, 0]</span>, <span class="ic">[1, 1]</span>.</p>
  <h2>Fill each panel</h2>
  <pre class="code-block">fig, axes = plt.subplots(2, 2, figsize=(10, 8))

axes[0, 0].plot(x, y1, marker='o', color='#0d9488')
axes[0, 1].bar(cats, y2, color='#f97316')
axes[1, 0].scatter(x, y3, s=30, color='#6366f1')
axes[1, 1].hist(y4, bins=15, color='#e11d48')

fig.suptitle('Quarterly Performance Overview', fontsize=16)
plt.tight_layout()
plt.show()</pre>
  <h2>Loop when panels share a pattern</h2>
  <pre class="code-block">fig, axes = plt.subplots(1, 3, figsize=(12, 4), sharey=True)
for ax, name, values in zip(axes, regions, dataset):
    ax.bar(methods, values, label=name)
    ax.set_title(name)
axes[0].set_ylabel('Score')
fig.legend(loc='upper right')
plt.show()</pre>
  <h2>Shared axes keep comparisons honest</h2>
  <table>
    <tr><th>Parameter</th><th>Effect</th></tr>
    <tr><td>sharex=True</td><td>All panels use the same x-limits</td></tr>
    <tr><td>sharey=True</td><td>All panels use the same y-limits</td></tr>
    <tr><td>fig.suptitle</td><td>One title over the whole figure</td></tr>
    <tr><td>fig.tight_layout</td><td>Auto spacing that removes overlap</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>sharey for side-by-side bars</strong>
    <p>Side-by-side panels that measure the same quantity should share the y-axis, so readers compare bars across panels instead of being misled by different scales.</p>
  </div>
  <div class="callout callout-info">
    <strong>Array shape</strong>
    <p>With a single row or column (<span class="ic">subplots(1, 3)</span>) the returned <span class="ic">axes</span> is a 1-D array — index with one value <span class="ic">axes[0]</span>. Only a multi-row shape is 2-D. Flatten if unsure: <span class="ic">axes.flatten()</span>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000411',
  '01A00000-0000-4000-8000-000000000311',
  1,
  'Advanced Layouts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Advanced Layouts</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Advanced Layouts</h1>
  <p>Real dashboards rarely want equal-sized panels. GridSpec lets you give different rows and columns different widths, and inset axes let you embed a zoom view inside another panel.</p>
  <h2>Unequal sizes with GridSpec</h2>
  <pre class="code-block">fig = plt.figure(figsize=(11, 4))
gs = fig.add_gridspec(1, 3, width_ratios=[2, 1, 1])

ax_main = fig.add_subplot(gs[0])
ax_side1 = fig.add_subplot(gs[1])
ax_side2 = fig.add_subplot(gs[2])

ax_main.plot(x, trend, marker='o')     # wide trend panel
ax_side1.barh(['A', 'B', 'C'], y1)     # narrow breakdown
ax_side2.barh(['A', 'B', 'C'], y2)
plt.tight_layout()
plt.show()</pre>
  <p><span class="ic">width_ratios=[2, 1, 1]</span> gives the first panel twice the width of the other two.</p>
  <h2>Spans across rows and columns</h2>
  <pre class="code-block">gs = fig.add_gridspec(2, 2, height_ratios=[1, 2])

ax_top = fig.add_subplot(gs[0, :])       # full-width top panel
ax_bot1 = fig.add_subplot(gs[1, 0])      # bottom-left
ax_bot2 = fig.add_subplot(gs[1, 1])      # bottom-right</pre>
  <p>GridSpec slices behave like numpy slices: <span class="ic">gs[0, :]</span> spans the whole top row.</p>
  <h2>Inset axes — a zoom within the plot</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(9, 4))
ax.plot(x, values, marker='o', color='#0d9488')

ax_inset = ax.inset_axes([0.58, 0.55, 0.36, 0.38])
ax_inset.plot(x_zoom, values_zoom, color='#e11d48')
ax_inset.set_title('Zoom: days 40-56', fontsize=10)
plt.show()</pre>
  <p><span class="ic">inset_axes</span> places a new axes at a fractional position inside the parent — <span class="ic">[x, y, width, height]</span> in figure-relative coordinates.</p>
  <h2>Controlling whitespace</h2>
  <pre class="code-block">gs.update(wspace=0.25, hspace=0.4)   # gap between panels
# or let Matplotlib auto-tune:
fig.tight_layout(pad=1.2)</pre>
  <div class="callout callout-tip">
    <strong>Tight layout vs constrained</strong>
    <p><span class="ic">fig.tight_layout()</span> fixes overlapped labels after-the-fact and works almost everywhere. For very complex grids, pass <span class="ic">constrained_layout=True</span> to <span class="ic">plt.subplots()</span> so spacing is handled while you draw.</p>
  </div>
  <div class="callout callout-info">
    <strong>One figure, one question</strong>
    <p>Multi-panel figures are coherent when each panel answers one part of a single question. A figure that mixes unrelated topics reads like noise — split it into two figures instead.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000413',
  '01A00000-0000-4000-8000-000000000313',
  1,
  'Histograms & Distributions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Histograms & Distributions</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Histograms &amp; Distributions</h1>
  <p>A histogram shows how values spread across a continuous range. It groups the data into bins and stacks them by count — instantly revealing the shape of a distribution.</p>
  <h2>First histogram</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(8, 4))
ax.hist(heights, bins=12, edgecolor='white', color='#0d9488')
ax.set_title('Distribution of Heights')
ax.set_xlabel('Height (cm)')
ax.set_ylabel('Count')
plt.show()</pre>
  <p>Too few bins smooth out detail; too many produce a spiky noise. Start around 10-20 bins and adjust by the story you want to tell.</p>
  <h2>KDE — a smooth density curve</h2>
  <pre class="code-block">import seaborn as sns

fig, ax = plt.subplots(figsize=(8, 4))
sns.histplot(heights, kde=True, bins=15, color='#0d9488', ax=ax)
ax.set_title('Height Distribution with KDE')
plt.show()</pre>
  <p>A kernel density estimate (KDE) draws a smooth curve approximating the probability density. It is great for comparing two or more distributions that overlap.</p>
  <h2>Comparing groups</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(8, 4))
sns.histplot(group_a, color='#f97316', label='Group A',
             alpha=0.55, kde=True, ax=ax)
sns.histplot(group_b, color='#6366f1', label='Group B',
             alpha=0.55, kde=True, ax=ax)
ax.legend()
plt.show()</pre>
  <div class="callout callout-info">
    <strong>Transparency is your friend</strong>
    <p>Overlapping opaque histograms hide whole areas. The <span class="ic">alpha</span> parameter makes layers blend, so both distributions stay readable.</p>
  </div>
  <h2>What to look for</h2>
  <ul>
    <li><strong>Peak</strong> — most common value range (the mode).</li>
    <li><strong>Spread</strong> — narrow means consistent; wide means variable.</li>
    <li><strong>Skew</strong> — a long tail on one side pulls the mean that way.</li>
    <li><strong>Two peaks</strong> — a clue that the data may hide two groups.</li>
    <li><strong>Outliers</strong> — isolated far-away bars worth investigating.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Normalize when counts differ</strong>
    <p>To compare groups of different sizes, set <span class="ic">density=True</span> in <span class="ic">ax.hist()</span> so each area sums to 1 — shapes line up fairly even when one group has far more rows.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000414',
  '01A00000-0000-4000-8000-000000000314',
  1,
  'Box & Violin Plots',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Box & Violin Plots</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Box &amp; Violin Plots</h1>
  <p>A box plot summarizes a distribution with five numbers: minimum, first quartile, median, third quartile, and maximum. It trades fine detail for a compact, comparable summary — ideal for comparing many groups at once.</p>
  <h2>Anatomy of a box</h2>
  <ul>
    <li>The <strong>box</strong> spans the first to third quartile (the interquartile range, IQR).</li>
    <li>The <strong>line inside</strong> is the median.</li>
    <li>The <strong>whiskers</strong> extend to the farthest point within 1.5 x IQR.</li>
    <li><strong>Fliers</strong> (dots) mark points beyond the whiskers.</li>
  </ul>
  <h2>Box plots with Seaborn</h2>
  <pre class="code-block">import seaborn as sns

fig, ax = plt.subplots(figsize=(8, 5))
sns.boxplot(data=df, x='region', y='sales', palette='Set2', ax=ax)
ax.set_title('Sales Distribution by Region')
plt.show()</pre>
  <p>One box per region makes the outlier regions and the medians instantly comparable.</p>
  <h2>Violin plots — density plus summary</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(8, 5))
sns.violinplot(data=df, x='region', y='sales',
               inner='quartile', palette='Set2', ax=ax)
ax.set_title('Sales Density by Region')
plt.show()</pre>
  <p>A violin plot draws a mirrored KDE on its side, so you see the shape — a second bump or a long tail — that a box hides. <span class="ic">inner='quartile'</span> keeps the quartile lines.</p>
  <h2>Choosing one or the other</h2>
  <table>
    <tr><th>You need</th><th>Choose</th></tr>
    <tr><td>Many groups, quick median/outlier scan</td><td>Box plot</td></tr>
    <tr><td>Shape, multimodality, density detail</td><td>Violin plot</td></tr>
    <tr><td>Publication with many categories</td><td>Box plot (keeps ink low)</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Repeated measures side by side</strong>
    <p>When comparing the same metric before and after, draw the two box plots next to each other on the same axes so the shift in medians is obvious at a glance.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000416',
  '01A00000-0000-4000-8000-000000000316',
  1,
  'Scatter & Relational Plots',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scatter & Relational Plots</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Scatter &amp; Relational Plots</h1>
  <p>Scatter plots put one variable on each axis and drop a point per observation. Clusters, trends, and outliers in the relationship between two variables become visible at once.</p>
  <h2>Basic scatter</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(8, 5))
ax.scatter(df['experience'], df['salary'], s=45, color='#0d9488', alpha=0.7)
ax.set_xlabel('Years of experience')
ax.set_ylabel('Annual salary')
ax.set_title('Salary vs Experience')
plt.show()</pre>
  <h2>Three or four dimensions at once</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(8, 5))
sns.scatterplot(data=df, x='experience', y='salary',
                hue='department', size='tenure',
                alpha=0.85, ax=ax)
ax.legend(loc='upper left')
plt.show()</pre>
  <p>Seaborn adds the encoding arguments for free: <span class="ic">hue</span> colors by a third variable, <span class="ic">size</span> scales points by a fourth. Two continuous scales plus one categorical hue is about the practical limit.</p>
  <h2>Add a trend line</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(8, 5))
sns.regplot(data=df, x='experience', y='salary',
            scatter_kws={'alpha': 0.6}, line_kws={'color': '#e11d48'}, ax=ax)
plt.show()</pre>
  <p><span class="ic">regplot</span> fits a linear regression and draws the confidence band. It is the fastest way to ask "is the relationship positive?"</p>
  <h2>Overplotting</h2>
  <p>Thousands of points on one axes merge into a black smear. Fixes, in order of impact:</p>
  <ul>
    <li>Raise <span class="ic">alpha</span> transparency so density shows through.</li>
    <li>Shrink <span class="ic">s</span> (marker size).</li>
    <li>Downsample to a random sample: <span class="ic">df.sample(n=2000)</span>.</li>
    <li>Use a hexbin plot for genuinely heavy datasets.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Patterns worth naming</strong>
    <p>Look for: an upward drift (positive relationship), downward drift (negative), a curved band (non-linear), a gap (two distinct groups), and lonely points far from the pack (outliers worth checking).</p>
  </div>
  <div class="callout callout-info">
    <strong>Scale matters</strong>
    <p>If one variable spans orders of magnitude, a few extreme points flatten the rest. Log-scale that axis with <span class="ic">ax.set_xscale('log')</span> so the structure re-emerges.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000417',
  '01A00000-0000-4000-8000-000000000317',
  1,
  'Seaborn Categorical Plots',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Seaborn Categorical Plots</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Seaborn Categorical Plots</h1>
  <p>Seaborn's categorical plots map "one value per category" without you writing aggregation code. Give them the DataFrame and the column names, and they compute the summary themselves.</p>
  <h2>Counts per category</h2>
  <pre class="code-block">import seaborn as sns

fig, ax = plt.subplots(figsize=(8, 4))
sns.countplot(data=df, x='plan_tier', palette='Set2', ax=ax)
ax.set_title('Customers by Plan Tier')
plt.show()</pre>
  <p><span class="ic">countplot</span> counts rows per category — the bar chart of how many.</p>
  <h2>Aggregated values per category</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(8, 4))
sns.barplot(data=df, x='region', y='revenue',
            errorbar=None, palette='Set2', ax=ax)
ax.set_title('Average Revenue by Region')
plt.show()</pre>
  <p><span class="ic">barplot</span> applies the estimator (the mean by default) to the y values within each category. <span class="ic">errorbar=None</span> keeps the bars clean when you only need the estimate.</p>
  <h2>Trends across categories</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(8, 4))
sns.pointplot(data=df, x='quarter', y='conversion',
              errorbar=None, marker='o', ax=ax)
ax.set_title('Conversion by Quarter')
plt.show()</pre>
  <p><span class="ic">pointplot</span> connects category means with a line, great for spotting a trend across an ordered category like quarter.</p>
  <h2>Compare two categorical axes</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(8, 5))
sns.barplot(data=df, x='region', y='revenue',
            hue='plan_tier', errorbar=None, palette='Set2', ax=ax)
ax.legend(loc='upper right')
plt.show()</pre>
  <p>The <span class="ic">hue</span> argument splits each category into sub-groups, producing grouped bars without manual offsets.</p>
  <div class="callout callout-info">
    <strong>Estimators</strong>
    <p>Change how values combine with <span class="ic">estimator=np.median</span> or a custom function. The default mean is fine for symmetric data; median resists a few huge outliers.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Order the bars</strong>
    <p>Pass <span class="ic">order=sorted(df['region'].unique())</span> or your own list. Seaborn sorts alphabetically by default, which is rarely the most informative arrangement for ordinal data.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000419',
  '01A00000-0000-4000-8000-000000000319',
  1,
  'Heatmaps & Correlation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Heatmaps & Correlation</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Heatmaps &amp; Correlation</h1>
  <p>A heatmap paints a grid of numbers with colors, so patterns in a matrix appear instantly. It is the classic companion to a correlation matrix.</p>
  <h2>Build a correlation matrix</h2>
  <pre class="code-block">import numpy as np

corr = df.select_dtypes(include=['number']).corr()
print(corr.round(2))</pre>
  <p>Each cell holds the Pearson correlation between two columns, from -1 (perfect inverse) to +1 (perfect direct). The diagonal is always 1.0.</p>
  <h2>Draw it</h2>
  <pre class="code-block">import seaborn as sns

fig, ax = plt.subplots(figsize=(9, 7))
sns.heatmap(corr, annot=True, fmt='.2f',
            cmap='coolwarm', center=0, ax=ax)
ax.set_title('Correlation Matrix')
plt.show()</pre>
  <p><span class="ic">annot=True</span> prints each value in its cell; <span class="ic">fmt='.2f'</span> formats it; <span class="ic">center=0</span> centers a diverging colormap at zero so red-blue reads as negative-positive.</p>
  <h2>Fix the scale</h2>
  <pre class="code-block">sns.heatmap(corr, annot=True, fmt='.2f', cmap='coolwarm',
            vmin=-1, vmax=1, ax=ax)</pre>
  <p>Correlations are globally bounded by -1 and 1, so pinning <span class="ic">vmin=-1, vmax=1</span> makes the color scale comparable across different matrices.</p>
  <h2>Mask the redundant half</h2>
  <pre class="code-block">mask = np.triu(np.ones_like(corr, dtype=bool))

fig, ax = plt.subplots(figsize=(8, 7))
sns.heatmap(corr, mask=mask, annot=True, fmt='.2f',
            cmap='coolwarm', vmin=-1, vmax=1, ax=ax)
plt.show()</pre>
  <p>Since a correlation matrix mirrors across the diagonal, masking the upper triangle removes duplicate information and tightens the figure.</p>
  <div class="callout callout-info">
    <strong>Correlation is not causation</strong>
    <p>A high correlation says the two columns move together — it does not say one causes the other. Always pair a strong correlation with domain context before claiming anything.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Shrink the colorbar</strong>
    <p>With <span class="ic">cbar_kws={'shrink': 0.7}</span> the colorbar stays compact and the plot area keeps its proportion.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000420',
  '01A00000-0000-4000-8000-000000000320',
  1,
  'Pair Plots & Facet Grids',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pair Plots & Facet Grids</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Pair Plots &amp; Facet Grids</h1>
  <p>A pair plot answers "how do all these columns relate to each other?" in one figure. Each numeric column gets an axis; every combination of two columns gets a scatter, and the diagonal shows each column's distribution.</p>
  <h2>The one-liner</h2>
  <pre class="code-block">import seaborn as sns

g = sns.pairplot(df, hue='species')
plt.show()</pre>
  <p>Give it the DataFrame plus, optionally, a <span class="ic">hue</span> column. Seaborn colors every cell by group, and the diagonal swaps in a KDE per group.</p>
  <h2>Restrict the columns</h2>
  <pre class="code-block">cols = ['sepal_length', 'sepal_width', 'petal_length', 'petal_width']
g = sns.pairplot(df, vars=cols, diag_kind='kde', corner=True)
plt.show()</pre>
  <p><span class="ic">vars</span> limits which columns participate; <span class="ic">corner=True</span> draws only the lower triangle, cutting redundant cells when the grid gets large.</p>
  <div class="callout callout-tip">
    <strong>Watch the cost</strong>
    <p>Ten columns produce 45 scatter cells and a figure with 100 mini-axes — slow to draw and brutal on a small screen. Prefer four to six columns per pair plot.</p>
  </div>
  <h2>Facet grids — many panels of one plot</h2>
  <pre class="code-block">g = sns.FacetGrid(df, col='region', col_wrap=3, height=3)
g.map(sns.scatterplot, 'hours_studied', 'exam_score')
plt.show()</pre>
  <p><span class="ic">FacetGrid</span> splits the data by a category and draws one panel per slice. <span class="ic">col_wrap</span> controls how many panels sit per row.</p>
  <h2>relplot — facets with one call</h2>
  <pre class="code-block">g = sns.relplot(data=df, x='date', y='sales',
                hue='channel', col='region', col_wrap=2,
                kind='line', height=3.5, aspect=1.4)
plt.show()</pre>
  <p><span class="ic">relplot</span> combines a relational plot with faceting, wiring the legend and axis sharing for you. It returns a <span class="ic">FacetGrid</span> object you can keep styling.</p>
  <div class="callout callout-info">
    <strong>The g.handle pattern</strong>
    <p>Seaborn figure-level functions return their grid object <span class="ic">g</span>. Use <span class="ic">g.set_titles()</span>, <span class="ic">g.set_axis_labels()</span>, and <span class="ic">g.tight_layout()</span> to polish every mini-panel consistently.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000422',
  '01A00000-0000-4000-8000-000000000322',
  1,
  'Time Series Visualization',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Time Series Visualization</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Time Series Visualization</h1>
  <p>Rows that carry a timestamp are among the most common data you will chart. The workflow always starts in pandas: parse the dates, index by them, then plot.</p>
  <h2>Prepare the index</h2>
  <pre class="code-block">import pandas as pd

df['date'] = pd.to_datetime(df['date'])
df = df.sort_values('date').set_index('date')
print(df.head())</pre>
  <p><span class="ic">pd.to_datetime</span> converts strings to real timestamps; sorting the index keeps the line moving forward in time.</p>
  <h2>Plot the series</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(10, 4))
ax.plot(df.index, df['sales'], color='#0d9488', linewidth=2)
ax.set_title('Daily Sales')
ax.set_ylabel('Sales ($)')
fig.autofmt_xdate()          # rotate and space the date labels
plt.show()</pre>
  <h2>Resample to a readable grain</h2>
  <pre class="code-block">monthly = df['sales'].resample('ME').mean()

fig, ax = plt.subplots(figsize=(10, 4))
ax.plot(monthly.index, monthly.values, marker='o', color='#f97316')
ax.set_title('Monthly Average Sales')
plt.show()</pre>
  <p><span class="ic">resample('ME')</span> groups into months; the 'ME' frequency means month-end. The average tames daily noise and exposes the trend.</p>
  <h2>Two series, shared time axis</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(10, 5))
ax.plot(monthly.index, monthly['sales'].values, label='sales',
        marker='o', color='#0d9488')
ax.plot(monthly.index, monthly['target'].values, label='target',
        linestyle='--', color='#e11d48')
ax.legend()
ax.set_title('Sales vs Target')
plt.show()</pre>
  <h2>Fill between signals improvement</h2>
  <pre class="code-block">ax.fill_between(monthly.index, monthly['sales'].values,
                monthly['target'].values,
                where=(monthly['sales'].values &gt;= monthly['target'].values),
                color='#22c55e', alpha=0.25, interpolate=True)</pre>
  <p>Green shading marks months where sales beat target — a pattern the reader absorbs before reading a single number.</p>
  <div class="callout callout-info">
    <strong>Watch for gaps</strong>
    <p>Missing timestamps create jumps in a line that can look like real changes. Plot the raw data behind the line (<span class="ic">ax.plot(index, value, alpha=0.3, lw=1)</span>) or resample so gaps become visible buckets.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000423',
  '01A00000-0000-4000-8000-000000000323',
  1,
  'Annotations & Fine-Tuning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Annotations & Fine-Tuning</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Annotations &amp; Fine-Tuning</h1>
  <p>Numbers stay in the data; insight lives in the annotation. A threshold line, an arrow to a peak, a short caption on a dip — these turn a correct chart into an effective one.</p>
  <h2>Benchmarks with lines</h2>
  <pre class="code-block">fig, ax = plt.subplots(figsize=(9, 4))
ax.plot(monthly.index, monthly['sales'].values, marker='o', color='#0d9488')
ax.axhline(monthly['target'].mean(), color='#e11d48',
           linestyle='--', linewidth=1.5, label='Avg target')
ax.legend()
plt.show()</pre>
  <p><span class="ic">ax.axhline</span> and <span class="ic">ax.axvline</span> draw infinite reference lines in data coordinates at a fixed value.</p>
  <h2>Place text with data coordinates</h2>
  <pre class="code-block">peak = monthly['sales'].idxmax()
ax.annotate('Peak month',
            xy=(peak, monthly.loc[peak, 'sales']),
            xytext=(0.65, 0.85), textcoords='axes fraction',
            arrowprops=dict(arrowstyle='-&gt;', color='#334155'),
            fontsize=11)</pre>
  <p><span class="ic">xy</span> points at the data; <span class="ic">xytext</span> places the label, here in axes-fraction coordinates to stay inside the frame. The <span class="ic">arrowprops</span> draws the connector.</p>
  <h2>Simple text without an arrow</h2>
  <pre class="code-block">ax.text(0.02, 0.95, 'Above target after Q3',
        transform=ax.transAxes, fontsize=10, color='#0f766e')</pre>
  <p><span class="ic">transform=ax.transAxes</span> pins the text at a fraction of the axes, so it does not drift when the data scale changes.</p>
  <h2>Shade a critical window</h2>
  <pre class="code-block">ax.axvspan(pd.Timestamp('2025-10-01'), pd.Timestamp('2025-12-31'),
           color='#0ea5e9', alpha=0.12, label='Holiday window')</pre>
  <p><span class="ic">axvspan</span> fills a vertical band between two values — perfect for marking months, campaigns, or seasons.</p>
  <h2>Tick formatting the easy way</h2>
  <pre class="code-block">from matplotlib.ticker import FuncFormatter
ax.yaxis.set_major_formatter(
    FuncFormatter(lambda v, pos: f'{v/1000:.0f}k'))</pre>
  <p>The lambda shrinks axis labels — <span class="ic">12500</span> becomes <span class="ic">12k</span> — keeping the tick area clean for larger figures.</p>
  <div class="callout callout-info">
    <strong>Caption the takeaway</strong>
    <p>Add one short line stating the single insight the chart supports, e.g. "Growth accelerated after the relaunch in March." If a chart needs two captions, it is probably two charts.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000425',
  '01A00000-0000-4000-8000-000000000325',
  1,
  'Designing a Dashboard',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Designing a Dashboard</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Designing a Dashboard</h1>
  <p>A dashboard tells one story with several charts. Before writing a line of plotting code, design decisions decide whether readers understand in seconds or get lost scrolling.</p>
  <h2>Start with the question</h2>
  <p>Every panel should answer a sub-question under one headline story. Three useful families:</p>
  <ul>
    <li><strong>Status:</strong> where do we stand? KPIs, totals, latest values.</li>
    <li><strong>Trend:</strong> how is it moving? line plots, resampled means.</li>
    <li><strong>Breakdown:</strong> what is it made of? bars, categorical plots, heatmaps.</li>
  </ul>
  <h2>Plan the grid on paper</h2>
  <p>Sketch rectangles before coding. A common shape for a report page:</p>
  <table>
    <tr><th>Row</th><th>Left</th><th>Right</th></tr>
    <tr><td>1</td><td colspan="2">Headline: KPIs and the key takeaway</td></tr>
    <tr><td>2</td><td>Trend line (wide)</td><td>Breakdown bar</td></tr>
    <tr><td>3</td><td>Distribution</td><td>Correlation heatmap</td></tr>
  </table>
  <p>That maps directly to a GridSpec: <span class="ic">gs[0, :]</span>, <span class="ic">(2, 1)</span> style spans, and so on.</p>
  <h2>Read the grid before you build it</h2>
  <pre class="code-block">fig = plt.figure(figsize=(12, 9))
gs = fig.add_gridspec(3, 2, height_ratios=[0.7, 2, 2])

ax_head  = fig.add_subplot(gs[0, :])   # full-width KPI row
ax_trend = fig.add_subplot(gs[1, 0])   # wide trend panel
ax_break = fig.add_subplot(gs[1, 1])   # breakdown panel
ax_dist  = fig.add_subplot(gs[2, 0])   # distribution
ax_corr  = fig.add_subplot(gs[2, 1])   # correlation heatmap
plt.show()</pre>
  <p>Empty panels tell you instantly whether the proportions feel right. Adjust <span class="ic">height_ratios</span> before any data is involved.</p>
  <h2>Color and contrast discipline</h2>
  <ul>
    <li>One accent color for the key series; neutral grays for everything else.</li>
    <li>No legend on every panel — a shared accent is usually clearer.</li>
    <li>Same units and axis choices for comparable panels.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Consistent baseline</strong>
    <p>Keep the same figure style, font size, and grid feel across panels. The dashboard reads as one artifact instead of five charts stapled together.</p>
  </div>
  <div class="callout callout-info">
    <strong>Deadline heuristic</strong>
    <p>If a reader cannot extract the headline message in under 15 seconds, simplify. Fewer, larger, well-annotated panels beat many cramped ones every time.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000426',
  '01A00000-0000-4000-8000-000000000326',
  1,
  'Building the Capstone Dashboard',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building the Capstone Dashboard</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Building the Capstone Dashboard</h1>
  <p>Now you build. This lesson assembles a small sales-report figure combining the techniques of the whole course: a GridSpec layout, a status panel, a trend, a categorical breakdown, and a correlation heatmap.</p>
  <h2>1. Prepare the data</h2>
  <pre class="code-block">import numpy as np
import pandas as pd

rng = np.random.default_rng(7)
dates = pd.date_range('2024-01-01', periods=365, freq='D')
sales = pd.DataFrame({
    'date': dates,
    'units': 300 + 40*np.sin(dates.dayofyear/15) + rng.normal(0, 25, 365),
}).set_index('date')
sales['revenue'] = sales['units'] * 12.5
monthly = sales.resample('ME').mean()</pre>
  <h2>2. The layout skeleton</h2>
  <pre class="code-block">import matplotlib.pyplot as plt
import seaborn as sns

plt.style.use('seaborn-v0_8-whitegrid')
fig = plt.figure(figsize=(13, 9))
gs = fig.add_gridspec(2, 2, height_ratios=[1, 1.6],
                      width_ratios=[1.4, 1])

ax_trend = fig.add_subplot(gs[0, 0])
ax_status = fig.add_subplot(gs[0, 1])
ax_weekday = fig.add_subplot(gs[1, 0])
ax_heat = fig.add_subplot(gs[1, 1])</pre>
  <h2>3. Fill the trend panel</h2>
  <pre class="code-block">ax_trend.plot(monthly.index, monthly['revenue'].values,
              marker='o', color='#0d9488', linewidth=2)
ax_trend.set_title('Monthly Revenue Trend')
ax_trend.set_ylabel('Avg revenue ($)')
ax_trend.axhline(monthly['revenue'].mean(), color='#e11d48',
                 linestyle='--', label='year mean')
ax_trend.legend()</pre>
  <h2>4. Status panel with a big number</h2>
  <pre class="code-block">total = sales['revenue'].sum()
ax_status.text(0.5, 0.6, f'${total/1000:,.0f}k',
               ha='center', va='center', fontsize=40,
               color='#0d9488', transform=ax_status.transAxes)
ax_status.text(0.5, 0.3, 'Total revenue, 2024',
               ha='center', fontsize=13,
               transform=ax_status.transAxes)
ax_status.axis('off')
ax_status.set_title('Status')</pre>
  <h2>5. Categorical breakdown</h2>
  <pre class="code-block">by_weekday = sales.groupby(sales.index.dayofweek)['units'].mean()
ax_weekday.bar(by_weekday.index, by_weekday.values,
               color='#f97316')
ax_weekday.set_xticks(range(7),
                      ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'])
ax_weekday.set_title('Avg Units by Weekday')
ax_weekday.set_ylabel('Units')</pre>
  <h2>6. Correlation heatmap</h2>
  <pre class="code-block">features = sales[['units', 'revenue']].join(
    pd.Series(sales.index.dayofyear, name='day_of_year'))
sns.heatmap(features.corr(), annot=True, fmt='.2f',
            cmap='coolwarm', vmin=-1, vmax=1,
            cbar_kws={'shrink': 0.7}, ax=ax_heat)
ax_heat.set_title('Correlation of Features')</pre>
  <h2>7. Finish</h2>
  <pre class="code-block">fig.suptitle('2024 Sales Report', fontsize=18, y=0.98)
fig.tight_layout(rect=(0, 0, 1, 0.95))
plt.show()</pre>
  <div class="callout callout-tip">
    <strong>One function, one panel</strong>
    <p>Write a helper per panel (<span class="ic">plot_trend(ax, data)</span>, <span class="ic">plot_heat(ax, df)</span>). Later, swapping data or tuning a single panel never touches the rest of the figure.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01A00000-0000-4000-8000-000000000427',
  '01A00000-0000-4000-8000-000000000327',
  1,
  'Polishing, Exporting & Sharing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Polishing, Exporting & Sharing</title>
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
.lesson-page table th, .lesson-page table td { border: 1px solid #99f6e4; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #2dd4bf; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #042f2e; color: #5eead4; }
.dark .lesson-page .callout { background: #042f2e; border-left-color: #2dd4bf; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #134e4a; }
.dark .lesson-page table th { background: #042f2e; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Polishing, Exporting &amp; Sharing</h1>
  <p>The chart is done when it looks right <em>and</em> survives being moved to a deck, a report, or a PDF. Exporting is where a figure either lands cleanly or turns into a blur.</p>
  <h2>Save with intent</h2>
  <pre class="code-block">fig.savefig('sales_report.png', dpi=200,
            bbox_inches='tight', facecolor='white')</pre>
  <p>The two settings that matter most: <span class="ic">dpi</span> sets resolution, and <span class="ic">bbox_inches='tight'</span> trims the whitespace to exactly what the figure draws.</p>
  <h2>Pick the format for the job</h2>
  <table>
    <tr><th>Format</th><th>Best for</th></tr>
    <tr><td>PNG</td><td>Screens, slides, emails — raster, keep dpi high</td></tr>
    <tr><td>SVG</td><td>Web and editing — vector, scales at any size</td></tr>
    <tr><td>PDF</td><td>Papers and print — vector, compact pages</td></tr>
  </table>
  <p>Vector formats (SVG/PDF) never pixelate, so choose them for anything that might be zoomed or re-edited.</p>
  <h2>Retina-friendly notebooks</h2>
  <pre class="code-block">plt.rcParams['figure.dpi'] = 110
plt.rcParams['savefig.dpi'] = 150</pre>
  <p>Set <span class="ic">figure.dpi</span> for on-screen crispness and <span class="ic">savefig.dpi</span> separately for files. Two knobs, one goal: no blurry output anywhere.</p>
  <h2>A pre-ship checklist</h2>
  <ul>
    <li>Every axis has a label; the figure has a title.</li>
    <li>Legends exist and do not cover data.</li>
    <li>Tick labels are neither cut off nor rotated into each other.</li>
    <li>The color scheme survives grayscale and colorblind checks.</li>
    <li>Units are stated (dollars, thousands, degrees).</li>
    <li>The exported file opens at a readable size with no clipped text.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Version everything</strong>
    <p>Note the library versions that produced the chart (<span class="ic">matplotlib.__version__</span>). Behavior drifts between versions — pin them for reports you might regenerate later.</p>
  </div>
  <div class="callout callout-info">
    <strong>You have finished the course</strong>
    <p>Run the capstone one more time end to end, then export. Deliverables that keep the same style and annotations across regenerations are what data teams ask for — you now know how to produce them.</p>
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
  ('01A00000-0000-4000-8000-000000000501', '01A00000-0000-4000-8000-000000000303',
   'What does the Axes object own?',
   'The Axes is the plotting area that holds ticks, spines, labels, and the data.', 1),
  ('01A00000-0000-4000-8000-000000000502', '01A00000-0000-4000-8000-000000000303',
   'Which call returns a figure AND its axes in one step?',
   'plt.subplots() creates both objects together, which is why it is used everywhere.', 2),
  ('01A00000-0000-4000-8000-000000000503', '01A00000-0000-4000-8000-000000000303',
   'Which element belongs to the Figure rather than the Axes?',
   'The Figure is the canvas and owns the overall layout and global title area.', 3),
  ('01A00000-0000-4000-8000-000000000504', '01A00000-0000-4000-8000-000000000306',
   'Which method draws a line plot?',
   'ax.plot() connects (x, y) points in order, making it the natural trend plot.', 1),
  ('01A00000-0000-4000-8000-000000000505', '01A00000-0000-4000-8000-000000000306',
   'What does the bottom parameter do in ax.bar()?',
   'bottom shifts a bar upward so it stacks on top of an earlier series.', 2),
  ('01A00000-0000-4000-8000-000000000506', '01A00000-0000-4000-8000-000000000306',
   'When is a bar chart the better choice than a line chart?',
   'Bars compare named categories, while lines emphasise ordered continuity.', 3),
  ('01A00000-0000-4000-8000-000000000507', '01A00000-0000-4000-8000-000000000309',
   'How do you apply a style sheet for the whole session?',
   'plt.style.use() sets global defaults that every later chart inherits.', 1),
  ('01A00000-0000-4000-8000-000000000508', '01A00000-0000-4000-8000-000000000309',
   'What does plt.rcParams control?',
   'It is the registry of global defaults for figures, axes, fonts, and lines.', 2),
  ('01A00000-0000-4000-8000-000000000509', '01A00000-0000-4000-8000-000000000309',
   'Which colormap is a recommended all-around sequential choice?',
   'viridis is perceptually uniform and colorblind-safe, unlike rainbow palettes.', 3),
  ('01A00000-0000-4000-8000-000000000510', '01A00000-0000-4000-8000-000000000312',
   'What does plt.subplots(2, 3) return?',
   'It returns one Figure and a 2-by-3 array of Axes objects.', 1),
  ('01A00000-0000-4000-8000-000000000511', '01A00000-0000-4000-8000-000000000312',
   'What does sharey=True do in plt.subplots()?',
   'All panels get the same y-limits so side-by-side comparisons stay honest.', 2),
  ('01A00000-0000-4000-8000-000000000512', '01A00000-0000-4000-8000-000000000312',
   'What does GridSpec allow that plain subplots cannot?',
   'GridSpec supports uneven row and column sizes plus arbitrary spans.', 3),
  ('01A00000-0000-4000-8000-000000000513', '01A00000-0000-4000-8000-000000000315',
   'What does a histogram reveal about data?',
   'It groups continuous values into bins and reveals the shape of the distribution.', 1),
  ('01A00000-0000-4000-8000-000000000514', '01A00000-0000-4000-8000-000000000315',
   'What does kde=True add to sns.histplot()?',
   'A smoothed kernel-density curve that estimates the probability distribution.', 2),
  ('01A00000-0000-4000-8000-000000000515', '01A00000-0000-4000-8000-000000000315',
   'In a box plot, what does the box itself span?',
   'The box runs from the first to the third quartile, framing the middle half.', 3),
  ('01A00000-0000-4000-8000-000000000516', '01A00000-0000-4000-8000-000000000318',
   'Which seaborn function adds a regression trend line to points?',
   'sns.regplot() fits a linear model and draws the confidence band.', 1),
  ('01A00000-0000-4000-8000-000000000517', '01A00000-0000-4000-8000-000000000318',
   'What does hue= encode in sns.scatterplot()?',
   'It colors points by a third variable, adding a dimension to the plot.', 2),
  ('01A00000-0000-4000-8000-000000000518', '01A00000-0000-4000-8000-000000000318',
   'Which seaborn categorical plot shows counts per category?',
   'sns.countplot() counts the rows in each group and draws one bar per count.', 3),
  ('01A00000-0000-4000-8000-000000000519', '01A00000-0000-4000-8000-000000000321',
   'What does annot=True do in sns.heatmap()?',
   'It prints each cell value inside the cell, making exact numbers readable.', 1),
  ('01A00000-0000-4000-8000-000000000520', '01A00000-0000-4000-8000-000000000321',
   'Why set vmin=-1 and vmax=1 on a correlation heatmap?',
   'Correlations always fall in [-1, 1], so pinning the scale makes matrices comparable.', 2),
  ('01A00000-0000-4000-8000-000000000521', '01A00000-0000-4000-8000-000000000321',
   'What appears on the diagonal of sns.pairplot(df, hue="group")?',
   'A distribution plot per group for each column, coloured by the hue variable.', 3),
  ('01A00000-0000-4000-8000-000000000522', '01A00000-0000-4000-8000-000000000324',
   'Which pandas method groups a datetime index into regular buckets?',
   'resample() rebins timestamps, e.g. daily data into monthly means.', 1),
  ('01A00000-0000-4000-8000-000000000523', '01A00000-0000-4000-8000-000000000324',
   'Which method draws a vertical reference line at a fixed value?',
   'ax.axvline() places an infinite vertical marker in data coordinates.', 2),
  ('01A00000-0000-4000-8000-000000000524', '01A00000-0000-4000-8000-000000000324',
   'Which argument pins text to a fixed fraction of the axes area?',
   'transform=ax.transAxes lets text use axes-fraction coordinates that never drift.', 3),
  ('01A00000-0000-4000-8000-000000000525', '01A00000-0000-4000-8000-000000000328',
   'What should you design BEFORE writing plotting code?',
   'A grid/panel sketch that maps each question to its panel.', 1),
  ('01A00000-0000-4000-8000-000000000526', '01A00000-0000-4000-8000-000000000328',
   'Which savefig argument trims surrounding whitespace?',
   'bbox_inches="tight" crops the file to exactly what the figure draws.', 2),
  ('01A00000-0000-4000-8000-000000000527', '01A00000-0000-4000-8000-000000000328',
   'Which export format stays crisp at any zoom level?',
   'SVG is vector, so it renders sharply for web and editing workflows.', 3),
  ('01A00000-0000-4000-8000-000000000528', '01A00000-0000-4000-8000-000000000328',
   'Why keep one helper function per panel in the capstone?',
   'Isolated helpers let you swap data or tune a single panel without touching the rest.', 4),
  ('01A00000-0000-4000-8000-000000000529', '01A00000-0000-4000-8000-000000000328',
   'Which final step makes a dashboard trustworthy?',
   'Label every axis and state the units so the audience can read it exactly.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  ('01A00000-0000-4000-8000-000000001001', '01A00000-0000-4000-8000-000000000501', 'The plotting area with ticks, spines, and labels', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001002', '01A00000-0000-4000-8000-000000000501', 'The savefig output format', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001003', '01A00000-0000-4000-8000-000000000501', 'The style sheet registry', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001004', '01A00000-0000-4000-8000-000000000501', 'The matplotlib version number', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001005', '01A00000-0000-4000-8000-000000000502', 'plt.subplots()', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001006', '01A00000-0000-4000-8000-000000000502', 'plt.savefig()', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001007', '01A00000-0000-4000-8000-000000000502', 'plt.rcParams', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001008', '01A00000-0000-4000-8000-000000000502', 'plt.legend()', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001009', '01A00000-0000-4000-8000-000000000503', 'The canvas and overall layout', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001010', '01A00000-0000-4000-8000-000000000503', 'The y-axis tick labels', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001011', '01A00000-0000-4000-8000-000000000503', 'The plotted data points', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001012', '01A00000-0000-4000-8000-000000000503', 'The legend entries', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001013', '01A00000-0000-4000-8000-000000000504', 'ax.plot()', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001014', '01A00000-0000-4000-8000-000000000504', 'ax.bar()', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001015', '01A00000-0000-4000-8000-000000000504', 'ax.scatter()', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001016', '01A00000-0000-4000-8000-000000000504', 'ax.hist()', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001017', '01A00000-0000-4000-8000-000000000505', 'Stacks the bar on top of an earlier series', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001018', '01A00000-0000-4000-8000-000000000505', 'Sets the bar color to black', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001019', '01A00000-0000-4000-8000-000000000505', 'Rotates the bar by 90 degrees', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001020', '01A00000-0000-4000-8000-000000000505', 'Adds a grid line under the bar', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001021', '01A00000-0000-4000-8000-000000000506', 'When the x-axis holds named categories', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001022', '01A00000-0000-4000-8000-000000000506', 'When data is strictly ordered by time', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001023', '01A00000-0000-4000-8000-000000000506', 'When plotting a full day of timestamps', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001024', '01A00000-0000-4000-8000-000000000506', 'When both axes are continuous measurements', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001025', '01A00000-0000-4000-8000-000000000507', 'plt.style.use()', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001026', '01A00000-0000-4000-8000-000000000507', 'ax.style.use()', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001027', '01A00000-0000-4000-8000-000000000507', 'fig.grid(style="clean")', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001028', '01A00000-0000-4000-8000-000000000507', 'plt.show(style=True)', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001029', '01A00000-0000-4000-8000-000000000508', 'Global defaults for figures, axes, and fonts', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001030', '01A00000-0000-4000-8000-000000000508', 'The current figure size only', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001031', '01A00000-0000-4000-8000-000000000508', 'The list of installed fonts', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001032', '01A00000-0000-4000-8000-000000000508', 'The array of axes in the last figure', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001033', '01A00000-0000-4000-8000-000000000509', 'viridis', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001034', '01A00000-0000-4000-8000-000000000509', 'jet', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001035', '01A00000-0000-4000-8000-000000000509', 'rainbow', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001036', '01A00000-0000-4000-8000-000000000509', 'flag', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001037', '01A00000-0000-4000-8000-000000000510', 'A Figure and a 2-by-3 array of Axes', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001038', '01A00000-0000-4000-8000-000000000510', 'Two separate figures with three panes each', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001039', '01A00000-0000-4000-8000-000000000510', 'A list of six legend objects', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001040', '01A00000-0000-4000-8000-000000000510', 'A single Axes with six stacked layers', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001041', '01A00000-0000-4000-8000-000000000511', 'All panels share the same y-limits', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001042', '01A00000-0000-4000-8000-000000000511', 'All panels use the same title text', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001043', '01A00000-0000-4000-8000-000000000511', 'Widens every panel equally', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001044', '01A00000-0000-4000-8000-000000000511', 'Removes every y-axis from the figure', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001045', '01A00000-0000-4000-8000-000000000512', 'Uneven sizes and arbitrary panel spans', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001046', '01A00000-0000-4000-8000-000000000512', 'Applying random colors per panel', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001047', '01A00000-0000-4000-8000-000000000512', 'Rotating the whole figure on export', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001048', '01A00000-0000-4000-8000-000000000512', 'Animating the panels in a notebook', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001049', '01A00000-0000-4000-8000-000000000513', 'The shape and spread of the distribution', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001050', '01A00000-0000-4000-8000-000000000513', 'The exact mean and median values', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001051', '01A00000-0000-4000-8000-000000000513', 'The correlation between two variables', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001052', '01A00000-0000-4000-8000-000000000513', 'The change over time of one variable', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001053', '01A00000-0000-4000-8000-000000000514', 'A smoothed density curve', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001054', '01A00000-0000-4000-8000-000000000514', 'A linear regression line', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001055', '01A00000-0000-4000-8000-000000000514', 'Eror bars on every bin', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001056', '01A00000-0000-4000-8000-000000000514', 'A colorbar for the plot', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001057', '01A00000-0000-4000-8000-000000000515', 'From the first to the third quartile', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001058', '01A00000-0000-4000-8000-000000000515', 'From the minimum to the maximum', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001059', '01A00000-0000-4000-8000-000000000515', 'From the median to the mean', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001060', '01A00000-0000-4000-8000-000000000515', 'From zero to the median', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001061', '01A00000-0000-4000-8000-000000000516', 'sns.regplot()', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001062', '01A00000-0000-4000-8000-000000000516', 'sns.boxplot()', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001063', '01A00000-0000-4000-8000-000000000516', 'sns.heatmap()', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001064', '01A00000-0000-4000-8000-000000000516', 'sns.pairplot()', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001065', '01A00000-0000-4000-8000-000000000517', 'Colors points by a third variable', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001066', '01A00000-0000-4000-8000-000000000517', 'Adds a second x-axis', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001067', '01A00000-0000-4000-8000-000000000517', 'Rotates the marker shapes', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001068', '01A00000-0000-4000-8000-000000000517', 'Sets the point transparency', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001069', '01A00000-0000-4000-8000-000000000518', 'sns.countplot()', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001070', '01A00000-0000-4000-8000-000000000518', 'sns.timeseries()', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001071', '01A00000-0000-4000-8000-000000000518', 'sns.pieplot()', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001072', '01A00000-0000-4000-8000-000000000518', 'sns.scatterplot()', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001073', '01A00000-0000-4000-8000-000000000519', 'Prints each cell value inside the cell', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001074', '01A00000-0000-4000-8000-000000000519', 'Adds axis labels automatically', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001075', '01A00000-0000-4000-8000-000000000519', 'Fills missing cells with the mean', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001076', '01A00000-0000-4000-8000-000000000519', 'Draws a colorbar for each row', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001077', '01A00000-0000-4000-8000-000000000520', 'Correlations are bounded by -1 and 1', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001078', '01A00000-0000-4000-8000-000000000520', 'Matplotlib rejects values above 1', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001079', '01A00000-0000-4000-8000-000000000520', 'It speeds up the heatmap drawing', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001080', '01A00000-0000-4000-8000-000000000520', 'It removes the diagonal automatically', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001081', '01A00000-0000-4000-8000-000000000521', 'A distribution plot per group', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001082', '01A00000-0000-4000-8000-000000000521', 'A correlation heatmap', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001083', '01A00000-0000-4000-8000-000000000521', 'A set of box plots', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001084', '01A00000-0000-4000-8000-000000000521', 'A legend list', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001085', '01A00000-0000-4000-8000-000000000522', 'resample()', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001086', '01A00000-0000-4000-8000-000000000522', 'groupby("date")', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001087', '01A00000-0000-4000-8000-000000000522', 'sort_values()', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001088', '01A00000-0000-4000-8000-000000000522', 'fillna()', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001089', '01A00000-0000-4000-8000-000000000523', 'ax.axvline()', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001090', '01A00000-0000-4000-8000-000000000523', 'ax.legend()', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001091', '01A00000-0000-4000-8000-000000000523', 'ax.set_title()', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001092', '01A00000-0000-4000-8000-000000000523', 'fig.savefig()', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001093', '01A00000-0000-4000-8000-000000000524', 'transform=ax.transAxes', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001094', '01A00000-0000-4000-8000-000000000524', 'alpha=0.5', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001095', '01A00000-0000-4000-8000-000000000524', 'linestyle="--"', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001096', '01A00000-0000-4000-8000-000000000524', 'cbar_kws={"shrink": 0.7}', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001097', '01A00000-0000-4000-8000-000000000525', 'A grid/panel sketch mapping each question to a panel', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001098', '01A00000-0000-4000-8000-000000000525', 'The final export filename', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001099', '01A00000-0000-4000-8000-000000000525', 'The legend placement', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001100', '01A00000-0000-4000-8000-000000000525', 'The colormap choice', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001101', '01A00000-0000-4000-8000-000000000526', 'bbox_inches="tight"', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001102', '01A00000-0000-4000-8000-000000000526', 'dpi=50', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001103', '01A00000-0000-4000-8000-000000000526', 'edgecolor="white"', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001104', '01A00000-0000-4000-8000-000000000526', 'figsize=(3, 2)', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001105', '01A00000-0000-4000-8000-000000000527', 'SVG', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001106', '01A00000-0000-4000-8000-000000000527', 'PNG at 72 dpi', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001107', '01A00000-0000-4000-8000-000000000527', 'JPG at low quality', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001108', '01A00000-0000-4000-8000-000000000527', 'GIF', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001109', '01A00000-0000-4000-8000-000000000528', 'Panels stay isolated and reusable', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001110', '01A00000-0000-4000-8000-000000000528', 'It reduces the file size', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001111', '01A00000-0000-4000-8000-000000000528', 'It removes the need for legends', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001112', '01A00000-0000-4000-8000-000000000528', 'It forces one shared color cycle', FALSE, 4),
  ('01A00000-0000-4000-8000-000000001113', '01A00000-0000-4000-8000-000000000529', 'Label every axis and state the units', TRUE,  1),
  ('01A00000-0000-4000-8000-000000001114', '01A00000-0000-4000-8000-000000000529', 'Remove all tick labels', FALSE, 2),
  ('01A00000-0000-4000-8000-000000001115', '01A00000-0000-4000-8000-000000000529', 'Add as many colors as possible', FALSE, 3),
  ('01A00000-0000-4000-8000-000000001116', '01A00000-0000-4000-8000-000000000529', 'Hide the title to keep it quiet', FALSE, 4)
ON CONFLICT (id) DO NOTHING;