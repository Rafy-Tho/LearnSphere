-- ============================================================================
-- SEED 062: Complete course — "Monitoring with Prometheus & Grafana"
-- ----------------------------------------------------------------------------
-- Instructor : David Kim        (10000000-0000-4000-8000-000000000004)
-- Category   : DevOps & CI/CD   (20000000-0000-4000-8000-000000000009)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Observability Foundations    → C1 The Three Pillars of Observability · C2 Metrics & Labels
--   M2 Prometheus Core              → C3 Prometheus Architecture · C4 Exporters
--   M3 Querying with PromQL         → C5 PromQL Fundamentals · C6 Rules & Alerting
--   M4 Visualization & Reliability  → C7 Grafana Dashboards · C8 Service-Level Metrics
--   M5 Scale & Capstone             → C9 Scaling Prometheus · C10 Capstone Monitoring Stack
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
  '03E00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000004',
  '20000000-0000-4000-8000-000000000009',
  'Monitoring with Prometheus & Grafana',
  'monitoring-with-prometheus-and-grafana',
  'Make your systems observable. Master the open-source monitoring standard: understand metrics, logs, and traces, run Prometheus with exporters, write powerful PromQL queries, automate alerting with Alertmanager, and build actionable Grafana dashboards driven by service-level objectives — then cap it off by assembling a complete monitoring stack for a real web application.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  60
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03E00000-0000-4000-8000-000000000011', '03E00000-0000-4000-8000-000000000001', 'Explain the three pillars of observability and when each signal matters.',      1),
  ('03E00000-0000-4000-8000-000000000012', '03E00000-0000-4000-8000-000000000001', 'Design metric names, labels, and deployments that control cardinality.',         2),
  ('03E00000-0000-4000-8000-000000000013', '03E00000-0000-4000-8000-000000000001', 'Run Prometheus and exporters and query time series with PromQL.',                3),
  ('03E00000-0000-4000-8000-000000000014', '03E00000-0000-4000-8000-000000000001', 'Precompute recording rules and route alerts through Alertmanager.',               4),
  ('03E00000-0000-4000-8000-000000000015', '03E00000-0000-4000-8000-000000000001', 'Build Grafana dashboards, define SLOs with error budgets, and scale the stack.',   5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03E00000-0000-4000-8000-000000000101', '03E00000-0000-4000-8000-000000000001', 1, 'Observability Foundations',  'Understand metrics, logs, and traces and design clean, low-cardinality metrics.', 'PUBLISHED'),
  ('03E00000-0000-4000-8000-000000000102', '03E00000-0000-4000-8000-000000000001', 2, 'Prometheus Core',            'Learn the pull architecture, the data model, and the exporters that feed Prometheus.', 'PUBLISHED'),
  ('03E00000-0000-4000-8000-000000000103', '03E00000-0000-4000-8000-000000000001', 3, 'Querying with PromQL',       'Master selectors, rates, aggregations, histogram_quantile, and alerting rules.', 'PUBLISHED'),
  ('03E00000-0000-4000-8000-000000000104', '03E00000-0000-4000-8000-000000000001', 4, 'Visualization & Reliability','Turn queries into Grafana dashboards and define SLOs with error budgets.', 'PUBLISHED'),
  ('03E00000-0000-4000-8000-000000000105', '03E00000-0000-4000-8000-000000000001', 5, 'Scale & Capstone',          'Scale Prometheus and assemble a complete monitoring stack for a web app.', 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03E00000-0000-4000-8000-000000000201', '03E00000-0000-4000-8000-000000000101', 1, 'The Three Pillars of Observability', 'Metrics, logs, and traces and the questions each signal answers.', 'PUBLISHED'),
  ('03E00000-0000-4000-8000-000000000202', '03E00000-0000-4000-8000-000000000101', 2, 'Metrics & Labels',                   'Design metric names, labels, and samples that keep series healthy.', 'PUBLISHED'),
  ('03E00000-0000-4000-8000-000000000203', '03E00000-0000-4000-8000-000000000102', 1, 'Prometheus Architecture',            'The pull model, TSDB, and how scrapes become time series.', 'PUBLISHED'),
  ('03E00000-0000-4000-8000-000000000204', '03E00000-0000-4000-8000-000000000102', 2, 'Exporters',                           'How node, blackbox, and custom exporters expose scrapeable metrics.', 'PUBLISHED'),
  ('03E00000-0000-4000-8000-000000000205', '03E00000-0000-4000-8000-000000000103', 1, 'PromQL Fundamentals',                 'Selectors, vectors, rate functions, and aggregations.', 'PUBLISHED'),
  ('03E00000-0000-4000-8000-000000000206', '03E00000-0000-4000-8000-000000000103', 2, 'Rules & Alerting',                    'Recording rules, alerting rules, and Alertmanager routing.', 'PUBLISHED'),
  ('03E00000-0000-4000-8000-000000000207', '03E00000-0000-4000-8000-000000000104', 1, 'Grafana Dashboards',                  'Data sources, panels, thresholds, and template variables.', 'PUBLISHED'),
  ('03E00000-0000-4000-8000-000000000208', '03E00000-0000-4000-8000-000000000104', 2, 'Service-Level Metrics',               'SLIs, SLOs, error budgets, and reliability alerting.', 'PUBLISHED'),
  ('03E00000-0000-4000-8000-000000000209', '03E00000-0000-4000-8000-000000000105', 1, 'Scaling Prometheus',                  'Federation, high availability, retention, and storage operations.', 'PUBLISHED'),
  ('03E00000-0000-4000-8000-000000000210', '03E00000-0000-4000-8000-000000000105', 2, 'Capstone Monitoring Stack',           'Build a full exporter-to-dashboard pipeline for a web application.', 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03E00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03E00000-0000-4000-8000-000000000301', '03E00000-0000-4000-8000-000000000201', 1, 'Metrics, Logs & Traces',          'Understand the three pillars of observability and their strengths.',         'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03E00000-0000-4000-8000-000000000302', '03E00000-0000-4000-8000-000000000201', 2, 'Observability in Practice',       'Apply golden signals and the RED and USE methods to real systems.',          'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03E00000-0000-4000-8000-000000000303', '03E00000-0000-4000-8000-000000000201', 3, 'Observability Foundations Quiz',  'Check your grasp of pillars and golden signals.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03E00000-0000-4000-8000-000000000304', '03E00000-0000-4000-8000-000000000202', 1, 'Anatomy of a Metric',             'Learn metric names, labels, samples, and the four metric types.',            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03E00000-0000-4000-8000-000000000305', '03E00000-0000-4000-8000-000000000202', 2, 'Labels & Cardinality',            'Add dimensions with labels and keep series under control.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03E00000-0000-4000-8000-000000000306', '03E00000-0000-4000-8000-000000000202', 3, 'Metrics & Labels Quiz',           'Verify your metric and cardinality knowledge.',                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03E00000-0000-4000-8000-000000000307', '03E00000-0000-4000-8000-000000000203', 1, 'Architecture & Data Model',       'See how pull scraping, the TSDB, and time series fit together.',             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03E00000-0000-4000-8000-000000000308', '03E00000-0000-4000-8000-000000000203', 2, 'Scraping Targets & Retention',    'Configure scrape jobs, track target health, and manage storage.',            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03E00000-0000-4000-8000-000000000309', '03E00000-0000-4000-8000-000000000203', 3, 'Prometheus Architecture Quiz',    'Test your understanding of scraping and storage.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03E00000-0000-4000-8000-000000000310', '03E00000-0000-4000-8000-000000000204', 1, 'The Node Exporter',               'Collect host-level metrics such as CPU, memory, disk, and network.',         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03E00000-0000-4000-8000-000000000311', '03E00000-0000-4000-8000-000000000204', 2, 'Blackbox Exporter & Custom Metrics', 'Probe endpoints from outside and expose metrics from your own apps.',     'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03E00000-0000-4000-8000-000000000312', '03E00000-0000-4000-8000-000000000204', 3, 'Exporters Quiz',                  'Check your exporter selection skills.',                                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03E00000-0000-4000-8000-000000000313', '03E00000-0000-4000-8000-000000000205', 1, 'Selectors, Vectors & Rate Functions', 'Match series with selectors and compute rates over range vectors.',       'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03E00000-0000-4000-8000-000000000314', '03E00000-0000-4000-8000-000000000205', 2, 'Aggregations & histogram_quantile', 'Combine series and estimate percentiles from histograms.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03E00000-0000-4000-8000-000000000315', '03E00000-0000-4000-8000-000000000205', 3, 'PromQL Quiz',                     'Prove you can write correct and useful PromQL queries.',                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03E00000-0000-4000-8000-000000000316', '03E00000-0000-4000-8000-000000000206', 1, 'Recording Rules',                 'Precompute expensive queries into fresh, fast time series.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03E00000-0000-4000-8000-000000000317', '03E00000-0000-4000-8000-000000000206', 2, 'Alerting Rules & Alertmanager',   'Turn conditions into alerts and route them to the right receivers.',         'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03E00000-0000-4000-8000-000000000318', '03E00000-0000-4000-8000-000000000206', 3, 'Rules & Alerting Quiz',           'Verify your rules and routing knowledge.',                                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03E00000-0000-4000-8000-000000000319', '03E00000-0000-4000-8000-000000000207', 1, 'Your First Dashboard',            'Connect Grafana to Prometheus and build a time series panel.',               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03E00000-0000-4000-8000-000000000320', '03E00000-0000-4000-8000-000000000207', 2, 'Panels, Thresholds & Templating', 'Use panel types, thresholds, and variables to make dashboards useful.',       'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03E00000-0000-4000-8000-000000000321', '03E00000-0000-4000-8000-000000000207', 3, 'Grafana Quiz',                    'Check your dashboard building skills.',                                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03E00000-0000-4000-8000-000000000322', '03E00000-0000-4000-8000-000000000208', 1, 'SLIs, SLOs & Error Budgets',      'Define measurable targets and budget for failure.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03E00000-0000-4000-8000-000000000323', '03E00000-0000-4000-8000-000000000208', 2, 'SLO Alerting & Reliability',      'Turn SLOs into multi-window burn-rate alerts that page only when it matters.', 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03E00000-0000-4000-8000-000000000324', '03E00000-0000-4000-8000-000000000208', 3, 'SLO & Reliability Quiz',         'Test your service-level metrics knowledge.',                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03E00000-0000-4000-8000-000000000325', '03E00000-0000-4000-8000-000000000209', 1, 'Federation & High Availability',  'Scale across teams and enforce availability patterns.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03E00000-0000-4000-8000-000000000326', '03E00000-0000-4000-8000-000000000209', 2, 'Retention & Storage Operations',  'Size, protect, and operate the TSDB in production.',                         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03E00000-0000-4000-8000-000000000327', '03E00000-0000-4000-8000-000000000210', 1, 'Capstone: A Monitoring Stack for a Web App', 'Assemble exporters, Prometheus, Alertmanager, and Grafana end to end.', 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03E00000-0000-4000-8000-000000000328', '03E00000-0000-4000-8000-000000000210', 2, 'Final Assessment',               'Prove you can build and understand a full Prometheus and Grafana stack.',     'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03E00000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03E00000-0000-4000-8000-000000000401',
  '03E00000-0000-4000-8000-000000000301',
  1,
  'Metrics, Logs & Traces',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Metrics, Logs &amp; Traces</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Metrics, Logs &amp; Traces</h1>
  <p>When something breaks at 2 a.m., the fastest path to a fix starts with a single question: <em>what data did we record beforehand?</em> Observability is the practice of making a system's internal state answerable from the outside, using the three signals classically called <strong>metrics</strong>, <strong>logs</strong>, and <strong>traces</strong>.</p>
  <p>Each pillar records a different kind of fact about your system. Choosing the right one for the right question is most of the battle — and this course, with Prometheus and Grafana, is fundamentally a metrics-and-dashboards journey.</p>
  <h2>The three pillars</h2>
  <ul>
    <li><strong>Metrics</strong> — numbers aggregated over time, like requests per second, CPU load, or queue depth. Small in size, cheap to store, ideal for alerts and dashboards.</li>
    <li><strong>Logs</strong> — discrete, timestamped events, like an authentication failure or a panic stack trace. High in detail, expensive to keep, and searchable only within retention.</li>
    <li><strong>Traces</strong> — the path followed by a single request as it fans out across services, showing latency inside each hop.</li>
  </ul>
  <table>
    <tr><th>Signal</th><th>Good at</th><th>Weak at</th></tr>
    <tr><td>Metrics</td><td>Repetitive patterns, trends, alerting</td><td>Explaining why a single call failed</td></tr>
    <tr><td>Logs</td><td>Debugging a single event in depth</td><td>Synthesizing the big picture</td></tr>
    <tr><td>Traces</td><td>Latency breakdowns across services</td><td>High-volume coarse monitoring</td></tr>
  </table>
  <h2>Why metrics are the workhorse</h2>
  <p>Metrics compress millions of events into a handful of numbers. A Prometheus counter for HTTP requests needs only the metric name, a few labels, and a monotonic value. That tiny footprint means you can afford to watch <em>everything</em>: every host, every endpoint, every queue.</p>
  <pre class="code-block">http_requests_total{job="web", status="200"} 48219320
http_requests_total{job="web", status="500"} 142</pre>
  <h2>Treating the pillars as complementary</h2>
  <p>A mature stack uses all three at once: metrics detect the anomaly and page the on-call engineer; the trace explains the request path; the logger shows the actual error message. Prometheus and Grafana excel at the metrics layer, while Loki (logs) and Tempo (traces) extend the same stack when you need them.</p>
  <div class="callout callout-tip">
    <strong>Rule of thumb</strong>
    <p>Start with metrics. They are cheap, always on, and they tell you <em>that</em> something is wrong. Drills into logs and traces only for the incidents that metrics flag.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000402',
  '03E00000-0000-4000-8000-000000000302',
  1,
  'Observability in Practice',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Observability in Practice</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Observability in Practice</h1>
  <p>Knowing the three pillars is only the beginning. In practice, teams need a small, opinionated set of metrics they can reason about quickly. Two families of patterns dominate: the <strong>four golden signals</strong> for user-facing services, and the <strong>RED / USE</strong> methods for choosing which metrics to record.</p>
  <h2>The four golden signals</h2>
  <ol>
    <li><strong>Latency</strong> — the time it takes to serve a request. Track both the happy path and slow failures so latency spikes are not masked.</li>
    <li><strong>Traffic</strong> — how much demand the system is serving, such as requests per second or active sessions.</li>
    <li><strong>Errors</strong> — the rate of requests that fail, either explicitly (500s) or implicitly (a 200 that returns wrong data).</li>
    <li><strong>Saturation</strong> — how full a resource is, like CPU at 90% or a queue draining slower than it fills.</li>
  </ol>
  <table>
    <tr><th>Method</th><th>Applies to</th><th>Focus</th></tr>
    <tr><td>RED</td><td>Request-driven services</td><td>Rate, Errors, Duration</td></tr>
    <tr><td>USE</td><td>Resources and components</td><td>Utilization, Saturation, Errors</td></tr>
  </table>
  <h2>RED for services</h2>
  <p>For a web API, RED collapses cleanly into three counters and a latency bucket set:</p>
  <pre class="code-block">http_requests_total{endpoint, method, status}
http_request_errors_total{endpoint, method, cause}
http_request_duration_seconds{endpoint, method, le}</pre>
  <div class="callout callout-info">
    <strong>REMEMBER</strong>
    <p>A status code does not always mean success. A checkout that returns 200 for a declined payment is a business error and must be counted as one.</p>
  </div>
  <h2>USE for resources</h2>
  <p>For hosts, containers, and queues, USE asks three things: how <em>utilized</em> is the resource, how <em>saturated</em> is it (extra work is queuing), and is it throwing <em>errors</em>? The node exporter in this course gives you the utilization half directly.</p>
  <h2>Turn signals into questions, not just numbers</h2>
  <p>A dashboard that satisfies the golden signals answers a story: <em>How fast? How much? How many are failing? How close are we to the red line?</em> Every panel you build later in this course should map back to one of those four questions.</p>
  <div class="callout callout-tip">
    <strong>PRO TIP</strong>
    <p>Limit every service dashboard to a dozen panels built from the golden signals. If you need more, you are likely looking at a debugging view, not an operational one.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000404',
  '03E00000-0000-4000-8000-000000000304',
  1,
  'Anatomy of a Metric',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Anatomy of a Metric</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Anatomy of a Metric</h1>
  <p>In Prometheus, a time series is a stream of <strong>samples</strong>. Each sample pairs a timestamp with a float value, and the series as a whole is identified by a <strong>metric name</strong> plus a set of <strong>labels</strong>. This tiny, regular structure is what makes Prometheus data cheap and queryable.</p>
  <pre class="code-block">node_cpu_seconds_total{instance="app-01:9100", cpu="0", mode="user"} 48219.32</pre>
  <p>The name <span class="ic">node_cpu_seconds_total</span> tells you the origin (node exporter), the quantity (CPU time), and the unit (seconds). The label set <span class="ic">{instance, cpu, mode}</span> splits the series into dimensions you can filter and aggregate over.</p>
  <h2>The four metric types</h2>
  <table>
    <tr><th>Type</th><th>Behavior</th><th>Typical name suffix</th></tr>
    <tr><td>Counter</td><td>Only increases, resets on restart</td><td><span class="ic">_total</span></td></tr>
    <tr><td>Gauge</td><td>Can go up and down</td><td>none, e.g. <span class="ic">_usage_bytes</span></td></tr>
    <tr><td>Histogram</td><td>Counts observations in pre-defined buckets</td><td><span class="ic">_bucket</span>, <span class="ic">_sum</span>, <span class="ic">_count</span></td></tr>
    <tr><td>Summary</td><td>Tracks quantiles on the client side</td><td><span class="ic">_quantile</span></td></tr>
  </table>
  <h2>Counter vs gauge</h2>
  <ul>
    <li><strong>Counter</strong> — use for anything that accumulates: requests served, bytes written, errors, uptime. They never decrease, so you compute rates like requests per second from them.</li>
    <li><strong>Gauge</strong> — use for level-like values that oscillate: temperature, memory used, queue depth, active users.</li>
  </ul>
  <div class="callout callout-info">
    <strong>WATCH OUT</strong>
    <p>Never apply <span class="ic">rate()</span> to a gauge. A rate derives increases between scrapes; on a gauge those increases are meaningless noise.</p>
  </div>
  <h2>Histograms and percentiles</h2>
  <p>A histogram counts observations into cumulative buckets with boundaries declared by <span class="ic">le</span> (less than or equal). Prometheus turns those bucket counts into percentiles with <span class="ic">histogram_quantile()</span>, which you will practice in the PromQL module.</p>
  <pre class="code-block">http_request_duration_seconds_bucket{le="0.1"} 12000
http_request_duration_seconds_bucket{le="0.5"} 45000
http_request_duration_seconds_bucket{le="+Inf"} 50000</pre>
  <h2>Naming conventions</h2>
  <ul>
    <li>Use one base unit in the name: <span class="ic">seconds</span>, <span class="ic">bytes</span>, <span class="ic">requests</span>.</li>
    <li>Prefix with the namespace, like <span class="ic">http_</span> or <span class="ic">node_</span>.</li>
    <li>Suffix counters with <span class="ic">_total</span> and histograms with <span class="ic">_seconds</span>.</li>
  </ul>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000405',
  '03E00000-0000-4000-8000-000000000305',
  1,
  'Labels &amp; Cardinality',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Labels &amp; Cardinality</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Labels &amp; Cardinality</h1>
  <p>Labels are the dimensions that let one metric name answer many questions. The metric <span class="ic">http_requests_total</span> becomes 12 different series when you tag it with <span class="ic">{method, status}</span> — but every new label value multiplies the number of series Prometheus must store and evaluate.</p>
  <pre class="code-block">http_requests_total{method="GET", status="200"} 10402
http_requests_total{method="GET", status="500"} 18
http_requests_total{method="POST", status="200"} 3911</pre>
  <h2>Cardinality is the enemy</h2>
  <p><strong>Cardinality</strong> is the number of unique label-value combinations for a metric. A label that can take 10 values turns one series into ten. Two such labels produce a hundred. When a label is unbounded — like a user id, an email, or a session token — the series count grows without limit and eventually cripples the TSDB.</p>
  <table>
    <tr><th>Good labels</th><th>Bad labels</th></tr>
    <tr><td><span class="ic">endpoint</span>, <span class="ic">method</span></td><td>user id, email, session token</td></tr>
    <tr><td><span class="ic">datacenter</span>, <span class="ic">az</span></td><td>full request body, stack trace</td></tr>
    <tr><td><span class="ic">environment</span></td><td>random suffix, build hash per run</td></tr>
  </table>
  <h2>How cardinality grows</h2>
  <pre class="code-block">requests_total{user_id="u_8475"}   <- unbounded, painful
requests_total{env="prod"}          <- bounded, useful</pre>
  <div class="callout callout-info">
    <strong>WATCH OUT</strong>
    <p>Dashboard queries like <span class="ic">sum(rate(...)) by (user_id)</span> look harmless in a demo and catastrophic in production. Always ask: <em>how many distinct values can this label take, and for how long?</em></p>
  </div>
  <h2>Containing the damage</h2>
  <ul>
    <li><strong>Aggregate aggressively:</strong> store high-cardinality detail in logs and traces, not as metric labels.</li>
    <li><strong>Relabel away:</strong> drop unneeded labels at scrape time with <span class="ic">metric_relabel_configs</span>.</li>
    <li><strong>Watch your exports:</strong> dashboards of your own dashboard — Grafana uses Prometheus to display <span class="ic">prometheus_tsdb_series</span> so you can see growth.</li>
  </ul>
  <h2>Relabeling basics</h2>
  <p>You can strip labels before they ever reach storage, keeping memory tight without changing your app:</p>
  <pre class="code-block">metric_relabel_configs:
  - source_labels: [request_id]
    regex: '.*'
    action: drop</pre>
  <div class="callout callout-tip">
    <strong>RULES OF THUMB</strong>
    <p>Keep cardinality below a few thousand series per metric in normal operation. If a label has no fixed upper bound, it belongs in a log line, not a sample.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000407',
  '03E00000-0000-4000-8000-000000000307',
  1,
  'Architecture &amp; Data Model',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Architecture &amp; Data Model</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Architecture &amp; Data Model</h1>
  <p>Prometheus is a <strong>pull-based</strong> monitoring system. Instead of agents pushing data in, Prometheus reaches out and scrapes an HTTP endpoint on each target on a fixed schedule. That one decision — pull, not push — drives almost everything else in its design.</p>
  <h2>The pull model wins</h2>
  <ul>
    <li><strong>Health comes free:</strong> a failed scrape is itself a signal (<span class="ic">up == 0</span>), so dead targets are discovered, not missed.</li>
    <li><strong>No target-side config:</strong> turn on a second Prometheus by duplicating the scrape config, no agent changes needed.</li>
    <li><strong>Predictable load:</strong> your Prometheus decides when and how hard it scrapes, keeping it from overwhelming targets at boot.</li>
  </ul>
  <h2>The components</h2>
  <table>
    <tr><th>Component</th><th>Role</th></tr>
    <tr><td>Retrieval</td><td>Performs scrapes on the scrape interval and ingests samples</td></tr>
    <tr><td>TSDB</td><td>Compresses and stores time series, with retention rules</td></tr>
    <tr><td>Rule evaluation</td><td>Runs recording and alerting rules on a schedule</td></tr>
    <tr><td>HTTP API + UI</td><td>Serves queries to the browser, Grafana, and CLI tools</td></tr>
    <tr><td>Service discovery</td><td>Finds targets from file, DNS, Consul, Kubernetes, and more</td></tr>
  </table>
  <h2>The time series data model</h2>
  <p>A sample is a (timestamp, value) pair. Series are keyed by metric name plus labels, stored in a packed TSDB format with ~1–3 bytes per sample — drastically cheaper than a raw CSV export.</p>
  <pre class="code-block">node_memory_Active_bytes{instance="192.168.1.10:9100", job="nodes"}
  (1737288000, 1288033280)
  (1737288020, 1289142272)</pre>
  <h2>Push paths still exist</h2>
  <p>Some workloads, like short-lived batch jobs, finish before a scrape can reach them. Use the <span class="ic">pushgateway</span> for such one-shot jobs, or the <span class="ic">remote write</span> protocol to forward series to long-term stores such as Cortex or Thanos. But for always-running services, pull is the default and the safest.</p>
  <div class="callout callout-tip">
    <strong>MENTAL MODEL</strong>
    <p>Think of Prometheus as a small database that asks questions on a timer. Everything it displays later is just the answers it collected by asking politely, on time, every few seconds.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000408',
  '03E00000-0000-4000-8000-000000000308',
  1,
  'Scraping Targets &amp; Retention',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Scraping Targets &amp; Retention</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Scraping Targets &amp; Retention</h1>
  <p>Everything Prometheus collects is defined in <span class="ic">prometheus.yml</span>. A <strong>scrape_config</strong> lists targets, the <span class="ic">scrape_interval</span>, and any extra labels to attach. Each target lives under the implicit labels <span class="ic">job</span> (the config it came from) and <span class="ic">instance</span> (host:port).</p>
  <pre class="code-block">scrape_configs:
  - job_name: nodes
    static_configs:
      - targets: ['192.168.1.10:9100', '192.168.1.11:9100']
    scrape_interval: 15s</pre>
  <h2>Targets and the up metric</h2>
  <p>For every target, Prometheus records <span class="ic">up{job, instance}</span>. A scrape that completes returns <span class="ic">up = 1</span>; a failure returns <span class="ic">up = 0</span>. This single metric doubles as the heartbeat of your entire fleet.</p>
  <pre class="code-block">up{job="nodes", instance="192.168.1.10:9100"} 1</pre>
  <h2>Labels you get for free</h2>
  <ul>
    <li><span class="ic">job</span> — the scrape job name.</li>
    <li><span class="ic">instance</span> — the scanned host and port.</li>
    <li>Any others you assign with <span class="ic">labels</span> or rewrite with <span class="ic">relabel_configs</span>.</li>
  </ul>
  <h2>Storage and retention</h2>
  <p>Samples land in the local <strong>TSDB</strong>, chunked and compressed. Two flags control how long data lives:</p>
  <pre class="code-block">prometheus --storage.tsdb.retention.time=30d \
           --storage.tsdb.retention.size=50GB</pre>
  <p>Use <em>time</em> for "how long do I need the past," and <em>size</em> for "how much disk am I willing to spend." Both can coexist; the first trigger to hit wins.</p>
  <div class="callout callout-info">
    <strong>REALITY CHECK</strong>
    <p>Local TSDB storage is intentionally cheap and short-lived (days to weeks). Permanent archives belong to remote storage via <span class="ic">remote_write</span>, covered later in the course.</p>
  </div>
  <h2>Watch your own health</h2>
  <p>Prometheus shadows these operations with self-metrics:
  <span class="ic">prometheus_tsdb_head_samples_appended_total</span>, <span class="ic">scrape_samples_scraped</span>, and <span class="ic">up</span> itself. If your monitoring system cannot monitor itself, every alert is suspect.</p>
  <div class="callout callout-tip">
    <strong>PRO TIP</strong>
    <p>Set global defaults once: one <span class="ic">scrape_interval</span>, one <span class="ic">evaluation_interval</span>. Overriding per-job everywhere is how monitoring stacks grow alert fatigue.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000410',
  '03E00000-0000-4000-8000-000000000310',
  1,
  'The Node Exporter',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Node Exporter</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Node Exporter</h1>
  <p>The <strong>node exporter</strong> runs on each Linux host and exposes that host's kernel and hardware statistics as Prometheus metrics on <span class="ic">/metrics</span> (default port <span class="ic">9100</span>). It is the fastest way to leave "I am blind" and reach "I know the state of every box."</p>
  <h2>Running it</h2>
  <pre class="code-block"># single binary, no dependencies
node_exporter --web.listen-address=:9100

# verify the endpoint
curl http://localhost:9100/metrics | head</pre>
  <p>Then add the hosts to your scrape config and watch them appear:</p>
  <pre class="code-block">scrape_configs:
  - job_name: nodes
    static_configs:
      - targets: ['app-01:9100', 'app-02:9100']</pre>
  <h2>Metrics you will use daily</h2>
  <table>
    <tr><th>Metric</th><th>Question it answers</th></tr>
    <tr><td><span class="ic">node_cpu_seconds_total</span></td><td>How much CPU by mode, per core?</td></tr>
    <tr><td><span class="ic">node_memory_MemAvailable_bytes</span></td><td>How much memory is actually available?</td></tr>
    <tr><td><span class="ic">node_filesystem_avail_bytes</span></td><td>How much disk is left per mount?</td></tr>
    <tr><td><span class="ic">node_network_receive_bytes_total</span></td><td>How much traffic is coming in?</td></tr>
    <tr><td><span class="ic">node_load1</span></td><td>Is the box saturated right now?</td></tr>
  </table>
  <h2>First queries</h2>
  <p>Turn raw counters into rates and gauges into utilization:</p>
  <pre class="code-block"># CPU utilization over 5 minutes, summed across cores
100 - ( avg(rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100 )

# memory utilization
node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes

# root filesystem utilization
node_filesystem_avail_bytes{mountpoint="/"} /
  node_filesystem_size_bytes{mountpoint="/"}</pre>
  <div class="callout callout-info">
    <strong>SECURITY</strong>
    <p><span class="ic">node_exporter</span> exposes kernel telemetry to anyone who can reach it. Bind it to a private interface or firewall it from the public internet, behind reverse-auth if required.</p>
  </div>
  <h2>What it does not do</h2>
  <p>The node exporter reports the machine, not your application. It will not tell you about HTTP request latency, queue length behind your API, or SQL query times — for that you need app-level metrics, which the next lesson covers.</p>
  <div class="callout callout-tip">
    <strong>PRO TIP</strong>
    <p>Expose several <span class="ic">node_exporter</span>-style host collectors in Kubernetes via the kubelet, but keep one rule of thumb: the metrics you name for hosts are the metrics you will page on for hosts.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000411',
  '03E00000-0000-4000-8000-000000000311',
  1,
  'Blackbox Exporter &amp; Custom Metrics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blackbox Exporter &amp; Custom Metrics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Blackbox Exporter &amp; Custom Metrics</h1>
  <p>Host metrics tell you how the machine is doing; they say nothing about whether the <em>outside world</em> can actually reach your service. The <strong>blackbox exporter</strong> solves exactly that by running active probes — HTTP, TCP, ICMP, DNS — the way a user would.</p>
  <h2>How probes are configured</h2>
  <p>Prometheus scrapes the blackbox exporter itself, passing the target and module as query parameters:</p>
  <pre class="code-block">scrape_configs:
  - job_name: blackbox_http
    metrics_path: /probe
    params:
      module: [http_2xx]
    static_configs:
      - targets: ['https://shop.example.com']
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance</pre>
  <h2>What you get back</h2>
  <ul>
    <li><span class="ic">probe_success</span> — 1 if the module conditions were met, else 0.</li>
    <li><span class="ic">probe_duration_seconds</span> — total round-trip time.</li>
    <li><span class="ic">probe_http_status_code</span>, <span class="ic">probe_http_content_length_bytes</span> — HTTP detail.</li>
    <li><span class="ic">probe_dns_lookup_time_seconds</span> — DNS speed.</li>
  </ul>
  <div class="callout callout-info">
    <strong>WHY BOTHER?</strong>
    <p>An app can be perfectly healthy on its host yet invisible to customers: broken DNS, a dropped TLS handshake, a firewall rule. Probes see what your internal metrics cannot.</p>
  </div>
  <h2>Adding custom application metrics</h2>
  <p>For application behavior — request latency, queue depth, user counts — you instrument your own code with a <strong>client library</strong>. The canonical pattern: build a <span class="ic">/metrics</span> endpoint, register counters and histograms, and scrape it like any other target.</p>
  <pre class="code-block">// Go client example
var Reqs = prometheus.NewCounterVec(
  prometheus.CounterOpts{
    Name: "http_requests_total",
    Help: "HTTP requests handled.",
  },
  []string{"method", "status"},
)</pre>
  <h2>A taxonomy of exporters</h2>
  <table>
    <tr><th>Need</th><th>Exporter</th></tr>
    <tr><td>Host metrics</td><td>node_exporter</td></tr>
    <tr><td>HTTP/TCP/ICMP/DNS probes</td><td>blackbox_exporter</td></tr>
    <tr><td>MySQL / Postgres</td><td>mysqld_exporter / postgres_exporter</td></tr>
    <tr><td>Windows hosts</td><td>windows_exporter</td></tr>
    <tr><td>Kubernetes cluster</td><td>kube-state-metrics (plus kubelet cAdvisor)</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>PATTERN</strong>
    <p>One exporter per concern, one <span class="ic">job_name</span> per exporter. When a probe flakes, you can tell instantly whether the problem is the network, the app, or the probe itself.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000413',
  '03E00000-0000-4000-8000-000000000313',
  1,
  'Selectors, Vectors &amp; Rate Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Selectors, Vectors &amp; Rate Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Selectors, Vectors &amp; Rate Functions</h1>
  <p><strong>PromQL</strong> is Prometheus' query language. Most expressions return one of two shapes. An <strong>instant vector</strong> is one sample per series at the evaluation time; a <strong>range vector</strong> is the set of samples spanning a window of time. Knowing which one you need is the whole game.</p>
  <h2>Selecting series</h2>
  <pre class="code-block"># one series name, no labels
node_memory_MemTotal_bytes

# filter with an exact label match
http_requests_total{status="200"}

# several exact matches
http_requests_total{method="GET", status="500"}

# regular expression match
http_requests_total{method=~"POST|PUT"}</pre>
  <h2>Two sides of every metric</h2>
  <p>The value of a metric like CPU use is boring until you view it through time. Prefix with <span class="ic">[5m]</span> to grab a range vector, then feed it to a function:</p>
  <table>
    <tr><th>Function</th><th>What it returns</th></tr>
    <tr><td><span class="ic">rate(counter[5m])</span></td><td>Average per-second increase, handles resets</td></tr>
    <tr><td><span class="ic">irate(counter[5m])</span></td><td>Per-second rate from the last two samples, more volatile</td></tr>
    <tr><td><span class="ic">increase(counter[1h])</span></td><td>Total increase over the window</td></tr>
    <tr><td><span class="ic">avg_over_time(gauge[5m])</span></td><td>Average gauge level over the window</td></tr>
  </table>
  <h2>Reading the classics</h2>
  <pre class="code-block"># requests per second over the last 5 minutes
rate(http_requests_total[5m])

# error rate as a fraction of traffic
rate(http_requests_total{status=~"5.."}[5m])
  / rate(http_requests_total[5m])

# a per-hour traffic pulse viewed at the minute scale
irate(http_requests_total[5m])</pre>
  <div class="callout callout-info">
    <strong>RULE</strong>
    <p><span class="ic">rate()</span> and <span class="ic">increase()</span> belong to counters. For gauges use direct math or <span class="ic">avg_over_time()</span>. Mixing the two yields nonsense alerts.</p>
  </div>
  <h2>Offset into the past</h2>
  <p>Compare reality to history without touching the data: <span class="ic">rate(http_requests_total[5m] offset 1d)</span> plots yesterday at the same hour — the basis of "is today unusual?" dashboards.</p>
  <div class="callout callout-tip">
    <strong>PRO TIP</strong>
    <p>Keep windows ≥ 4–5 scrape intervals so <span class="ic">rate()</span> has enough samples to be stable. A 15-second scrape paired with a <span class="ic">[1m]</span> window works well; a <span class="ic">[15s]</span> window is a dice roll.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000414',
  '03E00000-0000-4000-8000-000000000314',
  1,
  'Aggregations &amp; histogram_quantile',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aggregations &amp; histogram_quantile</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Aggregations &amp; histogram_quantile</h1>
  <p>A single metric can fan out into hundreds of series across instances and label values. <strong>Aggregation</strong> collapses them back into the one number you actually want on a dashboard — without breaking the per-instance view.</p>
  <h2>Sum, avg, max and friends</h2>
  <pre class="code-block"># total requests per second across the fleet
sum(rate(http_requests_total[5m]))

# the same, but keep the endpoint dimension
sum by (endpoint) (rate(http_requests_total[5m]))

# every instance, every endpoint — nothing collapsed
sum by (endpoint, instance) (rate(http_requests_total[5m]))</pre>
  <h2>by vs without</h2>
  <ul>
    <li><span class="ic">by (label)</span> — keep only these labels in the result.</li>
    <li><span class="ic">without (label)</span> — drop these labels, keep the rest.</li>
  </ul>
  <p>Choose <span class="ic">without</span> when the label list is long and stable; choose <span class="ic">by</span> when you want explicit control of the output shape.</p>
  <h2>Other handy aggregators</h2>
  <pre class="code-block">topk(5, rate(http_requests_total[5m]))    # busiest five series
count(up)                                  # how many series match
max(rate(http_requests_total[5m]))         # peak traffic</pre>
  <h2>Percentiles from a histogram</h2>
  <p>Average latency hides a sad tail: 95% of requests at 200 ms and 5% at 10 s produce an "average" nobody feels. Histograms preserve the distribution, and <span class="ic">histogram_quantile()</span> reads it back:</p>
  <pre class="code-block">histogram_quantile(0.95,
  sum by (le) (rate(http_request_duration_seconds_bucket[5m])))</pre>
  <p>You must feed it the cumulative counts per bucket (<span class="ic">le</span>). Never apply it to raw gauges; the output is only as good as the bucketing you declared at instrumentation time.</p>
  <div class="callout callout-info">
    <strong>BUCKETS MATTER</strong>
    <p>Buckets should concentrate around your SLO boundary. For a service promising p95 under 500 ms, include buckets at 0.25, 0.5, 1, and 2.5 seconds so the percentile is actually resolvable where you care.</p>
  </div>
  <h2>From percentiles to alerts</h2>
  <pre class="code-block"># triggered when the p95 breaches the SLO:
histogram_quantile(0.95,
  sum by (le) (rate(http_request_duration_seconds_bucket[5m]))) > 0.5</pre>
  <div class="callout callout-tip">
    <strong>DASHBOARD HABIT</strong>
    <p>Plot p50 and p95 on the same latency panel. The gap between them tells you whether a few slow requests (tail) or the whole fleet (mass) is regressing.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000416',
  '03E00000-0000-4000-8000-000000000316',
  1,
  'Recording Rules',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recording Rules</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Recording Rules</h1>
  <p>Some PromQL expressions are expensive and popular: the same fleet-wide error rate shown on five dashboards and used by two alert rules. Recomputing it on every panel load wastes CPU. <strong>Recording rules</strong> evaluate once on a schedule and store the answer as a fresh metric.</p>
  <h2>Anatomy of a rule file</h2>
  <pre class="code-block">groups:
  - name: api_slo.rules
    interval: 1m
    rules:
      - record: job:http_request_errors:rate5m
        expr: sum by (job, endpoint) (
          rate(http_requests_total{status=~"5.."}[5m]))

      - record: job:http_requests:rate5m
        expr: sum by (job, endpoint) (
          rate(http_requests_total[5m]))</pre>
  <h2>The naming convention</h2>
  <p>Use <span class="ic">level:metric:operation</span> so everyone can read intent at a glance:</p>
  <table>
    <tr><th>Level</th><th>Metric</th><th>Operation</th></tr>
    <tr><td><span class="ic">job</span></td><td>http_request_errors</td><td>rate5m</td></tr>
    <tr><td><span class="ic">cluster</span></td><td>node_memory_usage</td><td>ratio</td></tr>
    <tr><td><span class="ic">instance</span></td><td>api_latency</td><td>p95</td></tr>
  </table>
  <h2>Wire them in</h2>
  <pre class="code-block">rule_files:
  - "rules/*.yml"   # in prometheus.yml</pre>
  <p>Once loaded, dashboards and alerts simply query the precomputed name:</p>
  <pre class="code-block">job:http_request_errors:rate5m
  / job:http_requests:rate5m</pre>
  <div class="callout callout-info">
    <strong>WHY IT MATTERS</strong>
    <p>Every panel refresh and rule evaluation that reads one series instead of fifty makes the whole stack snappier. Heavy dashboards stop timing out precisely because the expensive part already ran once.</p>
  </div>
  <h2>When not to use them</h2>
  <ul>
    <li>Short-lived debugging queries — no value in caching them.</li>
    <li>Tiny metrics — recording rules add storage and keep nothing.</li>
    <li><span class="ic">histogram_quantile()</span> at the rule level if you need the raw buckets later — record the rate, not the quantile.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>DISCIPLINE</strong>
    <p>Treat recording rules like code: name them precisely, version the file, review for label hygiene. A recording rule is just a query you agreed to run forever.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000417',
  '03E00000-0000-4000-8000-000000000317',
  1,
  'Alerting Rules &amp; Alertmanager',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Alerting Rules &amp; Alertmanager</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Alerting Rules &amp; Alertmanager</h1>
  <p>Alerts are where monitoring earns its keep. An <strong>alerting rule</strong> in Prometheus decides <em>when</em> something is wrong; <strong>Alertmanager</strong> decides <em>who gets told, how, and how often</em>. Splitting the two keeps Prometheus fast and your inbox sane.</p>
  <h2>A well-shaped alerting rule</h2>
  <pre class="code-block">groups:
  - name: api_alerts.rules
    rules:
      - alert: HighErrorRate
        expr: job:http_request_errors:rate5m
          / job:http_requests:rate5m > 0.05
        for: 10m
        labels:
          severity: page
          team: api
        annotations:
          summary: "Error rate above 5% for 10 minutes"
          runbook_url: "https://runbooks.example.com/api"</pre>
  <ul>
    <li><span class="ic">expr</span> — a boolean PromQL expression; fires while it evaluates to true.</li>
    <li><span class="ic">for</span> — hold the condition for this long before firing, killing flap-artifacts.</li>
    <li><span class="ic">labels</span> — enrichment; severity and team drive routing.</li>
    <li><span class="ic">annotations</span> — what a human sees; summary plus runbook link.</li>
  </ul>
  <h2>Alert states</h2>
  <p>An alert lives through <span class="ic">inactive</span> → <span class="ic">pending</span> (condition true, <span class="ic">for</span> not elapsed) → <span class="ic">firing</span>. On recovery it resolves automatically — no one needs to silence anything by hand.</p>
  <h2>Alertmanager routing</h2>
  <p>Alertmanager groups related alerts, deduplicates repeats, and routes each bundle to receivers:</p>
  <pre class="code-block">route:
  group_by: ["alertname", "team"]
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 4h
  receiver: ops

receivers:
  - name: ops
    email_configs:
      - to: "oncall@example.com"
    slack_configs:
      - api_url: "https://hooks.slack.com/services/..."
        channel: "#incidents"
    webhook_configs:
      - url: "https://pagerduty.example.com/integrate"</pre>
  <div class="callout callout-info">
    <strong>WHY GROUPING?</strong>
    <p>A network blip makes 40 alerts blast half the fleet. Grouping by <span class="ic">alertname</span> + <span class="ic">team</span> collapses them into one notification that mentions the count — exactly the summary an on-call engineer needs.</p>
  </div>
  <h2>Receivers compared</h2>
  <table>
    <tr><th>Receiver</th><th>Best for</th></tr>
    <tr><td>Email</td><td>Non-urgent summaries and audit trails</td></tr>
    <tr><td>Slack / Teams</td><td>Team awareness and quick triage</td></tr>
    <tr><td>PagerDuty / webhook</td><td>Real paging to the on-call rotation</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>ALERT ETHICS</strong>
    <p>Alert on what a human must act on, not on what a dashboard already shows. If a page has no runbook and no owner, it is noise — delete it before it trains people to ignore everything.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000419',
  '03E00000-0000-4000-8000-000000000319',
  1,
  'Your First Dashboard',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Your First Dashboard</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Your First Dashboard</h1>
  <p><strong>Grafana</strong> is the visualization layer of the stack. It connects to Prometheus as a <em>data source</em> and turns queries into panels — no SQL, no export, just live series rendered as time is happening.</p>
  <h2>Connect Prometheus as a data source</h2>
  <ol>
    <li>Open Grafana and sign in (default <span class="ic">admin / admin</span>).</li>
    <li>Go to <span class="ic">Configuration → Data sources → Add data source</span>.</li>
    <li>Choose <span class="ic">Prometheus</span> and set the URL to <span class="ic">http://localhost:9090</span>.</li>
    <li>Click <span class="ic">Save &amp; test</span> — Grafana confirms the connection immediately.</li>
  </ol>
  <h2>Explore before you build</h2>
  <p>Use <span class="ic">Explore</span> to validate every expression before it lands on a dashboard. Switch from metric autocomplete to <span class="ic">PromQL</span> mode and try:</p>
  <pre class="code-block">rate(http_requests_total[5m])          # request rate
up                                       # target health
node_load1{job="nodes"}                 # host load</pre>
  <h2>Create your first panel</h2>
  <ol>
    <li><span class="ic">Dashboards → New dashboard → Add visualization</span>.</li>
    <li>Pick the Prometheus data source.</li>
    <li>Enter a query and set <span class="ic">Legend</span> to <span class="ic">{{instance}}</span> so series are readable.</li>
    <li>Save the dashboard with a meaningful name and description.</li>
  </ol>
  <div class="callout callout-info">
    <strong>HABITS</strong>
    <p>Give panels a purpose in the title, not a shape: "Error rate by endpoint" beats "graph 4". Add a dashboard description so next month's rotation understands the intent.</p>
  </div>
  <h2>A skeleton dashboard</h2>
  <table>
    <tr><th>Row</th><th>Panels</th></tr>
    <tr><td>Traffic</td><td>Request rate by endpoint, requests per status code</td></tr>
    <tr><td>Health</td><td>Targets up, error rate ratio, latency p95</td></tr>
    <tr><td>Capacity</td><td>CPU, memory, disk per host</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>PRO TIP</strong>
    <p>Point Grafana directly at your recording-rule metrics (<span class="ic">job:http_request_errors:rate5m</span>). Panels load faster, and both dashboards and alerts read from the same source of truth.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000420',
  '03E00000-0000-4000-8000-000000000320',
  1,
  'Panels, Thresholds &amp; Templating',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Panels, Thresholds &amp; Templating</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Panels, Thresholds &amp; Templating</h1>
  <p>A time series panel is only the first act. Grafana becomes genuinely useful when panels <em>mean</em> something at a glance: stat panels that turn numeric thresholds into color, and template variables that turn one dashboard into a per-host, per-service browser.</p>
  <h2>Pick the right panel type</h2>
  <table>
    <tr><th>Panel</th><th>Best for</th></tr>
    <tr><td>Time series</td><td>Trends: rates, latency over time</td></tr>
    <tr><td>Stat</td><td>A single current value, e.g. error rate</td></tr>
    <tr><td>Gauge</td><td>One value against thresholds, e.g. disk full</td></tr>
    <tr><td>Bar gauge</td><td>Many values side by side, e.g. per-instance CPU</td></tr>
    <tr><td>Table</td><td>Top-N and exact numbers per label</td></tr>
  </table>
  <h2>Thresholds communicate instantly</h2>
  <p>Give a stat panel two thresholds and an SLO boundary, and the color does the paging: green below the line, yellow near it, red over it. Thresholds rarely belong in time series panels — the line itself already shows the breach.</p>
  <div class="callout callout-tip">
    <strong>ONE THRESHOLD, ONE STORY</strong>
    <p>Set thresholds at your SLO target, not at arbitrary decimals. A 99.5% target means the error-rate threshold is 0.5%, and the panel turns red the moment budget starts burning.</p>
  </div>
  <h2>Template variables</h2>
  <p>A variable at the top of a dashboard feeds <span class="ic">$var</span> into every query. Build a variable from a Prometheus query:</p>
  <pre class="code-block"># variable "instance", label_values(node_load1, instance)
# query uses it:
node_load1{instance="$instance"}</pre>
  <p>Now one dashboard serves "pick a host" — instead of 200 cloned panels.</p>
  <h2>Annotations and links</h2>
  <ul>
    <li><strong>Annotations</strong> — draw deploy or incident events on the time axis; correlations become visible.</li>
    <li><strong>Links</strong> — point each panel to a runbook or Grafana Explore, closing alert → detail in one click.</li>
  </ul>
  <div class="callout callout-info">
    <strong>HABITS</strong>
    <p>Name panels like alerts: readable, scoped to one question. Keep the default time range honest — every dashboard should work well at 1h, 6h, and 7d, because that is what humans actually open.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000422',
  '03E00000-0000-4000-8000-000000000322',
  1,
  'SLIs, SLOs &amp; Error Budgets',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SLIs, SLOs &amp; Error Budgets</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>SLIs, SLOs &amp; Error Budgets</h1>
  <p>Reliability is a choice, not an accident. The SRE playbook names three tools for choosing it deliberately: <strong>SLIs</strong> (what we measure), <strong>SLOs</strong> (the target), and <strong>error budgets</strong> (how much failure we can afford).</p>
  <h2>Definitions</h2>
  <ul>
    <li><strong>SLI (Service Level Indicator)</strong> — a measurable fraction of good events, e.g. percentage of requests served in under 400 ms.</li>
    <li><strong>SLO (Service Level Objective)</strong> — the target you commit to, e.g. <span class="ic">99.9% availability</span> for a quarter.</li>
    <li><strong>Error budget</strong> — the acceptable unreliability: <span class="ic">100% − SLO</span>. For 99.9%, that is 0.1% of time or events you are allowed to miss.</li>
  </ul>
  <h2>Availability is a fraction, not a mood</h2>
  <pre class="code-block">availability = good_events / total_events

slo_sli  = 1 - ( error_requests / total_requests )</pre>
  <h2>Feeding the fraction from Prometheus</h2>
  <pre class="code-block"># error rate: 5xx over all requests, last 5 minutes
job:http_request_errors:rate5m / job:http_requests:rate5m
# availability = 1 minus that ratio</pre>
  <h2>Error budget math</h2>
  <table>
    <tr><th>SLO</th><th>Daily budget</th><th>30-day budget</th></tr>
    <tr><td>99.0%</td><td>14.4 minutes</td><td>7.2 hours</td></tr>
    <tr><td>99.9%</td><td>1.44 minutes</td><td>43.2 minutes</td></tr>
    <tr><td>99.99%</td><td>8.6 seconds</td><td>4.3 minutes</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>THE TRICK</strong>
    <p>The budget converts reliability from a feeling into an engineering currency. When the budget is full, ship new features; when it is burning fast, stop shipping and fix. That decision no longer requires a manager — it requires only the standing target.</p>
  </div>
  <h2>Choose SLIs that match user value</h2>
  <p>An SLI should approximate what a user perceives: request latency as seen at the edge, availability as the fraction of requests that succeed, and coverage across your primary traffic — not just a synthetic health check on one node.</p>
  <div class="callout callout-tip">
    <strong>START SMALL</strong>
    <p>Begin with one availability SLO and one latency SLO on a single critical service. Extend only when the dashboards and alerts around them are boring — which is exactly the point.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000423',
  '03E00000-0000-4000-8000-000000000323',
  1,
  'SLO Alerting &amp; Reliability',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SLO Alerting &amp; Reliability</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>SLO Alerting &amp; Reliability</h1>
  <p>Alerting "when the error rate is over 5%" reacts to user pain a little too late. SLO-based alerting watches the <strong>burn rate</strong> — how fast the error budget is being consumed — and pages early, with math that connects directly to the promise you made.</p>
  <h2>Burn rate in one line</h2>
  <p>Burn rate is how quickly you would exhaust the budget at the current error fraction:</p>
  <pre class="code-block">burn_rate = observed_error_ratio / (1 - SLO)</pre>
  <p>At 1.0 you exactly use the budget; at 14.4 you would blow 99.9% in about two days. The multi-window technique watches both a short and a long window so a pager fires promptly, but only when the budget really is burning.</p>
  <table>
    <tr><th>Window</th><th>Multiplier</th><th>Meaning</th></tr>
    <tr><td>1h / 5m</td><td>14.4×</td><td>Budget exhausted in ~2 days</td></tr>
    <tr><td>6h / 30m</td><td>6×</td><td>Budget exhausted in ~5 days</td></tr>
    <tr><td>3d / 6h</td><td>1×</td><td>Budget exhausted in ~30 days</td></tr>
  </table>
  <h2>A multi-window rule</h2>
  <pre class="code-block">- record: slo:api_error_burnrate
  expr: sum(rate(http_requests_total{status=~"5.."}[5m]))
        / sum(rate(http_requests_total[5m])) / 0.001

groups:
  - name: api_slo.rules
    rules:
      - alert: ApiErrorBudgetBurn
        expr: slo:api_error_burnrate > 14.4
          and slo:api_error_burnrate > 6
        for: 2m
        labels: { severity: page }
        annotations:
          summary: "API error budget burning fast"
          runbook_url: "https://runbooks.example.com/api-slo"</pre>
  <div class="callout callout-info">
    <strong>WHY TWO WINDOWS?</strong>
    <p>A single low-multiplier alert fires only after hours of sustained pain. A single high-multiplier alert fires on any five-minute blip. Overlapping both gives you speed without tripping on noise.</p>
  </div>
  <h2>Turning the knot</h2>
  <p>Blocking deploys when the budget is gone is a policy choice, not a tool. Prometheus reports the burn rate; your team decides when to freeze releases. That single policy — "no deploys into a burning budget" — is the highest-leverage reliability move in this course.</p>
  <div class="callout callout-tip">
    <strong>NEXT STEP</strong>
    <p>In the capstone you will wire exactly this rule to Alertmanager and to a Grafana panel that turns red as the budget drains — completing the loop from measurement to pager.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000425',
  '03E00000-0000-4000-8000-000000000325',
  1,
  'Federation &amp; High Availability',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Federation &amp; High Availability</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Federation &amp; High Availability</h1>
  <p>A single Prometheus happily monitors a conference demo; production asks more. Two growth directions matter: <strong>scale up</strong> the fleet covered by one Prometheus, and <strong>scale across teams</strong> by letting each group own a server while your global one still sees everything.</p>
  <h2>Federation: the pyramid</h2>
  <p>Each team runs a Prometheus that scrapes its own targets. A central Prometheus then scrapes the <em>team servers</em> — but only the small subset of metrics worth global aggregation:</p>
  <pre class="code-block">scrape_configs:
  - job_name: federate
    metrics_path: /federate
    params:
      match[]: ['{__name__=~"job:.*|slo:.*"}']
    static_configs:
      - targets: ['team-a-prom:9090', 'team-b-prom:9090']</pre>
  <p>Recording-rule outputs (prefixed <span class="ic">job:</span> or <span class="ic">slo:</span>) are the perfect federation currency: small, stable, already aggregated.</p>
  <div class="callout callout-info">
    <strong>BOUND THE SCOPE</strong>
    <p>Never federate <em>everything</em>. Duplicating raw high-cardinality series into a global server reproduces the exact storage pain you tried to divide. Federate the prepared answers.</p>
  </div>
  <h2>High availability: run two</h2>
  <p>For baseline HA, run two Prometheus replicas with identical scrape configs. Each stores its own copy; if one falls, the other still answers every query and sends every alert. Alertmanager dedupes the duplicate notifications.</p>
  <h2>Beyond a pair: Thanos and friends</h2>
  <p>When retention or global queries outgrow the local TSDB, add a sidecar layer — <strong>Thanos</strong> (or Cortex/Mimir) — that reads each server's blocks and exposes one global query frontend with long-term object-storage retention.</p>
  <table>
    <tr><th>Option</th><th>Good for</th></tr>
    <tr><td>Federation</td><td>Moderate scale, team perimeters, minimal new infra</td></tr>
    <tr><td>HA pair</td><td>Baseline availability, no extra components</td></tr>
    <tr><td>Thanos / Mimir</td><td>Global queries, long retention, many-many clusters</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>RULE OF SCALE</strong>
    <p>Add architecture only when the single server costs you more than the new components do. A healthy pair beats a struggling single every time — start there.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000426',
  '03E00000-0000-4000-8000-000000000326',
  1,
  'Retention &amp; Storage Operations',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Retention &amp; Storage Operations</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Retention &amp; Storage Operations</h1>
  <p>The TSDB is the engine room. Knowing how it chunks data, how retention trims it, and how much disk it will eat tells you whether your Prometheus is a gift or a surprise invoice.</p>
  <h2>How the TSDB stores data</h2>
  <p>Incoming samples are buffered in memory, then compacted into read-only <strong>blocks</strong> of two-hour spans — each with itself-contained metadata so later blocks can be deleted independently. A <span class="ic">WAL</span> (write-ahead log) protects the newest unsaved chunks across restarts.</p>
  <h2>Size your disk before you fill it</h2>
  <pre class="code-block">needed_bytes = retention_seconds *
               ingested_samples_per_second *
               approx_bytes_per_sample</pre>
  <p>Rule of thumb: budget <span class="ic">1–3 bytes per sample</span> after compression, then add 20% headroom. Practically, watch <span class="ic">prometheus_tsdb_compaction_chunk_size_bytes_sum</span> and the raw <span class="ic">prometheus_tsdb_head_series</span> for the ground truth.</p>
  <div class="callout callout-info">
    <strong>LEAKY MATH</strong>
    <p>Cardinality shows up here faster than anywhere else. A metric that explodes from 1k to 10k series makes your honest 30-day plan wrong overnight. Sizing is a statement about your label hygiene as much as your disk budget.</p>
  </div>
  <h2>Retention that matches the promise</h2>
  <pre class="code-block">prometheus --storage.tsdb.retention.time=15d \
           --storage.tsdb.retention.size=100GB</pre>
  <p>The size limit is a hard cap that keeps a burst of series from eating the whole disk; the time limit is your policy. Set both, and alert when <span class="ic">prometheus_tsdb_storage_blocks_bytes</span> approaches the cap.</p>
  <h2>Protect the box that watches everyone</h2>
  <ul>
    <li><strong>Backups:</strong> stop Prometheus cleanly and copy the <span class="ic">data/</span> directory — or use the TSDB snapshot API for hot snapshots.</li>
    <li><strong>Upgrades:</strong> one node at a time; the WAL and block format are what make rolling restarts safe.</li>
    <li><strong>Security:</strong> run behind TLS and auth; expose neither the UI nor <span class="ic">/api</span> to the public internet.</li>
    <li><strong>Sandbox resource:</strong> cap memory with <span class="ic">--storage.tsdb.min-block-duration</span> defaults in mind and monitor the process.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>OPS MINDSET</strong>
    <p>Your monitoring server deserves the same operational rigor as your critical services — dashboards, alerts, backups, and a runbook. When it whispers, you must already believe it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03E00000-0000-4000-8000-000000000427',
  '03E00000-0000-4000-8000-000000000327',
  1,
  'Capstone: A Monitoring Stack for a Web App',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: A Monitoring Stack for a Web App</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #0ea5b7; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #0f766e; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #f0fdfa; color: #0f766e; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #f0fdfa; border-left: 4px solid #0ea5b7; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #22d3ee; }
.dark .lesson-page h2 { color: #5eead4; }
.dark .lesson-page .ic { background: #134e4a; color: #5eead4; }
.dark .lesson-page .callout { background: #134e4a; border-left-color: #22d3ee; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #134e4a; color: #5eead4; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: A Monitoring Stack for a Web App</h1>
  <p>Everything so far fits together into one pipeline. In this capstone you assemble the complete stack — exporter → Prometheus → recording rules → alerts → Alertmanager → Grafana — and prove it works with a few well-chosen queries.</p>
  <h2>1. Sources and exporters</h2>
  <ul>
    <li>Run <span class="ic">node_exporter</span> on two app hosts.</li>
    <li>Instrument the web app with a client library exposing <span class="ic">http_requests_total</span> and a duration histogram.</li>
    <li>Add a <span class="ic">blackbox_exporter</span> job probing the public URL.</li>
  </ul>
  <pre class="code-block">scrape_configs:
  - job_name: nodes
    static_configs: [{ targets: ['app-01:9100', 'app-02:9100'] }]
  - job_name: web
    static_configs: [{ targets: ['app-01:9091'] }]
  - job_name: blackbox
    metrics_path: /probe
    params: { module: [http_2xx] }
    static_configs: [{ targets: ['https://shop.example.com'] }]
    relabel_configs:
      - { source_labels: [__address__], target_label: __param_target }
      - { source_labels: [__param_target], target_label: instance }</pre>
  <h2>2. Recording rules for the dashboard and SLO</h2>
  <pre class="code-block">groups:
  - name: api_slo.rules
    rules:
      - record: job:http_requests:rate5m
        expr: sum by (job) (rate(http_requests_total[5m]))
      - record: job:http_request_errors:rate5m
        expr: sum by (job) (
          rate(http_requests_total{status=~"5.."}[5m]))
      - record: slo:api_error_burnrate
        expr: job:http_request_errors:rate5m
          / job:http_requests:rate5m / 0.001</pre>
  <h2>3. Alert for the budget burn</h2>
  <pre class="code-block">- alert: ApiErrorBudgetBurn
  expr: slo:api_error_burnrate > 14.4 and slo:api_error_burnrate > 6
  for: 2m
  labels: { severity: page }
  annotations:
    summary: "API error budget burning fast"</pre>
  <p>Point Alertmanager at your team channel, grouping by <span class="ic">alertname</span>.</p>
  <h2>4. The Grafana screen</h2>
  <ul>
    <li>Traffic panel: <span class="ic">job:http_requests:rate5m</span>.</li>
    <li>Health panel: <span class="ic">job:http_request_errors:rate5m / job:http_requests:rate5m</span> with a threshold at 0.5%.</li>
    <li>Latency panel: <span class="ic">histogram_quantile(0.95, sum by (le) (rate(http_request_duration_seconds_bucket[5m])))</span>.</li>
    <li>Hosts row: CPU, memory, disk per instance with an instance template variable.</li>
  </ul>
  <h2>5. Prove it works</h2>
  <pre class="code-block"># all targets healthy?
sum(up) == sum(count(up) by (job, instance))
# availability fraction for the last 30 days
1 - (sum(increase(http_requests_total{status=~"5.."}[30d]))
     / sum(increase(http_requests_total[30d])))</pre>
  <div class="callout callout-tip">
    <strong>DONE WHEN...</strong>
    <p>The dashboard parks at green under demand, the burn-rate alert fires only during real regressions, and a brand-new teammate can page out from it without reading the codebase. That is observability earning its salary.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES  (29 questions)
--    Q1 (303) · Q2 (306) · Q3 (309) · Q4 (312) · Q5 (315)
--    Q6 (318) · Q7 (321) · Q8 (324) · Q9 final (328, 5 questions)
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('03E00000-0000-4000-8000-000000000501', '03E00000-0000-4000-8000-000000000303',
   'Which metric type only ever increases?',
   'Counters start at zero and only increase, which is why they are ideal for totals.', 1),
  ('03E00000-0000-4000-8000-000000000502', '03E00000-0000-4000-8000-000000000303',
   'Which of the three pillars is best for following a single request across services?',
   'Traces link the events of one request as it moves across services.', 2),
  ('03E00000-0000-4000-8000-000000000503', '03E00000-0000-4000-8000-000000000303',
   'Which golden signal describes how full a resource is?',
   'Saturation measures how close a resource is to its limit.', 3),
  ('03E00000-0000-4000-8000-000000000504', '03E00000-0000-4000-8000-000000000306',
   'What identifies a single time series in Prometheus?',
   'A series is uniquely identified by its metric name plus label set.', 1),
  ('03E00000-0000-4000-8000-000000000505', '03E00000-0000-4000-8000-000000000306',
   'A label that can take 20 values multiplies one series into how many?',
   'Cardinality is multiplicative: one label with 20 values yields 20 series.', 2),
  ('03E00000-0000-4000-8000-000000000506', '03E00000-0000-4000-8000-000000000306',
   'Which metric type best fits a live value like current memory use?',
   'Gauges go up and down with the value they represent.', 3),
  ('03E00000-0000-4000-8000-000000000507', '03E00000-0000-4000-8000-000000000309',
   'How does Prometheus collect metrics from targets?',
   'It pulls samples from an HTTP metrics endpoint on a schedule.', 1),
  ('03E00000-0000-4000-8000-000000000508', '03E00000-0000-4000-8000-000000000309',
   'Which metric tells you a target scrape succeeded?',
   'up equals 1 when the last scrape succeeded and 0 when it failed.', 2),
  ('03E00000-0000-4000-8000-000000000509', '03E00000-0000-4000-8000-000000000309',
   'Which label is added automatically to every target?',
   'Prometheus adds the job and instance labels to every scraped series.', 3),
  ('03E00000-0000-4000-8000-000000000510', '03E00000-0000-4000-8000-000000000312',
   'Which exporter should you use to collect CPU and memory from a Linux host?',
   'node_exporter exposes host-level kernel and hardware metrics.', 1),
  ('03E00000-0000-4000-8000-000000000511', '03E00000-0000-4000-8000-000000000312',
   'Which exporter probes an HTTPS endpoint from the outside?',
   'blackbox_exporter performs active HTTP, TCP, ICMP, and DNS probes.', 2),
  ('03E00000-0000-4000-8000-000000000512', '03E00000-0000-4000-8000-000000000312',
   'How do you add custom metrics like request latency to your own app?',
   'A client library registers counters and histograms behind a /metrics endpoint.', 3),
  ('03E00000-0000-4000-8000-000000000513', '03E00000-0000-4000-8000-000000000315',
   'What does rate(http_requests_total[5m]) return?',
   'It returns the average per-second increase of the counter over 5 minutes.', 1),
  ('03E00000-0000-4000-8000-000000000514', '03E00000-0000-4000-8000-000000000315',
   'Which operator matches a label value against a regular expression?',
   'The =~ operator matches label values with a regex.', 2),
  ('03E00000-0000-4000-8000-000000000515', '03E00000-0000-4000-8000-000000000315',
   'Which function estimates a percentile from histogram buckets?',
   'histogram_quantile() reads the cumulative bucket counts.', 3),
  ('03E00000-0000-4000-8000-000000000516', '03E00000-0000-4000-8000-000000000318',
   'Why are recording rules valuable?',
   'They precompute expensive queries into fresh series, speeding dashboards up.', 1),
  ('03E00000-0000-4000-8000-000000000517', '03E00000-0000-4000-8000-000000000318',
   'What does the for clause on an alerting rule do?',
   'It requires the condition to persist for that duration before firing.', 2),
  ('03E00000-0000-4000-8000-000000000518', '03E00000-0000-4000-8000-000000000318',
   'What is Alertmanager responsible for?',
   'It groups, deduplicates, and routes alerts to receivers.', 3),
  ('03E00000-0000-4000-8000-000000000519', '03E00000-0000-4000-8000-000000000321',
   'What must be configured first before Grafana can show Prometheus data?',
   'A Prometheus data source must be added in Grafana.', 1),
  ('03E00000-0000-4000-8000-000000000520', '03E00000-0000-4000-8000-000000000321',
   'Which Grafana feature turns one dashboard into a per-host browser?',
   'Template variables let panels react to a user-selected value.', 2),
  ('03E00000-0000-4000-8000-000000000521', '03E00000-0000-4000-8000-000000000321',
   'What do thresholds add to a stat panel?',
   'They color or highlight the value when it crosses a defined boundary.', 3),
  ('03E00000-0000-4000-8000-000000000522', '03E00000-0000-4000-8000-000000000324',
   'What does SLI stand for?',
   'A service level indicator is a measurable fraction of good events.', 1),
  ('03E00000-0000-4000-8000-000000000523', '03E00000-0000-4000-8000-000000000324',
   'An SLO of 99.9% over 30 days allows how much error budget?',
   '0.1% of 30 days is about 43 minutes of acceptable downtime.', 2),
  ('03E00000-0000-4000-8000-000000000524', '03E00000-0000-4000-8000-000000000324',
   'What is a burn rate of 14.4 telling you?',
   'At that rate the error budget for a 99.9% SLO is exhausted in about two days.', 3),
  ('03E00000-0000-4000-8000-000000000525', '03E00000-0000-4000-8000-000000000328',
   'Which type of metric should feed rate()?',
   'Only counters are intended for rate() — it derives increases.', 1),
  ('03E00000-0000-4000-8000-000000000526', '03E00000-0000-4000-8000-000000000328',
   'What does the node_exporter expose?',
   'It exposes host-level CPU, memory, disk, and network metrics.', 2),
  ('03E00000-0000-4000-8000-000000000527', '03E00000-0000-4000-8000-000000000328',
   'Which recording-rule name follows the recommended convention?',
   'Use the level:metric:operation pattern like job:http_requests:rate5m.', 3),
  ('03E00000-0000-4000-8000-000000000528', '03E00000-0000-4000-8000-000000000328',
   'What does a multi-window burn-rate alert combine?',
   'It checks a short window and a long window to fire promptly without noise.', 4),
  ('03E00000-0000-4000-8000-000000000529', '03E00000-0000-4000-8000-000000000328',
   'Which component groups and deduplicates notifications before sending them?',
   'Alertmanager collapses related alerts into one notification.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; exactly one is_correct = TRUE.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): counter
  ('03E00000-0000-4000-8000-000000001001', '03E00000-0000-4000-8000-000000000501', 'Counter', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001002', '03E00000-0000-4000-8000-000000000501', 'Gauge', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001003', '03E00000-0000-4000-8000-000000000501', 'Histogram', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001004', '03E00000-0000-4000-8000-000000000501', 'Summary', FALSE, 4),
  -- Q1 (501)q2: traces
  ('03E00000-0000-4000-8000-000000001005', '03E00000-0000-4000-8000-000000000502', 'Traces', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001006', '03E00000-0000-4000-8000-000000000502', 'Metrics', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001007', '03E00000-0000-4000-8000-000000000502', 'Logs', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001008', '03E00000-0000-4000-8000-000000000502', 'Dashboards', FALSE, 4),
  -- Q1 (501)q3: saturation
  ('03E00000-0000-4000-8000-000000001009', '03E00000-0000-4000-8000-000000000503', 'Saturation', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001010', '03E00000-0000-4000-8000-000000000503', 'Latency', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001011', '03E00000-0000-4000-8000-000000000503', 'Traffic', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001012', '03E00000-0000-4000-8000-000000000503', 'Errors', FALSE, 4),
  -- Q2 (504): series identity
  ('03E00000-0000-4000-8000-000000001013', '03E00000-0000-4000-8000-000000000504', 'Metric name plus label set', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001014', '03E00000-0000-4000-8000-000000000504', 'Metric name only', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001015', '03E00000-0000-4000-8000-000000000504', 'The target IP address', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001016', '03E00000-0000-4000-8000-000000000504', 'The alert name', FALSE, 4),
  -- Q2 (504)q2: cardinality 20
  ('03E00000-0000-4000-8000-000000001017', '03E00000-0000-4000-8000-000000000505', '20', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001018', '03E00000-0000-4000-8000-000000000505', '2', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001019', '03E00000-0000-4000-8000-000000000505', '200', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001020', '03E00000-0000-4000-8000-000000000505', '0', FALSE, 4),
  -- Q2 (504)q3: gauge
  ('03E00000-0000-4000-8000-000000001021', '03E00000-0000-4000-8000-000000000506', 'Gauge', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001022', '03E00000-0000-4000-8000-000000000506', 'Counter', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001023', '03E00000-0000-4000-8000-000000000506', 'Summary', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001024', '03E00000-0000-4000-8000-000000000506', 'Histogram', FALSE, 4),
  -- Q3 (507): pull model
  ('03E00000-0000-4000-8000-000000001025', '03E00000-0000-4000-8000-000000000507', 'It pulls samples over HTTP on a schedule', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001026', '03E00000-0000-4000-8000-000000000507', 'It waits for targets to push data', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001027', '03E00000-0000-4000-8000-000000000507', 'It reads from a database', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001028', '03E00000-0000-4000-8000-000000000507', 'It polls a message queue', FALSE, 4),
  -- Q3 (507)q2: up metric
  ('03E00000-0000-4000-8000-000000001029', '03E00000-0000-4000-8000-000000000508', 'up', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001030', '03E00000-0000-4000-8000-000000000508', 'job', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001031', '03E00000-0000-4000-8000-000000000508', 'node_load1', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001032', '03E00000-0000-4000-8000-000000000508', 'instances', FALSE, 4),
  -- Q3 (507)q3: auto labels
  ('03E00000-0000-4000-8000-000000001033', '03E00000-0000-4000-8000-000000000509', 'job and instance', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001034', '03E00000-0000-4000-8000-000000000509', 'host and port', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001035', '03E00000-0000-4000-8000-000000000509', 'env and region', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001036', '03E00000-0000-4000-8000-000000000509', 'team and repo', FALSE, 4),
  -- Q4 (510): node exporter
  ('03E00000-0000-4000-8000-000000001037', '03E00000-0000-4000-8000-000000000510', 'node_exporter', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001038', '03E00000-0000-4000-8000-000000000510', 'blackbox_exporter', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001039', '03E00000-0000-4000-8000-000000000510', 'mysqld_exporter', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001040', '03E00000-0000-4000-8000-000000000510', 'windows_exporter', FALSE, 4),
  -- Q4 (510)q2: blackbox
  ('03E00000-0000-4000-8000-000000001041', '03E00000-0000-4000-8000-000000000511', 'blackbox_exporter', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001042', '03E00000-0000-4000-8000-000000000511', 'node_exporter', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001043', '03E00000-0000-4000-8000-000000000511', 'pushgateway', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001044', '03E00000-0000-4000-8000-000000000511', 'cadvisor', FALSE, 4),
  -- Q4 (510)q3: custom metrics
  ('03E00000-0000-4000-8000-000000001045', '03E00000-0000-4000-8000-000000000512', 'A client library exposing a /metrics endpoint', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001046', '03E00000-0000-4000-8000-000000000512', 'Writing to a log file', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001047', '03E00000-0000-4000-8000-000000000512', 'Sending an email per request', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001048', '03E00000-0000-4000-8000-000000000512', 'Editing the TSDB directly', FALSE, 4),
  -- Q5 (513): rate
  ('03E00000-0000-4000-8000-000000001049', '03E00000-0000-4000-8000-000000000513', 'The average per-second increase over 5 minutes', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001050', '03E00000-0000-4000-8000-000000000513', 'The total count so far', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001051', '03E00000-0000-4000-8000-000000000513', 'The 95th percentile latency', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001052', '03E00000-0000-4000-8000-000000000513', 'The current instant value', FALSE, 4),
  -- Q5 (513)q2: regex match
  ('03E00000-0000-4000-8000-000000001053', '03E00000-0000-4000-8000-000000000514', '=~', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001054', '03E00000-0000-4000-8000-000000000514', '=', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001055', '03E00000-0000-4000-8000-000000000514', '!=', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001056', '03E00000-0000-4000-8000-000000000514', '>=', FALSE, 4),
  -- Q5 (513)q3: histogram_quantile
  ('03E00000-0000-4000-8000-000000001057', '03E00000-0000-4000-8000-000000000515', 'histogram_quantile()', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001058', '03E00000-0000-4000-8000-000000000515', 'rate()', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001059', '03E00000-0000-4000-8000-000000000515', 'sum()', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001060', '03E00000-0000-4000-8000-000000000515', 'increase()', FALSE, 4),
  -- Q6 (516): recording rules
  ('03E00000-0000-4000-8000-000000001061', '03E00000-0000-4000-8000-000000000516', 'They precompute expensive queries into fresh series', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001062', '03E00000-0000-4000-8000-000000000516', 'They delete old samples', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001063', '03E00000-0000-4000-8000-000000000516', 'They scrape new targets', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001064', '03E00000-0000-4000-8000-000000000516', 'They send alert emails', FALSE, 4),
  -- Q6 (516)q2: for clause
  ('03E00000-0000-4000-8000-000000001065', '03E00000-0000-4000-8000-000000000517', 'Requires the condition to persist before firing', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001066', '03E00000-0000-4000-8000-000000000517', 'Sets the scrape interval', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001067', '03E00000-0000-4000-8000-000000000517', 'Names the alert', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001068', '03E00000-0000-4000-8000-000000000517', 'Defines the receiver', FALSE, 4),
  -- Q6 (516)q3: alertmanager
  ('03E00000-0000-4000-8000-000000001069', '03E00000-0000-4000-8000-000000000518', 'It groups, deduplicates, and routes alerts', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001070', '03E00000-0000-4000-8000-000000000518', 'It stores the time series', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001071', '03E00000-0000-4000-8000-000000000518', 'It scrapes the targets', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001072', '03E00000-0000-4000-8000-000000000518', 'It renders dashboards', FALSE, 4),
  -- Q7 (519): data source
  ('03E00000-0000-4000-8000-000000001073', '03E00000-0000-4000-8000-000000000519', 'A Prometheus data source', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001074', '03E00000-0000-4000-8000-000000000519', 'An SMTP server', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001075', '03E00000-0000-4000-8000-000000000519', 'A database backup', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001076', '03E00000-0000-4000-8000-000000000519', 'A webhook token', FALSE, 4),
  -- Q7 (519)q2: template variables
  ('03E00000-0000-4000-8000-000000001077', '03E00000-0000-4000-8000-000000000520', 'Template variables', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001078', '03E00000-0000-4000-8000-000000000520', 'Annotations', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001079', '03E00000-0000-4000-8000-000000000520', 'Row repeats', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001080', '03E00000-0000-4000-8000-000000000520', 'Playlists', FALSE, 4),
  -- Q7 (519)q3: thresholds
  ('03E00000-0000-4000-8000-000000001081', '03E00000-0000-4000-8000-000000000521', 'They recolor the value when it crosses a boundary', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001082', '03E00000-0000-4000-8000-000000000521', 'They delete old points', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001083', '03E00000-0000-4000-8000-000000000521', 'They pause the queries', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001084', '03E00000-0000-4000-8000-000000000521', 'They add new series', FALSE, 4),
  -- Q8 (522): SLI
  ('03E00000-0000-4000-8000-000000001085', '03E00000-0000-4000-8000-000000000522', 'Service Level Indicator', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001086', '03E00000-0000-4000-8000-000000000522', 'System Load Indicator', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001087', '03E00000-0000-4000-8000-000000000522', 'Service Log Integration', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001088', '03E00000-0000-4000-8000-000000000522', 'Server Level Index', FALSE, 4),
  -- Q8 (522)q2: budget minutes
  ('03E00000-0000-4000-8000-000000001089', '03E00000-0000-4000-8000-000000000523', 'About 43 minutes', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001090', '03E00000-0000-4000-8000-000000000523', 'About 7 hours', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001091', '03E00000-0000-4000-8000-000000000523', 'About 14 hours', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001092', '03E00000-0000-4000-8000-000000000523', 'About 3 days', FALSE, 4),
  -- Q8 (522)q3: burn rate meaning
  ('03E00000-0000-4000-8000-000000001093', '03E00000-0000-4000-8000-000000000524', 'Budget exhausted in about two days', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001094', '03E00000-0000-4000-8000-000000000524', 'Budget exhausted in about a month', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001095', '03E00000-0000-4000-8000-000000000524', 'Budget is completely safe', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001096', '03E00000-0000-4000-8000-000000000524', 'Budget has been refilled', FALSE, 4),
  -- Q9 (525): rate on counter
  ('03E00000-0000-4000-8000-000000001097', '03E00000-0000-4000-8000-000000000525', 'Counter', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001098', '03E00000-0000-4000-8000-000000000525', 'Gauge', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001099', '03E00000-0000-4000-8000-000000000525', 'Summary', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001100', '03E00000-0000-4000-8000-000000000525', 'Label', FALSE, 4),
  -- Q9 (525)q2: node exporter
  ('03E00000-0000-4000-8000-000000001101', '03E00000-0000-4000-8000-000000000526', 'Host-level CPU, memory, disk, and network metrics', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001102', '03E00000-0000-4000-8000-000000000526', 'HTTP request latency per endpoint', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001103', '03E00000-0000-4000-8000-000000000526', 'Database query plans', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001104', '03E00000-0000-4000-8000-000000000526', 'Payment gateway logs', FALSE, 4),
  -- Q9 (525)q3: recording rule convention
  ('03E00000-0000-4000-8000-000000001105', '03E00000-0000-4000-8000-000000000527', 'job:http_requests:rate5m', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001106', '03E00000-0000-4000-8000-000000000527', 'rate5m_http_requests', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001107', '03E00000-0000-4000-8000-000000000527', 'requests_http_five_min', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001108', '03E00000-0000-4000-8000-000000000527', 'http_rate', FALSE, 4),
  -- Q9 (525)q4: multi-window
  ('03E00000-0000-4000-8000-000000001109', '03E00000-0000-4000-8000-000000000528', 'A short window and a long window', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001110', '03E00000-0000-4000-8000-000000000528', 'Two identical windows', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001111', '03E00000-0000-4000-8000-000000000528', 'A single infinite window', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001112', '03E00000-0000-4000-8000-000000000528', 'No windows at all', FALSE, 4),
  -- Q9 (525)q5: alertmanager
  ('03E00000-0000-4000-8000-000000001113', '03E00000-0000-4000-8000-000000000529', 'Alertmanager', TRUE,  1),
  ('03E00000-0000-4000-8000-000000001114', '03E00000-0000-4000-8000-000000000529', 'Grafana', FALSE, 2),
  ('03E00000-0000-4000-8000-000000001115', '03E00000-0000-4000-8000-000000000529', 'node_exporter', FALSE, 3),
  ('03E00000-0000-4000-8000-000000001116', '03E00000-0000-4000-8000-000000000529', 'The TSDB', FALSE, 4)
ON CONFLICT (id) DO NOTHING;