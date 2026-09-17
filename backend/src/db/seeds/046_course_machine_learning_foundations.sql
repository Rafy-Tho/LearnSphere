-- ============================================================================
-- SEED 046: Complete course — "Machine Learning Foundations"
-- ----------------------------------------------------------------------------
-- Instructor : Anita Patel        (10000000-0000-4000-8000-000000000003)
-- Category   : Data Science       (20000000-0000-4000-8000-000000000003)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Foundations of ML                    → C1 Core Concepts & ML Types · C2 Data & Feature Engineering
--   M2 Supervised Learning: Regression      → C3 Splitting & Evaluation · C4 Linear Regression
--   M3 Supervised Learning: Classification  → C5 Classification Models · C6 Ensembles & k-NN
--   M4 Unsupervised Learning & Evaluation   → C7 Clustering · C8 Evaluation & Diagnostics
--   M5 Workflow & Capstone                  → C9 End-to-End Workflow · C10 Capstone Project
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across `quizzes` and `quiz_options`.
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
  '02E00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000003',
  '20000000-0000-4000-8000-000000000003',
  'Machine Learning Foundations',
  'machine-learning-foundations',
  'Build a real machine learning foundation. Master learning types, data cleaning and features, honest train/test evaluation, regression and classification models, clustering, and then run a complete end-to-end prediction pipeline.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  44
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02E00000-0000-4000-8000-000000000011', '02E00000-0000-4000-8000-000000000001', 'Explain the three major types of machine learning and when to use each.',          1),
  ('02E00000-0000-4000-8000-000000000012', '02E00000-0000-4000-8000-000000000001', 'Prepare real-world data and engineer features for modeling.',                      2),
  ('02E00000-0000-4000-8000-000000000013', '02E00000-0000-4000-8000-000000000001', 'Build and evaluate regression and classification models with scikit-learn.',        3),
  ('02E00000-0000-4000-8000-000000000014', '02E00000-0000-4000-8000-000000000001', 'Apply clustering to uncover structure and use proper evaluation metrics.',           4),
  ('02E00000-0000-4000-8000-000000000015', '02E00000-0000-4000-8000-000000000001', 'Run a complete machine learning workflow from raw data to a working pipeline.',      5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02E00000-0000-4000-8000-000000000101', '02E00000-0000-4000-8000-000000000001', 1, 'Foundations of Machine Learning',   'Core concepts, learning types, and data readiness.',                 'PUBLISHED'),
  ('02E00000-0000-4000-8000-000000000102', '02E00000-0000-4000-8000-000000000001', 2, 'Supervised Learning: Regression',   'Predict continuous values with linear models.',                      'PUBLISHED'),
  ('02E00000-0000-4000-8000-000000000103', '02E00000-0000-4000-8000-000000000001', 3, 'Supervised Learning: Classification','Predict categories with logistic regression, trees, and ensembles.', 'PUBLISHED'),
  ('02E00000-0000-4000-8000-000000000104', '02E00000-0000-4000-8000-000000000001', 4, 'Unsupervised Learning & Evaluation','Cluster data and measure model quality reliably.',                    'PUBLISHED'),
  ('02E00000-0000-4000-8000-000000000105', '02E00000-0000-4000-8000-000000000001', 5, 'Workflow & Capstone',               'Run an end-to-end project and iterate like a data scientist.',       'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02E00000-0000-4000-8000-000000000201', '02E00000-0000-4000-8000-000000000101', 1, 'Core Concepts & ML Types',     'What machine learning is and the main learning paradigms.',  'PUBLISHED'),
  ('02E00000-0000-4000-8000-000000000202', '02E00000-0000-4000-8000-000000000101', 2, 'Data & Feature Engineering',   'Clean data and build features models can learn from.',        'PUBLISHED'),
  ('02E00000-0000-4000-8000-000000000203', '02E00000-0000-4000-8000-000000000102', 1, 'Splitting & Evaluation',       'Hold data out honestly and measure regression quality.',      'PUBLISHED'),
  ('02E00000-0000-4000-8000-000000000204', '02E00000-0000-4000-8000-000000000102', 2, 'Linear Regression',            'Fit straight lines, polynomials, and regularized models.',    'PUBLISHED'),
  ('02E00000-0000-4000-8000-000000000205', '02E00000-0000-4000-8000-000000000103', 1, 'Classification Models',        'Model probabilities and decisions with regression and trees.','PUBLISHED'),
  ('02E00000-0000-4000-8000-000000000206', '02E00000-0000-4000-8000-000000000103', 2, 'Ensembles & Instance-Based',   'Combine many models and learn from neighbors.',               'PUBLISHED'),
  ('02E00000-0000-4000-8000-000000000207', '02E00000-0000-4000-8000-000000000104', 1, 'Clustering',                   'Find natural groups in unlabeled data.',                      'PUBLISHED'),
  ('02E00000-0000-4000-8000-000000000208', '02E00000-0000-4000-8000-000000000104', 2, 'Evaluation & Diagnostics',     'Measure classifier quality and fight overfitting.',           'PUBLISHED'),
  ('02E00000-0000-4000-8000-000000000209', '02E00000-0000-4000-8000-000000000105', 1, 'End-to-End Workflow',          'The full process from problem to deployed model.',            'PUBLISHED'),
  ('02E00000-0000-4000-8000-000000000210', '02E00000-0000-4000-8000-000000000105', 2, 'Capstone Project',             'Build, evaluate, and iterate on a prediction pipeline.',      'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02E00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02E00000-0000-4000-8000-000000000301', '02E00000-0000-4000-8000-000000000201', 1, 'What is Machine Learning?',           'Understand what machine learning is and how it differs from traditional programming.',  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02E00000-0000-4000-8000-000000000302', '02E00000-0000-4000-8000-000000000201', 2, 'Types of Machine Learning',           'Compare supervised, unsupervised, and reinforcement learning.',                         'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02E00000-0000-4000-8000-000000000303', '02E00000-0000-4000-8000-000000000201', 3, 'ML Foundations Quiz',                  'Check your understanding of core machine learning concepts.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02E00000-0000-4000-8000-000000000304', '02E00000-0000-4000-8000-000000000202', 1, 'Data Preparation & Cleaning',          'Tidy real-world data: missing values, duplicates, and outliers.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02E00000-0000-4000-8000-000000000305', '02E00000-0000-4000-8000-000000000202', 2, 'Features & Feature Engineering',       'Turn raw columns into features models can learn from.',                                 'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('02E00000-0000-4000-8000-000000000306', '02E00000-0000-4000-8000-000000000202', 3, 'Data & Features Quiz',                 'Test your data preparation and feature knowledge.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02E00000-0000-4000-8000-000000000307', '02E00000-0000-4000-8000-000000000203', 1, 'Training & Test Splits',               'Hold data out honestly so evaluation reflects unseen rows.',                            'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('02E00000-0000-4000-8000-000000000308', '02E00000-0000-4000-8000-000000000203', 2, 'Regression Evaluation Metrics',        'Measure error with MAE, MSE, RMSE, and R-squared.',                                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02E00000-0000-4000-8000-000000000309', '02E00000-0000-4000-8000-000000000203', 3, 'Splitting & Evaluation Quiz',          'Verify you can split data and read regression metrics.',                                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02E00000-0000-4000-8000-000000000310', '02E00000-0000-4000-8000-000000000204', 1, 'Linear Regression',                    'Fit and interpret the classic continuous-prediction model.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02E00000-0000-4000-8000-000000000311', '02E00000-0000-4000-8000-000000000204', 2, 'Polynomial & Regularized Regression',  'Add flexibility to linear models and tame it with regularization.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('02E00000-0000-4000-8000-000000000312', '02E00000-0000-4000-8000-000000000204', 3, 'Regression Quiz',                      'Check your understanding of linear and regularized models.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02E00000-0000-4000-8000-000000000313', '02E00000-0000-4000-8000-000000000205', 1, 'Logistic Regression',                  'Model class probabilities with the sigmoid function.',                                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02E00000-0000-4000-8000-000000000314', '02E00000-0000-4000-8000-000000000205', 2, 'Decision Trees',                       'Learn the rule-based classifier behind random forests.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('02E00000-0000-4000-8000-000000000315', '02E00000-0000-4000-8000-000000000205', 3, 'Classification Quiz',                  'Test your knowledge of classification models.',                                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02E00000-0000-4000-8000-000000000316', '02E00000-0000-4000-8000-000000000206', 1, 'Ensemble Methods',                     'Combine many models with bagging and boosting.',                                        'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02E00000-0000-4000-8000-000000000317', '02E00000-0000-4000-8000-000000000206', 2, 'k-Nearest Neighbors',                  'Predict by majority vote of the nearest training points.',                              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02E00000-0000-4000-8000-000000000318', '02E00000-0000-4000-8000-000000000206', 3, 'Ensembles & k-NN Quiz',                'Check your ensemble and instance-based learning skills.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02E00000-0000-4000-8000-000000000319', '02E00000-0000-4000-8000-000000000207', 1, 'k-Means Clustering',                   'Partition unlabeled data into k compact clusters.',                                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02E00000-0000-4000-8000-000000000320', '02E00000-0000-4000-8000-000000000207', 2, 'Hierarchical & Density-Based Clustering', 'Use dendrograms and density to cluster arbitrary shapes.',                              'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('02E00000-0000-4000-8000-000000000321', '02E00000-0000-4000-8000-000000000207', 3, 'Clustering Quiz',                      'Verify you can group unlabeled data and pick the right k.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02E00000-0000-4000-8000-000000000322', '02E00000-0000-4000-8000-000000000208', 1, 'Classification Metrics',               'Read a confusion matrix and use precision, recall, and F1.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02E00000-0000-4000-8000-000000000323', '02E00000-0000-4000-8000-000000000208', 2, 'Overfitting, Bias & Regularization',   'Diagnose the training-validation gap and fix it.',                                      'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02E00000-0000-4000-8000-000000000324', '02E00000-0000-4000-8000-000000000208', 3, 'Model Evaluation Quiz',                'Test your evaluation and diagnostics knowledge.',                                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02E00000-0000-4000-8000-000000000325', '02E00000-0000-4000-8000-000000000209', 1, 'The Machine Learning Workflow',        'See the end-to-end loop from problem to monitoring.',                                   'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02E00000-0000-4000-8000-000000000326', '02E00000-0000-4000-8000-000000000210', 1, 'Building a Prediction Pipeline',       'Chain preprocessing and modeling into one object.',                                     'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02E00000-0000-4000-8000-000000000327', '02E00000-0000-4000-8000-000000000210', 2, 'Evaluation & Iteration',               'Compare models, tune carefully, and ship with discipline.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02E00000-0000-4000-8000-000000000328', '02E00000-0000-4000-8000-000000000210', 3, 'Final Assessment',                     'Prove what you learned across the whole course.',                                        'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02E00000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02E00000-0000-4000-8000-000000000401',
  '02E00000-0000-4000-8000-000000000301',
  1,
  'What is Machine Learning?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is Machine Learning?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is Machine Learning?</h1>
  <p>Machine learning is a field where computers <strong>learn from data</strong> instead of following rules a human writes by hand. A model finds patterns in examples and uses those patterns to make predictions on new, unseen input.</p>
  <p>In traditional programming you write the rules and feed in data to get answers. In machine learning you feed in data <em>and</em> the answers, and the computer writes the rules itself:</p>
  <pre class="code-block">traditional:       data + rules  -> answers
machine learning:  data + answers -> rules (a model)</pre>
  <h2>Core vocabulary</h2>
  <ul>
    <li><span class="ic">Features</span> — the input variables describing each example (e.g., square footage, bedrooms).</li>
    <li><span class="ic">Label / target</span> — the answer we want to predict (e.g., house price).</li>
    <li><span class="ic">Model</span> — the learned rule that maps features to the target.</li>
    <li><span class="ic">Training</span> — the process of fitting a model to examples.</li>
    <li><span class="ic">Inference</span> — using the trained model to answer on new data.</li>
  </ul>
  <h2>What each task looks like</h2>
  <table>
    <tr><th>Question</th><th>Features</th><th>Target</th></tr>
    <tr><td>Will this email be opened?</td><td>subject, sender, length</td><td>opened yes/no</td></tr>
    <tr><td>What will sales be next month?</td><td>week, price, ads</td><td>units sold</td></tr>
    <tr><td>Which segment is this user?</td><td>clicks, time, items</td><td>(none — group only)</td></tr>
  </table>
  <div class="callout">
    <strong>The pattern</strong>
    <p>Every ML project reduces to: prepare data, choose a model, train it, and honestly evaluate how well it generalizes.</p>
  </div>
  <div class="callout callout-info">
    <strong>Prerequisite</strong>
    <p>You should already know Python basics and basic statistics. Everything machine-learning-specific is taught here from zero.</p>
  </div>
  <div class="callout callout-tip">
    <strong>What you will build</strong>
    <p>By the end of this course you will ship an end-to-end pipeline that predicts house prices from raw tabular data.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000402',
  '02E00000-0000-4000-8000-000000000302',
  1,
  'Types of Machine Learning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Types of Machine Learning</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Types of Machine Learning</h1>
  <p>Learning tasks divide into three broad families, named by what the training data looks like and what the model is asked to do.</p>
  <h2>Supervised learning</h2>
  <p>Every training example has a <strong>label</strong>. The model learns the map from features to label.</p>
  <ul>
    <li>Regression — the label is a number (price, temperature).</li>
    <li>Classification — the label is a category (spam/not spam, digit 0–9).</li>
  </ul>
  <h2>Unsupervised learning</h2>
  <p>No labels. The model finds structure on its own — grouping, compressing, or flagging anomalies.</p>
  <ul>
    <li>Clustering — group similar customers or items.</li>
    <li>Dimensionality reduction — compress many columns into few.</li>
    <li>Anomaly detection — flag unusual behavior.</li>
  </ul>
  <h2>Reinforcement learning</h2>
  <p>An agent learns a <strong>policy</strong> by acting and receiving rewards or penalties. Used in games, robotics, and recommendation.</p>
  <h2>Comparison at a glance</h2>
  <table>
    <tr><th>Paradigm</th><th>Data has labels?</th><th>Goal</th><th>Example</th></tr>
    <tr><td>Supervised</td><td>Yes</td><td>Predict the label</td><td>Price forecast</td></tr>
    <tr><td>Unsupervised</td><td>No</td><td>Find hidden structure</td><td>Customer segments</td></tr>
    <tr><td>Reinforcement</td><td>Rewards, not labels</td><td>Maximize long-term reward</td><td>Game-playing agent</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Start supervised</strong>
    <p>Most real business problems are supervised. This course spends the most time there, then covers unsupervised clustering.</p>
  </div>
  <div class="callout callout-info">
    <strong>Semi-supervised</strong>
    <p>A hybrid: a little labeled data plus a lot of unlabeled data. The model is seeded by labels, then propagates structure to the rest.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000404',
  '02E00000-0000-4000-8000-000000000304',
  1,
  'Data Preparation & Cleaning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Data Preparation & Cleaning</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Data Preparation &amp; Cleaning</h1>
  <p>Real data is messy. Cleaning it is the largest share of a typical project and influences the outcome more than the algorithm choice.</p>
  <h2>Common data problems</h2>
  <table>
    <tr><th>Problem</th><th>Example</th><th>Typical fix</th></tr>
    <tr><td>Missing values</td><td>blank price</td><td>drop or impute</td></tr>
    <tr><td>Duplicates</td><td>same row twice</td><td>drop_duplicates()</td></tr>
    <tr><td>Wrong types</td><td>price stored as text</td><td>cast to numeric</td></tr>
    <tr><td>Impossible values</td><td>age 240</td><td>domain rules</td></tr>
    <tr><td>Inconsistent strings</td><td>"NYC" vs "New York"</td><td>normalize</td></tr>
  </table>
  <h2>Handling missing values</h2>
  <pre class="code-block">import pandas as pd

df = pd.read_csv("houses.csv")
print(df.isna().sum())

df = df.dropna(subset=["price"])       # rows without target are useless
df["bedrooms"] = df["bedrooms"].fillna(df["bedrooms"].median())</pre>
  <div class="callout callout-info">
    <strong>Missing target</strong>
    <p>Rows without a label can never be used for supervised training. Drop them, or keep them for prediction-time scoring later.</p>
  </div>
  <h2>Outliers</h2>
  <p>Outliers can drag regression lines around. Investigate before deleting — they might be data-entry errors or genuinely important rare cases.</p>
  <pre class="code-block">q1 = df["price"].quantile(0.25)
q3 = df["price"].quantile(0.75)
iqr = q3 - q1
cap = q3 + 1.5 * iqr
print(df[df["price"] > cap].shape)</pre>
  <div class="callout callout-tip">
    <strong>Clean once, reuse forever</strong>
    <p>Move cleaning steps into functions so a new dataset — tomorrows test set or next quarters data — goes through the exact same rules.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000405',
  '02E00000-0000-4000-8000-000000000305',
  1,
  'Features & Feature Engineering',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Features & Feature Engineering</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Features &amp; Feature Engineering</h1>
  <p>A <strong>feature</strong> is a single measurable property of an example. Feature engineering turns raw data into features a model can learn from — and good features beat clever algorithms.</p>
  <h2>Feature types</h2>
  <table>
    <tr><th>Type</th><th>Example</th><th>How models see it</th></tr>
    <tr><td>Numeric</td><td>price, area</td><td>as-is (or scaled)</td></tr>
    <tr><td>Ordinal</td><td>rating 1–5</td><td>ordered integers</td></tr>
    <tr><td>Categorical</td><td>city, style</td><td>encoded</td></tr>
    <tr><td>Datetime</td><td>listed_at</td><td>year, month, weekday</td></tr>
    <tr><td>Text</td><td>description</td><td>TF–IDF vectors</td></tr>
  </table>
  <h2>Encoding categoricals</h2>
  <pre class="code-block"># one-hot: category -&gt; indicator columns
district_ohe = pd.get_dummies(df[["district"]], prefix="district")

# ordinal: preserve known ordering
df["rating_code"] = df["rating"].map({"low": 1, "mid": 2, "high": 3})</pre>
  <h2>Scaling numeric features</h2>
  <pre class="code-block">from sklearn.preprocessing import StandardScaler

scaler = StandardScaler()
df["price_scaled"] = scaler.fit_transform(df[["price"]])</pre>
  <p>Distance-based models (k-NN, clustering) and gradient descent need comparable scales, or one column silently dominates the math.</p>
  <h2>Creating features</h2>
  <ul>
    <li>Domain ratios: price per square meter.</li>
    <li>Binning: age to decade.</li>
    <li>Aggregates: mean neighborhood price.</li>
    <li>Time pieces: season, weekend flag.</li>
  </ul>
  <div class="callout">
    <strong>Watch for leakage</strong>
    <p>A feature that encodes the answer (e.g., "sold fast" derived from the target) guarantees strong training scores and poor real-world results.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000407',
  '02E00000-0000-4000-8000-000000000307',
  1,
  'Training & Test Splits',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Training & Test Splits</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Training &amp; Test Splits</h1>
  <p>Your goal is a model that works on data it has never seen. If you evaluate on training data, you are grading the exam with the answer sheet. The fix is a held-out <strong>test set</strong>.</p>
  <h2>The three-way split</h2>
  <table>
    <tr><th>Set</th><th>Use</th><th>Typical size</th></tr>
    <tr><td>Train</td><td>fit the model</td><td>70–80%</td></tr>
    <tr><td>Validation</td><td>pick hyperparameters</td><td>10–15%</td></tr>
    <tr><td>Test</td><td>final honest check</td><td>10–15%</td></tr>
  </table>
  <h2>Splitting in practice</h2>
  <pre class="code-block">from sklearn.model_selection import train_test_split

X = df.drop(columns=["price"])
y = df["price"]

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, shuffle=True
)</pre>
  <div class="callout callout-tip">
    <strong>random_state</strong>
    <p>A fixed <span class="ic">random_state</span> makes the split reproducible. Change the seed and results shift — a constant seed keeps experiments comparable.</p>
  </div>
  <h2>Stratification</h2>
  <p>For classification with rare classes, a random split may empty a class from the test set. <span class="ic">stratify=y</span> keeps class proportions in both sets.</p>
  <pre class="code-block">X_tr, X_te, y_tr, y_te = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y
)</pre>
  <div class="callout">
    <strong>No fit on the test set</strong>
    <p>Never scale, impute, or encode using test statistics. Fit those transforms on the training set only, then apply them to the test set.</p>
  </div>
  <h2>Ordered data</h2>
  <p>Time series must not be shuffled. Split by time so the model is tested on the future, not the past.</p>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000408',
  '02E00000-0000-4000-8000-000000000308',
  1,
  'Regression Evaluation Metrics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Regression Evaluation Metrics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Regression Evaluation Metrics</h1>
  <p>Once a regression model predicts numbers, how do you know it is good? Metrics compare predictions with true values. All of them start with <strong>residuals</strong> — the differences.</p>
  <pre class="code-block">residual = y_true - y_pred</pre>
  <h2>Core metrics</h2>
  <table>
    <tr><th>Metric</th><th>Meaning</th><th>Sensitive to</th></tr>
    <tr><td>MAE</td><td>average absolute error</td><td>typical error, all equally</td></tr>
    <tr><td>MSE</td><td>average squared error</td><td>large errors (squared)</td></tr>
    <tr><td>RMSE</td><td>square root of MSE</td><td>large errors, in target units</td></tr>
    <tr><td>R²</td><td>variance explained vs mean baseline</td><td>overall fit vs baseline</td></tr>
  </table>
  <pre class="code-block">from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

mae  = mean_absolute_error(y_test, y_pred)
mse  = mean_squared_error(y_test, y_pred)
rmse = mse ** 0.5
r2   = r2_score(y_test, y_pred)</pre>
  <div class="callout">
    <strong>R² interpretation</strong>
    <p>R² = 1 is a perfect fit, R² = 0 means no better than predicting the mean, and a negative R² means worse than that baseline.</p>
  </div>
  <h2>Picking a metric</h2>
  <ul>
    <li>Price prediction — RMSE: big mistakes are costly.</li>
    <li>Sensor calibration — MAE: every unit of error matters equally.</li>
    <li>Comparing to a baseline — R² shows the gain over the average.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Always report the baseline</strong>
    <p>Predicting the training mean on every test row is the weakest possible model. Any real model must beat it by a meaningful margin.</p>
  </div>
  <h2>Debugging bad predictions</h2>
  <p>Plot residuals against predictions. Patterns such as funnels or curves reveal model flaws that a single number hides.</p>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000410',
  '02E00000-0000-4000-8000-000000000310',
  1,
  'Linear Regression',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Linear Regression</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Linear Regression</h1>
  <p>Linear regression models the target as a weighted sum of features plus an intercept. It is simple, fast, interpretable, and often a strong baseline that anything fancier must beat.</p>
  <pre class="code-block">price = w0 + w1 * area + w2 * bedrooms + noise</pre>
  <ul>
    <li><span class="ic">w0</span> — the intercept (prediction when all features are zero).</li>
    <li><span class="ic">w1, w2 …</span> — slopes: the change in the target for a one-unit change in that feature.</li>
  </ul>
  <h2>Fitting the model</h2>
  <p><span class="ic">Ordinary least squares</span> chooses weights that minimize the sum of squared residuals.</p>
  <pre class="code-block">from sklearn.linear_model import LinearRegression

model = LinearRegression()
model.fit(X_train, y_train)

print(model.intercept_)
print(model.coef_)</pre>
  <h2>Reading the coefficients</h2>
  <p>A slope of 120 on <span class="ic">area</span> says each extra square meter raises the predicted price by 120 — <em>holding other features constant</em>.</p>
  <div class="callout callout-info">
    <strong>Do not over-interpret</strong>
    <p>Correlated features muddle individual coefficients. If two features move together, their slopes split the credit unpredictably.</p>
  </div>
  <h2>Assumptions worth checking</h2>
  <table>
    <tr><th>Assumption</th><th>Cheap check</th></tr>
    <tr><td>Roughly linear relationship</td><td>scatter features against target</td></tr>
    <tr><td>No wild outliers</td><td>residual boxplot</td></tr>
    <tr><td>Stable spread</td><td>residuals vs fitted plot</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Start here</strong>
    <p>Fit linear regression first on almost every regression problem. It sets an interpretable benchmark and exposes data problems fast.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000411',
  '02E00000-0000-4000-8000-000000000311',
  1,
  'Polynomial & Regularized Regression',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Polynomial & Regularized Regression</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Polynomial &amp; Regularized Regression</h1>
  <p>Real relationships are rarely straight lines. You can keep the linear machinery and feed it non-linear features — or restrain flexibility when the model becomes too jumpy.</p>
  <h2>Polynomial features</h2>
  <p>Adding squared and cubic terms lets the same least-squares fitter trace curves:</p>
  <pre class="code-block">from sklearn.preprocessing import PolynomialFeatures
from sklearn.pipeline import make_pipeline
from sklearn.linear_model import LinearRegression

pipe = make_pipeline(
    PolynomialFeatures(degree=3),
    LinearRegression()
)
pipe.fit(X_train, y_train)</pre>
  <div class="callout">
    <strong>High degree overfits</strong>
    <p>Degree 25 will snake through every training point and fail on anything new. The added flexibility is the problem, not the solution.</p>
  </div>
  <h2>Regularization</h2>
  <p>Regularization adds a penalty for large weights, trading a little training accuracy for a lot of stability.</p>
  <table>
    <tr><th>Method</th><th>Penalty</th><th>Effect</th></tr>
    <tr><td>Ridge (L2)</td><td>sum of squared weights</td><td>shrinks weights toward zero</td></tr>
    <tr><td>Lasso (L1)</td><td>sum of absolute weights</td><td>can set weights to zero</td></tr>
    <tr><td>ElasticNet</td><td>mix of L1 and L2</td><td>balance of both</td></tr>
  </table>
  <pre class="code-block">from sklearn.linear_model import Ridge

ridge = Ridge(alpha=10.0)   # bigger alpha = stronger penalty
ridge.fit(X_train, y_train)</pre>
  <div class="callout callout-tip">
    <strong>Scale before regularizing</strong>
    <p>Ridge and Lasso punish weight magnitude, so features with large units would take the hit unfairly. Standardize features first.</p>
  </div>
  <div class="callout callout-info">
    <strong>The bias-variance trade</strong>
    <p>More flexibility lowers bias but raises variance. Regularization is the dial you turn to find the balance your data supports.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000413',
  '02E00000-0000-4000-8000-000000000313',
  1,
  'Logistic Regression',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Logistic Regression</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Logistic Regression</h1>
  <p>Despite the name, logistic regression is a <strong>classification</strong> model. It outputs the probability that an example belongs to the positive class.</p>
  <p>A linear combination of features is pushed through the <span class="ic">sigmoid</span> function, which squashes any real number into the interval (0, 1):</p>
  <pre class="code-block">p = 1 / (1 + e ^ -(w0 + w1*x1 + w2*x2))</pre>
  <h2>Decision rule</h2>
  <p>Predict the positive class when the probability exceeds a threshold (default 0.5). Lower thresholds catch more positives but raise false alarms.</p>
  <pre class="code-block">from sklearn.linear_model import LogisticRegression

clf = LogisticRegression()
clf.fit(X_train, y_train)

print(clf.predict_proba(X_test)[:3])   # P(0), P(1) per row
print(clf.predict(X_test)[:3])</pre>
  <h2>Training objective</h2>
  <p>Weights are tuned to minimize <span class="ic">log loss</span> (cross-entropy): wrong confident predictions get punished hardest.</p>
  <div class="callout callout-info">
    <strong>Credit approval example</strong>
    <p>A bank might threshold at 0.6 for auto-approval and 0.3 for manual review — the probability, not the raw label, drives the business rule.</p>
  </div>
  <h2>Multiclass</h2>
  <p>One-vs-rest trains one binary model per class; the prediction is the class with the highest probability.</p>
  <table>
    <tr><th>Situation</th><th>Recommended model</th></tr>
    <tr><td>Two classes, need probabilities</td><td>logistic regression</td></tr>
    <tr><td>Known non-linear boundaries</td><td>trees or kernels</td></tr>
    <tr><td>Imbalanced rare positives</td><td>threshold tuning + class_weight</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Look at probabilities, not just labels</strong>
    <p>Two applicants can both be predicted approved — one at 0.51, one at 0.99. The model sees them very differently, and so should you.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000414',
  '02E00000-0000-4000-8000-000000000314',
  1,
  'Decision Trees',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Decision Trees</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Decision Trees</h1>
  <p>A decision tree asks a chain of <strong>if/else questions</strong> about the features. Each node splits the data; leaves hold the prediction.</p>
  <pre class="code-block">price > 120?                     (root)
|-- yes -> area > 100?
|          |-- yes -> predict 180
|          +-- no  -> predict 140
+-- no  -> predict 90            (leaf)</pre>
  <h2>How splits are chosen</h2>
  <p>The tree picks the feature and threshold that most reduces impurity — usually <span class="ic">Gini impurity</span> or <span class="ic">entropy</span>.</p>
  <pre class="code-block">from sklearn.tree import DecisionTreeClassifier

tree = DecisionTreeClassifier(max_depth=4, random_state=42)
tree.fit(X_train, y_train)</pre>
  <div class="callout">
    <strong>Trees overfit fast</strong>
    <p>With no depth limit a tree can memorize the training set perfectly. Keep <span class="ic">max_depth</span> small or prune using validation.</p>
  </div>
  <h2>Strengths and limits</h2>
  <table>
    <tr><th>Strengths</th><th>Limits</th></tr>
    <tr><td>Interpretable rules</td><td>High variance</td></tr>
    <tr><td>Handles mixed feature types</td><td>Easy to overfit</td></tr>
    <tr><td>No scaling needed</td><td>Small changes shift splits</td></tr>
    <tr><td>Captures interactions</td><td>Axis-aligned splits only</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Feature importance</strong>
    <p>Nodes used often and near the root get high importance scores — a fast way to see which features actually matter.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Rarely use a single tree</strong>
    <p>A single tree is a great study tool and a clear baseline. For production, wrap trees in ensembles — that is the next lesson.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000416',
  '02E00000-0000-4000-8000-000000000316',
  1,
  'Ensemble Methods',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ensemble Methods</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Ensemble Methods</h1>
  <p>One model makes mistakes; many, combined wisely, cancel them out. <strong>Ensembles</strong> blend several models into one stronger predictor.</p>
  <h2>Two big ideas</h2>
  <table>
    <tr><th>Idea</th><th>How</th><th>Example</th></tr>
    <tr><td>Bagging</td><td>train many models on bootstrap samples, average</td><td>Random Forest</td></tr>
    <tr><td>Boosting</td><td>train models sequentially, each fixing the last</td><td>Gradient boosting</td></tr>
  </table>
  <h2>Random forest</h2>
  <p>Averaging many deep trees cuts variance. Injecting randomness (random row samples and random feature subsets per tree) makes the trees decorrelated, so their errors cancel.</p>
  <pre class="code-block">from sklearn.ensemble import RandomForestRegressor

rf = RandomForestRegressor(
    n_estimators=200,
    max_depth=10,
    random_state=42
)
rf.fit(X_train, y_train)
print(rf.feature_importances_)</pre>
  <div class="callout callout-info">
    <strong>Bagging reduces variance</strong>
    <p>Single deep trees have high variance. The forest keeps their low bias while averaging away most of the variance.</p>
  </div>
  <h2>Gradient boosting</h2>
  <p>Boosting adds trees one at a time, each fitting the <em>residuals</em> of the current ensemble. This builds a strong model from many weak ones.</p>
  <pre class="code-block">from sklearn.ensemble import GradientBoostingRegressor

gb = GradientBoostingRegressor(n_estimators=150, max_depth=3)
gb.fit(X_train, y_train)</pre>
  <div class="callout callout-tip">
    <strong>Rank the features</strong>
    <p>Forests and boosted trees expose <span class="ic">feature_importances_</span>. Plot them to justify model behavior and spot dead features.</p>
  </div>
  <div class="callout">
    <strong>Ensembles cost interpretability</strong>
    <p>Hundreds of trees are opaque. Balance raw performance against the need to explain decisions to stakeholders.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000417',
  '02E00000-0000-4000-8000-000000000317',
  1,
  'k-Nearest Neighbors',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>k-Nearest Neighbors</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>k-Nearest Neighbors</h1>
  <p>k-NN makes <strong>no assumptions</strong> about the shape of the data — it stores the training examples and classifies each new point by majority vote of its <span class="ic">k</span> closest neighbors. Nothing is learned until prediction time (a lazy model).</p>
  <h2>How it works</h2>
  <ol>
    <li>Compute distance from the new point to every training point.</li>
    <li>Take the k smallest distances.</li>
    <li>For classification: majority class. For regression: average target.</li>
  </ol>
  <pre class="code-block">from sklearn.neighbors import KNeighborsClassifier

knn = KNeighborsClassifier(n_neighbors=5)
knn.fit(X_train, y_train)   # just stores the data
knn.predict(X_test)</pre>
  <div class="callout">
    <strong>Scale or distances lie</strong>
    <p>A salary column in dollars dwarfs an age column in years, so distance becomes salary-only. Standardize all numeric features first.</p>
  </div>
  <h2>Choosing k</h2>
  <ul>
    <li><span class="ic">k = 1</span> — perfect on training data, jittery on new data (high variance).</li>
    <li>Larger <span class="ic">k</span> — smoother and more robust, but blurrier near borders (higher bias).</li>
    <li>Use an odd <span class="ic">k</span> to avoid ties in two-class problems.</li>
  </ul>
  <table>
    <tr><th>Trade-off</th><th>k small</th><th>k large</th></tr>
    <tr><td>Variance</td><td>high</td><td>low</td></tr>
    <tr><td>Bias</td><td>low</td><td>high</td></tr>
    <tr><td>Boundary</td><td>complex</td><td>smooth</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>When to use it</strong>
    <p>k-NN shines on small, well-scaled datasets with clean features. It slows down badly as data grows, because every prediction scans all examples.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000419',
  '02E00000-0000-4000-8000-000000000319',
  1,
  'k-Means Clustering',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>k-Means Clustering</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>k-Means Clustering</h1>
  <p>Clustering finds groups in <strong>unlabeled</strong> data. k-means partitions points into <span class="ic">k</span> clusters, each represented by a centroid.</p>
  <h2>Objective</h2>
  <p>The algorithm minimizes <span class="ic">inertia</span> — the summed squared distance from each point to its cluster centroid. Tight, compact clusters score low inertia.</p>
  <h2>Algorithm</h2>
  <ol>
    <li>Place k initial centroids.</li>
    <li>Assign every point to the nearest centroid.</li>
    <li>Recompute each centroid as the mean of its members.</li>
    <li>Repeat steps 2–3 until assignments stop changing.</li>
  </ol>
  <pre class="code-block">from sklearn.cluster import KMeans

kmeans = KMeans(n_clusters=4, n_init=10, random_state=42)
df["segment"] = kmeans.fit_predict(X_scaled)
print(kmeans.inertia_)</pre>
  <div class="callout callout-tip">
    <strong>Always scale</strong>
    <p>k-means uses Euclidean distance, so unscaled features dominate the geometry. Standardize before clustering.</p>
  </div>
  <h2>Choosing k</h2>
  <ul>
    <li><span class="ic">Elbow plot</span> — plot inertia against k and pick the bend where gains shrink.</li>
    <li><span class="ic">Silhouette score</span> — measures how separated the clusters are. Higher is better (0.5+ is decent).</li>
  </ul>
  <table>
    <tr><th>Reality</th><th>k-means assumption</th><th>Goes wrong when</th></tr>
    <tr><td>Groups overlap</td><td>clear boundaries</td><td>hard to separate</td></tr>
    <tr><td>Clusters are elongated</td><td>round and convex</td><td>mixes two ends</td></tr>
    <tr><td>Groups differ in size</td><td>roughly equal</td><td>tiny groups get stolen</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Results depend on initialization</strong>
    <p>k-means can land in a local minimum. Modern implementations use k-means++ and several restarts to make results stable.</p>
  </div>
  <p>Clusters are descriptive labels, not ground truth — always sanity-check segments against business meaning before trusting them.</p>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000420',
  '02E00000-0000-4000-8000-000000000320',
  1,
  'Hierarchical & Density-Based Clustering',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hierarchical & Density-Based Clustering</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Hierarchical &amp; Density-Based Clustering</h1>
  <p>k-means assumes round, similar-size clusters. Two alternatives relax those assumptions: <strong>hierarchical</strong> and <strong>density-based</strong> clustering.</p>
  <h2>Agglomerative (bottom-up)</h2>
  <p>Start with each point as its own cluster and repeatedly merge the closest pair. The merge history forms a <span class="ic">dendrogram</span> — cut it at any level to choose the number of clusters.</p>
  <pre class="code-block">from sklearn.cluster import AgglomerativeClustering

hc = AgglomerativeClustering(n_clusters=3, linkage="ward")
df["hc_label"] = hc.fit_predict(X_scaled)</pre>
  <ul>
    <li><span class="ic">ward</span> — minimizes variance growth.</li>
    <li><span class="ic">average</span> — mean distance between clusters.</li>
    <li><span class="ic">complete</span> — farthest point distance.</li>
  </ul>
  <h2>DBSCAN — clusters by density</h2>
  <p>Points are neighbors within radius <span class="ic">eps</span>; dense chains form clusters; isolated points become <span class="ic">noise</span>.</p>
  <pre class="code-block">from sklearn.cluster import DBSCAN

db = DBSCAN(eps=0.5, min_samples=5)
df["db_label"] = db.fit_predict(X_scaled)   # -1 = noise</pre>
  <table>
    <tr><th>Method</th><th>Cluster shapes</th><th>Needs k?</th><th>Handles noise?</th></tr>
    <tr><td>k-means</td><td>round, equal sizes</td><td>yes</td><td>no — forces every point in</td></tr>
    <tr><td>Hierarchical</td><td>any, via dendrogram</td><td>choose from tree</td><td>partially</td></tr>
    <tr><td>DBSCAN</td><td>arbitrary density shapes</td><td>no</td><td>yes — labels them noise</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>DBSCAN for anomalies</strong>
    <p>Fraud or hardware-failure points often sit in sparse regions. DBSCAN naturally flags them as noise instead of forcing a group label on them.</p>
  </div>
  <div class="callout callout-info">
    <strong>eps is your dial</strong>
    <p>Small <span class="ic">eps</span> means many micro-clusters; large <span class="ic">eps</span> means one blob. Tune it with domain knowledge and silhouette scores.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000422',
  '02E00000-0000-4000-8000-000000000322',
  1,
  'Classification Metrics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Classification Metrics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Classification Metrics</h1>
  <p>Raw accuracy hides how a classifier actually behaves. The confusion matrix is the starting point: every test prediction lands in one of four buckets.</p>
  <table>
    <tr><th></th><th>Predicted positive</th><th>Predicted negative</th></tr>
    <tr><td>Actual positive</td><td>True Positive (TP)</td><td>False Negative (FN)</td></tr>
    <tr><td>Actual negative</td><td>False Positive (FP)</td><td>True Negative (TN)</td></tr>
  </table>
  <h2>Derived metrics</h2>
  <pre class="code-block">precision = TP / (TP + FP)   # of predicted positives, how many were right
recall    = TP / (TP + FN)   # of real positives, how many were found
f1        = 2 * P * R / (P + R)
accuracy  = (TP + TN) / total</pre>
  <p>Precision and recall pull in opposite directions — raising one usually lowers the other. Choose based on the cost of each mistake.</p>
  <div class="callout">
    <strong>Which error hurts more?</strong>
    <p>Spam filters prefer high precision (never delete real mail). Cancer screens prefer high recall (never miss a case). Pick the metric that mirrors the real cost.</p>
  </div>
  <h2>ROC and AUC</h2>
  <p>The ROC curve plots true-positive rate against false-positive rate as the decision threshold moves. <span class="ic">AUC</span> summarizes it: 0.5 means random guessing, 1.0 is perfect.</p>
  <pre class="code-block">from sklearn.metrics import classification_report, roc_auc_score

print(classification_report(y_test, y_pred))
auc = roc_auc_score(y_test, clf.predict_proba(X_test)[:, 1])</pre>
  <div class="callout callout-tip">
    <strong>Imbalance distorts accuracy</strong>
    <p>With 95% negatives, predicting all negatives scores 95% accuracy but finds zero positives. Report precision, recall, and F1 alongside accuracy.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000423',
  '02E00000-0000-4000-8000-000000000323',
  1,
  'Overfitting, Bias & Regularization',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Overfitting, Bias & Regularization</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Overfitting, Bias &amp; Regularization</h1>
  <p>A model must do two opposite things: fit the signal in training data and stay calm about the noise. Overfitting chases noise; underfitting ignores signal.</p>
  <h2>Underfit vs overfit</h2>
  <table>
    <tr><th>Sign</th><th>Underfit (high bias)</th><th>Overfit (high variance)</th></tr>
    <tr><td>Training score</td><td>low</td><td>very high</td></tr>
    <tr><td>Validation score</td><td>also low</td><td>much lower</td></tr>
    <tr><td>Fix</td><td>more features or capacity</td><td>regularize, simplify, add data</td></tr>
  </table>
  <div class="callout">
    <strong>The tell-tale sign</strong>
    <p>The gap between training and validation performance IS the overfitting meter. A big gap means the model is memorizing rather than generalizing.</p>
  </div>
  <h2>Why it happens</h2>
  <ul>
    <li>Too many features, too few rows.</li>
    <li>Very flexible models (deep trees, high-degree polynomials).</li>
    <li>Training for too many epochs.</li>
    <li>Noise injected by duplicated or leaked features.</li>
  </ul>
  <h2>Fighting overfitting</h2>
  <pre class="code-block">from sklearn.linear_model import Ridge
from sklearn.model_selection import GridSearchCV

grid = GridSearchCV(Ridge(), {"alpha": [0.1, 1, 10, 100]}, cv=5)
grid.fit(X_train, y_train)</pre>
  <h2>Regularization toolbox</h2>
  <table>
    <tr><th>Tool</th><th>What it does</th></tr>
    <tr><td>L1/L2 penalties</td><td>shrink or zero coefficients</td></tr>
    <tr><td>Pruning / max_depth</td><td>limit tree growth</td></tr>
    <tr><td>Early stopping</td><td>stop training before it memorizes noise</td></tr>
    <tr><td>Cross-validation</td><td>honest estimate while tuning</td></tr>
    <tr><td>More (real) data</td><td>dilutes noise, stabilizes signal</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Simplest first defense</strong>
    <p>Before heavy machinery, try: fewer features, smaller capacity, more data. Regularization is a dial, not the whole orchestra.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000425',
  '02E00000-0000-4000-8000-000000000325',
  1,
  'The Machine Learning Workflow',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Machine Learning Workflow</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Machine Learning Workflow</h1>
  <p>All projects — big and small — follow the same loop. Knowing where you are in the loop is half the job.</p>
  <h2>The seven steps</h2>
  <ol>
    <li><strong>Define the problem</strong> — what is predicted, for whom, and by what metric?</li>
    <li><strong>Acquire data</strong> — internal tables, exports, or public datasets; check licensing.</li>
    <li><strong>Explore and clean</strong> — distributions, missing values, duplicates, weird values.</li>
    <li><strong>Engineer features</strong> — encode, scale, and create domain features.</li>
    <li><strong>Split and baseline</strong> — hold out test data, fit a naive baseline first.</li>
    <li><strong>Model and tune</strong> — compare families, tune hyperparameters with cross-validation.</li>
    <li><strong>Evaluate, deploy, monitor</strong> — one final test-set check, then ship and track decay.</li>
  </ol>
  <table>
    <tr><th>Step</th><th>Output</th><th>Key tools</th></tr>
    <tr><td>Define</td><td>problem statement and metric</td><td>stakeholders</td></tr>
    <tr><td>Clean</td><td>tidy table</td><td>pandas</td></tr>
    <tr><td>Features</td><td>model-ready matrix</td><td>sklearn preprocessors</td></tr>
    <tr><td>Train</td><td>trained candidates</td><td>scikit-learn</td></tr>
    <tr><td>Evaluate</td><td>metric report and choice</td><td>sklearn metrics</td></tr>
    <tr><td>Deploy</td><td>live predictions</td><td>API or batch job</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Iterate, do not walk one way</strong>
    <p>You will bounce back: a bad model exposes cleaning bugs; deployed results contradict offline scores. Each loop sharpens the system.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Write everything down</strong>
    <p>Record splits, seeds, metric values, and decisions. Reproducibility turns a lucky experiment into knowledge.</p>
  </div>
  <p>This course capstone runs the whole loop with a house-price dataset — you will see every step in action.</p>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000426',
  '02E00000-0000-4000-8000-000000000326',
  1,
  'Building a Prediction Pipeline',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building a Prediction Pipeline</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Building a Prediction Pipeline</h1>
  <p>Hand-writing scaling, encoding, and modeling each time invites errors and <strong>data leakage</strong>. A scikit-learn <span class="ic">Pipeline</span> chains every transform into one object — one fit, one predict, guaranteed consistent.</p>
  <h2>Why pipelines</h2>
  <ul>
    <li>Transforms learned on training data apply identically to new rows.</li>
    <li>Cross-validation refits everything on each fold — no leakage.</li>
    <li>One object trains, predicts, and can be saved.</li>
  </ul>
  <h2>A complete pipeline</h2>
  <pre class="code-block">from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.ensemble import RandomForestRegressor

numeric_features = ["area", "bedrooms"]
categorical_features = ["district"]

preprocessor = ColumnTransformer(
    transformers=[
        ("num", StandardScaler(), numeric_features),
        ("cat", OneHotEncoder(), categorical_features),
    ]
)

pipeline = Pipeline(steps=[
    ("preprocess", preprocessor),
    ("model", RandomForestRegressor(n_estimators=200, random_state=42)),
])

pipeline.fit(X_train, y_train)</pre>
  <div class="callout">
    <strong>Leakage is invisible</strong>
    <p>Fitting a scaler on the whole dataset before splitting means the scaler saw the test set — your reported scores are silently optimistic.</p>
  </div>
  <h2>Running the workflow</h2>
  <pre class="code-block">import pickle
from sklearn.metrics import mean_absolute_error

y_pred = pipeline.predict(X_test)
mae = mean_absolute_error(y_test, y_pred)

with open("house_model.pkl", "wb") as f:
    pickle.dump(pipeline, f)</pre>
  <div class="callout callout-tip">
    <strong>Ship the pipeline, not just the model</strong>
    <p>Save the fitted <span class="ic">Pipeline</span> — then raw input rows go in and predictions come out, transforms included.</p>
  </div>
  <div class="callout callout-info">
    <strong>Grid search inside the pipeline</strong>
    <p>Pass a pipeline to GridSearchCV and tune hyperparameters across folds with the same leakage-safe machinery.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02E00000-0000-4000-8000-000000000427',
  '02E00000-0000-4000-8000-000000000327',
  1,
  'Evaluation & Iteration',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Evaluation & Iteration</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #7c3aed; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page h3 { color: #1f2937; font-size: 17px; margin: 22px 0 6px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f5f3ff; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #7c3aed; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f5f3ff; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page h3 { color: #e5e7eb; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #a78bfa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Evaluation &amp; Iteration</h1>
  <p>The first model is a starting point, not the answer. Real projects cycle: evaluate honestly, learn, and improve — always keeping the final test set sacred.</p>
  <h2>Compare many candidates</h2>
  <pre class="code-block">from sklearn.model_selection import cross_val_score

models = {
    "linear":   LinearRegression(),
    "ridge":    Ridge(alpha=10),
    "forest":   RandomForestRegressor(random_state=42),
    "gradient": GradientBoostingRegressor(random_state=42),
}

for name, model in models.items():
    score = cross_val_score(model, X_train, y_train,
                            cv=5, scoring="neg_root_mean_squared_error")
    print(name, round(-score.mean(), 2))</pre>
  <h2>Tune with held-out data</h2>
  <p>Use validation or cross-validation for tuning. Touch the test set only once, at the very end, and report that number as the true performance.</p>
  <div class="callout">
    <strong>Test-set discipline</strong>
    <p>Tune hyperparameters on the test set and the final score is fraudulent. The test set exists to estimate real-world performance — use it once.</p>
  </div>
  <h2>Iteration loop</h2>
  <table>
    <tr><th>Observation</th><th>Likely next step</th></tr>
    <tr><td>Train good, test bad</td><td>regularize, shrink capacity, add data</td></tr>
    <tr><td>Both scores bad</td><td>more or better features, different model</td></tr>
    <tr><td>Errors concentrated in one group</td><td>inspect that slice, add a feature for it</td></tr>
    <tr><td>Score great but business flat</td><td>the metric does not match the goal — redefine it</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Monitor after launch</strong>
    <p>Data drifts over time. Track incoming feature distributions and re-evaluate on fresh labels so the model does not silently rot.</p>
  </div>
  <div class="callout callout-info">
    <strong>Keep a model registry</strong>
    <p>Log each candidate: data version, pipeline, hyperparameters, and scores. The past winner is your benchmark for every future idea.</p>
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
  ('02E00000-0000-4000-8000-000000000501', '02E00000-0000-4000-8000-000000000303',
   'What is the defining characteristic of supervised learning?',
   'Models learn from examples that come with known target labels.', 1),
  ('02E00000-0000-4000-8000-000000000502', '02E00000-0000-4000-8000-000000000303',
   'In which paradigm does a model learn by acting and receiving rewards?',
   'Reinforcement learning agents learn policies from the rewards of their actions.', 2),
  ('02E00000-0000-4000-8000-000000000503', '02E00000-0000-4000-8000-000000000303',
   'Which task is an example of unsupervised learning?',
   'Clustering untagged customers by similarity has no labels, so it is unsupervised.', 3),
  ('02E00000-0000-4000-8000-000000000504', '02E00000-0000-4000-8000-000000000306',
   'Which step is standard when preparing tabular data for a model?',
   'Missing values must be handled so the model does not fail on unseen rows.', 1),
  ('02E00000-0000-4000-8000-000000000505', '02E00000-0000-4000-8000-000000000306',
   'Why scale or normalize numeric features before distance-based models?',
   'Features with large ranges would overpower small-range features in distance calculations.', 2),
  ('02E00000-0000-4000-8000-000000000506', '02E00000-0000-4000-8000-000000000306',
   'What is one-hot encoding used for?',
   'One-hot encoding gives every category its own binary indicator column.', 3),
  ('02E00000-0000-4000-8000-000000000507', '02E00000-0000-4000-8000-000000000309',
   'Why must the test set stay untouched until the final evaluation?',
   'Adapting to the test set leaks information and inflates reported results.', 1),
  ('02E00000-0000-4000-8000-000000000508', '02E00000-0000-4000-8000-000000000309',
   'What problem does stratified cross-validation solve in classification?',
   'Stratification keeps the proportion of classes stable across every fold.', 2),
  ('02E00000-0000-4000-8000-000000000509', '02E00000-0000-4000-8000-000000000309',
   'What does R-squared measure?',
   'R-squared compares model residuals with the variance around the mean baseline.', 3),
  ('02E00000-0000-4000-8000-000000000510', '02E00000-0000-4000-8000-000000000312',
   'In simple linear regression, what does the slope w1 represent?',
   'The slope measures how the target responds to a one-unit change in the feature.', 1),
  ('02E00000-0000-4000-8000-000000000511', '02E00000-0000-4000-8000-000000000312',
   'Which metric is minimized by ordinary least squares training?',
   'Ordinary least squares minimizes the sum of squared residuals.', 2),
  ('02E00000-0000-4000-8000-000000000512', '02E00000-0000-4000-8000-000000000312',
   'How does L2 regularization (ridge) restrain a model?',
   'Ridge adds a penalty on squared weight magnitude so large coefficients shrink.', 3),
  ('02E00000-0000-4000-8000-000000000513', '02E00000-0000-4000-8000-000000000315',
   'What does a logistic regression model output for a binary problem?',
   'The sigmoid squashes the linear combination into the interval (0, 1).', 1),
  ('02E00000-0000-4000-8000-000000000514', '02E00000-0000-4000-8000-000000000315',
   'Which measure is used to choose splits in decision trees?',
   'Trees pick splits that reduce a measure of impurity such as Gini impurity.', 2),
  ('02E00000-0000-4000-8000-000000000515', '02E00000-0000-4000-8000-000000000315',
   'Why is accuracy a poor metric on a heavily imbalanced dataset?',
   'With 95 percent negative rows, predicting all negatives reaches high accuracy while missing every positive.', 3),
  ('02E00000-0000-4000-8000-000000000516', '02E00000-0000-4000-8000-000000000318',
   'Why does a random forest generalize better than a single deep tree?',
   'Bagging with random feature subsets lowers variance without inflating bias.', 1),
  ('02E00000-0000-4000-8000-000000000517', '02E00000-0000-4000-8000-000000000318',
   'In k-NN, what happens as k is increased?',
   'More neighbors smooth the decision boundary, trading variance for bias.', 2),
  ('02E00000-0000-4000-8000-000000000518', '02E00000-0000-4000-8000-000000000318',
   'Why must features be scaled for k-NN?',
   'Euclidean distance in k-NN gives features with large ranges unwarranted influence.', 3),
  ('02E00000-0000-4000-8000-000000000519', '02E00000-0000-4000-8000-000000000321',
   'What objective does standard k-means optimize?',
   'k-means iterates to minimize inertia, the squared distance from points to centroids.', 1),
  ('02E00000-0000-4000-8000-000000000520', '02E00000-0000-4000-8000-000000000321',
   'How does DBSCAN label points that do not fit any dense region?',
   'DBSCAN groups dense regions and labels leftover points as noise.', 2),
  ('02E00000-0000-4000-8000-000000000521', '02E00000-0000-4000-8000-000000000321',
   'What does the elbow method for k-means look for?',
   'After the kink, adding clusters barely reduces inertia, so the bend picks k.', 3),
  ('02E00000-0000-4000-8000-000000000522', '02E00000-0000-4000-8000-000000000324',
   'The F1 score is the harmonic mean of which pair?',
   'F1 balances precision and recall and is useful when classes are imbalanced.', 1),
  ('02E00000-0000-4000-8000-000000000523', '02E00000-0000-4000-8000-000000000324',
   'A model that performs well on training data but poorly on validation is:',
   'High training scores with much lower validation scores are the classic overfitting signature.', 2),
  ('02E00000-0000-4000-8000-000000000524', '02E00000-0000-4000-8000-000000000324',
   'What does the ROC curve plot?',
   'ROC trades true-positive rate against false-positive rate across thresholds.', 3),
  ('02E00000-0000-4000-8000-000000000525', '02E00000-0000-4000-8000-000000000328',
   'Which is the recommended first step of a machine learning project?',
   'A clear objective and metric steer every later decision in the project.', 1),
  ('02E00000-0000-4000-8000-000000000526', '02E00000-0000-4000-8000-000000000328',
   'How can gradient boosting improve on a single decision tree?',
   'Boosting fits new learners to the residuals of the current ensemble.', 2),
  ('02E00000-0000-4000-8000-000000000527', '02E00000-0000-4000-8000-000000000328',
   'Why is tuning hyperparameters directly on the test set discouraged?',
   'Using test performance to pick hyperparameters turns the test set into training input.', 3),
  ('02E00000-0000-4000-8000-000000000528', '02E00000-0000-4000-8000-000000000328',
   'Which algorithm fits a continuous target such as house price best?',
   'Regression models predict continuous values while clustering and encoding do not.', 4),
  ('02E00000-0000-4000-8000-000000000529', '02E00000-0000-4000-8000-000000000328',
   'Which pipeline order is the standard ML workflow?',
   'Preparation and splitting always come before modeling, and deployment follows trusted evaluation.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): supervised learning
  ('02E00000-0000-4000-8000-000000001001', '02E00000-0000-4000-8000-000000000501', 'Models learn from labeled input-output pairs', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001002', '02E00000-0000-4000-8000-000000000501', 'Models discover groups without labels', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001003', '02E00000-0000-4000-8000-000000000501', 'Models learn by trial and error with rewards', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001004', '02E00000-0000-4000-8000-000000000501', 'Models memorize the entire dataset', FALSE, 4),
  -- Q1 (501)q2: reinforcement
  ('02E00000-0000-4000-8000-000000001005', '02E00000-0000-4000-8000-000000000502', 'Reinforcement learning', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001006', '02E00000-0000-4000-8000-000000000502', 'Supervised learning', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001007', '02E00000-0000-4000-8000-000000000502', 'Unsupervised learning', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001008', '02E00000-0000-4000-8000-000000000502', 'Semi-supervised learning', FALSE, 4),
  -- Q1 (501)q3: unsupervised example
  ('02E00000-0000-4000-8000-000000001009', '02E00000-0000-4000-8000-000000000503', 'Segmenting customers by purchasing behavior', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001010', '02E00000-0000-4000-8000-000000000503', 'Predicting a house price', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001011', '02E00000-0000-4000-8000-000000000503', 'Classifying emails as spam or not spam', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001012', '02E00000-0000-4000-8000-000000000503', 'Recognizing handwritten digits', FALSE, 4),
  -- Q2 (504): missing values
  ('02E00000-0000-4000-8000-000000001013', '02E00000-0000-4000-8000-000000000504', 'Impute or drop missing values consistently', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001014', '02E00000-0000-4000-8000-000000000504', 'Delete the target column', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001015', '02E00000-0000-4000-8000-000000000504', 'Merge every category into one bucket', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001016', '02E00000-0000-4000-8000-000000000504', 'Ignore all outliers forever', FALSE, 4),
  -- Q2 (504)q2: scaling
  ('02E00000-0000-4000-8000-000000001017', '02E00000-0000-4000-8000-000000000505', 'So features with larger units do not dominate distances', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001018', '02E00000-0000-4000-8000-000000000505', 'It prevents data leakage', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001019', '02E00000-0000-4000-8000-000000000505', 'It creates new categories', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001020', '02E00000-0000-4000-8000-000000000505', 'It raises the R-squared score', FALSE, 4),
  -- Q2 (504)q3: one-hot
  ('02E00000-0000-4000-8000-000000001021', '02E00000-0000-4000-8000-000000000506', 'Turning categorical labels into binary indicator columns', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001022', '02E00000-0000-4000-8000-000000000506', 'Sorting numeric values', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001023', '02E00000-0000-4000-8000-000000000506', 'Removing outliers', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001024', '02E00000-0000-4000-8000-000000000506', 'Filling missing target values', FALSE, 4),
  -- Q3 (507): test set
  ('02E00000-0000-4000-8000-000000001025', '02E00000-0000-4000-8000-000000000507', 'So reported performance reflects unseen data', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001026', '02E00000-0000-4000-8000-000000000507', 'So it can be shuffled', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001027', '02E00000-0000-4000-8000-000000000507', 'So it joins the training set', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001028', '02E00000-0000-4000-8000-000000000507', 'So outliers are removed', FALSE, 4),
  -- Q3 (507)q2: stratification
  ('02E00000-0000-4000-8000-000000001029', '02E00000-0000-4000-8000-000000000508', 'It preserves the class balance in every fold', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001030', '02E00000-0000-4000-8000-000000000508', 'It eliminates all outliers', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001031', '02E00000-0000-4000-8000-000000000508', 'It makes the model memorize labels', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001032', '02E00000-0000-4000-8000-000000000508', 'It removes duplicate rows', FALSE, 4),
  -- Q3 (507)q3: R-squared
  ('02E00000-0000-4000-8000-000000001033', '02E00000-0000-4000-8000-000000000509', 'The proportion of variance explained by the model', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001034', '02E00000-0000-4000-8000-000000000509', 'The total error in dollars', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001035', '02E00000-0000-4000-8000-000000000509', 'The number of features used', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001036', '02E00000-0000-4000-8000-000000000509', 'The seconds spent training', FALSE, 4),
  -- Q4 (510): slope
  ('02E00000-0000-4000-8000-000000001037', '02E00000-0000-4000-8000-000000000510', 'The change in the target for a one-unit change in the feature', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001038', '02E00000-0000-4000-8000-000000000510', 'The prediction when all features are zero', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001039', '02E00000-0000-4000-8000-000000000510', 'The average prediction error', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001040', '02E00000-0000-4000-8000-000000000510', 'The number of training rows', FALSE, 4),
  -- Q4 (510)q2: OLS objective
  ('02E00000-0000-4000-8000-000000001041', '02E00000-0000-4000-8000-000000000511', 'Mean Squared Error', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001042', '02E00000-0000-4000-8000-000000000511', 'Mean Absolute Error', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001043', '02E00000-0000-4000-8000-000000000511', 'F1 score', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001044', '02E00000-0000-4000-8000-000000000511', 'R-squared value', FALSE, 4),
  -- Q4 (510)q3: ridge
  ('02E00000-0000-4000-8000-000000001045', '02E00000-0000-4000-8000-000000000512', 'It adds a penalty that shrinks large coefficients', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001046', '02E00000-0000-4000-8000-000000000512', 'It sets several coefficients to exactly zero', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001047', '02E00000-0000-4000-8000-000000000512', 'It adds more training data', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001048', '02E00000-0000-4000-8000-000000000512', 'It increases the learning rate', FALSE, 4),
  -- Q5 (513): logistic output
  ('02E00000-0000-4000-8000-000000001049', '02E00000-0000-4000-8000-000000000513', 'A probability between 0 and 1 after a sigmoid', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001050', '02E00000-0000-4000-8000-000000000513', 'An unbounded real number', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001051', '02E00000-0000-4000-8000-000000000513', 'A cluster assignment', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001052', '02E00000-0000-4000-8000-000000000513', 'A decision tree diagram', FALSE, 4),
  -- Q5 (513)q2: split criterion
  ('02E00000-0000-4000-8000-000000001053', '02E00000-0000-4000-8000-000000000514', 'Gini impurity', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001054', '02E00000-0000-4000-8000-000000000514', 'Cosine similarity', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001055', '02E00000-0000-4000-8000-000000000514', 'Mean squared error', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001056', '02E00000-0000-4000-8000-000000000514', 'The size of the dataset', FALSE, 4),
  -- Q5 (513)q3: imbalanced accuracy
  ('02E00000-0000-4000-8000-000000001057', '02E00000-0000-4000-8000-000000000515', 'A model predicting only the majority class can still score high', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001058', '02E00000-0000-4000-8000-000000000515', 'Accuracy ignores outliers', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001059', '02E00000-0000-4000-8000-000000000515', 'Accuracy always equals precision', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001060', '02E00000-0000-4000-8000-000000000515', 'Accuracy requires huge datasets', FALSE, 4),
  -- Q6 (516): random forest
  ('02E00000-0000-4000-8000-000000001061', '02E00000-0000-4000-8000-000000000516', 'Averaging many decorrelated trees reduces variance', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001062', '02E00000-0000-4000-8000-000000000516', 'One deep tree always wins', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001063', '02E00000-0000-4000-8000-000000000516', 'Bagging raises bias sharply', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001064', '02E00000-0000-4000-8000-000000000516', 'Trees become faster to train', FALSE, 4),
  -- Q6 (516)q2: increasing k
  ('02E00000-0000-4000-8000-000000001065', '02E00000-0000-4000-8000-000000000517', 'It reduces variance and increases bias', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001066', '02E00000-0000-4000-8000-000000000517', 'It always improves accuracy', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001067', '02E00000-0000-4000-8000-000000000517', 'It removes the need for scaling', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001068', '02E00000-0000-4000-8000-000000000517', 'It makes predictions instant', FALSE, 4),
  -- Q6 (516)q3: scaling k-NN
  ('02E00000-0000-4000-8000-000000001069', '02E00000-0000-4000-8000-000000000518', 'Distance is the core computation and is highly scale-sensitive', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001070', '02E00000-0000-4000-8000-000000000518', 'It changes the class labels', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001071', '02E00000-0000-4000-8000-000000000518', 'It selects k automatically', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001072', '02E00000-0000-4000-8000-000000000518', 'It creates the clusters', FALSE, 4),
  -- Q7 (519): k-means objective
  ('02E00000-0000-4000-8000-000000001073', '02E00000-0000-4000-8000-000000000519', 'It minimizes within-cluster squared distances (inertia)', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001074', '02E00000-0000-4000-8000-000000000519', 'It maximizes only between-cluster distance', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001075', '02E00000-0000-4000-8000-000000000519', 'It minimizes the number of clusters', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001076', '02E00000-0000-4000-8000-000000000519', 'It maximizes the noise points', FALSE, 4),
  -- Q7 (519)q2: DBSCAN noise
  ('02E00000-0000-4000-8000-000000001077', '02E00000-0000-4000-8000-000000000520', 'It marks them as noise', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001078', '02E00000-0000-4000-8000-000000000520', 'It assigns them to a random cluster', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001079', '02E00000-0000-4000-8000-000000000520', 'It deletes them from the dataset', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001080', '02E00000-0000-4000-8000-000000000520', 'It converts them into centroids', FALSE, 4),
  -- Q7 (519)q3: elbow method
  ('02E00000-0000-4000-8000-000000001081', '02E00000-0000-4000-8000-000000000521', 'The k where inertia stops dropping sharply', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001082', '02E00000-0000-4000-8000-000000000521', 'The k with the fewest features', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001083', '02E00000-0000-4000-8000-000000000521', 'The tallest bar in a histogram', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001084', '02E00000-0000-4000-8000-000000000521', 'The k that maximizes training time', FALSE, 4),
  -- Q8 (522): F1 score
  ('02E00000-0000-4000-8000-000000001085', '02E00000-0000-4000-8000-000000000522', 'Precision and recall', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001086', '02E00000-0000-4000-8000-000000000522', 'Accuracy and R-squared', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001087', '02E00000-0000-4000-8000-000000000522', 'Sensitivity and accuracy', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001088', '02E00000-0000-4000-8000-000000000522', 'Bias and variance', FALSE, 4),
  -- Q8 (522)q2: overfitting
  ('02E00000-0000-4000-8000-000000001089', '02E00000-0000-4000-8000-000000000523', 'Overfitting', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001090', '02E00000-0000-4000-8000-000000000523', 'Underfitting', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001091', '02E00000-0000-4000-8000-000000000523', 'Perfectly regularized', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001092', '02E00000-0000-4000-8000-000000000523', 'Under-trained', FALSE, 4),
  -- Q8 (522)q3: ROC curve
  ('02E00000-0000-4000-8000-000000001093', '02E00000-0000-4000-8000-000000000524', 'True positive rate versus false positive rate across thresholds', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001094', '02E00000-0000-4000-8000-000000000524', 'Precision versus recall only', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001095', '02E00000-0000-4000-8000-000000000524', 'Training loss versus test loss', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001096', '02E00000-0000-4000-8000-000000000524', 'Clusters versus inertia', FALSE, 4),
  -- Q9 (525): first step
  ('02E00000-0000-4000-8000-000000001097', '02E00000-0000-4000-8000-000000000525', 'Define the problem and the success metric', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001098', '02E00000-0000-4000-8000-000000000525', 'Train every possible model immediately', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001099', '02E00000-0000-4000-8000-000000000525', 'Deploy to production first', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001100', '02E00000-0000-4000-8000-000000000525', 'Delete the raw data', FALSE, 4),
  -- Q9 (525)q2: boosting
  ('02E00000-0000-4000-8000-000000001101', '02E00000-0000-4000-8000-000000000526', 'It sequentially trains weak learners that correct previous errors', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001102', '02E00000-0000-4000-8000-000000000526', 'It only averages independent trees', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001103', '02E00000-0000-4000-8000-000000000526', 'It removes every feature', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001104', '02E00000-0000-4000-8000-000000000526', 'It trains one very deep tree', FALSE, 4),
  -- Q9 (525)q3: test set tuning
  ('02E00000-0000-4000-8000-000000001105', '02E00000-0000-4000-8000-000000000527', 'The test set then leaks into model selection', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001106', '02E00000-0000-4000-8000-000000000527', 'It reduces training time', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001107', '02E00000-0000-4000-8000-000000000527', 'It honestly boosts accuracy', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001108', '02E00000-0000-4000-8000-000000000527', 'It removes the need to scale', FALSE, 4),
  -- Q9 (525)q4: continuous target
  ('02E00000-0000-4000-8000-000000001109', '02E00000-0000-4000-8000-000000000528', 'Linear regression', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001110', '02E00000-0000-4000-8000-000000000528', 'k-means clustering', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001111', '02E00000-0000-4000-8000-000000000528', 'DBSCAN', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001112', '02E00000-0000-4000-8000-000000000528', 'One-hot encoding', FALSE, 4),
  -- Q9 (525)q5: pipeline order
  ('02E00000-0000-4000-8000-000000001113', '02E00000-0000-4000-8000-000000000529', 'Clean data, split, train, evaluate, deploy', TRUE,  1),
  ('02E00000-0000-4000-8000-000000001114', '02E00000-0000-4000-8000-000000000529', 'Deploy, train, clean, evaluate, split', FALSE, 2),
  ('02E00000-0000-4000-8000-000000001115', '02E00000-0000-4000-8000-000000000529', 'Split, evaluate, clean, deploy, train', FALSE, 3),
  ('02E00000-0000-4000-8000-000000001116', '02E00000-0000-4000-8000-000000000529', 'Train, split, deploy, clean, evaluate', FALSE, 4)
ON CONFLICT (id) DO NOTHING;