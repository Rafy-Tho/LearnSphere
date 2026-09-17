-- ============================================================================
-- SEED 047: Complete course — "Serverless Computing with AWS Lambda"
-- ----------------------------------------------------------------------------
-- Instructor : David Kim          (10000000-0000-4000-8000-000000000004)
-- Category   : Cloud Computing    (20000000-0000-4000-8000-000000000004)
-- Level      : ADVANCED · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Serverless Fundamentals    → C1 The Serverless Model · C2 Entering AWS Lambda
--   M2 Lambda Core                → C3 Writing & Securing Functions · C4 Event Sources & Patterns
--   M3 Serverless APIs            → C5 API Gateway Integration · C6 Environment & Secrets
--   M4 Reliability & Observability → C7 Error Handling & Async · C8 Monitoring & Tracing
--   M5 Deployment & Operations    → C9 Deployment & Versioning · C10 Cost, Performance & Capstone
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
  '02F00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000004',
  '20000000-0000-4000-8000-000000000004',
  'Serverless Computing with AWS Lambda',
  'serverless-computing-aws-lambda',
  'Ship production code without provisioning a single server. Master the serverless model, AWS Lambda functions, IAM security, event triggers, API Gateway, reliability patterns, observability, and cost control — then deploy a complete serverless application end to end.',
  'PUBLISHED',
  'ADVANCED',
  'SUBSCRIPTION',
  45
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02F00000-0000-4000-8000-000000000011', '02F00000-0000-4000-8000-000000000001', 'Explain the serverless model, its trade-offs, and where it fits an architecture.', 1),
  ('02F00000-0000-4000-8000-000000000012', '02F00000-0000-4000-8000-000000000001', 'Author, configure, and secure AWS Lambda functions with least-privilege IAM roles.', 2),
  ('02F00000-0000-4000-8000-000000000013', '02F00000-0000-4000-8000-000000000001', 'Trigger functions from events and compose decoupled event-driven workflows.', 3),
  ('02F00000-0000-4000-8000-000000000014', '02F00000-0000-4000-8000-000000000001', 'Expose functions through API Gateway and manage environment, secrets, and configuration.', 4),
  ('02F00000-0000-4000-8000-000000000015', '02F00000-0000-4000-8000-000000000001', 'Operate serverless systems: retries, monitoring, tracing, versioning, and cost control.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02F00000-0000-4000-8000-000000000101', '02F00000-0000-4000-8000-000000000001', 1, 'Serverless Fundamentals', 'Understand the model, its trade-offs, and the platform that runs functions.', 'PUBLISHED'),
  ('02F00000-0000-4000-8000-000000000102', '02F00000-0000-4000-8000-000000000001', 2, 'Lambda Core', 'Write handlers, choose runtimes, and secure functions with IAM.', 'PUBLISHED'),
  ('02F00000-0000-4000-8000-000000000103', '02F00000-0000-4000-8000-000000000001', 3, 'Serverless APIs', 'Expose functions through API Gateway and manage their configuration.', 'PUBLISHED'),
  ('02F00000-0000-4000-8000-000000000104', '02F00000-0000-4000-8000-000000000001', 4, 'Reliability & Observability', 'Make functions resilient, observable, and traceable.', 'PUBLISHED'),
  ('02F00000-0000-4000-8000-000000000105', '02F00000-0000-4000-8000-000000000001', 5, 'Deployment & Operations', 'Ship versions, automate infrastructure, and tune cost and latency.', 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02F00000-0000-4000-8000-000000000201', '02F00000-0000-4000-8000-000000000101', 1, 'The Serverless Model', 'What serverless means, its trade-offs, and where it shines.', 'PUBLISHED'),
  ('02F00000-0000-4000-8000-000000000202', '02F00000-0000-4000-8000-000000000101', 2, 'Entering AWS Lambda', 'Functions, runtimes, and the execution environment they live in.', 'PUBLISHED'),
  ('02F00000-0000-4000-8000-000000000203', '02F00000-0000-4000-8000-000000000102', 1, 'Writing & Securing Functions', 'Author handlers and protect them with least-privilege IAM.', 'PUBLISHED'),
  ('02F00000-0000-4000-8000-000000000204', '02F00000-0000-4000-8000-000000000102', 2, 'Event Sources & Patterns', 'Trigger functions from every major AWS event source.', 'PUBLISHED'),
  ('02F00000-0000-4000-8000-000000000205', '02F00000-0000-4000-8000-000000000103', 1, 'API Gateway Integration', 'Expose functions as secure, scalable HTTP endpoints.', 'PUBLISHED'),
  ('02F00000-0000-4000-8000-000000000206', '02F00000-0000-4000-8000-000000000103', 2, 'Environment & Secrets', 'Configure functions and keep secrets out of code.', 'PUBLISHED'),
  ('02F00000-0000-4000-8000-000000000207', '02F00000-0000-4000-8000-000000000104', 1, 'Error Handling & Async', 'Retries, dead-letter queues, streams, and async invocation.', 'PUBLISHED'),
  ('02F00000-0000-4000-8000-000000000208', '02F00000-0000-4000-8000-000000000104', 2, 'Monitoring & Tracing', 'Metrics, logs, alarms, and end-to-end tracing with X-Ray.', 'PUBLISHED'),
  ('02F00000-0000-4000-8000-000000000209', '02F00000-0000-4000-8000-000000000105', 1, 'Deployment & Versioning', 'Versions, aliases, and safe release strategies.', 'PUBLISHED'),
  ('02F00000-0000-4000-8000-000000000210', '02F00000-0000-4000-8000-000000000105', 2, 'Cost, Performance & Capstone', 'Cold starts, cost control, and shipping a complete app.', 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02F00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02F00000-0000-4000-8000-000000000301', '02F00000-0000-4000-8000-000000000201', 1, 'The Serverless Model',                 'What serverless means and how the platform runs your code.',           'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02F00000-0000-4000-8000-000000000302', '02F00000-0000-4000-8000-000000000201', 2, 'Serverless Trade-Offs & Use Cases',    'Where the model excels, where it strains, and classic workloads.',     'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02F00000-0000-4000-8000-000000000303', '02F00000-0000-4000-8000-000000000201', 3, 'Serverless Fundamentals Quiz',         'Check your grasp of the serverless model and FaaS.',                   'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02F00000-0000-4000-8000-000000000304', '02F00000-0000-4000-8000-000000000202', 1, 'AWS Lambda Overview',                  'The function, handler, runtime, role, and invocation lifecycle.',      'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02F00000-0000-4000-8000-000000000305', '02F00000-0000-4000-8000-000000000202', 2, 'Runtimes & the Execution Environment', 'Choose a runtime and understand the sandbox your code runs in.',       'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02F00000-0000-4000-8000-000000000306', '02F00000-0000-4000-8000-000000000202', 3, 'Lambda Basics Quiz',                   'Test the fundamentals of functions and runtimes.',                     'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02F00000-0000-4000-8000-000000000307', '02F00000-0000-4000-8000-000000000203', 1, 'Writing Lambda Functions',             'Author handlers, log cleanly, and configure memory and timeout.',      'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02F00000-0000-4000-8000-000000000308', '02F00000-0000-4000-8000-000000000203', 2, 'IAM Roles & Lambda Permissions',       'Secure your function with least-privilege execution roles.',           'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02F00000-0000-4000-8000-000000000309', '02F00000-0000-4000-8000-000000000203', 3, 'Functions & IAM Quiz',                 'Verify your handler and permission knowledge.',                        'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02F00000-0000-4000-8000-000000000310', '02F00000-0000-4000-8000-000000000204', 1, 'Event Sources & Triggers',             'Drive functions from S3, EventBridge, SNS, SQS, and streams.',         'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02F00000-0000-4000-8000-000000000311', '02F00000-0000-4000-8000-000000000204', 2, 'Event-Driven Architecture Patterns',   'Decouple workloads with queues, topics, and choreography.',            'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('02F00000-0000-4000-8000-000000000312', '02F00000-0000-4000-8000-000000000204', 3, 'Triggers & Events Quiz',               'Check your event-source and invocation-model skills.',                 'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02F00000-0000-4000-8000-000000000313', '02F00000-0000-4000-8000-000000000205', 1, 'API Gateway Fundamentals',             'Expose functions as HTTP endpoints with managed APIs.',                'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02F00000-0000-4000-8000-000000000314', '02F00000-0000-4000-8000-000000000205', 2, 'REST & HTTP APIs with Lambda',         'Compare API types, add auth, and shape proxy responses.',              'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('02F00000-0000-4000-8000-000000000315', '02F00000-0000-4000-8000-000000000205', 3, 'API Gateway Quiz',                     'Verify your API integration knowledge.',                               'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02F00000-0000-4000-8000-000000000316', '02F00000-0000-4000-8000-000000000206', 1, 'Environment Variables',                'Configure functions at runtime without touching code.',                'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02F00000-0000-4000-8000-000000000317', '02F00000-0000-4000-8000-000000000206', 2, 'Secrets & Configuration Management',   'Keep secrets out of code with Parameter Store and Secrets Manager.',   'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02F00000-0000-4000-8000-000000000318', '02F00000-0000-4000-8000-000000000206', 3, 'Environment & Secrets Quiz',           'Test your configuration management choices.',                          'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02F00000-0000-4000-8000-000000000319', '02F00000-0000-4000-8000-000000000207', 1, 'Error Handling & Retries',             'Know how each invocation model fails and how to mop up.',              'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02F00000-0000-4000-8000-000000000320', '02F00000-0000-4000-8000-000000000207', 2, 'Streams & Async Invocation',           'Process queues, streams, and asynchronous workloads reliably.',        'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('02F00000-0000-4000-8000-000000000321', '02F00000-0000-4000-8000-000000000207', 3, 'Reliability Quiz',                     'Check your retry, DLQ, and destination knowledge.',                    'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02F00000-0000-4000-8000-000000000322', '02F00000-0000-4000-8000-000000000208', 1, 'CloudWatch Monitoring',                'Watch invocations, errors, duration, and throttles.',                  'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('02F00000-0000-4000-8000-000000000323', '02F00000-0000-4000-8000-000000000208', 2, 'Tracing & Observability',              'Trace requests end to end with X-Ray and structured logs.',            'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02F00000-0000-4000-8000-000000000324', '02F00000-0000-4000-8000-000000000208', 3, 'Monitoring & Tracing Quiz',            'Test your observability setup.',                                       'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('02F00000-0000-4000-8000-000000000325', '02F00000-0000-4000-8000-000000000209', 1, 'Deployment & Versioning',              'Publish versions, route traffic with aliases, and roll back safely.',  'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02F00000-0000-4000-8000-000000000326', '02F00000-0000-4000-8000-000000000210', 1, 'Infrastructure as Code & CI/CD',       'Define functions in SAM templates and ship through pipelines.',        'TEXT', 'PUBLISHED', 'FREE', 10, 12),
  ('02F00000-0000-4000-8000-000000000327', '02F00000-0000-4000-8000-000000000210', 2, 'Cost Optimization & Cold Starts',      'Control spend and keep first requests fast.',                          'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('02F00000-0000-4000-8000-000000000328', '02F00000-0000-4000-8000-000000000210', 3, 'Final Assessment',                     'Prove what you learned across the whole course.',                      'QUIZ', 'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02F00000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02F00000-0000-4000-8000-000000000401',
  '02F00000-0000-4000-8000-000000000301',
  1,
  'The Serverless Model',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Serverless Model</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Serverless Model</h1>
  <p>Serverless computing lets you run code <strong>without provisioning or managing servers</strong>. You deploy a function, the cloud provider runs it on demand, scales it automatically, and bills you only for the compute time it actually consumes.</p>
  <ul>
    <li><strong>No infrastructure to manage</strong> — nobody patches operating systems or racks servers.</li>
    <li><strong>Instant, automatic scaling</strong> — from zero requests to thousands per second without capacity planning.</li>
    <li><strong>Pay-per-use</strong> — no charge for idle capacity because there is none.</li>
    <li><strong>Event-driven</strong> — code runs in response to events: an upload, a message, an HTTP call, a schedule.</li>
  </ul>
  <h2>FaaS and BaaS</h2>
  <p>&ldquo;Serverless&rdquo; is an umbrella term covering two ideas:</p>
  <table>
    <tr><th>Category</th><th>Examples</th><th>Your job</th></tr>
    <tr><td>Function as a Service (FaaS)</td><td>AWS Lambda</td><td>Write and deploy the function; the platform runs it.</td></tr>
    <tr><td>Backend as a Service (BaaS)</td><td>S3, DynamoDB, Cognito</td><td>Call the managed service; the provider operates it.</td></tr>
  </table>
  <h2>How a serverless platform runs your code</h2>
  <p>When an event arrives, the platform:</p>
  <ol>
    <li>Schedules an <strong>execution environment</strong> for your function.</li>
    <li>Passes the event as input to your <span class="ic">handler</span>.</li>
    <li>Collects the return value (or the thrown error) and routes it back.</li>
    <li>Reuses the warm environment while traffic continues, then recycles it when idle.</li>
  </ol>
  <pre class="code-block"># A minimal Lambda function (Python)
import json

def handler(event, context):
    name = event.get('name', 'stranger')
    return {
        'statusCode': 200,
        'body': json.dumps({'message': f'Hello, {name}!'}),
    }</pre>
  <h2>What you give up</h2>
  <ul>
    <li>Long-running processes — a function has a hard execution limit.</li>
    <li>Persistent local state — storage is ephemeral between environments.</li>
    <li>Direct control over the underlying hardware and network.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Think in events</strong>
    <p>Design each function around one responsibility triggered by one kind of event. Small functions are easier to scale, test, and reuse — this mindset runs through the whole course.</p>
  </div>
  <div class="callout callout-info">
    <strong>FaaS vs containers</strong>
    <p>A container gives you a full runtime you manage. A FaaS function hides the runtime — you ship code and let the platform own operations. Both are valuable; the next lesson covers when to pick which.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000402',
  '02F00000-0000-4000-8000-000000000302',
  1,
  'Serverless Trade-Offs & Use Cases',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Serverless Trade-Offs & Use Cases</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Serverless Trade-Offs &amp; Use Cases</h1>
  <p>Serverless is not the correct tool for every problem. It trades raw control for operational speed, so choosing it wisely means knowing both sides of the bargain.</p>
  <h2>Where serverless shines</h2>
  <ul>
    <li><strong>Spiky or unpredictable traffic</strong> — scaling is automatic, including down to zero.</li>
    <li><strong>Event-driven glue</strong> — reacting to uploads, messages, and data changes.</li>
    <li><strong>Short-lived work</strong> — anything that finishes in seconds or minutes.</li>
    <li><strong>Rapid iteration</strong> — no instances to wait for; deploy functions in seconds.</li>
  </ul>
  <h2>Where the model struggles</h2>
  <table>
    <tr><th>Workload</th><th>Why</th></tr>
    <tr><td>Long-running jobs</td><td>Hard 15-minute invocation ceiling.</td></tr>
    <tr><td>Constant high utilization</td><td>Always-on compute is cheaper per hour.</td></tr>
    <tr><td>Stateful sessions</td><td>Functions must stay stateless; state lives elsewhere.</td></tr>
  </table>
  <h2>Classic serverless patterns</h2>
  <ol>
    <li><strong>Image processing</strong> — an S3 object-created event fires a thumbnailer.</li>
    <li><strong>Webhooks</strong> — Stripe or GitHub calls an endpoint; a function validates and routes.</li>
    <li><strong>Stream enrichment</strong> — Kinesis records are parsed, enriched, and stamped.</li>
    <li><strong>Scheduled jobs</strong> — EventBridge cron invokes a nightly report builder.</li>
  </ol>
  <h2>Example: a thumbnail generator</h2>
  <pre class="code-block">import boto3
from PIL import Image

s3 = boto3.client('s3')

def handler(event, context):
    record = event['Records'][0]
    bucket = record['s3']['bucket']['name']
    key = record['s3']['object']['key']
    data = s3.get_object(Bucket=bucket, Key=key)['Body'].read()
    img = Image.open(BytesIO(data))
    img.thumbnail((256, 256))
    thumb = key.rsplit('/')[-1]
    s3.put_object(Bucket=bucket, Key='thumbnails/' + thumb, Body=img.tobytes())
    return {'statusCode': 200, 'body': 'Thumb created'}</pre>
  <div class="callout callout-tip">
    <strong>The cost model fits these jobs</strong>
    <p>Image processing is bursty — you pay for the few seconds each upload uses, not for an idle server humming all night.</p>
  </div>
  <div class="callout callout-info">
    <strong>Is serverless right here?</strong>
    <p>Ask two questions: can the work finish in minutes, and does the traffic vary over time? If both are yes, Lambda is usually a strong fit.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000403',
  '02F00000-0000-4000-8000-000000000304',
  1,
  'AWS Lambda Overview',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AWS Lambda Overview</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>AWS Lambda Overview</h1>
  <p>Amazon Lambda runs your code in a managed runtime on demand. You bring a function, an event arrives, Lambda builds or reuses an execution environment, runs your handler, and returns the result.</p>
  <h2>What makes up a Lambda function</h2>
  <table>
    <tr><th>Piece</th><th>Role</th></tr>
    <tr><td>Function code</td><td>The handler plus helper modules and dependencies.</td></tr>
    <tr><td>Handler</td><td>The entry point Lambda calls for each invocation.</td></tr>
    <tr><td>Runtime</td><td>Language environment: Node.js, Python, Java, Go, and more.</td></tr>
    <tr><td>Execution role</td><td>The IAM identity the function uses to touch other AWS services.</td></tr>
    <tr><td>Configuration</td><td>Memory, timeout, layers, env vars, triggers, and concurrency.</td></tr>
  </table>
  <h2>The invocation lifecycle</h2>
  <ol>
    <li>An event arrives from a trigger or the Invoke API.</li>
    <li>Lambda picks a warm environment or initializes a new one (cold start).</li>
    <li>Your handler runs with the event as its first argument.</li>
    <li>The return value is delivered back, or logged if there is no caller.</li>
  </ol>
  <h2>A Node.js handler</h2>
  <pre class="code-block">exports.handler = async (event) =&gt; {
  const name = event.name ?? 'world';
  return {
    statusCode: 200,
    body: JSON.stringify({ message: `Hello, ${name}!` }),
  };
};</pre>
  <h2>Invocation flavors</h2>
  <ul>
    <li><strong>Synchronous (RequestResponse)</strong> — the caller waits for the result. API Gateway and SDK calls use this.</li>
    <li><strong>Asynchronous (Event)</strong> — Lambda queues the event and returns 202 immediately; S3 and SNS use this.</li>
    <li><strong>Polling</strong> — Lambda pulls records from SQS or streams and delivers them as batches.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Concurrency is the real scaler</strong>
    <p>Lambda scales by launching more concurrent execution environments — up to the account limit — each handling events independently.</p>
  </div>
  <div class="callout callout-info">
    <strong>Stateless by design</strong>
    <p>Execution environments are reused, but do not rely on that. Keep durable state in S3, DynamoDB, or a database.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000404',
  '02F00000-0000-4000-8000-000000000305',
  1,
  'Runtimes & the Execution Environment',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Runtimes & the Execution Environment</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Runtimes &amp; the Execution Environment</h1>
  <p>Your runtime decides which language tools are available; the execution environment decides how much cold-start and per-invocation overhead you feel.</p>
  <h2>Managed runtimes</h2>
  <table>
    <tr><th>Runtime</th><th>Typical fit</th></tr>
    <tr><td>Node.js</td><td>Fast startup, huge npm ecosystem, easy async code.</td></tr>
    <tr><td>Python</td><td>Scripting, data processing, ML inference glue.</td></tr>
    <tr><td>Java</td><td>Enterprise codebases; heavier but dependable.</td></tr>
    <tr><td>Go</td><td>Tiny binaries, low cold starts, high throughput.</td></tr>
    <tr><td>.NET / Ruby</td><td>Existing team skills and legacy application code.</td></tr>
  </table>
  <h2>Anatomy of an execution environment</h2>
  <ul>
    <li><strong>Sandbox</strong> — the isolated runtime environment Lambda creates.</li>
    <li><strong>Runtime</strong> — the language interpreter plus your code and layers.</li>
    <li><strong>Init phase</strong> — boots the runtime, loads dependencies, runs module-level code.</li>
    <li><strong>Invoke phase</strong> — your handler executes for each event.</li>
    <li><strong>Shutdown phase</strong> — Lambda tears down idle environments.</li>
  </ul>
  <h2>Cold starts and the init window</h2>
  <p>The init phase runs once per environment. Reusing expensive work across invocations is the biggest speed lever:</p>
  <pre class="code-block">import boto3

# Runs once at environment init, then reused
dynamodb = boto3.resource('dynamodb')
TABLE = dynamodb.Table('orders')

def handler(event, context):
    return TABLE.get_item(Key={'id': event['id']})['Item']</pre>
  <h2>Configuration that shapes the sandbox</h2>
  <table>
    <tr><th>Setting</th><th>Range</th><th>Notes</th></tr>
    <tr><td>Memory</td><td>128 MB – 10,240 MB</td><td>Extra memory adds proportional CPU.</td></tr>
    <tr><td>Timeout</td><td>1 s – 15 min</td><td>Set it tight, not at the ceiling.</td></tr>
    <tr><td>Ephemeral /tmp</td><td>512 MB – 10 GB</td><td>Local scratch; never durable state.</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Weight your init work</strong>
    <p>Anything outside the handler runs once per environment. Keep it lean and load heavy libraries lazily.</p>
  </div>
  <div class="callout callout-info">
    <strong>Layers multiply init too</strong>
    <p>Layers bundle shared code for many functions. They download at init, so oversized layers cost you a cold start — size them with intention.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000405',
  '02F00000-0000-4000-8000-000000000307',
  1,
  'Writing Lambda Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Writing Lambda Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Writing Lambda Functions</h1>
  <p>A Lambda function is a small, focused unit of work. The handler is the contract: read the event, do one job well, return a serializable result.</p>
  <h2>The handler contract</h2>
  <pre class="code-block">exports.handler = async (event, context) =&gt; {
  console.log('Received:', JSON.stringify(event));
  return { ok: true };
};</pre>
  <ul>
    <li><span class="ic">event</span> — the payload from whichever trigger fired.</li>
    <li><span class="ic">context</span> — request id, remaining time, function name, credentials metadata.</li>
    <li>Return value — sent to the caller synchronously, or discarded asynchronously.</li>
  </ul>
  <h2>Structure for testability</h2>
  <p>Keep the handler thin and move logic into exported functions you can test locally:</p>
  <pre class="code-block">export function priceWithTax(subtotal, rate = 0.2) {
  return Math.round(subtotal * (1 + rate) * 100) / 100;
}

exports.handler = async (event) =&gt; {
  return { total: priceWithTax(event.subtotal) };
};</pre>
  <h2>Logging that machines can read</h2>
  <pre class="code-block">console.log(JSON.stringify({
  level: 'info', requestId: context.awsRequestId, path: event.path
}));</pre>
  <h2>Right-size the configuration</h2>
  <table>
    <tr><th>Setting</th><th>Recommendation</th></tr>
    <tr><td>Memory</td><td>Start at 1,024 MB; the extra CPU often beats saving memory.</td></tr>
    <tr><td>Timeout</td><td>Two to three times your observed p99, with headroom.</td></tr>
    <tr><td>Reserved concurrency</td><td>Cap noisy tenants and protect downstream services.</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Idempotency counts</strong>
    <p>Queues deliver at-least-once and async triggers retry, so the same event can arrive twice. Make side effects safe to repeat.</p>
  </div>
  <div class="callout callout-info">
    <strong>Errors are data too</strong>
    <p>Throw on genuine failures instead of returning fake success. Lambda and its retry machinery work correctly only when you fail honestly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000406',
  '02F00000-0000-4000-8000-000000000308',
  1,
  'IAM Roles & Lambda Permissions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IAM Roles & Lambda Permissions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>IAM Roles &amp; Lambda Permissions</h1>
  <p>Lambda functions are never handed root credentials. Instead, you attach an <strong>execution role</strong> — the identity the function assumes when it calls AWS services.</p>
  <h2>The execution role</h2>
  <p>The role carries a trust policy allowing <span class="ic">lambda.amazonaws.com</span> to assume it, plus permission policies defining what the function may do:</p>
  <pre class="code-block">{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["logs:CreateLogStream", "logs:PutLogEvents"],
      "Resource": "arn:aws:logs:*:*:*"
    },
    {
      "Effect": "Allow",
      "Action": ["dynamodb:GetItem", "dynamodb:PutItem"],
      "Resource": "arn:aws:dynamodb:us-east-1:123456789012:table/orders"
    }
  ]
}</pre>
  <h2>Least privilege in practice</h2>
  <ul>
    <li>Scope actions to the services your handler actually calls.</li>
    <li>Scope resources to the exact tables, buckets, or queues — not all of them.</li>
    <li>Give every function its own role so one compromise stays contained.</li>
  </ul>
  <h2>Resource-based policies: who may invoke</h2>
  <p>A separate policy answers a different question: which source may trigger your function. S3, SNS, and EventBridge need this permission:</p>
  <pre class="code-block">aws lambda add-permission --function-name thumbnailer --statement-id s3-invoke --action lambda:InvokeFunction --principal s3.amazonaws.com --source-arn arn:aws:s3:::uploads --source-account 123456789012</pre>
  <div class="callout callout-tip">
    <strong>Widen narrowly, never with a blank check</strong>
    <p>When a function fails with AccessDenied, add only the missing action on the smallest resource. Do not reach for a full-access policy.</p>
  </div>
  <div class="callout callout-info">
    <strong>Encrypted variables</strong>
    <p>Environment variables are encrypted with KMS. With a customer-managed key the role also needs kms:Decrypt to open them at runtime.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000407',
  '02F00000-0000-4000-8000-000000000310',
  1,
  'Event Sources & Triggers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Event Sources & Triggers</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Event Sources &amp; Triggers</h1>
  <p>A bare Lambda function does nothing until something invokes it. Event sources are the something — services that hand your function data when things happen.</p>
  <h2>Push triggers</h2>
  <table>
    <tr><th>Source</th><th>What fires it</th></tr>
    <tr><td>Amazon S3</td><td>Object create, delete, or restore events.</td></tr>
    <tr><td>Amazon SNS</td><td>Publications to a topic.</td></tr>
    <tr><td>EventBridge</td><td>Event bus rules and scheduled cron expressions.</td></tr>
    <tr><td>API Gateway</td><td>Incoming HTTP requests.</td></tr>
  </table>
  <h2>Polling sources</h2>
  <table>
    <tr><th>Source</th><th>How it works</th></tr>
    <tr><td>Amazon SQS</td><td>Lambda pulls batches of messages from your queue.</td></tr>
    <tr><td>DynamoDB Streams</td><td>Row-level changes stream to your function.</td></tr>
    <tr><td>Kinesis Data Streams</td><td>Shards of ordered records consumed by your handler.</td></tr>
  </table>
  <h2>An S3 event, as Lambda sees it</h2>
  <pre class="code-block">{
  "Records": [
    {
      "eventName": "ObjectCreated:Put",
      "s3": {
        "bucket": { "name": "uploads" },
        "object": { "key": "profile-photo.jpg", "size": 245760 }
      }
    }
  ]
}</pre>
  <p>Every trigger has its own payload shape — SNS wraps the message, SQS wraps it in record metadata, Kinesis base64-encodes it. Learning each contract is the first skill.</p>
  <h2>Invocation modes affect your code</h2>
  <ul>
    <li><strong>Sync</strong> — the return value matters; errors go straight back to the caller.</li>
    <li><strong>Async</strong> — Lambda retries failed events; the return value is ignored.</li>
    <li><strong>Polled</strong> — your handler receives batches; failures can be partial.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Sample real events</strong>
    <p>The Console generates test events per source. Capture the real thing and freeze it in your test suite rather than guessing the shape.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000408',
  '02F00000-0000-4000-8000-000000000311',
  1,
  'Event-Driven Architecture Patterns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Event-Driven Architecture Patterns</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Event-Driven Architecture Patterns</h1>
  <p>Serverless pays off as an event-driven system: producers emit events without knowing who consumes them, and consumers scale and fail independently.</p>
  <h2>Decouple with queues</h2>
  <p>A queue between producer and consumer smooths bursts. If producers emit 1000 events a second but consumers handle 10, the excess becomes backlog, not loss:</p>
  <pre class="code-block">Producer --&gt; SQS queue --&gt; Lambda consumer</pre>
  <h2>Fan out with SNS or EventBridge</h2>
  <ul>
    <li><strong>SNS</strong> — publish once, deliver to many SQS queues, Lambda functions, or endpoints.</li>
    <li><strong>EventBridge</strong> — richer routing: filter by event fields and send to many targets.</li>
  </ul>
  <pre class="code-block">import json

def handler(event, context):
    for record in event['Records']:
        message = json.loads(record['Sns']['Message'])
        print('Order event:', message['order_id'])
    return {'statusCode': 200}</pre>
  <h2>Choreography vs orchestration</h2>
  <table>
    <tr><th>Approach</th><th>Description</th></tr>
    <tr><td>Choreography</td><td>Each service reacts to events and emits follow-ups.</td></tr>
    <tr><td>Orchestration</td><td>Step Functions drives a state machine of Lambda tasks with retries.</td></tr>
  </table>
  <h2>Idempotency is the backbone</h2>
  <pre class="code-block">def handler(event, context):
    key = event['order_id']
    if processed.contains(key):
        return {'statusCode': 200, 'body': 'duplicate'}
    processed.mark(key)
    return process_order(event)</pre>
  <div class="callout callout-tip">
    <strong>Plan for duplicates</strong>
    <p>Retries and at-least-once queues make duplicates normal, not bugs. Store a processed marker or keep operations naturally idempotent.</p>
  </div>
  <div class="callout callout-info">
    <strong>Send references, not blobs</strong>
    <p>Put the heavy artifact in S3 and let the event carry the object key. Small events mean cheap retries and fast queues.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000409',
  '02F00000-0000-4000-8000-000000000313',
  1,
  'API Gateway Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>API Gateway Fundamentals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>API Gateway Fundamentals</h1>
  <p>API Gateway is the front door for HTTP: it accepts requests, applies auth and throttling, then hands them to your Lambda function. That keeps Lambda free of HTTP plumbing.</p>
  <h2>Three API types</h2>
  <table>
    <tr><th>Type</th><th>Sweet spot</th></tr>
    <tr><td>REST API</td><td>Feature-rich: usage plans, API keys, request validation, WAF, private endpoints.</td></tr>
    <tr><td>HTTP API</td><td>Cheap, low-latency JSON APIs with JWT and Lambda authorizers.</td></tr>
    <tr><td>WebSocket API</td><td>Persistent two-way connections for chat and live dashboards.</td></tr>
  </table>
  <h2>How the proxy works</h2>
  <pre class="code-block">https://abc123.execute-api.us-east-1.amazonaws.com/prod/orders/42</pre>
  <p>The gateway maps <span class="ic">/orders/42</span> to your function and builds this event:</p>
  <pre class="code-block">{
  "httpMethod": "GET",
  "path": "/orders/42",
  "pathParameters": { "id": "42" },
  "queryStringParameters": { "status": "open" },
  "headers": { "Authorization": "Bearer token" },
  "requestContext": { "requestId": "abc", "stage": "prod" }
}</pre>
  <h2>A working proxy handler</h2>
  <pre class="code-block">exports.handler = async (event) =&gt; {
  const { id } = event.pathParameters ?? {};
  return {
    statusCode: 200,
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ id, message: 'Order fetched' }),
  };
};</pre>
  <h2>Deployments and stages</h2>
  <ul>
    <li><strong>Deployment</strong> — a snapshot of the API configuration.</li>
    <li><strong>Stage</strong> — a named environment (dev, staging, prod) bound to a deployment.</li>
    <li>Each stage gets its own URL and can point at different Lambda versions.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Start with the HTTP API</strong>
    <p>Unless you need usage plans or WAF, the HTTP API is cheaper, faster, and simpler to reason about.</p>
  </div>
  <div class="callout callout-info">
    <strong>Prove the path end to end</strong>
    <p>Deploy a hello handler behind an HTTP API and curl it. Watching the exchange in CloudWatch logs builds confidence fast.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000410',
  '02F00000-0000-4000-8000-000000000314',
  1,
  'REST & HTTP APIs with Lambda',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>REST & HTTP APIs with Lambda</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>REST &amp; HTTP APIs with Lambda</h1>
  <p>Once an HTTP API exists, the interesting decisions are about auth, payload shape, and how errors travel back to clients.</p>
  <h2>Response format</h2>
  <pre class="code-block">return {
  statusCode: 201,
  headers: { 'Access-Control-Allow-Origin': '*' },
  body: JSON.stringify({ id: 'new-1', created: true }),
};</pre>
  <p>Lambda must return this envelope — the gateway maps statusCode to the HTTP status and passes the body through.</p>
  <h2>Reading input</h2>
  <pre class="code-block">const body = JSON.parse(event.body ?? '{}');
const page = event.queryStringParameters?.page ?? '1';
const { id } = event.pathParameters ?? {};</pre>
  <h2>Authorization options</h2>
  <table>
    <tr><th>Mechanism</th><th>Use</th></tr>
    <tr><td>IAM authorization</td><td>SigV4-signed clients, including SDKs and Cognito identities.</td></tr>
    <tr><td>JWT authorizer</td><td>Cognito User Pools or any OIDC token provider.</td></tr>
    <tr><td>Lambda authorizer</td><td>Custom logic — token validation, roles, caching.</td></tr>
  </table>
  <h2>Mapping errors to HTTP codes</h2>
  <pre class="code-block">try {
  return await handleOrder(event);
} catch (err) {
  if (err.code === 'NOT_FOUND') {
    return { statusCode: 404, body: JSON.stringify({ error: 'Missing' }) };
  }
  console.error(JSON.stringify({ level: 'error', requestId, err }));
  return { statusCode: 500, body: JSON.stringify({ error: 'Internal' }) };
}</pre>
  <h2>Throttling protects everyone</h2>
  <ul>
    <li>Set account-level rate limits so one consumer cannot starve the fleet.</li>
    <li>Usage plans cap per-client request rates using API keys.</li>
    <li>Keep a small burst allowance; smooth the rest.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Handle CORS in config, not workarounds</strong>
    <p>For browser clients, enable CORS on the API and echo requested headers from Lambda. Fighting it in code only adds confusion.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000411',
  '02F00000-0000-4000-8000-000000000316',
  1,
  'Environment Variables',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Environment Variables</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Environment Variables</h1>
  <p>Environment variables decouple configuration from code. The same package can run in dev or prod simply by swapping variables at deploy time.</p>
  <h2>Reading variables</h2>
  <pre class="code-block">import os

TABLE_NAME = os.environ['TABLE_NAME']              # required
REGION = os.environ.get('REGION', 'us-east-1')     # optional</pre>
  <h2>Setting them</h2>
  <pre class="code-block">aws lambda update-function-configuration --function-name orders-api --environment 'Variables={"TABLE_NAME":"orders-prod","STAGE":"prod"}'</pre>
  <h2>Common patterns</h2>
  <ul>
    <li>Table and bucket names, queue URLs, external endpoint hosts.</li>
    <li>Feature flags and retry thresholds.</li>
    <li>Read once at init into module scope — not per invocation.</li>
  </ul>
  <h2>Encryption at rest</h2>
  <p>Lambda encrypts environment variables with a KMS key. By default it uses aws/lambda; attach your own key when you want independent control over who can decrypt.</p>
  <div class="callout callout-tip">
    <strong>Know the limits</strong>
    <p>Environment variables are limited to 4 KB total, and they are visible in the console. Treat them as non-secret configuration.</p>
  </div>
  <div class="callout callout-info">
    <strong>Do not put secrets here</strong>
    <p>Anyone with read access to the function can see the variables. Secrets belong in Secrets Manager or Parameter Store, read at runtime.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000412',
  '02F00000-0000-4000-8000-000000000317',
  1,
  'Secrets & Configuration Management',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Secrets & Configuration Management</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Secrets &amp; Configuration Management</h1>
  <p>Configuration you can read openly is fine; credentials need a vault. AWS gives you two managed stores with different strengths.</p>
  <h2>Compare the stores</h2>
  <table>
    <tr><th>Feature</th><th>Parameter Store</th><th>Secrets Manager</th></tr>
    <tr><td>Cost</td><td>Free tier</td><td>Charged per secret per month</td></tr>
    <tr><td>Rotation</td><td>Manual only</td><td>Automatic with a rotation Lambda</td></tr>
    <tr><td>Secure strings</td><td>Yes, with KMS</td><td>Yes, with KMS</td></tr>
    <tr><td>Best for</td><td>Config and occasional secrets</td><td>High-value credentials with a lifecycle</td></tr>
  </table>
  <h2>Read at runtime</h2>
  <pre class="code-block">import json, boto3
from botocore.exceptions import ClientError

secrets = boto3.client('secretsmanager')

def get_secret(name):
    try:
        resp = secrets.get_secret_value(SecretId=name)
    except ClientError as err:
        raise RuntimeError('Secret fetch failed') from err
    return json.loads(resp['SecretString'])

DB_CREDS = get_secret('prod/db')   # read once at init</pre>
  <h2>Grant access narrowly</h2>
  <pre class="code-block">{
  "Effect": "Allow",
  "Action": ["secretsmanager:GetSecretValue"],
  "Resource": "arn:aws:secretsmanager:region:account:secret:prod/db-*"
}</pre>
  <h2>Secrets hygiene</h2>
  <ul>
    <li>Never log a secret or store it in an environment variable.</li>
    <li>Reference secrets through a narrow IAM resource, never account-wide.</li>
    <li>Enable automatic rotation wherever the service supports it.</li>
    <li>Cache with a short expiry instead of fetching on every invocation.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Cache with a TTL</strong>
    <p>Secrets Manager calls add latency to the request path. Fetch once at init and refresh lazily — your p99 will thank you.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000413',
  '02F00000-0000-4000-8000-000000000319',
  1,
  'Error Handling & Retries',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error Handling & Retries</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Error Handling &amp; Retries</h1>
  <p>Lambda runs your code on your behalf, so <strong>how a failure behaves depends on how the function was invoked</strong>. Knowing the three invocation models tells you where errors surface and how to clean them up.</p>
  <h2>Failure behavior by invocation type</h2>
  <table>
    <tr><th>Invocation model</th><th>What happens on error</th></tr>
    <tr><td>Synchronous (RequestResponse)</td><td>The caller receives the error immediately and decides whether to retry.</td></tr>
    <tr><td>Asynchronous (Event)</td><td>Lambda retries twice by default, then delivers the event to a destination or dead-letter queue.</td></tr>
    <tr><td>Polling (event source mappings)</td><td>Records are retried until they age out; stream mappings skip only the failing record.</td></tr>
  </table>
  <h2>Retries for asynchronous invocations</h2>
  <p>Asynchronous invocations are queued inside Lambda, and Lambda retries the function <strong>twice by default</strong>, with an event age cap of six hours. Both knobs are per-function:</p>
  <pre class="code-block">aws lambda put-function-event-invoke-config --function-name orders-processor --maximum-retry-attempts 2 --maximum-event-age-in-seconds 3600</pre>
  <h2>On-failure destinations</h2>
  <p>For asynchronous work, prefer an <strong>on-failure destination</strong> over a dead-letter queue. Lambda delivers the failed event, including its <span class="ic">requestPayload</span>, to a target of your choice:</p>
  <ul>
    <li><strong>SQS</strong> &mdash; a durable queue a downstream worker can replay.</li>
    <li><strong>SNS</strong> &mdash; fan the failure out to alerting channels.</li>
    <li><strong>EventBridge</strong> &mdash; let any rule or archive react to it.</li>
    <li><strong>Lambda</strong> &mdash; a dedicated failure-handler function.</li>
  </ul>
  <h2>Dead-letter queues for streaming sources</h2>
  <p>Event source mappings that read from <strong>SQS queues and SNS topics</strong> still support a dead-letter queue: when retries are exhausted, the message moves to the DLQ wrapped as a large SQS record you can inspect and replay.</p>
  <h2>Build for idempotency</h2>
  <p>Retries mean your handler can run <strong>more than once for the same event</strong>, so design every function to be safe when repeated:</p>
  <ul>
    <li>Use entity IDs or idempotency keys instead of blind inserts and updates.</li>
    <li>Prefer conditional writes in DynamoDB so duplicate events fail cleanly.</li>
    <li>Never perform side effects (email, payment, writes) twice for one event.</li>
  </ul>
  <h2>Return structured errors</h2>
  <p>Classify errors in the handler so the caller or destination can act on them:</p>
  <pre class="code-block">def handler(event, context):
    try:
        order = retrieve_order(event['order_id'])
    except OrderNotFound:
        return {'statusCode': 404, 'body': 'order not found'}
    except Exception as exc:
        raise RuntimeError(f'checkout failed: {exc}') from exc
    return {'statusCode': 200, 'body': 'ok'}</pre>
  <div class="callout callout-tip">
    <strong>Assume every event may run twice</strong>
    <p>Producers and consumers must tolerate a duplicate event without doubling a charge, an email, or a database write. Idempotency is the cheapest insurance against retry storms.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000414',
  '02F00000-0000-4000-8000-000000000320',
  1,
  'Streams & Async Invocation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Streams & Async Invocation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Streams &amp; Async Invocation</h1>
  <p>Queues and streams let your functions process work <strong>as it arrives</strong>, at whatever rate your team can consume it. Lambda integrates with these sources through <span class="ic">event source mappings</span> that poll on your behalf.</p>
  <h2>Polling event source mappings</h2>
  <p>An event source mapping connects a source to a function: it polls the source, packages records into batches, and invokes your function once per batch.</p>
  <table>
    <tr><th>Source</th><th>Batching</th><th>Throughput driver</th></tr>
    <tr><td>SQS queue</td><td>Batch of up to 10,000 messages</td><td>Number of queues and concurrent batches</td></tr>
    <tr><td>Kinesis stream</td><td>Batch of up to 10,000 records</td><td>Number of shards</td></tr>
    <tr><td>DynamoDB stream</td><td>Consistent with the table shards</td><td>Table shard count</td></tr>
    <tr><td>Amazon MSK (Kafka)</td><td>Batch per partition</td><td>Number of partitions</td></tr>
  </table>
  <h2>Reading from SQS</h2>
  <p>SQS is fully managed, so there are no shards to worry about. Lambda polls the queue, <strong>deletes messages only after the batch succeeds</strong>, and relies on the queue visibility timeout to decide when to retry a failed batch.</p>
  <pre class="code-block">def handler(event, context):
    for record in event['Records']:
        payload = json.loads(record['body'])
        process_order(payload)
    return {'statusCode': 200}</pre>
  <h2>Ordered processing on streams</h2>
  <p>Kinesis and DynamoDB streams preserve order <strong>within a shard</strong>. Lambda assigns each shard to a single consumer, so records that share a partition key are processed sequentially. Distribute partition keys evenly to spread the load across shards.</p>
  <div class="callout callout-info">
    <strong>Watch IteratorAge</strong>
    <p>If the function is slower than the write rate, the stream backs up and the <span class="ic">IteratorAge</span> metric climbs. That number is your earliest warning that consumers are falling behind producers.</p>
  </div>
  <h2>Asynchronous fan-out</h2>
  <p>When you do not need the answer, invoke asynchronously: the event is queued inside Lambda, retried twice on failure, and routable to destinations. Use it for notifications, enrichment jobs, and workflows that tolerate delay.</p>
  <pre class="code-block">aws lambda invoke --function-name thumbnailer --invocation-type Event --payload '{"key":"photo.jpg"}' out.json</pre>
  <h2>Push versus pull</h2>
  <ul>
    <li><strong>Push</strong> (S3, EventBridge, API Gateway) &mdash; Lambda runs in response to an event; retries follow the platform default.</li>
    <li><strong>Pull</strong> (SQS, Kinesis, DynamoDB) &mdash; a mapping owns delivery, gives fine retry control, and preserves order.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Decouple, then scale</strong>
    <p>A producer should never wait on a consumer. Put a queue or stream between them and let each side scale independently, down to zero.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000415',
  '02F00000-0000-4000-8000-000000000322',
  1,
  'CloudWatch Monitoring',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CloudWatch Monitoring</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>CloudWatch Monitoring</h1>
  <p>Every Lambda function publishes a <strong>standard set of CloudWatch metrics</strong>. Watching them, and knowing the normal shape of each, is how you find problems before your users do.</p>
  <h2>Core Lambda metrics</h2>
  <table>
    <tr><th>Metric</th><th>What it measures</th></tr>
    <tr><td>Invocations</td><td>How many times the function ran in the period.</td></tr>
    <tr><td>Errors</td><td>Invocations that hit an error, excluding throttles and timeouts.</td></tr>
    <tr><td>Duration</td><td>The wall-clock milliseconds of each execution.</td></tr>
    <tr><td>Throttles</td><td>Executions rejected because concurrency was exhausted.</td></tr>
    <tr><td>ConcurrentExecutions</td><td>Simultaneous executions; the peak defines your concurrency budget.</td></tr>
    <tr><td>IteratorAge</td><td>Age of the oldest unprocessed stream record (stream mappings only).</td></tr>
  </table>
  <p>Use <span class="ic">Errors</span> to alarm on failures, remember <span class="ic">Timeout</span> is a separate metric, and track <span class="ic">DestinationDeliveryFailures</span> for failing on-failure destinations.</p>
  <h2>Log groups and log streams</h2>
  <p>Every execution writes to its function log group, named <span class="ic">/aws/lambda/&lt;function-name&gt;</span>, across many log streams. Set retention explicitly, because data older than your window is deleted automatically:</p>
  <pre class="code-block">aws logs put-retention-policy --log-group-name /aws/lambda/image-resizer --retention-in-days 14</pre>
  <h2>Alarm on symptoms</h2>
  <p>Alarm on <strong>user-visible symptoms</strong>, not raw activity. A single alarm on Errors covers most functions:</p>
  <pre class="code-block">aws cloudwatch put-metric-alarm --alarm-name image-resizer-errors --alarm-description "Errors above zero for 5 minutes" --metric-name Errors --namespace AWS/Lambda --statistic Sum --period 300 --evaluation-periods 1 --threshold 0 --comparison-operator GreaterThanThreshold --dimensions Name=FunctionName,Value=image-resizer</pre>
  <h2>Deeper insight from the same data</h2>
  <ul>
    <li><strong>Metric filters</strong> &mdash; count log events matching a pattern as a custom metric (for example, <span class="ic">&quot;ERROR&quot;</span>).</li>
    <li><strong>Logs Insights</strong> &mdash; run queries over log events to find errors across functions.</li>
    <li><strong>Dashboards</strong> &mdash; put the four or five metrics that matter on one screen.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Alarm now, tune later</strong>
    <p>Start with an alarm per function on Errors above zero and on sustained Throttles. Add duration and concurrency alarms once you know your baseline.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000416',
  '02F00000-0000-4000-8000-000000000323',
  1,
  'Tracing & Observability',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tracing & Observability</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Tracing &amp; Observability</h1>
  <p>Observability answers <strong>what happened, why, and where</strong> across the whole application. For Lambda that means three pillars: structured logs, metrics that matter, and distributed traces that connect many functions into one request.</p>
  <h2>Log in JSON</h2>
  <p>Write <strong>JSON log records</strong> with a consistent schema so tools can query them without parsing prose:</p>
  <pre class="code-block">{
  "level": "ERROR",
  "request_id": "cb8f2d5a-3b9e",
  "operation": "checkout",
  "error": "payment_failed",
  "duration_ms": 412
}</pre>
  <p>Always include <span class="ic">level</span>, <span class="ic">request_id</span>, and a machine-readable <span class="ic">error</span> code. Lambda merges its own fields &mdash; AWSRequestId, function name, timestamp &mdash; into every record.</p>
  <h2>Trace with AWS X-Ray</h2>
  <p>Enable <strong>active tracing</strong> on every function reached via API Gateway or called by other functions. X-Ray builds a service map from segments:</p>
  <table>
    <tr><th>Segment</th><th>Represents</th></tr>
    <tr><td>API Gateway</td><td>The HTTP request entering the API.</td></tr>
    <tr><td>Lambda invocation</td><td>Handler execution, plus any subsegments you add.</td></tr>
    <tr><td>DynamoDB / S3 / HTTP calls</td><td>Downstream work performed during the invocation.</td></tr>
  </table>
  <p>With active tracing, Lambda records the invocation automatically. Add subsegments for the parts of your logic that matter:</p>
  <pre class="code-block">const AWSXRay = require('aws-xray-sdk');
const s3 = AWSXRay.captureAWSClient(new S3());

exports.handler = async (event) => {
  const sub = AWSXRay.getSegment().addNewSubsegment('render_page');
  const page = await render(event.path);
  sub.close();
  return ok(page);
}</pre>
  <h2>Correlate end to end</h2>
  <p>X-Ray shows one trace across API Gateway, every Lambda hop, and all downstream calls. Carry a <span class="ic">trace-id</span> or <span class="ic">correlation-id</span> through logs and payloads so a single customer issue can be followed from edge to database.</p>
  <h2>Map metrics to symptoms</h2>
  <ul>
    <li><strong>Errors + Duration spikes</strong> &mdash; slow code, slow dependencies, or hot retry loops.</li>
    <li><strong>Throttles + concurrency ceiling</strong> &mdash; reserved concurrency or account limits are too low.</li>
    <li><strong>High InitDuration</strong> &mdash; cold starts dominate; trim dependencies or warm environments.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Instrument from day one</strong>
    <p>Traces and structured logs are cheap to add early and painful to retrofit. Make JSON logs, active tracing, and a correlation header part of every function template.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000417',
  '02F00000-0000-4000-8000-000000000325',
  1,
  'Deployment & Versioning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deployment & Versioning</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Deployment &amp; Versioning</h1>
  <p>Deploying a Lambda function is <strong>publishing an immutable snapshot</strong> of code and settings, not mutating a running server. Versions and aliases give you stable, auditable, and safe delivery.</p>
  <h2>Code and configuration</h2>
  <p>A deployment has two parts: the <strong>deployment package</strong> (ZIP or container image, up to 250 MB unzipped) and the <strong>configuration</strong> (runtime, role, memory, timeout, environment). Changing either creates a state you can publish.</p>
  <h2>Versions</h2>
  <p>Publishing a version copies <span class="ic">$LATEST</span> into a <strong>numbered, immutable snapshot</strong>. You can never change a published version, which is exactly what makes it safe to trust in production:</p>
  <pre class="code-block">aws lambda publish-version --function-name orders-api
aws lambda list-versions-by-function --function-name orders-api</pre>
  <h2>Aliases</h2>
  <p>An alias is a <strong>stable pointer</strong> to a version. Deploy new code, then repoint the alias when you are ready; callers never change their ARN:</p>
  <pre class="code-block">aws lambda create-alias --function-name orders-api --name prod --function-version 12
aws lambda update-alias --function-name orders-api --name prod --function-version 13</pre>
  <h2>Roll out gradually</h2>
  <p>Weighted aliases can split traffic between two versions for a rolling canary:</p>
  <pre class="code-block">aws lambda update-alias --function-name orders-api --name prod --function-version 13 --routing-config AdditionalVersionWeights={"12":0.1}</pre>
  <p>Send 10% to the new version, watch errors and latency, then reweight to 100% once it is proven.</p>
  <h2>Roll back safely</h2>
  <p>The previous version still exists and is immutable, so rollback is simply <strong>repointing the alias again</strong> &mdash; no redeploy, no waiting:</p>
  <pre class="code-block">aws lambda update-alias --function-name orders-api --name prod --function-version 12</pre>
  <div class="callout callout-info">
    <strong>Code versus configuration</strong>
    <p>Environment variables and memory changes can break a function too. Prefer making them part of the versioned configuration, authored as infrastructure as code, so every environment is reproducible.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000418',
  '02F00000-0000-4000-8000-000000000326',
  1,
  'Infrastructure as Code & CI/CD',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Infrastructure as Code & CI/CD</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Infrastructure as Code &amp; CI/CD</h1>
  <p>Infrastructure as code (IaC) turns your Lambda setup into <strong>reviewable, versioned text</strong>. AWS SAM, an extension of CloudFormation, is the most direct way to describe Lambda-heavy services.</p>
  <h2>A minimal SAM template</h2>
  <pre class="code-block">AWSTemplateFormatVersion: '2010-09-09'
Transform: AWS::Serverless-2016-10-31

Resources:
  OrdersFunction:
    Type: AWS::Serverless::Function
    Properties:
      CodeUri: src/
      Handler: app.handler
      Runtime: python3.13
      MemorySize: 256
      Timeout: 30
      Environment:
        Variables:
          TABLE_NAME: !Ref OrdersTable

  OrdersTable:
    Type: AWS::DynamoDB::Table
    Properties:
      BillingMode: PAY_PER_REQUEST
      AttributeDefinitions:
        - AttributeName: id
          AttributeType: S
      KeySchema:
        - AttributeName: id
          KeyType: HASH</pre>
  <p>The template declares the function and its table together, so one deploy creates or updates both atomically.</p>
  <h2>Build and deploy</h2>
  <pre class="code-block">sam build
sam deploy --guided</pre>
  <p><span class="ic">sam build</span> packages your source into a deployable artifact, and <span class="ic">sam deploy</span> pushes it to CloudFormation, which creates the stack and rolls back automatically if a resource fails.</p>
  <h2>Ship through a pipeline</h2>
  <p>Treat the template as source code. A CI/CD pipeline should:</p>
  <ol>
    <li>Run linters and unit tests on the handler code.</li>
    <li>Build and package the SAM artifact with <span class="ic">sam build</span>.</li>
    <li>Deploy to staging and run integration tests.</li>
    <li>Promote the same artifact to production unchanged.</li>
  </ol>
  <p>The same artifact moving through environments is what makes deployments trustworthy.</p>
  <h2>Environments without forks</h2>
  <p>Use CloudFormation <span class="ic">parameters</span> and conditions to keep one template across dev, staging, and prod. Keep per-environment secrets in Secrets Manager or Parameter Store and reference them from the function configuration.</p>
  <h2>Safe updates</h2>
  <p>SAM supports CodeDeploy-style deployments on functions: gradual traffic shifts that <strong>roll back automatically when alarms fire</strong>. Declare a deployment preference on the function and the stack manages the rest.</p>
  <div class="callout callout-tip">
    <strong>Treat functions as cattle</strong>
    <p>If you cannot rebuild a function from a template, it is not actually managed. Role, table, and event source all belong in the template so environments are disposable and reproducible.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02F00000-0000-4000-8000-000000000419',
  '02F00000-0000-4000-8000-000000000327',
  1,
  'Cost Optimization & Cold Starts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cost Optimization & Cold Starts</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #8b5cf6; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #6d28d9; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ede9fe; color: #6d28d9; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ede9fe; border-left: 4px solid #8b5cf6; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ede9fe; color: #6d28d9; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #a78bfa; }
.dark .lesson-page h2 { color: #c4b5fd; }
.dark .lesson-page .ic { background: #2e1065; color: #c4b5fd; }
.dark .lesson-page .callout { background: #2e1065; border-left-color: #8b5cf6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #2e1065; color: #c4b5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Cost Optimization &amp; Cold Starts</h1>
  <p>Pricing and cold starts are the two questions every Lambda team eventually asks. Both are manageable with a little measurement and a few structural choices.</p>
  <h2>What Lambda bills you for</h2>
  <table>
    <tr><th>Dimension</th><th>Unit</th></tr>
    <tr><td>Requests</td><td>Per request, after the always-free 1 million per month.</td></tr>
    <tr><td>Duration</td><td>GB-seconds: memory in GB multiplied by time in seconds per execution.</td></tr>
    <tr><td>Provisioned concurrency</td><td>Per warmed instance while it is configured.</td></tr>
  </table>
  <p>Because duration is <strong>memory multiplied by time</strong>, doubling memory and halving runtime can cost roughly the same, while making the function faster.</p>
  <h2>Right-size the memory</h2>
  <p>More memory also means a faster CPU allocation, so CPU-bound functions often finish fast enough to cost <strong>less per execution at higher memory</strong>. Measure a few sizes &mdash; for many workloads the sweet spot is <span class="ic">512&ndash;1024 MB</span>. Pick the cheapest point that meets your latency budget.</p>
  <h2>Reduce what you invoke</h2>
  <ul>
    <li><strong>Batch records</strong> &mdash; process many messages per invocation instead of one.</li>
    <li><strong>Compress and paginate</strong> &mdash; pay for fewer, larger requests.</li>
    <li><strong>Choose the cheapest path</strong> &mdash; a scheduled check may beat a constant stream of events.</li>
  </ul>
  <h2>What is a cold start?</h2>
  <p>A cold start is the time a <strong>fresh execution environment</strong> takes to initialize before your handler runs: download the code, boot the runtime, run module-level setup. Warm environments skip this entirely.</p>
  <ol>
    <li>Lambda allocates a new sandbox for the function.</li>
    <li>The runtime starts (Node, Python, Java, and so on).</li>
    <li>Your module-level initialization runs, then the handler executes.</li>
  </ol>
  <p>For fast runtimes such as Node.js and Python, initialization is usually a few hundred milliseconds; fat dependencies and heavy frameworks make it worse.</p>
  <h2>Cut initialization time</h2>
  <ul>
    <li>Keep dependencies and bundled code lean.</li>
    <li>Lazy-load heavy clients only when they are first used.</li>
    <li>Increase memory, which also speeds up initialization.</li>
    <li>Reserve a little <span class="ic">Provisioned Concurrency</span> for latency-critical functions.</li>
  </ul>
  <p>Provisioned concurrency keeps environments warm ahead of time, trading a fixed fee for predictable latency. Enable it only where p99 latency matters, never as a blanket setting.</p>
  <div class="callout callout-tip">
    <strong>Measure, then tune</strong>
    <p>Track <span class="ic">InitDuration</span> and <span class="ic">ColdStart</span> to learn what you are actually paying. Optimize the biggest lever first: fewer fat dependencies first, then memory, then provisioned concurrency.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES  (29 questions: 3 per short quiz lesson, 5 for the final assessment)
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('02F00000-0000-4000-8000-000000000501', '02F00000-0000-4000-8000-000000000303',
   'In the FaaS model, when do you pay for your function?',
   'Lambda bills only for the compute time your function actually uses; idle deployments cost nothing.', 1),
  ('02F00000-0000-4000-8000-000000000502', '02F00000-0000-4000-8000-000000000303',
   'What does a serverless platform abstract away?',
   'The platform owns servers, scaling, and runtime patching, leaving you to ship code and events.', 2),
  ('02F00000-0000-4000-8000-000000000503', '02F00000-0000-4000-8000-000000000303',
   'Which is a hard limit for a single Lambda invocation?',
   'Lambda caps each invocation at 15 minutes; longer work belongs on containers or managed jobs.', 3),
  ('02F00000-0000-4000-8000-000000000504', '02F00000-0000-4000-8000-000000000306',
   'What is the first argument received by your Lambda handler?',
   'The handler signature is (event, context); the first argument always carries the triggering event data.', 1),
  ('02F00000-0000-4000-8000-000000000505', '02F00000-0000-4000-8000-000000000306',
   'Which AWS service triggers a function on a schedule?',
   'EventBridge rules fire on schedules and can invoke a function directly.', 2),
  ('02F00000-0000-4000-8000-000000000506', '02F00000-0000-4000-8000-000000000306',
   'How is the language runtime of a function chosen?',
   'The runtime is a property of the function, such as Node.js, Python, or Java.', 3),
  ('02F00000-0000-4000-8000-000000000507', '02F00000-0000-4000-8000-000000000309',
   'What is the purpose of a Lambda execution role?',
   'The execution role is the IAM identity Lambda assumes, deciding which resources the function may touch.', 1),
  ('02F00000-0000-4000-8000-000000000508', '02F00000-0000-4000-8000-000000000309',
   'What does least privilege mean when configuring IAM?',
   'Least privilege grants each function exactly the permissions it needs, keeping the blast radius small.', 2),
  ('02F00000-0000-4000-8000-000000000509', '02F00000-0000-4000-8000-000000000309',
   'Which AWS service is best suited to storing and rotating secrets?',
   'Secrets Manager manages encrypted values and can rotate them automatically.', 3),
  ('02F00000-0000-4000-8000-000000000510', '02F00000-0000-4000-8000-000000000312',
   'How does Lambda consume messages from an SQS queue?',
   'Event source mappings poll managed queues and hand records to the function in batches.', 1),
  ('02F00000-0000-4000-8000-000000000511', '02F00000-0000-4000-8000-000000000312',
   'What does Lambda scale on when processing a Kinesis stream?',
   'Each shard is assigned to one consumer, so parallelism tracks the number of shards.', 2),
  ('02F00000-0000-4000-8000-000000000512', '02F00000-0000-4000-8000-000000000312',
   'What is the simplest way to invoke a function from code?',
   'Call the Invoke API with the function ARN and a payload; the SDK handles the rest.', 3),
  ('02F00000-0000-4000-8000-000000000513', '02F00000-0000-4000-8000-000000000315',
   'What role does API Gateway play in front of Lambda?',
   'API Gateway is the managed HTTP door that turns REST endpoints into Lambda invocations.', 1),
  ('02F00000-0000-4000-8000-000000000514', '02F00000-0000-4000-8000-000000000315',
   'Which feature restricts API access to trusted clients?',
   'Usage plans issue API keys and enforce per-client quotas and throttling.', 2),
  ('02F00000-0000-4000-8000-000000000515', '02F00000-0000-4000-8000-000000000315',
   'What does Lambda return to API Gateway in proxy mode?',
   'Proxy responses must include at least statusCode and body, serialized as JSON.', 3),
  ('02F00000-0000-4000-8000-000000000516', '02F00000-0000-4000-8000-000000000318',
   'Where should non-secret configuration values live?',
   'Environment variables hold settings that change without a code redeploy.', 1),
  ('02F00000-0000-4000-8000-000000000517', '02F00000-0000-4000-8000-000000000318',
   'What does Systems Manager Parameter Store provide?',
   'Parameter Store stores secure parameters and secrets against versioned ARNs at negligible cost.', 2),
  ('02F00000-0000-4000-8000-000000000518', '02F00000-0000-4000-8000-000000000318',
   'Why should secrets never be baked into code or artifacts?',
   'Secrets committed to code are hard to revoke and may escape into source control.', 3),
  ('02F00000-0000-4000-8000-000000000519', '02F00000-0000-4000-8000-000000000321',
   'Where do failed async invocations go after retries are exhausted?',
   'An on-failure destination or dead-letter queue captures events for inspection and replay.', 1),
  ('02F00000-0000-4000-8000-000000000520', '02F00000-0000-4000-8000-000000000321',
   'How many times does Lambda retry a failed asynchronous invocation by default?',
   'Async invocations retry twice by default, with optional age and count caps.', 2),
  ('02F00000-0000-4000-8000-000000000521', '02F00000-0000-4000-8000-000000000321',
   'Which service decouples producers and consumers with managed queues?',
   'SQS offers durable at-least-once queues so a busy consumer never drops work.', 3),
  ('02F00000-0000-4000-8000-000000000522', '02F00000-0000-4000-8000-000000000324',
   'Where does Lambda write logs by default?',
   'Lambda streams logs to CloudWatch Logs automatically through its log group.', 1),
  ('02F00000-0000-4000-8000-000000000523', '02F00000-0000-4000-8000-000000000324',
   'Which CloudWatch metric counts failed invocations?',
   'The Errors metric counts invocations that failed, feeding alarms and dashboards.', 2),
  ('02F00000-0000-4000-8000-000000000524', '02F00000-0000-4000-8000-000000000324',
   'Which service traces requests across functions end to end?',
   'X-Ray builds a service map of segments across API Gateway, Lambda, and downstream calls.', 3),
  ('02F00000-0000-4000-8000-000000000525', '02F00000-0000-4000-8000-000000000328',
   'Which invocation type waits for your code to finish?',
   'Synchronous (RequestResponse) calls block until the handler returns its response.', 1),
  ('02F00000-0000-4000-8000-000000000526', '02F00000-0000-4000-8000-000000000328',
   'What is the main cause of a cold start?',
   'A cold start happens when Lambda creates a fresh execution environment for the function.', 2),
  ('02F00000-0000-4000-8000-000000000527', '02F00000-0000-4000-8000-000000000328',
   'What is a published Lambda version?',
   'A version is an immutable snapshot of function code and settings, safe for production trust.', 3),
  ('02F00000-0000-4000-8000-000000000528', '02F00000-0000-4000-8000-000000000328',
   'Why use a Lambda alias?',
   'Aliases are stable pointers you can repoint to a new version, even gradually.', 4),
  ('02F00000-0000-4000-8000-000000000529', '02F00000-0000-4000-8000-000000000328',
   'Which style is most serverless-first?',
   'Small single-purpose functions composed with managed services beat one big function.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (0501): billing model
  ('02F00000-0000-4000-8000-000000001001', '02F00000-0000-4000-8000-000000000501', 'Only for compute time actually consumed', TRUE,  1),
  ('02F00000-0000-4000-8000-000000001002', '02F00000-0000-4000-8000-000000000501', 'For every hour the function stays deployed', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001003', '02F00000-0000-4000-8000-000000000501', 'For each byte of code uploaded', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001004', '02F00000-0000-4000-8000-000000000501', 'Only while traffic is above zero', FALSE, 4),
  -- Q1 (0502)q2: platform abstraction
  ('02F00000-0000-4000-8000-000000001005', '02F00000-0000-4000-8000-000000000502', 'Your application business logic', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001006', '02F00000-0000-4000-8000-000000000502', 'The mobile and web user interfaces', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001007', '02F00000-0000-4000-8000-000000000502', 'The runtime infrastructure and scaling', TRUE,  3),
  ('02F00000-0000-4000-8000-000000001008', '02F00000-0000-4000-8000-000000000502', 'The database schema design', FALSE, 4),
  -- Q1 (0503)q3: execution limit
  ('02F00000-0000-4000-8000-000000001009', '02F00000-0000-4000-8000-000000000503', 'A maximum of 100 invocations per day', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001010', '02F00000-0000-4000-8000-000000000503', 'A maximum execution duration of 15 minutes', TRUE,  2),
  ('02F00000-0000-4000-8000-000000001011', '02F00000-0000-4000-8000-000000000503', 'A maximum code size of 1 GB', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001012', '02F00000-0000-4000-8000-000000000503', 'A maximum payload of 200 KB', FALSE, 4),
  -- Q2 (0504): handler signature
  ('02F00000-0000-4000-8000-000000001013', '02F00000-0000-4000-8000-000000000504', 'The context object', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001014', '02F00000-0000-4000-8000-000000000504', 'The runtime configuration', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001015', '02F00000-0000-4000-8000-000000000504', 'The IAM policy document', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001016', '02F00000-0000-4000-8000-000000000504', 'The event object', TRUE,  4),
  -- Q2 (0505)q2: schedule
  ('02F00000-0000-4000-8000-000000001017', '02F00000-0000-4000-8000-000000000505', 'EventBridge', TRUE,  1),
  ('02F00000-0000-4000-8000-000000001018', '02F00000-0000-4000-8000-000000000505', 'Amazon S3', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001019', '02F00000-0000-4000-8000-000000000505', 'Route 53', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001020', '02F00000-0000-4000-8000-000000000505', 'Amazon VPC', FALSE, 4),
  -- Q2 (0506)q3: runtime
  ('02F00000-0000-4000-8000-000000001021', '02F00000-0000-4000-8000-000000000506', 'From the handler file extension', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001022', '02F00000-0000-4000-8000-000000000506', 'By the runtime configured on the function', TRUE,  2),
  ('02F00000-0000-4000-8000-000000001023', '02F00000-0000-4000-8000-000000000506', 'From the AWS region selection', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001024', '02F00000-0000-4000-8000-000000000506', 'From the function name prefix', FALSE, 4),
  -- Q3 (0507): execution role
  ('02F00000-0000-4000-8000-000000001025', '02F00000-0000-4000-8000-000000000507', 'To authenticate end users of the application', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001026', '02F00000-0000-4000-8000-000000000507', 'To encrypt environment variables at rest', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001027', '02F00000-0000-4000-8000-000000000507', 'To grant the function permission to call AWS services', TRUE,  3),
  ('02F00000-0000-4000-8000-000000001028', '02F00000-0000-4000-8000-000000000507', 'To cap the function concurrency', FALSE, 4),
  -- Q3 (0508)q2: least privilege
  ('02F00000-0000-4000-8000-000000001029', '02F00000-0000-4000-8000-000000000508', 'Use the AdministratorAccess policy everywhere', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001030', '02F00000-0000-4000-8000-000000000508', 'Reuse one role across all functions', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001031', '02F00000-0000-4000-8000-000000000508', 'Rotate credentials and keys daily', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001032', '02F00000-0000-4000-8000-000000000508', 'Grant only the permissions the function needs', TRUE,  4),
  -- Q3 (0509)q3: secrets
  ('02F00000-0000-4000-8000-000000001033', '02F00000-0000-4000-8000-000000000509', 'CloudWatch Logs', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001034', '02F00000-0000-4000-8000-000000000509', 'AWS Secrets Manager', TRUE,  2),
  ('02F00000-0000-4000-8000-000000001035', '02F00000-0000-4000-8000-000000000509', 'An S3 bucket', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001036', '02F00000-0000-4000-8000-000000000509', 'AWS X-Ray', FALSE, 4),
  -- Q4 (0510): SQS
  ('02F00000-0000-4000-8000-000000001037', '02F00000-0000-4000-8000-000000000510', 'Through an event source mapping that polls the queue', TRUE,  1),
  ('02F00000-0000-4000-8000-000000001038', '02F00000-0000-4000-8000-000000000510', 'By subscribing the queue to a function topic', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001039', '02F00000-0000-4000-8000-000000000510', 'By pushing records into the handler event directly', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001040', '02F00000-0000-4000-8000-000000000510', 'SQS queues cannot trigger Lambda functions', FALSE, 4),
  -- Q4 (0511)q2: shards
  ('02F00000-0000-4000-8000-000000001041', '02F00000-0000-4000-8000-000000000511', 'The number of concurrent executions in the account', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001042', '02F00000-0000-4000-8000-000000000511', 'The size of each stream record payload', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001043', '02F00000-0000-4000-8000-000000000511', 'The number of shards in the stream', TRUE,  3),
  ('02F00000-0000-4000-8000-000000001044', '02F00000-0000-4000-8000-000000000511', 'The message retention period of the stream', FALSE, 4),
  -- Q4 (0512)q3: invoke api
  ('02F00000-0000-4000-8000-000000001045', '02F00000-0000-4000-8000-000000000512', 'Send an email to the function alias', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001046', '02F00000-0000-4000-8000-000000000512', 'Upload a file to the S3 bucket', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001047', '02F00000-0000-4000-8000-000000000512', 'Query the CloudWatch dashboard', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001048', '02F00000-0000-4000-8000-000000000512', 'Call the Invoke API with the function ARN', TRUE,  4),
  -- Q5 (0513): api gateway
  ('02F00000-0000-4000-8000-000000001049', '02F00000-0000-4000-8000-000000000513', 'It compiles the Lambda source code', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001050', '02F00000-0000-4000-8000-000000000513', 'It exposes HTTP endpoints that map to Lambda invocations', TRUE,  2),
  ('02F00000-0000-4000-8000-000000001051', '02F00000-0000-4000-8000-000000000513', 'It stores the function log streams', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001052', '02F00000-0000-4000-8000-000000000513', 'It replaces the execution role', FALSE, 4),
  -- Q5 (0514)q2: api keys
  ('02F00000-0000-4000-8000-000000001053', '02F00000-0000-4000-8000-000000000514', 'VPC endpoints', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001054', '02F00000-0000-4000-8000-000000000514', 'CloudWatch alarms', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001055', '02F00000-0000-4000-8000-000000000514', 'Usage plans with API keys', TRUE,  3),
  ('02F00000-0000-4000-8000-000000001056', '02F00000-0000-4000-8000-000000000514', 'Security groups on the frontend', FALSE, 4),
  -- Q5 (0515)q3: proxy response
  ('02F00000-0000-4000-8000-000000001057', '02F00000-0000-4000-8000-000000000515', 'A JSON object with statusCode and body', TRUE,  1),
  ('02F00000-0000-4000-8000-000000001058', '02F00000-0000-4000-8000-000000000515', 'A plain text string only', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001059', '02F00000-0000-4000-8000-000000000515', 'A pointer to an S3 object', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001060', '02F00000-0000-4000-8000-000000000515', 'A zipped deployment package', FALSE, 4),
  -- Q6 (0516): env vars
  ('02F00000-0000-4000-8000-000000001061', '02F00000-0000-4000-8000-000000000516', 'Hard-coded inside the handler source', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001062', '02F00000-0000-4000-8000-000000000516', 'Embedded in the function name', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001063', '02F00000-0000-4000-8000-000000000516', 'Stored only in the AWS account metadata', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001064', '02F00000-0000-4000-8000-000000000516', 'In environment variables', TRUE,  4),
  -- Q6 (0517)q2: parameter store
  ('02F00000-0000-4000-8000-000000001065', '02F00000-0000-4000-8000-000000000517', 'A secure store for parameters and secrets at negligible cost', TRUE,  1),
  ('02F00000-0000-4000-8000-000000001066', '02F00000-0000-4000-8000-000000000517', 'A full replacement for CloudFormation', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001067', '02F00000-0000-4000-8000-000000000517', 'A managed PostgreSQL database', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001068', '02F00000-0000-4000-8000-000000000517', 'A distributed code repository', FALSE, 4),
  -- Q6 (0518)q3: secrets in code
  ('02F00000-0000-4000-8000-000000001069', '02F00000-0000-4000-8000-000000000518', 'It speeds up container warm starts', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001070', '02F00000-0000-4000-8000-000000000518', 'Secrets in code are hard to rotate and easy to leak', TRUE,  2),
  ('02F00000-0000-4000-8000-000000001071', '02F00000-0000-4000-8000-000000000518', 'The FaaS model forbids environment access', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001072', '02F00000-0000-4000-8000-000000000518', 'It increases the execution role size', FALSE, 4),
  -- Q7 (0519): dlq
  ('02F00000-0000-4000-8000-000000001073', '02F00000-0000-4000-8000-000000000519', 'Back to the original event source', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001074', '02F00000-0000-4000-8000-000000000519', 'To an S3 lifecycle rule', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001075', '02F00000-0000-4000-8000-000000000519', 'To a dead-letter queue or on-failure destination', TRUE,  3),
  ('02F00000-0000-4000-8000-000000001076', '02F00000-0000-4000-8000-000000000519', 'They are dropped silently', FALSE, 4),
  -- Q7 (0520)q2: retries
  ('02F00000-0000-4000-8000-000000001077', '02F00000-0000-4000-8000-000000000520', 'Zero times', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001078', '02F00000-0000-4000-8000-000000000520', 'Once, for a single total attempt', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001079', '02F00000-0000-4000-8000-000000000520', 'Five times', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001080', '02F00000-0000-4000-8000-000000000520', 'Twice, for three total attempts', TRUE,  4),
  -- Q7 (0521)q3: decouple
  ('02F00000-0000-4000-8000-000000001081', '02F00000-0000-4000-8000-000000000521', 'EventBridge rules', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001082', '02F00000-0000-4000-8000-000000000521', 'Amazon SQS queues', TRUE,  2),
  ('02F00000-0000-4000-8000-000000001083', '02F00000-0000-4000-8000-000000000521', 'CloudFront distributions', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001084', '02F00000-0000-4000-8000-000000000521', 'Aurora replicas', FALSE, 4),
  -- Q8 (0522): logs
  ('02F00000-0000-4000-8000-000000001085', '02F00000-0000-4000-8000-000000000522', 'CloudWatch Logs', TRUE,  1),
  ('02F00000-0000-4000-8000-000000001086', '02F00000-0000-4000-8000-000000000522', 'A dedicated S3 bucket', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001087', '02F00000-0000-4000-8000-000000000522', 'An OpenSearch domain by default', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001088', '02F00000-0000-4000-8000-000000000522', 'The local disk of the tenant machine', FALSE, 4),
  -- Q8 (0523)q2: errors metric
  ('02F00000-0000-4000-8000-000000001089', '02F00000-0000-4000-8000-000000000523', 'Invocations', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001090', '02F00000-0000-4000-8000-000000000523', 'Duration', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001091', '02F00000-0000-4000-8000-000000000523', 'Errors', TRUE,  3),
  ('02F00000-0000-4000-8000-000000001092', '02F00000-0000-4000-8000-000000000523', 'ConcurrentExecutions', FALSE, 4),
  -- Q8 (0524)q3: tracing
  ('02F00000-0000-4000-8000-000000001093', '02F00000-0000-4000-8000-000000000524', 'Amazon SNS', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001094', '02F00000-0000-4000-8000-000000000524', 'AWS X-Ray', TRUE,  2),
  ('02F00000-0000-4000-8000-000000001095', '02F00000-0000-4000-8000-000000000524', 'DynamoDB Accelerator', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001096', '02F00000-0000-4000-8000-000000000524', 'Route 53', FALSE, 4),
  -- Q9 (0525): sync
  ('02F00000-0000-4000-8000-000000001097', '02F00000-0000-4000-8000-000000000525', 'Synchronous (RequestResponse)', TRUE,  1),
  ('02F00000-0000-4000-8000-000000001098', '02F00000-0000-4000-8000-000000000525', 'Asynchronous (Event)', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001099', '02F00000-0000-4000-8000-000000000525', 'Polling (Pull)', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001100', '02F00000-0000-4000-8000-000000000525', 'DryRun (Validate)', FALSE, 4),
  -- Q9 (0526)q2: cold start
  ('02F00000-0000-4000-8000-000000001101', '02F00000-0000-4000-8000-000000000526', 'Heavy incoming traffic', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001102', '02F00000-0000-4000-8000-000000000526', 'Large response payloads', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001103', '02F00000-0000-4000-8000-000000000526', 'Creating a fresh execution environment', TRUE,  3),
  ('02F00000-0000-4000-8000-000000001104', '02F00000-0000-4000-8000-000000000526', 'Console session timeouts', FALSE, 4),
  -- Q9 (0527)q3: version
  ('02F00000-0000-4000-8000-000000001105', '02F00000-0000-4000-8000-000000000527', 'A beta release channel', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001106', '02F00000-0000-4000-8000-000000000527', 'An interactive code editor', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001107', '02F00000-0000-4000-8000-000000000527', 'The function performance dashboard', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001108', '02F00000-0000-4000-8000-000000000527', 'An immutable snapshot of code and settings', TRUE,  4),
  -- Q9 (0528)q4: alias
  ('02F00000-0000-4000-8000-000000001109', '02F00000-0000-4000-8000-000000000528', 'To double the memory limit', FALSE, 1),
  ('02F00000-0000-4000-8000-000000001110', '02F00000-0000-4000-8000-000000000528', 'To repoint a stable ARN to a new version', TRUE,  2),
  ('02F00000-0000-4000-8000-000000001111', '02F00000-0000-4000-8000-000000000528', 'To encrypt the function source', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001112', '02F00000-0000-4000-8000-000000000528', 'To delete old published versions', FALSE, 4),
  -- Q9 (0529)q5: serverless-first
  ('02F00000-0000-4000-8000-000000001113', '02F00000-0000-4000-8000-000000000529', 'Small single-purpose functions with managed services', TRUE,  1),
  ('02F00000-0000-4000-8000-000000001114', '02F00000-0000-4000-8000-000000000529', 'One large function for the whole application', FALSE, 2),
  ('02F00000-0000-4000-8000-000000001115', '02F00000-0000-4000-8000-000000000529', 'Virtual machines for everything', FALSE, 3),
  ('02F00000-0000-4000-8000-000000001116', '02F00000-0000-4000-8000-000000000529', 'Storing all state in function memory', FALSE, 4)
ON CONFLICT (id) DO NOTHING;