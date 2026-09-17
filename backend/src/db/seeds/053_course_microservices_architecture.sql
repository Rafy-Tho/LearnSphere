-- ============================================================================
-- SEED 053: Complete course — "Microservices Architecture"
-- ----------------------------------------------------------------------------
-- Instructor : Elena Rodriguez    (10000000-0000-4000-8000-000000000005)
-- Category   : Software Design & Architecture (20000000-0000-4000-8000-000000000010)
-- Level      : ADVANCED · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Foundations of Microservices → C1 Monolith vs Microservices · C2 Service Decomposition
--   M2 Communication & the Edge    → C3 Inter-Service Communication · C4 API Gateways & Service Discovery
--   M3 Resilience & Data           → C5 Resilience Patterns · C6 Data per Service & Consistency
--   M4 Operations                  → C7 Containers & Orchestration · C8 Observability & Testing
--   M5 Capstone: Monolith Migration → C9 The Migration Playbook · C10 Building & Validating
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
  '03500000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000005',
  '20000000-0000-4000-8000-000000000010',
  'Microservices Architecture',
  'microservices-architecture',
  'Design, build, and operate microservices with confidence. Master the trade-offs of splitting monoliths, communication patterns, resilience, data ownership, containers, observability, and a real capstone migration.',
  'PUBLISHED',
  'ADVANCED',
  'SUBSCRIPTION',
  51
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03500000-0000-4000-8000-000000000011', '03500000-0000-4000-8000-000000000001', 'Compare monolithic and microservice architectures and choose the right fit for a given domain.',            1),
  ('03500000-0000-4000-8000-000000000012', '03500000-0000-4000-8000-000000000001', 'Decompose a system into cohesive services using bounded contexts and business capabilities.',                2),
  ('03500000-0000-4000-8000-000000000013', '03500000-0000-4000-8000-000000000001', 'Design synchronous and asynchronous inter-service communication behind a gateway with discovery.',           3),
  ('03500000-0000-4000-8000-000000000014', '03500000-0000-4000-8000-000000000001', 'Apply timeouts, retries, circuit breakers, and sagas to keep distributed workflows consistent.',              4),
  ('03500000-0000-4000-8000-000000000015', '03500000-0000-4000-8000-000000000001', 'Operate and observe microservices with containers, orchestration, and the three pillars of observability.',  5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03500000-0000-4000-8000-000000000101', '03500000-0000-4000-8000-000000000001', 1, 'Foundations of Microservices', 'Compare monoliths and microservices, then decompose bounded systems into services.',     'PUBLISHED'),
  ('03500000-0000-4000-8000-000000000102', '03500000-0000-4000-8000-000000000001', 2, 'Communication & the Edge',     'Link services with sync and async patterns behind a gateway with discovery.',          'PUBLISHED'),
  ('03500000-0000-4000-8000-000000000103', '03500000-0000-4000-8000-000000000001', 3, 'Resilience & Data',            'Absorb failures with timeouts, retries, breakers, and sagas, and own data per service.', 'PUBLISHED'),
  ('03500000-0000-4000-8000-000000000104', '03500000-0000-4000-8000-000000000001', 4, 'Operations',                   'Package in containers, orchestrate deployments, and observe and test the mesh.',         'PUBLISHED'),
  ('03500000-0000-4000-8000-000000000105', '03500000-0000-4000-8000-000000000001', 5, 'Capstone: Monolith Migration', 'Extract a real service from a monolith and harden it end to end.',                      'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03500000-0000-4000-8000-000000000201', '03500000-0000-4000-8000-000000000101', 1, 'Monolith vs Microservices', 'Define the trade-off space between the two styles.',            'PUBLISHED'),
  ('03500000-0000-4000-8000-000000000202', '03500000-0000-4000-8000-000000000101', 2, 'Service Decomposition',     'Turn domains into independently owned services.',               'PUBLISHED'),
  ('03500000-0000-4000-8000-000000000203', '03500000-0000-4000-8000-000000000102', 1, 'Inter-Service Communication', 'Choose synchronous and asynchronous contracts.',              'PUBLISHED'),
  ('03500000-0000-4000-8000-000000000204', '03500000-0000-4000-8000-000000000102', 2, 'API Gateways & Service Discovery', 'Route traffic and find services at runtime.',                'PUBLISHED'),
  ('03500000-0000-4000-8000-000000000205', '03500000-0000-4000-8000-000000000103', 1, 'Resilience Patterns',       'Timeouts, retries, and circuit breakers.',                      'PUBLISHED'),
  ('03500000-0000-4000-8000-000000000206', '03500000-0000-4000-8000-000000000103', 2, 'Data per Service & Consistency', 'Owned data, eventual consistency, and sagas.',             'PUBLISHED'),
  ('03500000-0000-4000-8000-000000000207', '03500000-0000-4000-8000-000000000104', 1, 'Containers & Orchestration', 'Package and schedule services on a cluster.',                  'PUBLISHED'),
  ('03500000-0000-4000-8000-000000000208', '03500000-0000-4000-8000-000000000104', 2, 'Observability & Testing',   'Log, trace, and prove behavior in production.',                 'PUBLISHED'),
  ('03500000-0000-4000-8000-000000000209', '03500000-0000-4000-8000-000000000105', 1, 'The Migration Playbook',    'Plan incremental extraction with the strangler fig.',           'PUBLISHED'),
  ('03500000-0000-4000-8000-000000000210', '03500000-0000-4000-8000-000000000105', 2, 'Capstone Build & Validation', 'Ship a hardened shipment service.',                           'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03500000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03500000-0000-4000-8000-000000000301', '03500000-0000-4000-8000-000000000201', 1, 'The Monolith Problem',            'Recognize the strengths and pain points of a monolith deployment.',      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03500000-0000-4000-8000-000000000302', '03500000-0000-4000-8000-000000000201', 2, 'When Microservices Win',           'Define microservices and weigh their benefits against their costs.',      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03500000-0000-4000-8000-000000000303', '03500000-0000-4000-8000-000000000201', 3, 'Microservices Foundations Quiz',   'Check your grasp of the trade-off between the two styles.',               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03500000-0000-4000-8000-000000000304', '03500000-0000-4000-8000-000000000202', 1, 'Decomposition Strategies',         'Split a system along business capability and subdomain lines.',           'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03500000-0000-4000-8000-000000000305', '03500000-0000-4000-8000-000000000202', 2, 'Bounded Contexts & Domain Modeling','Use domain-driven design to draw stable, honest service borders.',       'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03500000-0000-4000-8000-000000000306', '03500000-0000-4000-8000-000000000202', 3, 'Service Decomposition Quiz',       'Verify your decomposition decisions.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03500000-0000-4000-8000-000000000307', '03500000-0000-4000-8000-000000000203', 1, 'Inter-Service Communication Patterns', 'Match REST, RPC, and messaging to each interaction.',                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03500000-0000-4000-8000-000000000308', '03500000-0000-4000-8000-000000000203', 2, 'Events & Asynchronous Messaging',  'Loosen coupling with queues, topics, and events.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03500000-0000-4000-8000-000000000309', '03500000-0000-4000-8000-000000000203', 3, 'Communication Patterns Quiz',      'Test how services should talk to each other.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03500000-0000-4000-8000-000000000310', '03500000-0000-4000-8000-000000000204', 1, 'API Gateways & BFFs',              'Centralize edge concerns behind a single entry point.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03500000-0000-4000-8000-000000000311', '03500000-0000-4000-8000-000000000204', 2, 'Service Discovery & Dynamic Routing', 'Find healthy instances as services scale.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03500000-0000-4000-8000-000000000312', '03500000-0000-4000-8000-000000000204', 3, 'Gateways & Discovery Quiz',        'Confirm edge routing and discovery knowledge.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03500000-0000-4000-8000-000000000313', '03500000-0000-4000-8000-000000000205', 1, 'Timeouts, Retries & Backoff',      'Bound wait times and retry safely under load.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03500000-0000-4000-8000-000000000314', '03500000-0000-4000-8000-000000000205', 2, 'Circuit Breakers & Bulkheads',     'Fail fast and isolate faults before they cascade.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03500000-0000-4000-8000-000000000315', '03500000-0000-4000-8000-000000000205', 3, 'Resilience Patterns Quiz',         'Prove you can contain failures.',                                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03500000-0000-4000-8000-000000000316', '03500000-0000-4000-8000-000000000206', 1, 'Data per Service & Database Sprawl', 'Give every service ownership of its own data.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03500000-0000-4000-8000-000000000317', '03500000-0000-4000-8000-000000000206', 2, 'Eventual Consistency & Sagas',     'Coordinate multi-service workflows without distributed transactions.',     'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03500000-0000-4000-8000-000000000318', '03500000-0000-4000-8000-000000000206', 3, 'Data & Consistency Quiz',          'Check data ownership and saga reasoning.',                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03500000-0000-4000-8000-000000000319', '03500000-0000-4000-8000-000000000207', 1, 'Containers & Orchestration',       'Package services as images and schedule them on a cluster.',               'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03500000-0000-4000-8000-000000000320', '03500000-0000-4000-8000-000000000207', 2, 'Deployment Models & Service Mesh', 'Ship progressive releases and add mesh-level traffic control.',            'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03500000-0000-4000-8000-000000000321', '03500000-0000-4000-8000-000000000207', 3, 'Containers & Orchestration Quiz',  'Test your cluster and deployment knowledge.',                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03500000-0000-4000-8000-000000000322', '03500000-0000-4000-8000-000000000208', 1, 'Observability: Logs, Metrics & Traces', 'Make microservices inspectable with the three pillars.',            'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03500000-0000-4000-8000-000000000323', '03500000-0000-4000-8000-000000000208', 2, 'Testing Microservices',            'Validate contracts, units, and integrations continuously.',                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03500000-0000-4000-8000-000000000324', '03500000-0000-4000-8000-000000000208', 3, 'Observability & Testing Quiz',     'Verify you can observe and test a distributed system.',                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03500000-0000-4000-8000-000000000325', '03500000-0000-4000-8000-000000000209', 1, 'The Strangler Fig & Migration Playbook', 'Extract a monolith incrementally, never in one big bang.',          'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03500000-0000-4000-8000-000000000326', '03500000-0000-4000-8000-000000000210', 1, 'Capstone: Building the Shipment Service', 'Design, code, and package a new shipment service.',              'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03500000-0000-4000-8000-000000000327', '03500000-0000-4000-8000-000000000210', 2, 'Capstone: End-to-End Validation',  'Wire the service, harden it, and validate the whole flow.',                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03500000-0000-4000-8000-000000000328', '03500000-0000-4000-8000-000000000210', 3, 'Final Assessment',                 'Prove end-to-end mastery of microservices architecture.',                   'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03500000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03500000-0000-4000-8000-000000000401',
  '03500000-0000-4000-8000-000000000301',
  1,
  'The Monolith Problem',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Monolith Problem</title>
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
  <h1>The Monolith Problem</h1>
  <p>A <strong>monolith</strong> is an application built as a single deployable unit: one codebase, one build, one process, and usually one shared database. Most successful systems start exactly this way, and for years the monolith was simply <em>how</em> software was written.</p>
  <p>The problem is not the monolith itself — it is the way monoliths <strong>age</strong>. As a business grows, the single unit grows with it, and every change, release, and team starts squeezing through the same door.</p>
  <h2>One unit, one team, one release</h2>
  <p>In a monolith every feature lives in the same process. A checkout flow and a recommendation engine share the codebase, the memory, and the deployment:</p>
  <pre class="code-block">monolith/               # single deployable unit
  src/
    orders/             # orders module
    billing/            # billing module
    recommendations/    # recommendations module
  build_me.sh           # one pipeline builds everything</pre>
  <p>Because modules share a process, they also share infrastructure: one <span class="ic">schema</span>, one application server, one scaling unit.</p>
  <h2>Advantages you give up slowly</h2>
  <p>Monoliths are not clumsy; they are efficient:</p>
  <ul>
    <li><strong>Simple debugging</strong> — one process, one log stream, one stack trace.</li>
    <li><strong>Atomic transactions</strong> — a single database keeps consistency trivial.</li>
    <li><strong>Fast to start</strong> — no service wiring, networks, or contracts.</li>
    <li><strong>Cheap operations</strong> — one artifact, one deploy, one monitor.</li>
  </ul>
  <h2>Where a monolith breaks</h2>
  <p>The pain is rarely in year one. It arrives with scale — in people, features, or traffic:</p>
  <table>
    <tr><th>Symptom</th><th>Root cause</th></tr>
    <tr><td>Deployments take an hour and touch unrelated features</td><td>Everything ships together</td></tr>
    <tr><td>Merge conflicts on every pull request</td><td>Many teams editing one tree</td></tr>
    <tr><td>One heavy query slows the whole site</td><td>Shared database and process</td></tr>
    <tr><td>Cannot scale the checkout independently</td><td>One scaling unit for all work</td></tr>
    <tr><td>New hires cannot find where a feature lives</td><td>Unbounded module boundary</td></tr>
  </table>
  <p><strong>Stability coupling</strong> is the real killer: a bug in the review banner can take down the payment path, because nothing isolates one module from another.</p>
  <div class="callout callout-info">
    <strong>Honest view</strong>
    <p>Most monoliths are perfectly fine for a long time. The decision to split is a business decision about <em>autonomy and change velocity</em>, not a badge of sophistication.</p>
  </div>
  <h2>When a monolith still shines</h2>
  <ul>
    <li>A small team shipping a simple domain quickly.</li>
    <li>A product in discovery where the boundaries are not yet known.</li>
    <li>Systems where consistency matters more than independent scale.</li>
  </ul>
  <p>Starting as a monolith is the industry default for good reasons. The next lesson looks at when — and how — splitting that unit into microservices pays off.</p>
  <div class="callout callout-tip">
    <strong>Mental model</strong>
    <p>Microservices swap <em>shared process</em> for <em>shared contract</em>. The price of isolation is the network, and the network fails. Keep that trade in mind for the whole course.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000402',
  '03500000-0000-4000-8000-000000000302',
  1,
  'When Microservices Win',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>When Microservices Win</title>
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
  <h1>When Microservices Win</h1>
  <p>A <strong>microservice</strong> is a small, independently deployable service that owns a narrow piece of business capability. A system built from them runs as many processes — each small, each with its own data, and each deployable on its own schedule.</p>
  <p>Martin Fowler defines the core differently from size alone: microservices are about <strong>independence</strong>. The whole benefit rests on two properties — <em>independent deployment</em> and <em>independent scaling</em> — and everything else follows from them.</p>
  <h2>Defining characteristics</h2>
  <ul>
    <li><strong>Single capability</strong> — does one job well, not a horizontal slice of many.</li>
    <li><strong>Own data</strong> — its schema is private; others reach it through an API.</li>
    <li><strong>Independently deployable</strong> — its artifact can ship without coordinating with peers.</li>
    <li><strong>Autonomous team</strong> — the owning team can run it end to end.</li>
    <li><strong>Boundary via network</strong> — the only coupling is the contract between services.</li>
  </ul>
  <h2>The trade-off surface</h2>
  <table>
    <tr><th>Dimension</th><th>Monolith</th><th>Microservices</th></tr>
    <tr><td>Deploy unit</td><td>One artifact</td><td>Many artifacts</td></tr>
    <tr><td>Data</td><td>Shared schema</td><td>Per-service schema</td></tr>
    <tr><td>Release cadence</td><td>Single coordinated event</td><td>Continuous, per service</td></tr>
    <tr><td>Failure scope</td><td>Whole process at risk</td><td>Blast radius by design</td></tr>
    <tr><td>Team autonomy</td><td>Shared ownership</td><td>Independent ownership</td></tr>
    <tr><td>Operational burden</td><td>Low</td><td>High — networks, tracing, discovery</td></tr>
  </table>
  <p>Notice the last row. Microservices move complexity out of the code and into the <strong>operating environment</strong>. You trade a hard-to-scale process for a hard-to-operate system.</p>
  <h2>When they win</h2>
  <p>The architecture pays off when the organization has multiple streams of work that need different cadences:</p>
  <ul>
    <li>Large teams, where one tree creates conflict and slow releases.</li>
    <li>Uneven load across features (checkout spikes, reporting never does).</li>
    <li>Technology fit per capability (a language that suits streaming, not the rest).</li>
  </ul>
  <h2>When they lose</h2>
  <div class="callout">
    <strong>Beware the hype tax</strong>
    <p>With a team of five, microservices mostly add friction: three services to deploy, a message broker to babysit, and a debugger that jumps across processes. The complexity budget is real and must be spent deliberately.</p>
  </div>
  <ul>
    <li>Unclear domain boundaries — you can split the app but not the confusion.</li>
    <li>Distributed monolith risk — services that still share a database and deploy together.</li>
    <li>No operational maturity — no CI, no monitoring, no rollback muscle.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Rule of thumb</strong>
    <p>Split when the cost of the deployment is greater than the cost of the network. Do not split to look modern — split to move faster, and only where the velocity gain is real.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000404',
  '03500000-0000-4000-8000-000000000304',
  1,
  'Decomposition Strategies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Decomposition Strategies</title>
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
  <h1>Decomposition Strategies</h1>
  <p>Splitting a monolith is an act of <strong>finding seams</strong>, not inventing them. The goal is a set of services where each one maps to a clear business capability and the seams — the costly boundaries between them — land where reality already divides work.</p>
  <h2>Decompose by business capability</h2>
  <p>Look at the organization, not the code. A retailer has capabilities like <em>Orders</em>, <em>Billing</em>, <em>Inventory</em>, <em>Shipments</em>, and <em>Customer Accounts</em>. Each maps to a service and, ideally, to a team:</p>
  <pre class="code-block">orders      → Orders Service      (own team, own schema)
billing     → Billing Service
inventory   → Inventory Service
shipments   → Shipment Service
accounts    → Customer Service</pre>
  <p>This is the strongest driver because it aligns ownership: one team owns one service end to end, and cross-service change means a cross-team negotiation — exactly what should be rare.</p>
  <h2>Decompose by subdomain</h2>
  <p>Domain-driven design adds a sharper lens: break the domain into <strong>subdomains</strong>. Core subdomains (the competitive heart) deserve the best engineers and cleanest borders; supporting and generic subdomains can be bought or kept simple:</p>
  <table>
    <tr><th>Subdomain</th><th>Kind</th><th>Example</th></tr>
    <tr><td>Pricing engine</td><td>Core</td><td>Differentiation, must own</td></tr>
    <tr><td>Notifications</td><td>Supporting</td><td>Needed, keep small</td></tr>
    <tr><td>Identity / SSO</td><td>Generic</td><td>Buy it, integrate it</td></tr>
  </table>
  <h2>Decompose by verbs, not nouns</h2>
  <p>A tempting shortcut splits by layers: an API service, a business-logic service, a data service. That produces the classic <strong>distributed monolith</strong> — every feature still needs all three to answer, so no team is autonomous and every request fans across the network. Decompose by <em>flows</em>, not by technical layer.</p>
  <h2>Pitfalls to avoid</h2>
  <ul>
    <li><strong>Shared database as glue</strong> — two services writing one schema are one service wearing a costume.</li>
    <li><strong>Chatty fragments</strong> — when a user action needs sixteen calls, the seam was drawn in the wrong place.</li>
    <li><strong>Too-small services</strong> — a service with a single CRUD table and no team autonomy earns no benefit.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Sizing heuristic</strong>
    <p>Sam Newman's test: a service should be sized so the owning team's great majority of changes touch <em>that service only</em>. If cross-service releases dominate, the boundary is wrong.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Boundaries are a decision</strong>
    <p>You will get some wrong. Plan for merging and re-splitting as the domain becomes clearer — the strangler approach in module 5 makes that cheap.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000405',
  '03500000-0000-4000-8000-000000000305',
  1,
  'Bounded Contexts & Domain Modeling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bounded Contexts & Domain Modeling</title>
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
  <h1>Bounded Contexts &amp; Domain Modeling</h1>
  <p>Eric Evans gave architecture its sharpest tool: the <strong>bounded context</strong>. It is the boundary inside which a model of the domain is consistent — where a term like <span class="ic">Order</span> means exactly one thing and a single team owns its truth.</p>
  <p>Outside the boundary, the same word can mean something <em>different</em>, and that is healthy. Sales and Logistics both say "order" and mean different things. Microservice boundaries should follow these context boundaries, not fight them.</p>
  <h2>The ubiquitous language</h2>
  <p>Inside a context, domain experts, engineers, and product people speak one <strong>ubiquitous language</strong>. The words in the code match the words in the meeting:</p>
  <pre class="code-block">// Sales context                        // Shipments context
class Order {                           class Shipment {
  items, total, status                    orderId, carrier, tracking
}                                       }
// v1.0 dispatched means paid          // v2.1 dispatched means with courier</pre>
  <p>Same word, two meanings, two contexts — and two services. Forcing one shared <span class="ic">Order</span> model across both is the root of most "shared kernel" pain.</p>
  <h2>Aggregates and invariants</h2>
  <p>Within a context, model <strong>aggregates</strong>: clusters of objects that must stay consistent together. An <span class="ic">Order</span> and its <span class="ic">OrderLines</span> form one aggregate; the total must always equal the sum of its lines. The aggregate root (<span class="ic">Order</span>) is the only entry point, so its invariant is never broken by an outsider.</p>
  <p>Ask: <em>which group of data changes atomically?</em> That group is one aggregate, and aggregates rarely cross service boundaries by design. If two aggregates need to stay consistent, an <strong>event</strong> coordinates them (module 3), and a <strong>saga</strong> compensates on failure (module 3 of this track).</p>
  <h2>A context map</h2>
  <p>Draw how contexts relate. The common patterns:</p>
  <table>
    <tr><th>Relationship</th><th>Meaning</th><th>Microservice fit</th></tr>
    <tr><td>Customer / Supplier</td><td>One publishes, one consumes</td><td>Clean — API or events</td></tr>
    <tr><td>Shared Kernel</td><td>Two contexts share a model</td><td>Risky — coupling ahead</td></tr>
    <tr><td>Anti-Corruption Layer</td><td>A translator protects a context</td><td>Great — wrap legacy worlds</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Map first</strong>
    <p>Spend the afternoon drawing your context map before touching code. The seams you find there are the seams you should cut later.</p>
  </div>
  <h2>From context to service</h2>
  <ol>
    <li>Find the core subdomains and their languages.</li>
    <li>Draw context boundaries where the language changes.</li>
    <li>Place aggregates inside one context.</li>
    <li>Name the service after the capability: <span class="ic">shipment-service</span>, not <span class="ic">data-access-service</span>.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Beware a shared database</strong>
    <p>If two contexts write the same table, they share a model whether or not you admit it. Databases are the most tenacious glue in a system — module 5 shows how to cut it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000407',
  '03500000-0000-4000-8000-000000000307',
  1,
  'Inter-Service Communication Patterns',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inter-Service Communication Patterns</title>
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
  <h1>Inter-Service Communication Patterns</h1>
  <p>Once you have services, you must choose how they talk. The first decision is <strong>synchronous or asynchronous</strong> — does the caller wait for an answer, or hand off work and move on?</p>
  <table>
    <tr><th>Style</th><th>Behavior</th><th>Best for</th><th>Cost</th></tr>
    <tr><td>Sync request-reply</td><td>Caller blocks for a response</td><td>Queries, CRUD, commands needing confirmation</td><td>Availability coupling</td></tr>
    <tr><td>Async messaging</td><td>Caller publishes and returns</td><td>Events, fan-out, long work, integration</td><td>Consistency logic</td></tr>
  </table>
  <h2>REST, RPC, and everything sync</h2>
  <p><span class="ic">REST</span> over HTTP is the default: simple, debuggable, cacheable. <span class="ic">gRPC</span> adds a schema, HTTP/2 multiplexing, and typed calls — faster, but harder to debug:</p>
  <pre class="code-block">// REST — get a shipment
GET /shipments/{id}
200 {"id": "shp_1", "status": "dispatched"}

// gRPC — typed request, no HTTP verb ceremony
service ShipmentService {
  rpc GetShipment (ShipmentId) returns (Shipment);
}</pre>
  <h2>Choose by interaction need</h2>
  <ul>
    <li><strong>Need the answer now</strong> → synchronous call (with a timeout — module 5, resilience).</li>
    <li><strong>Just record that something happened</strong> → publish an event, do not wait.</li>
    <li><strong>Fan-out to many listeners</strong> → topic, never a loop of synchronous calls.</li>
  </ul>
  <h2>Contracts are the real boundary</h2>
  <p>Whatever the transport, the service boundary is its <strong>contract</strong> — the shape that must keep working for every consumer. Rules that prevent breakage:</p>
  <ul>
    <li><strong>Additive changes first</strong> — new fields and new optional routes are safe.</li>
    <li><strong>Version explicitly</strong> — <span class="ic">/v2/shipments</span>, or a header, when semantics change.</li>
    <li><strong>Make writes idempotent</strong> — a retried request must not double-book a shipment.</li>
    <li><strong>Never let a consumer read your database</strong> — the contract is the only door.</li>
  </ul>
  <h2>Idempotency on the wire</h2>
  <pre class="code-block">POST /shipments        # client sends
Idempotency-Key: 9f1c  # the same key twice = same result

# second identical retry returns the FIRST response, no duplicate side effect</pre>
  <div class="callout callout-tip">
    <strong>Decide sync vs async per interaction</strong>
    <p>Do not pick one style site-wide. Checkout confirms availability synchronously; "send me a receipt" and "update my feed" are events. Mix deliberately.</p>
  </div>
  <div class="callout callout-info">
    <strong>Anti-pattern: the chained sync circus</strong>
    <p>A→B→C→D on one request multiplies latency and failure odds. A gateway can aggregate (module 4) and a saga can handle multi-step work (module 6 of this course) — both beat six nested calls.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000408',
  '03500000-0000-4000-8000-000000000308',
  1,
  'Events & Asynchronous Messaging',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Events & Asynchronous Messaging</title>
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
  <h1>Events &amp; Asynchronous Messaging</h1>
  <p>Asynchronous messaging removes the biggest microservices tax — <strong>availability coupling</strong>. A producer publishes and returns; consumers react in their own time. No one waits on the slower service; no call chain collapses in a line.</p>
  <h2>The cast: broker, queue, topic</h2>
  <p>A <strong>broker</strong> (RabbitMQ, Kafka, AWS SQS/SNS) sits in the middle. Two delivery shapes matter:</p>
  <table>
    <tr><th>Shape</th><th>Delivery</th><th>Use case</th></tr>
    <tr><td>Queue</td><td>One consumer takes each message (work distribution)</td><td>Jobs: "send label to printer"</td></tr>
    <tr><td>Topic</td><td>Every subscriber gets a copy (fan-out)</td><td>Events: "order.dispatched" → billing + analytics + owner</td></tr>
  </table>
  <h2>Publish once, react many times</h2>
  <pre class="code-block">// producer publishes a fact
event = {
  "type": "shipment.dispatched",
  "id": "evt_8f31",
  "payload": { "shipmentId": "shp_1", "orderId": "ord_9" },
  "occurredAt": "2026-09-17T10:22:35Z"
}

// consumers subscribe to the same topic, independently
billing.subscribe("shipment.dispatched")
analytics.subscribe("shipment.dispatched")</pre>
  <h2>Event types</h2>
  <ul>
    <li><strong>Event notification</strong> — "something happened here", no data dump; consumers query back if needed.</li>
    <li><strong>Event-carried state transfer</strong> — the event carries the data, so consumers avoid a back-call.</li>
    <li><strong>Command</strong> — "please do this" (a request, not a fact); paired with queues for work distribution.</li>
  </ul>
  <h2>Hard parts that are normal</h2>
  <ul>
    <li><strong>Ordering</strong> — Kafka keeps order per partition; RabbitMQ generally does not. Design for out-of-order arrival or pay for ordering.</li>
    <li><strong>At-least-once delivery</strong> — brokers redeliver on failure. Make consumers <strong>idempotent</strong> by tracking processed event ids.</li>
    <li><strong>Dead-letter queues</strong> — poison messages that keep failing go to a DLQ for inspection instead of blocking the stream.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Exactly-once is a myth</strong>
    <p>Production systems get <em>exactly-once processing</em> out of at-least-once delivery plus idempotent consumers: deduplicate on the event id, then apply the side effect once.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Events are facts</strong>
    <p>Name events in past tense, immutable, versioned by a schema. You can publish the same fact to ten future consumers without them knowing.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000410',
  '03500000-0000-4000-8000-000000000310',
  1,
  'API Gateways & BFFs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>API Gateways & BFFs</title>
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
  <h1>API Gateways &amp; BFFs</h1>
  <p>Clients should not know there are ten services behind the door. An <strong>API gateway</strong> is the single, managed entry point that sits between clients and the fleet — one base URL for the outside world, and internal routing behind it.</p>
  <pre class="code-block">client  ──►  gateway  ──►  /orders → orders-service
            /api/v1     ──►  /shipments → shipment-service
                        ──►  /billing → billing-service</pre>
  <h2>What the gateway own</h2>
  <ul>
    <li><strong>Routing</strong> — map <span class="ic">/api/v1/orders</span> to the right service and version.</li>
    <li><strong>Authentication &amp; authorization</strong> — validate the token once at the edge, forward identity to services.</li>
    <li><strong>Rate limiting</strong> — protect the fleet per client while different services stay independent.</li>
    <li><strong>TLS termination</strong> and header hygiene.</li>
    <li><strong>Aggregation</strong> — compose a page from several services with one round trip.</li>
  </ul>
  <h2>BFF: gateway per client</h2>
  <p>A single gateway that shapes everything for everyone becomes a fan-in bottleneck. The <strong>Backend-for-Frontend</strong> pattern gives each client its own gateway, shaped to that screen:</p>
  <pre class="code-block">web-client  → web-bff   →  { orders, shipments, account }
mobile-app  → mobile-bff →  { lightweight payload, offline-first }</pre>
  <p>A phone does not want the desktop payload. Each BFF owns its client's shape and its own team.</p>
  <h2>Health, the load balancer style</h2>
  <p>The gateway needs to know which instances are alive. Route by <span class="ic">DNS name</span>, and the orchestrator or registry (lesson 0311) tells it where healthy replicas are:</p>
  <pre class="code-block">path /orders → service orders-service
  instance orders-service-86b-1 :8080  (healthy)
  instance orders-service-86b-2 :8080  (draining → skip)</pre>
  <h2>Downsides to plan around</h2>
  <ul>
    <li><strong>Single point of failure</strong> — run at least two replicas; the gateway is low-spec but must never be the only load.</li>
    <li><strong>Gateway drift</strong> — a gateway that grows business logic becomes a mini-monolith. Keep it thin and routing-focused.</li>
    <li><strong>Aggregation timeouts</strong> — treat each aggregation leg with its own timeout so a slow leg cannot stall the page.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Start thin</strong>
    <p>Begin with routing, auth, and TLS only. Add rate limits and aggregation when real numbers justify it — every feature on the gateway is a feature you must not break.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000411',
  '03500000-0000-4000-8000-000000000311',
  1,
  'Service Discovery & Dynamic Routing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Service Discovery & Dynamic Routing</title>
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
  <h1>Service Discovery &amp; Dynamic Routing</h1>
  <p>Microservices restart, scale up, and scale down constantly. A caller cannot hardcode an IP — the instance may be gone in a minute. <strong>Service discovery</strong> answers one question: <em>where is a healthy instance of the service I need right now?</em></p>
  <h2>The registry pattern</h2>
  <p>A <strong>service registry</strong> holds the current map of name → live instances:</p>
  <pre class="code-block">REGISTRY
  orders-service    → 10.0.0.11:8080, 10.0.0.12:8080
  shipment-service  → 10.0.0.21:8080
  billing-service   → 10.0.0.31:8080

# a service starts → registers with a heartbeat
# a service dies   → heartbeat stops → entry evicted</pre>
  <p>Registries appear everywhere: <span class="ic">Consul</span>, <span class="ic">Eureka</span>, <span class="ic">etcd</span>, or the built-in DNS of a Kubernetes cluster. In Kubernetes, a Service name is itself a discoverable DNS address that load-balances to healthy pods.</p>
  <h2>Client-side vs server-side discovery</h2>
  <table>
    <tr><th>Approach</th><th>Who resolves</th><th>Path</th><th>Trade-off</th></tr>
    <tr><td>Client-side</td><td>Caller (or sidecar)</td><td>Caller → registry → instance</td><td>Scale: no central proxy in the path; needs registry smarts per call</td></tr>
    <tr><td>Server-side</td><td>A load balancer</td><td>Caller → LB → registry-aware pool</td><td>Simple clients; the LB is a hop and a scale point</td></tr>
  </table>
  <p>Kubernetes blends both: DNS resolves the Service name, and iptables or kube-proxy forwards only to <em>ready</em> pods.</p>
  <h2>Health checks make discovery truthful</h2>
  <p>A "running" process is not the same as a "serving" process. The registry must trust the service's own signals:</p>
  <ul>
    <li><strong>Liveness</strong> — am I running? If no, restart me.</li>
    <li><strong>Readiness</strong> — can I serve traffic? If no, take me out of the rotation but do not kill me.</li>
  </ul>
  <pre class="code-block"># flask-style readiness endpoint
@app.route("/health/ready")
def ready():
    if db_is_reachable() and not draining:
        return "ok", 200
    return "not ready", 503</pre>
  <div class="callout callout-info">
    <strong>Draining, not dying</strong>
    <p>Before a scaled-down instance stops, it should stop receiving new requests, finish in-flight ones, then exit. Discovery-compliant drains are what make zero-downtime scaling real.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Cache with care</strong>
    <p>Clients cache registry lookups to reduce chatter; refresh them so scaling still works. Stale entries only survive one refresh, not forever.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000413',
  '03500000-0000-4000-8000-000000000313',
  1,
  'Timeouts, Retries & Backoff',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Timeouts, Retries & Backoff</title>
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
  <h1>Timeouts, Retries &amp; Backoff</h1>
  <p>In a distributed system the network is a third party, and third parties fail. The first line of defense is disciplined <strong>waiting</strong>: never hold a caller hostage to a response that will never come.</p>
  <h2>Timeouts: bound every wait</h2>
  <p>Every outbound call needs an upper bound. A pending request ties up a thread, a connection, and the caller's patience — and if all callers hang on a stuck service, the fleet stalls together:</p>
  <pre class="code-block"># python-style
resp = requests.get("http://shipments.internal/shipments/1",
                    timeout=(2.5, 5))   # connect + read timeouts</pre>
  <p>Defaults to be skeptical of: connection 500 ms, read 2–5 s, and a total request budget at the caller so a chain of calls still finishes on time.</p>
  <h2>Retries: only for safe faults</h2>
  <p>A retry helps with <em>transient</em> failures: connection reset, timeout, 502/503/504, throttling. It is wasted on <span class="ic">400</span> and dangerous on writes without idempotency.</p>
  <ul>
    <li><span class="ic">GET / 5xx</span> — safe to retry.</li>
    <li><span class="ic">POST</span> — retry only with an idempotency key.</li>
    <li><span class="ic">4xx</span> — never retry; the request itself is wrong.</li>
  </ul>
  <h2>Exponential backoff + jitter</h2>
  <p>If every caller retries at the same moment, the retries synchronize into a <strong>thundering herd</strong>. Spread them with exponential growth plus random jitter:</p>
  <pre class="code-block">delay = base * 2 ** attempt + random(0, base)
# attempt 0 → ~1s, attempt 1 → ~2s, attempt 2 → ~4s … capped at max_delay</pre>
  <p>Also honor the <span class="ic">Retry-After</span> header when a server tells you it is busy — that is the server negotiating on your behalf.</p>
  <h2>Idempotency keys: retry agreement</h2>
  <p>Make the retry harmless. The client sends a key; the server remembers the result; a second identical attempt returns the first outcome instead of running twice:</p>
  <pre class="code-block">POST /shipments        Idempotency-Key: 7c21   → 201 created (id shp_2)
POST /shipments        Idempotency-Key: 7c21   → 201 SAME shipment, no duplicate</pre>
  <h2>Budget discipline</h2>
  <div class="callout callout-tip">
    <strong>One global timeout budget</strong>
    <p>Pick a service timeout (say 2s), and subtract downstream budgets from it. Client → 2s → gateway/service spends 300 ms upstream + 1.5s on its own call. Never let nested timeouts stack to infinity.</p>
  </div>
  <div class="callout callout-info">
    <strong>When to stop retrying</strong>
    <p>Cap attempts (2–3) and total time. Repeating past that point is wishful thinking — return a clean failure so the circuit breaker (next lesson) can take over.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000414',
  '03500000-0000-4000-8000-000000000314',
  1,
  'Circuit Breakers & Bulkheads',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Circuit Breakers & Bulkheads</title>
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
  <h1>Circuit Breakers &amp; Bulkheads</h1>
  <p>Retries cannot save a service that is genuinely down — they only make it worse. When a downstream is failing, the strongest move is to <strong>stop calling it</strong>. That is the circuit breaker.</p>
  <h2>Three states</h2>
  <table>
    <tr><th>State</th><th>Behavior</th></tr>
    <tr><td>Closed</td><td>Normal. Calls pass; failures counted as a rolling ratio.</td></tr>
    <tr><td>Open</td><td>After threshold (e.g. 50% errors in 10s): calls fail instantly, no traffic reaches the service.</td></tr>
    <tr><td>Half-open</td><td>After a cooldown, the breaker lets a few probe calls through. Success → close; failure → open again.</td></tr>
  </table>
  <pre class="code-block"># resilience4j-style config
circuitBreaker:
  failureRateThreshold: 50
  slidingWindowSize: 10
  waitDurationInOpenState: 30s
  permittedNumberOfCallsInHalfOpenState: 3</pre>
  <h2>Why fail fast wins</h2>
  <p>When B is down, every caller of B spends a timeout budget on a doomed call. Worse, queues fill with slow handlers, and threads pile up until <em>your</em> service runs out of resources — a cascade. Open breakers turn doomed calls into instant responses, so B has room to recover and your service keeps serving the healthy paths.</p>
  <h2>Fallbacks and degradation</h2>
  <p>An open breaker is a perfect place to degrade gracefully: serve a cached value, a default plan, or a clear "recently unavailable" payload instead of an error:</p>
  <pre class="code-block">def get_price(product_id):
    try:
        return pricing_client.get(product_id)
    except BreakerOpen:
        return cached_price(product_id)   # last known good</pre>
  <h2>Bulkheads — isolate the pool</h2>
  <p>A circuit breaker stops <em>requests</em>: a <strong>bulkhead</strong> stops <em>resources</em> from being consumed. Give each dependency its own connection pool, thread pool, and queue so one slow dependency cannot starve the others:</p>
  <pre class="code-block"># rentals analogy: compartments, not one open deck
checkout  → pool of 20 connections (billing)
updates   → pool of 5  connections (recommendations)
# if recommendations hangs, it can only burn its own 5 slots</pre>
  <div class="callout callout-info">
    <strong>Circuit breaker vs bulkhead</strong>
    <p>They complement each other. The breaker says "stop invoking the failing service"; the bulkhead says "even when invocations happen, cap the blast radius of each dependency."</p>
  </div>
  <div class="callout callout-tip">
    <strong>Where they live</strong>
    <p>In-process libraries (Resilience4j, Polly) work per service; a service mesh (lesson 0320) applies the same ideas at the network layer. Start in-process — it is easier to reason about.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000416',
  '03500000-0000-4000-8000-000000000316',
  1,
  'Data per Service & Database Sprawl',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Data per Service & Database Sprawl</title>
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
  <h1>Data per Service &amp; Database Sprawl</h1>
  <p>If two services write the same table, they are one service that happens to run in two processes. The <strong>database-per-service</strong> rule is the load-bearing wall of microservices: <em>each service owns the only schema it may touch, and no other service reads or writes it directly.</em></p>
  <h2>Own data, share contracts</h2>
  <pre class="code-block">orders-service     → owns orders_db  (orders, order_lines)
shipment-service   → owns shipment_db (shipments, carriers)
billing-service    → owns billing_db  (invoices)

# reading another team data? Use its API or subscribe to its events
# never a live cross-service JOIN at 3am in a shared schema</pre>
  <p>This is what makes independent scaling and independent evolution possible: the shipping schema can change shape without a co-ordinated migration with orders.</p>
  <h2>Polyglot persistence</h2>
  <p>Because each service chooses its own store, the right tool can finally fit each job:</p>
  <table>
    <tr><th>Service</th><th>Data shape</th><th>Sensible store</th></tr>
    <tr><td>billing</td><td>Relational, invoices, audit</td><td>PostgreSQL</td></tr>
    <tr><td>recommendations</td><td>Session carts, hot keys</td><td>Redis</td></tr>
    <tr><td>catalog</td><td>Documents with nested variants</td><td>MongoDB</td></tr>
    <tr><td>search</td><td>Full-text + filters</td><td>Elasticsearch</td></tr>
  </table>
  <div class="callout">
    <strong>Polyglot is a tax, not a reward</strong>
    <p>Every extra engine is another thing to back up, secure, and operate. Adopt a second database only when the first one genuinely costs you more than the second one will.</p>
  </div>
  <h2>No shared schema, no shared transactions</h2>
  <p>The trade-off is the death of the atomic multi-table transaction. A checkout that writes orders and billing and shipments used to be one <span class="ic">BEGIN ... COMMIT</span>. Across services there is no global transaction manager you can trust.</p>
  <p>Two healthy answers (both in the next lesson):</p>
  <ul>
    <li><strong>Eventual consistency</strong> — one service commits, publishes an event, and the rest react.</li>
    <li><strong>Sagas</strong> — chain of local transactions with compensating steps to unwind a partial failure.</li>
  </ul>
  <h2>Read-model pattern: CQRS</h2>
  <p>When a detail page needs data from several services with zero fan-in, a service can maintain its own <strong>read model</strong> subscribed to the events it needs:</p>
  <pre class="code-block">order_summary_db.build_me:
  ← on order.placed        (from orders)
  ← on shipment.dispatched (from shipments)
  ← on payment.succeeded   (from billing)</pre>
  <div class="callout callout-tip">
    <strong>Denormalize on purpose</strong>
    <p>Duplication of <em>facts</em> (copied from events) is fine; duplication of <em>truth</em> (writers competing) is not. Read models replicate the first, never the second.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000417',
  '03500000-0000-4000-8000-000000000317',
  1,
  'Eventual Consistency & Sagas',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Eventual Consistency & Sagas</title>
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
  <h1>Eventual Consistency &amp; Sagas</h1>
  <p>Cross-service atomicity is out of reach, so we design for a system that is <em>eventually</em> consistent and can always unwind a partial result. Two tools carry the load: <strong>eventual consistency</strong> as the default posture, and <strong>sagas</strong> for multi-step workflows.</p>
  <h2>What eventual consistency means</h2>
  <p>With one database, a transaction is immediate and global. With services, a fact committed in orders reaches billing a few hundred milliseconds later via an event:</p>
  <pre class="code-block">order placed (orders_db COMMIT)
  └─► publish order.placed
       └─► billing listens → creates invoice (eventually)
       └─► analytics listens → records funnel (eventually)</pre>
  <p>The system is <strong>consistent in the end</strong>, and usually faster than a human would ever notice. (CAP forces the choice: when the network partitions, you pick consistency or availability — microservices lean availability and pay with this lag.)</p>
  <h2>The saga pattern</h2>
  <p>A saga is a sequence of local transactions. Each step commits <em>its own</em> transaction; when a later step fails, <strong>compensating actions</strong> reverse the steps that already ran. Two orchestration styles:</p>
  <h3>Choreographed</h3>
  <p>Each service listens for the next event and acts. No central coordinator — simple, but the flow is harder to see:</p>
  <pre class="code-block">orders.placed → billing.charge → shipment.book → shipping.label
  on shipment failure → shipping.cancel booking (compensation)</pre>
  <h3>Orchestrated</h3>
  <p>A single <strong>saga orchestrator</strong> tells each service what to do and runs the compensations in reverse on failure:</p>
  <pre class="code-block">orchestrator:
  1. call billing.charge          → ok (tx A)
  2. call shipment.book           → ok (tx B)
  3. call warehouse.pick          → FAILED
  compensation: undo step 2, undo step 1   # whole flow aborted cleanly</pre>
  <h2>Compensation, not rollback</h2>
  <div class="callout">
    <strong>No global rollback</strong>
    <p>A compensation is a <em>new</em> transaction that reverses a <em>completed</em> one — a refund invoice, a cancelled booking. It cannot rewind committed data in place, and it must itself be idempotent and traceable.</p>
  </div>
  <h2>Design rules that keep sagas sane</h2>
  <ul>
    <li>Keep each local step short and idempotent (retryable).</li>
    <li>Never leave a step half-applied: COMPLETE or fully compensate.</li>
    <li>Persist saga state so a crash can resume the flow, not restart it.</li>
    <li>Log the saga id on every step — you will query that during outages.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Reach for a saga</strong>
    <p>When a workflow spans services and must be <em>all-or-nothing</em> (place → pay → ship → notify), a saga is the standard answer. When a failure is tolerable without undoing (newsletter copy), an event with a DLQ is enough.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000419',
  '03500000-0000-4000-8000-000000000319',
  1,
  'Containers & Orchestration',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Containers & Orchestration</title>
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
  <h1>Containers &amp; Orchestration</h1>
  <p>Containers are the packaging unit microservices were looking for: a filesystem, runtime, and configuration baked into an <strong>image</strong>, started and stopped in seconds, identical on every machine. The same image that passed CI runs in production — that reproducibility is the point.</p>
  <h2>Container vs virtual machine</h2>
  <table>
    <tr><th></th><th>Virtual machine</th><th>Container</th></tr>
    <tr><td>Isolation</td><td>Whole guest OS</td><td>Process-level, shared kernel</td></tr>
    <tr><td>Boot</td><td>Seconds to minutes</td><td>Milliseconds</td></tr>
    <tr><td>Size</td><td>Gigabytes</td><td>Megabytes per layer</td></tr>
    <tr><td>Reproducibility</td><td>Fragile guest drift</td><td>Immutable image layers</td></tr>
  </table>
  <h2>From code to image</h2>
  <pre class="code-block"># Dockerfile (shipment-service)
FROM node:22-alpine
WORKDIR /app
COPY package.json .
RUN npm ci --omit=dev
COPY src ./src
EXPOSE 8080
CMD ["node", "src/server.js"]</pre>
  <p>Layers matter: dependencies change rarely, so they sit low and stay cached; source changes sit high and rebuild cheaply.</p>
  <h2>Orchestration: run many, heal them</h2>
  <p>Running one container is easy. Running dozens, keeping them healthy, and routing traffic is <strong>orchestration</strong> — which is why Kubernetes exists. Core primitives you will touch daily:</p>
  <ul>
    <li><strong>Pod</strong> — the smallest deployable unit; wraps one or a few containers sharing a network namespace.</li>
    <li><strong>Deployment</strong> — declares desired state: "<span class="ic">3 replicas of shipment:v2</span>"; the controller converges.</li>
    <li><strong>Service</strong> — a stable DNS name and load balancer in front of the pods.</li>
    <li><strong>ConfigMap / Secret</strong> — config and credentials, injected at runtime instead of baked in.</li>
  </ul>
  <pre class="code-block">kubectl apply -f deployment.yaml   # declares: 3× shipment:v2, port 8080
kubectl rollout status deploy/shipment   # watch it converge</pre>
  <h2>Probes: what keeps traffic safe</h2>
  <p>The orchestrator decides who gets traffic based on your probes:</p>
  <ul>
    <li><strong>livenessProbe</strong> — is the process healthy? Failure → restart the pod.</li>
    <li><strong>readinessProbe</strong> — can it serve? Failure → pull it out of the Service rotation, do not restart.</li>
    <li><strong>startupProbe</strong> — give slow-starting services time before the other probes run.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Desired-state, not scripts</strong>
    <p>You never say "restart service X". You say "X should be 3 replicas of v2" and the controller restarts, scales, and rolls as needed. That imperative-to-declarative shift is the whole job of orchestration.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Start with compose</strong>
    <p>For local development and the capstone, <span class="ic">docker compose</span> runs the whole fleet on one machine — the easiest way to feel multi-service before you need a cluster.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000420',
  '03500000-0000-4000-8000-000000000320',
  1,
  'Deployment Models & Service Mesh',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Deployment Models & Service Mesh</title>
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
  <h1>Deployment Models &amp; Service Mesh</h1>
  <p>An independently deployable service is only valuable if the deploy does not hurt. That is the job of <strong>progressive delivery</strong>: release new versions to the fleet gradually, watch, and abort at the first sign of trouble.</p>
  <h2>Release strategies</h2>
  <table>
    <tr><th>Strategy</th><th>How it works</th><th>Failure impact</th></tr>
    <tr><td>Rolling</td><td>Update replicas in batches, keep availability constant</td><td>Bounded to the current batch</td></tr>
    <tr><td>Blue-green</td><td>New stack parallel, flip traffic by DNS once green</td><td>Instant flip back</td></tr>
    <tr><td>Canary</td><td>Route 5% of real traffic to v2, grow it while metrics stay good</td><td>Affects only the canary slice</td></tr>
  </table>
  <p>Kubernetes Deployments give you rolling for free; <span class="ic">strategy:</span> flags and ingress rules unlock the richer ones:</p>
  <pre class="code-block">deployment.spec.strategy:
  type: RollingUpdate
  rollingUpdate: { maxSurge: 1, maxUnavailable: 0 }</pre>
  <h2>Progressive delivery tooling</h2>
  <ul>
    <li><strong>Argo Rollouts</strong> — canary + automated analysis (compare error rate before you grow the slice).</li>
    <li><strong>Feature flags</strong> — turn behavior on and off without deploying at all.</li>
    <li><strong>Release trains vs on-demand</strong> — per-service continuous is the goal; coordinate only when contracts change.</li>
  </ul>
  <h2>The service mesh</h2>
  <p>As the fleet grows, network concerns repeat per service: retries, timeouts, mTLS, tracing, rate limits. A <strong>service mesh</strong> lifts them out of each app into a <strong>sidecar proxy</strong> that rides next to every pod (e.g. Envoy, managed by Istio or Linkerd):</p>
  <pre class="code-block">pod shipment:
  container shipment  (your app — now clean of resilience code)
  container envoy     (sidecar — mTLS, retries, tracing, rules)

traffic rules (DRY, mesh-wide):
  anything → pricing: retry 2, timeout 1s, circuit open after 20 errors</pre>
  <p>Now every service gets resilient behavior without a library audit — and <strong>mTLS</strong> between services becomes automatic, replacing service-to-service firewalls.</p>
  <div class="callout callout-info">
    <strong>Mesh is a later step</strong>
    <p>Do not reach for a mesh on day one. In-process Resilience4j/ Polly is simpler and debuggable; the mesh pays off around dozens of services where per-app config becomes its own support burden.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Canaries need metrics</strong>
    <p>A canary you cannot steer is just a parallel deploy. Wire error-rate and latency dashboards <em>before</em> you rely on progressive delivery (lesson 0322).</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000422',
  '03500000-0000-4000-8000-000000000322',
  1,
  'Observability: Logs, Metrics & Traces',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Observability: Logs, Metrics & Traces</title>
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
  <h1>Observability: Logs, Metrics &amp; Traces</h1>
  <p>A monolith tells one story; a fleet tells dozens that must be stitched. <strong>Observability</strong> is the discipline of asking questions of a running system — and getting answers. The three pillars cover the time axes:</p>
  <ul>
    <li><strong>Logs</strong> — what happened (a record of each event).</li>
    <li><strong>Metrics</strong> — what is happening overall (rates, errors, saturation).</li>
    <li><strong>Traces</strong> — how one request flowed through many services.</li>
  </ul>
  <h2>Logs: structured, correlated, aggregated</h2>
  <p>Format so machines can parse. One JSON line per event, with service, level, and a <span class="ic">trace_id</span>:</p>
  <pre class="code-block">{"service":"shipment","level":"error","trace_id":"ab12…",
 "msg":"carrier api timeout","shipmentId":"shp_1","attempt":3,
 "at":"2026-09-17T10:22:41Z"}</pre>
  <p>Tie the log to a request. The <span class="ic">trace_id</span> is generated at the edge and propagated on every hop so you can grep one id and see the whole journey.</p>
  <h2>Metrics: signal, not noise</h2>
  <p>The <span class="ic">RED</span> method for request-driven services: <strong>Rate</strong> (requests/s), <strong>Errors</strong> (error ratio — your SLO), <span class="ic">RED duration →</span> <strong>Duration</strong> (p50/p95/p99 latency). For resources use <span class="ic">USE</span>: Utilization, Saturation, Errors.</p>
  <table>
    <tr><th>Metric</th><th>Answers</th><th>Alert shape</th></tr>
    <tr><td>Error rate / request</td><td>User-visible health</td><td>Error budget burn</td></tr>
    <tr><td>p99 latency</td><td>Worst-case experience</td><td>Slow-path alarms</td></tr>
    <tr><td>CPU saturation, queue depth</td><td>Capacity strain</td><td>Scaling triggers</td></tr>
  </table>
  <p>Watch <strong>cardinality</strong>: high-cardinality labels (per request id) explode Prometheus memory. Keep unique identifiers in logs, keep labels bounded.</p>
  <h2>Traces: one request, many hops</h2>
  <pre class="code-block">GET /checkout           total 620 ms
  orders:  120 ms  ✓
  billing: 300 ms  ✓   ← 48% of the budget, investigate
  shipment: 45 ms  ✓
  analytics: 130 ms ✓</pre>
  <p>A distributed trace is a tree of <strong>spans</strong> linked by the trace id, one span per service hop. Trace not only makes latency attribution possible — it is the map you need when a p99 spikes and nothing screams.</p>
  <h2>Turn signals into budgets</h2>
  <div class="callout callout-tip">
    <strong>Error budgets</strong>
    <p>Pick an SLO — "shipping API 99.9% in 30 days" — and treat the remaining 0.1% as a budget you may spend on releases. Running over the budget halts launches until you earn it back. That is engineering accountability in one number.</p>
  </div>
  <div class="callout callout-info">
    <strong>Correlate, never bolt on</strong>
    <p>Ship correlation data (trace ids, request ids) in <em>every</em> log line from day one. Retro-fitting observation onto a running fleet is the most expensive lesson in operations.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000423',
  '03500000-0000-4000-8000-000000000323',
  1,
  'Testing Microservices',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Testing Microservices</title>
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
  <h1>Testing Microservices</h1>
  <p>With services deployed independently, the test suite must prove two different things: <em>my service is right</em>, and <em>my service still fits the world</em>. The pyramid keeps the first cheap and local; contracts keep the second honest.</p>
  <h2>The pyramid, adapted</h2>
  <table>
    <tr><th>Layer</th><th>What it covers</th><th>Speed / cost</th></tr>
    <tr><td>Unit</td><td>Pure logic: pricing math, compensation logic, validation</td><td>Fast, cheap, abundant</td></tr>
    <tr><td>Integration</td><td>Service + its real database, message broker, or HTTP API</td><td>Fewer, but 'real'</td></tr>
    <tr><td>Contract</td><td>Agreed API shape between consumer and provider</td><td>Fast per service pair</td></tr>
    <tr><td>End-to-end</td><td>A few happy journeys through the whole fleet</td><td>Slow, brittle, few</td></tr>
  </table>
  <h2>Integration tests with real deps</h2>
  <p>Mocking everything romanticizes reality. <span class="ic">Testcontainers</span> spins the real PostgreSQL or broker in Docker per suite, so the test exercises your actual schema and query plans:</p>
  <pre class="code-block">@container
postgres:16  → db_url = connect()

def test_duplicate_idempotency_key_returns_first_result():
    first  = post_shipment(key="7c21")
    second = post_shipment(key="7c21")
    assert second.id == first.id
    assert count_rows("shipments") == 1</pre>
  <h2>Contract tests: your API is a promise</h2>
  <p>Consumer-driven contracts (e.g. <span class="ic">Pact</span>) capture the subset a consumer <em>actually uses</em>:</p>
  <ul>
    <li>Consumer writes expectations: <span class="ic">GET /shipments/1 → 200, {id, status}</span>.</li>
    <li>Provider runs them in CI and sees <em>which consumer</em> would break if a field changes.</li>
    <li>Safest evolution: add a field → all continue; remove a field → only consumers that never used it survive it.</li>
  </ul>
  <pre class="code-block"># pact expectation (pytest style)
expected = { "id": "shp_1", "status": "dispatched" }
resp = requests.get(f"{provider}/shipments/{expected['id']}")
assert match(expected, resp.json())   # provider CI runs this</pre>
  <div class="callout callout-tip">
    <strong>Contracts beat full E2E</strong>
    <p>You cannot run full end-to-end in every service build — there are too many combinations. Contracts pin down each seam cheaply; you keep a tiny E2E shell for the happy paths only.</p>
  </div>
  <h2>Resilience in CI</h2>
  <p>Test the failure modes you built: kill the database mid-call, double the latency, then assert the breaker opens and the fallback fires. <span class="ic">Chaos engineering</span> (fail a real dependency in a staging fleet) turns "should work in theory" into measured truth.</p>
  <div class="callout callout-info">
    <strong>Test what breaks on sprint</strong>
    <p>Unit tests that survive refactors... are fine. The tests that pay rent are the ones that fail when a contract drifts or a timeout misconfigures. Spend CI minutes there.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000425',
  '03500000-0000-4000-8000-000000000325',
  1,
  'The Strangler Fig & Migration Playbook',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Strangler Fig & Migration Playbook</title>
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
  <h1>The Strangler Fig &amp; Migration Playbook</h1>
  <p>Rewriting a monolith in one release is the highest-risk move in software. The <strong>strangler fig pattern</strong> does the opposite: while the old system keeps serving, you grow a new system around it and flip traffic slice by slice. The monolith shrinks in the middle, like a tree swallowed by the vine that shares its name.</p>
  <h2>The three phases</h2>
  <ol>
    <li><strong>Add a facade</strong> — a gateway in front of the monolith, intercepting all calls.</li>
    <li><strong>Extract one slice</strong> — move a page, route, or capability to a new service behind the same interface.</li>
    <li><strong>Redirect traffic</strong> — point the facade at the service; verify; repeat until the monolith is empty, then delete it.</li>
  </ol>
  <pre class="code-block">before:            mid-strangle:            end:
 client ──► mono    client ──► mono          client ──► gateway
                     gateway ──► mono (OLD)             ──► orders-svc
                     gateway ──► ship-svc (NEW)         ──► billing-svc
                                                        ──► ship-svc  ...</pre>
  <h2>Pick the first slice wisely</h2>
  <p>The first extraction sets expectations and confidence. Choose a slice that is:</p>
  <ul>
    <li><strong>Well-understood</strong> — behavior you can characterize in tests.</li>
    <li><strong>Low-coupling</strong> — touches the fewest shared tables and callers.</li>
    <li><strong>Impactful</strong> — something the business notices and praises.</li>
  </ul>
  <h2>Twin-run and the data problem</h2>
  <p>The hardest part is not code — it is the <strong>shared database</strong>. Before you can cut the schema, run both world in <em>twin-run</em>: the old and new paths both execute, results are diffed, and only new data flows to the new service's schema:</p>
  <pre class="code-block">write path during twin-run:
  mono.write(orders)  ──► orders_db OLD
  svc.write(orders)   ──► orders_db NEW   (same transaction-ish event)
diff job compares both; when parity holds for weeks → cut over</pre>
  <p>Only after parity holds do you stop writing the old table and point the facade one-way. Reversibility comes from keeping the old path warm until the new one is proven.</p>
  <h2>Feature flags keep every step reversible</h2>
  <p>Guard each slice and its data paths behind a flag. A bad Tuesday deploy flips the flag back — not a rollback of an entire migration:</p>
  <pre class="code-block">flags/checkout-uses-shipment-service:  {owners, on, rollback: instant}
flags/shipment-writes-new-schema:      {twin-run → single-writer}</pre>
  <div class="callout callout-info">
    <strong>Kill the 'big bang' reflex</strong>
    <p>Every extraction ships independently. If an extract is not independently deployable and reversible, it is not an extraction — it is the big bang wearing a plan.</p>
  </div>
  <div class="callout callout-tip">
    <strong>The capstone gives you a practice run</strong>
    <p>In module 5 you will strangle one small slice of a toy monolith with exactly this playbook: facade, extract, twin-run, flag, cut over. The pattern, not the pile of code, is what you take away.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000426',
  '03500000-0000-4000-8000-000000000326',
  1,
  'Capstone: Building the Shipment Service',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Building the Shipment Service</title>
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
  <h1>Capstone: Building the Shipment Service</h1>
  <p>Time to apply the whole playbook. The capstone takes a toy monolith (a store that ships orders) and stranglers out one slice: the <strong>shipment service</strong>. This lesson builds its contract, its schema, and its resilient API — cleanly, the way lesson 0316 said you should.</p>
  <h2>1. The contract</h2>
  <p>It owns shipments and nothing else. Additive-first, versioned, with idempotency keys on writes:</p>
  <pre class="code-block">GET    /v1/shipments/{id}        → shipment          (read model)
POST   /v1/shipments             Idempotency-Key    (create + reserve carrier)
GET    /health/ready             → 200 when db + queue ok
# events published: shipment.created, shipment.dispatched</pre>
  <h2>2. Its own schema</h2>
  <pre class="code-block">-- shipment_db (owned by ship-svc only)
CREATE TABLE shipments (
  id            uuid PRIMARY KEY,
  order_id      uuid        NOT NULL,
  carrier       text        NOT NULL,
  tracking      text,
  status        text        NOT NULL DEFAULT 'created',
  idempotency_key text       UNIQUE,
  created_at    timestamptz NOT NULL DEFAULT now()
);</pre>
  <p>Note the <span class="ic">UNIQUE idempotency_key</span> — the database enforces retry safety even if two requests race.</p>
  <h2>3. Create + idempotent reply</h2>
  <pre class="code-block"># pseudo-handler (node/express)
app.post("/v1/shipments", async (req, res) =&gt; {
  const key = req.header("Idempotency-Key");

  const existing = await db.findByKey(key);
  if (existing) return res.status(201).json(existing);  // replay same answer

  const shipment = await db.insert({ orderId, carrier, key });
  await bus.publish(shipment.created, shipment);          // fire and forget
  res.status(201).json(shipment);
});</pre>
  <h2>4. Resilience wired in</h2>
  <p>Every outbound hop gets the module-5 treatment — timeout, one retry, a breaker:</p>
  <pre class="code-block">carrierClient = withTimeout(1500ms)
  .withRetry(2, backoff=exp + jitter)
  .withBreaker(failureRate=50, open=30s)
  .withBulkhead(limits=10)   # cannot starve creation path</pre>
  <h2>5. Package it</h2>
  <pre class="code-block">docker build -t shop/shipment-service:0.1.0 .
docker run -p 8080:8080 -e DATABASE_URL=... -e QUEUE_URL=... shop/shipment-service:0.1.0</pre>
  <div class="callout callout-tip">
    <strong>Test at the edge</strong>
    <p>Before wiring it in, verify the idempotency contract with the containerized Postgres test from lesson 0323: same key twice → one row, and the second response matches the first.</p>
  </div>
  <div class="callout callout-info">
    <strong>Own the whole slice</strong>
    <p>The service owns schema, API, events, and resilience config. A stub that only pipes the monolith table is a distributed monolith; this one is a service.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03500000-0000-4000-8000-000000000427',
  '03500000-0000-4000-8000-000000000327',
  1,
  'Capstone: End-to-End Validation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: End-to-End Validation</title>
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
  <h1>Capstone: End-to-End Validation</h1>
  <p>The service is built. Now run the strangler: stand up the whole fleet locally, point the facade at the new path, break things on purpose, and prove the slice is production-shaped.</p>
  <h2>The fleet, one command</h2>
  <p><span class="ic">docker compose</span> starts the monolith, the new service, Postgres (one per service), and a broker — discovery done by compose service names, exactly like a cluster's DNS:</p>
  <pre class="code-block">services:
  monolith:  build: ./legacy-store    ports: ["9000:9000"]
  shipment:  build: ./shipment-service  ports: ["8080:8080"]
             depends_on: [shipment_db, queue]
  gateway:   build: ./gateway         ports: ["8081:8081"]</pre>
  <h2>Wire the facade and flip one route</h2>
  <pre class="code-block"># gateway routing — strangle step 2/3
/api/v1/shipments/*  →  shipment:8080     (NEW, behind feature flag)
/api/v1/orders/*     →  monolith:9000     (still on legacy)</pre>
  <p>Keep the flag <em>off</em> first, test <em>through</em> the flag (both paths run), then flip it. Reversing means flipping back — no redeploy.</p>
  <h2>Observability check</h2>
  <p>Fire a checkout and answer the three pillars with the actual numbers:</p>
  <pre class="code-block"># logs: one JSON line per service with the SAME trace_id
{"service":"shipment","level":"info","trace_id":"t_42",
 "msg":"shipment created","shipmentId":"shp_1"}

# metrics: ship-svc error rate 0%, p99 38 ms
# trace:   /checkout  orders 120ms → shipment 45ms → billing 130ms</pre>
  <p>If the trace_id does not flow from edge to fleet, you have not earned observability yet — fix propagation before moving on.</p>
  <h2>Break it on purpose (chaos, mini)</h2>
  <ul>
    <li>Kill the shipment database → readiness flips to 503, gateway stops routing, caller falls back to cached info.</li>
    <li>Slow the carrier stub to 10 s → the timeout fires, the breaker opens, the bulkhead saves the create path.</li>
    <li>Retry a POST with the same key → one shipment row, two identical responses.</li>
  </ul>
  <h2>Cut-over checklist</h2>
  <table>
    <tr><th>Gate</th><th>Passes when...</th></tr>
    <tr><td>Contract tests green</td><td>Consumer expectations hold against the new service</td></tr>
    <tr><td>Twin-run parity</td><td>New writes match legacy writes for a full week</td></tr>
    <tr><td>Error budget intact</td><td>P99 and error rate inside the SLO during load</td></tr>
    <tr><td>Rollback rehearsed</td><td>Flag flip restores legacy with no data loss</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>You just ran a real migration</strong>
    <p>Facade → extract → twin-run → flag → cut over. The same steps scale to a checkout split or a billing split; only the business weight changes.</p>
  </div>
  <div class="callout callout-info">
    <strong>Final word</strong>
    <p>Microservices buy autonomy, not performance. The systems you built here move slower per hop and fail in more places — but each failure is bounded, logged, and reversible. That is the architecture working as designed.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES  (29 questions)
--    Q1-3 for lesson 0303 · Q4-6 for 0306 · Q7-9 for 0309 · Q10-12 for 0312
--    Q13-15 for 0315 · Q16-18 for 0318 · Q19-21 for 0321 · Q22-24 for 0324
--    Q25-29 for final assessment 0328.
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('03500000-0000-4000-8000-000000000501', '03500000-0000-4000-8000-000000000303',
   'Which statement best contrasts a monolith with a microservice architecture?',
   'A monolith is one deployable unit; microservices are many independently deployable services.', 1),
  ('03500000-0000-4000-8000-000000000502', '03500000-0000-4000-8000-000000000303',
   'Which operational pain grows fastest as a monolith grows in size and team count?',
   'Long builds and releases that touch many modules slow every team down together.', 2),
  ('03500000-0000-4000-8000-000000000503', '03500000-0000-4000-8000-000000000303',
   'When is a monolith still the right architectural call?',
   'Small teams and simple domains ship faster with less operational overhead than a fleet.', 3),
  ('03500000-0000-4000-8000-000000000504', '03500000-0000-4000-8000-000000000306',
   'What is the primary driver for choosing a service boundary?',
   'Boundaries should follow business capabilities so one team owns the slice end to end.', 1),
  ('03500000-0000-4000-8000-000000000505', '03500000-0000-4000-8000-000000000306',
   'Why does database-per-service matter during decomposition?',
   'Shared schemas silently couple services and destroy independent ownership.', 2),
  ('03500000-0000-4000-8000-000000000506', '03500000-0000-4000-8000-000000000306',
   'What does the strangler fig pattern recommend for migration?',
   'Replace one slice at a time behind a facade instead of rewriting everything at once.', 3),
  ('03500000-0000-4000-8000-000000000507', '03500000-0000-4000-8000-000000000309',
   'Which communication fit applies to a query needing an immediate answer?',
   'Synchronous request-reply returns the data the caller needs right now.', 1),
  ('03500000-0000-4000-8000-000000000508', '03500000-0000-4000-8000-000000000309',
   'What makes a message durable in most broker-based queues?',
   'The broker persists the message until a consumer acknowledges it.', 2),
  ('03500000-0000-4000-8000-000000000509', '03500000-0000-4000-8000-000000000309',
   'How do you keep a slow downstream service from hanging your own service?',
   'Every outbound call needs a bounded timeout, never an infinite wait.', 3),
  ('03500000-0000-4000-8000-000000000510', '03500000-0000-4000-8000-000000000312',
   'What is the primary role of an API gateway?',
   'It is the single managed entry point that routes and enforces edge policies.', 1),
  ('03500000-0000-4000-8000-000000000511', '03500000-0000-4000-8000-000000000312',
   'Why can client-side service discovery scale better than a central gateway?',
   'Clients or sidecars query the registry directly, removing the central proxy from the request path.', 2),
  ('03500000-0000-4000-8000-000000000512', '03500000-0000-4000-8000-000000000312',
   'How does a service registry keep its entries current?',
   'Services send heartbeats and the registry evicts instances that stop reporting.', 3),
  ('03500000-0000-4000-8000-000000000513', '03500000-0000-4000-8000-000000000315',
   'What is the purpose of adding jitter to exponential backoff?',
   'Jitter desynchronizes retries so the herd does not thundering-storm the recovering service.', 1),
  ('03500000-0000-4000-8000-000000000514', '03500000-0000-4000-8000-000000000315',
   'In which state does a circuit breaker let every call fail fast?',
   'When open, the breaker refuses calls to protect the failing service and the caller.', 2),
  ('03500000-0000-4000-8000-000000000515', '03500000-0000-4000-8000-000000000315',
   'What does the bulkhead pattern protect against?',
   'It caps resources per dependency so one slow dependency cannot consume every connection.', 3),
  ('03500000-0000-4000-8000-000000000516', '03500000-0000-4000-8000-000000000318',
   'What does the database-per-service rule require?',
   'Each service owns the only schema it may touch; other services use its API or events.', 1),
  ('03500000-0000-4000-8000-000000000517', '03500000-0000-4000-8000-000000000318',
   'Why are cross-service distributed transactions avoided?',
   'Two-phase commit across network partitions is slow, fragile, and couples services.', 2),
  ('03500000-0000-4000-8000-000000000518', '03500000-0000-4000-8000-000000000318',
   'In a saga, how is an already-completed step undone after a later failure?',
   'A compensating transaction reverses the completed step instead of rolling it back in place.', 3),
  ('03500000-0000-4000-8000-000000000519', '03500000-0000-4000-8000-000000000321',
   'What does an orchestrator such as Kubernetes provide for containers?',
   'Placement, scaling, and self-healing, driven by a declared desired state.', 1),
  ('03500000-0000-4000-8000-000000000520', '03500000-0000-4000-8000-000000000321',
   'What is the smallest deployable unit in Kubernetes?',
   'A Pod wraps one or more containers that share a network namespace.', 2),
  ('03500000-0000-4000-8000-000000000521', '03500000-0000-4000-8000-000000000321',
   'Which advantage does a rolling deployment give over an all-at-once swap?',
   'It updates replicas in batches so the service stays available during the release.', 3),
  ('03500000-0000-4000-8000-000000000522', '03500000-0000-4000-8000-000000000324',
   'What are the three pillars of observability?',
   'Logs tell what happened, metrics tell how the system behaves, traces follow one request across services.', 1),
  ('03500000-0000-4000-8000-000000000523', '03500000-0000-4000-8000-000000000324',
   'Why does a distributed request carry a trace id?',
   'The trace id links every service span of a single request so its full path can be reconstructed.', 2),
  ('03500000-0000-4000-8000-000000000524', '03500000-0000-4000-8000-000000000324',
   'Which test type catches a contract drift between a consumer and a provider?',
   'Consumer-driven contract tests encode the API subset each consumer relies on.', 3),
  ('03500000-0000-4000-8000-000000000525', '03500000-0000-4000-8000-000000000328',
   'Which practice keeps a migration step reversible during extraction?',
   'Feature flags and twin-run make any slice fall back to the legacy path safely.', 1),
  ('03500000-0000-4000-8000-000000000526', '03500000-0000-4000-8000-000000000328',
   'What must be unique per logical operation for a retry to be safe?',
   'The idempotency key lets the server recognize a duplicate and answer the same way.', 2),
  ('03500000-0000-4000-8000-000000000527', '03500000-0000-4000-8000-000000000328',
   'Which metric best states user-facing health of a service against an SLO?',
   'Error rate measured against the error budget shows how much reliability remains.', 3),
  ('03500000-0000-4000-8000-000000000528', '03500000-0000-4000-8000-000000000328',
   'What does a readiness probe accomplish in an orchestrator?',
   'It removes unready instances from traffic rotation without restarting them.', 4),
  ('03500000-0000-4000-8000-000000000529', '03500000-0000-4000-8000-000000000328',
   'How do you pinpoint where time is spent when a request is slow across a fleet?',
   'A distributed trace shows the latency contributed by every service along the path.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): monolith vs microservices
  ('03500000-0000-4000-8000-000000001001', '03500000-0000-4000-8000-000000000501', 'One deployable unit vs many independently deployable services', TRUE,  1),
  ('03500000-0000-4000-8000-000000001002', '03500000-0000-4000-8000-000000000501', 'Monoliths cannot be tested and microservices always can', FALSE, 2),
  ('03500000-0000-4000-8000-000000001003', '03500000-0000-4000-8000-000000000501', 'Microservices require one language and monoliths require none', FALSE, 3),
  ('03500000-0000-4000-8000-000000001004', '03500000-0000-4000-8000-000000000501', 'Microservices must use REST and monoliths must not', FALSE, 4),
  -- Q1 (501)q2: monolith pain
  ('03500000-0000-4000-8000-000000001005', '03500000-0000-4000-8000-000000000502', 'All teams gate on one long build and release', FALSE, 1),
  ('03500000-0000-4000-8000-000000001006', '03500000-0000-4000-8000-000000000502', 'Deployments touch unrelated modules and risks pile up', TRUE,  2),
  ('03500000-0000-4000-8000-000000001007', '03500000-0000-4000-8000-000000000502', 'The license of a single database always doubles', FALSE, 3),
  ('03500000-0000-4000-8000-000000001008', '03500000-0000-4000-8000-000000000502', 'The homepage must be redeployed every hour', FALSE, 4),
  -- Q1 (501)q3: monolith still right
  ('03500000-0000-4000-8000-000000001009', '03500000-0000-4000-8000-000000000503', 'A platform with dozens of disjoint work streams', FALSE, 1),
  ('03500000-0000-4000-8000-000000001010', '03500000-0000-4000-8000-000000000503', 'Teams that must deploy on separate schedules', FALSE, 2),
  ('03500000-0000-4000-8000-000000001011', '03500000-0000-4000-8000-000000000503', 'A small team shipping a simple domain quickly', TRUE,  3),
  ('03500000-0000-4000-8000-000000001012', '03500000-0000-4000-8000-000000000503', 'Hundreds of engineers editing one codebase', FALSE, 4),
  -- Q2 (504): boundary driver
  ('03500000-0000-4000-8000-000000001013', '03500000-0000-4000-8000-000000000504', 'The number of tables in the shared database', FALSE, 1),
  ('03500000-0000-4000-8000-000000001014', '03500000-0000-4000-8000-000000000504', 'The frontend component tree structure', FALSE, 2),
  ('03500000-0000-4000-8000-000000001015', '03500000-0000-4000-8000-000000000504', 'Every separate API endpoint you can invent', FALSE, 3),
  ('03500000-0000-4000-8000-000000001016', '03500000-0000-4000-8000-000000000504', 'Business capability ownership minimizing cross-team coupling', TRUE,  4),
  -- Q2 (504)q2: db per service
  ('03500000-0000-4000-8000-000000001017', '03500000-0000-4000-8000-000000000505', 'So services do not silently couple through a shared schema', TRUE,  1),
  ('03500000-0000-4000-8000-000000001018', '03500000-0000-4000-8000-000000000505', 'So the DBA has fewer backups to run', FALSE, 2),
  ('03500000-0000-4000-8000-000000001019', '03500000-0000-4000-8000-000000000505', 'Because SQL is banned inside microservices', FALSE, 3),
  ('03500000-0000-4000-8000-000000001020', '03500000-0000-4000-8000-000000000505', 'So cross-service JOINs become faster', FALSE, 4),
  -- Q2 (504)q3: strangler fig
  ('03500000-0000-4000-8000-000000001021', '03500000-0000-4000-8000-000000000506', 'Rewriting the monolith in one release weekend', FALSE, 1),
  ('03500000-0000-4000-8000-000000001022', '03500000-0000-4000-8000-000000000506', 'Replacing one slice at a time behind the same facade', TRUE,  2),
  ('03500000-0000-4000-8000-000000001023', '03500000-0000-4000-8000-000000000506', 'Moving code modules without changing their behavior', FALSE, 3),
  ('03500000-0000-4000-8000-000000001024', '03500000-0000-4000-8000-000000000506', 'Deleting the monolith at the start of the sprint', FALSE, 4),
  -- Q3 (507): sync fit
  ('03500000-0000-4000-8000-000000001025', '03500000-0000-4000-8000-000000000507', 'An event published to a topic for fan-out', FALSE, 1),
  ('03500000-0000-4000-8000-000000001026', '03500000-0000-4000-8000-000000000507', 'A nightly batch data copy', FALSE, 2),
  ('03500000-0000-4000-8000-000000001027', '03500000-0000-4000-8000-000000000507', 'Synchronous request-reply over REST or RPC', TRUE,  3),
  ('03500000-0000-4000-8000-000000001028', '03500000-0000-4000-8000-000000000507', 'Reading another service database directly', FALSE, 4),
  -- Q3 (507)q2: durable message
  ('03500000-0000-4000-8000-000000001029', '03500000-0000-4000-8000-000000000508', 'The producer keeps triggering callbacks forever', FALSE, 1),
  ('03500000-0000-4000-8000-000000001030', '03500000-0000-4000-8000-000000000508', 'Every consumer caches the payload in memory', FALSE, 2),
  ('03500000-0000-4000-8000-000000001031', '03500000-0000-4000-8000-000000000508', 'The message copies itself between brokers', FALSE, 3),
  ('03500000-0000-4000-8000-000000001032', '03500000-0000-4000-8000-000000000508', 'The broker stores it until a consumer acknowledges', TRUE,  4),
  -- Q3 (507)q3: slow downstream
  ('03500000-0000-4000-8000-000000001033', '03500000-0000-4000-8000-000000000509', 'Give every call a bounded timeout', TRUE,  1),
  ('03500000-0000-4000-8000-000000001034', '03500000-0000-4000-8000-000000000509', 'Remove the timeout so the call truly finishes', FALSE, 2),
  ('03500000-0000-4000-8000-000000001035', '03500000-0000-4000-8000-000000000509', 'Add RAM to both services so neither waits', FALSE, 3),
  ('03500000-0000-4000-8000-000000001036', '03500000-0000-4000-8000-000000000509', 'Cache every response for a whole week', FALSE, 4),
  -- Q4 (510): gateway role
  ('03500000-0000-4000-8000-000000001037', '03500000-0000-4000-8000-000000000510', 'A shared schema the whole fleet reads', FALSE, 1),
  ('03500000-0000-4000-8000-000000001038', '03500000-0000-4000-8000-000000000510', 'A single entry point that routes and enforces edge policies', TRUE,  2),
  ('03500000-0000-4000-8000-000000001039', '03500000-0000-4000-8000-000000000510', 'The CI pipeline that builds every service', FALSE, 3),
  ('03500000-0000-4000-8000-000000001040', '03500000-0000-4000-8000-000000000510', 'A heartbeat collector for the fleet', FALSE, 4),
  -- Q4 (510)q2: client-side discovery
  ('03500000-0000-4000-8000-000000001041', '03500000-0000-4000-8000-000000000511', 'It removes the central proxy from the request path', TRUE,  1),
  ('03500000-0000-4000-8000-000000001042', '03500000-0000-4000-8000-000000000511', 'It avoids DNS lookups entirely', FALSE, 2),
  ('03500000-0000-4000-8000-000000001043', '03500000-0000-4000-8000-000000000511', 'It stores the registry inside the database', FALSE, 3),
  ('03500000-0000-4000-8000-000000001044', '03500000-0000-4000-8000-000000000511', 'It hardcodes instance IP addresses in config', FALSE, 4),
  -- Q4 (510)q3: registry freshness
  ('03500000-0000-4000-8000-000000001045', '03500000-0000-4000-8000-000000000512', 'Heartbeats keep registrations fresh and stale entries are evicted', TRUE,  1),
  ('03500000-0000-4000-8000-000000001046', '03500000-0000-4000-8000-000000000512', 'The DBA edits the registry each night', FALSE, 2),
  ('03500000-0000-4000-8000-000000001047', '03500000-0000-4000-8000-000000000512', 'Clients guess instance addresses on every call', FALSE, 3),
  ('03500000-0000-4000-8000-000000001048', '03500000-0000-4000-8000-000000000512', 'The load balancer never updates its pools', FALSE, 4),
  -- Q5 (513): jitter
  ('03500000-0000-4000-8000-000000001049', '03500000-0000-4000-8000-000000000513', 'It spreads retries and avoids synchronized retry storms', TRUE,  1),
  ('03500000-0000-4000-8000-000000001050', '03500000-0000-4000-8000-000000000513', 'It makes every retry happen instantly', FALSE, 2),
  ('03500000-0000-4000-8000-000000001051', '03500000-0000-4000-8000-000000000513', 'It converts HTTP errors into database rows', FALSE, 3),
  ('03500000-0000-4000-8000-000000001052', '03500000-0000-4000-8000-000000000513', 'It doubles the timeout on each attempt', FALSE, 4),
  -- Q5 (513)q2: breaker open
  ('03500000-0000-4000-8000-000000001053', '03500000-0000-4000-8000-000000000514', 'In the closed state', FALSE, 1),
  ('03500000-0000-4000-8000-000000001054', '03500000-0000-4000-8000-000000000514', 'In the open state', TRUE,  2),
  ('03500000-0000-4000-8000-000000001055', '03500000-0000-4000-8000-000000000514', 'In the half-open state', FALSE, 3),
  ('03500000-0000-4000-8000-000000001056', '03500000-0000-4000-8000-000000000514', 'In no state — it never blocks calls', FALSE, 4),
  -- Q5 (513)q3: bulkhead
  ('03500000-0000-4000-8000-000000001057', '03500000-0000-4000-8000-000000000515', 'Compressing all API payloads end to end', FALSE, 1),
  ('03500000-0000-4000-8000-000000001058', '03500000-0000-4000-8000-000000000515', 'Restarting process pools on an hourly timer', FALSE, 2),
  ('03500000-0000-4000-8000-000000001059', '03500000-0000-4000-8000-000000000515', 'Resource pools that cap the blast radius per dependency', TRUE,  3),
  ('03500000-0000-4000-8000-000000001060', '03500000-0000-4000-8000-000000000515', 'Deleting the failing dependency forever', FALSE, 4),
  -- Q6 (516): db per service rule
  ('03500000-0000-4000-8000-000000001061', '03500000-0000-4000-8000-000000000516', 'The schema shared by all services through SQL views', FALSE, 1),
  ('03500000-0000-4000-8000-000000001062', '03500000-0000-4000-8000-000000000516', 'One central DBA reading every service schema', FALSE, 2),
  ('03500000-0000-4000-8000-000000001063', '03500000-0000-4000-8000-000000000516', 'Merging schemas after every release train', FALSE, 3),
  ('03500000-0000-4000-8000-000000001064', '03500000-0000-4000-8000-000000000516', 'Each service owns the only schema it may touch', TRUE,  4),
  -- Q6 (516)q2: dist transactions
  ('03500000-0000-4000-8000-000000001065', '03500000-0000-4000-8000-000000000517', 'They couple services and are unreliable across network partitions', TRUE,  1),
  ('03500000-0000-4000-8000-000000001066', '03500000-0000-4000-8000-000000000517', 'They make the user interface load faster', FALSE, 2),
  ('03500000-0000-4000-8000-000000001067', '03500000-0000-4000-8000-000000000517', 'PostgreSQL simply cannot run transactions', FALSE, 3),
  ('03500000-0000-4000-8000-000000001068', '03500000-0000-4000-8000-000000000517', 'They double the number of required databases', FALSE, 4),
  -- Q6 (516)q3: saga compensation
  ('03500000-0000-4000-8000-000000001069', '03500000-0000-4000-8000-000000000518', 'A distributed lock freezes the whole system', FALSE, 1),
  ('03500000-0000-4000-8000-000000001070', '03500000-0000-4000-8000-000000000518', 'A compensating action reverses the completed step', TRUE,  2),
  ('03500000-0000-4000-8000-000000001071', '03500000-0000-4000-8000-000000000518', 'The failed step retries with no upper limit', FALSE, 3),
  ('03500000-0000-4000-8000-000000001072', '03500000-0000-4000-8000-000000000518', 'The entire database is rolled back atomically', FALSE, 4),
  -- Q7 (519): orchestrator
  ('03500000-0000-4000-8000-000000001073', '03500000-0000-4000-8000-000000000519', 'A web framework for the frontend', FALSE, 1),
  ('03500000-0000-4000-8000-000000001074', '03500000-0000-4000-8000-000000000519', 'An automated SQL schema designer', FALSE, 2),
  ('03500000-0000-4000-8000-000000001075', '03500000-0000-4000-8000-000000000519', 'Placement, scaling, and self-healing for containers', TRUE,  3),
  ('03500000-0000-4000-8000-000000001076', '03500000-0000-4000-8000-000000000519', 'A place where application code is written', FALSE, 4),
  -- Q7 (519)q2: smallest unit
  ('03500000-0000-4000-8000-000000001077', '03500000-0000-4000-8000-000000000520', 'A single container image', FALSE, 1),
  ('03500000-0000-4000-8000-000000001078', '03500000-0000-4000-8000-000000000520', 'A Pod that wraps one or more containers', TRUE,  2),
  ('03500000-0000-4000-8000-000000001079', '03500000-0000-4000-8000-000000000520', 'The virtual machine host running containers', FALSE, 3),
  ('03500000-0000-4000-8000-000000001080', '03500000-0000-4000-8000-000000000520', 'The DNS record that maps the service name', FALSE, 4),
  -- Q7 (519)q3: rolling deployment
  ('03500000-0000-4000-8000-000000001081', '03500000-0000-4000-8000-000000000521', 'It updates replicas in batches so availability holds', TRUE,  1),
  ('03500000-0000-4000-8000-000000001082', '03500000-0000-4000-8000-000000000521', 'It avoids needing smoke tests entirely', FALSE, 2),
  ('03500000-0000-4000-8000-000000001083', '03500000-0000-4000-8000-000000000521', 'It deletes the old version before the new one starts', FALSE, 3),
  ('03500000-0000-4000-8000-000000001084', '03500000-0000-4000-8000-000000000521', 'It reuses the same container image forever', FALSE, 4),
  -- Q8 (522): three pillars
  ('03500000-0000-4000-8000-000000001085', '03500000-0000-4000-8000-000000000522', 'Linters, tests, and builds', FALSE, 1),
  ('03500000-0000-4000-8000-000000001086', '03500000-0000-4000-8000-000000000522', 'Logs, metrics, and traces', TRUE,  2),
  ('03500000-0000-4000-8000-000000001087', '03500000-0000-4000-8000-000000000522', 'CPU, memory, and disk', FALSE, 3),
  ('03500000-0000-4000-8000-000000001088', '03500000-0000-4000-8000-000000000522', 'Cache, queue, and worker', FALSE, 4),
  -- Q8 (522)q2: trace id
  ('03500000-0000-4000-8000-000000001089', '03500000-0000-4000-8000-000000000523', 'It replaces the IP address of the client', FALSE, 1),
  ('03500000-0000-4000-8000-000000001090', '03500000-0000-4000-8000-000000000523', 'It compresses the request payload', FALSE, 2),
  ('03500000-0000-4000-8000-000000001091', '03500000-0000-4000-8000-000000000523', 'It links the same request across many services', TRUE,  3),
  ('03500000-0000-4000-8000-000000001092', '03500000-0000-4000-8000-000000000523', 'It signs the TLS certificate', FALSE, 4),
  -- Q8 (522)q3: contract tests
  ('03500000-0000-4000-8000-000000001093', '03500000-0000-4000-8000-000000000524', 'Unit tests of the frontend components', FALSE, 1),
  ('03500000-0000-4000-8000-000000001094', '03500000-0000-4000-8000-000000000524', 'Static code linters and formatters', FALSE, 2),
  ('03500000-0000-4000-8000-000000001095', '03500000-0000-4000-8000-000000000524', 'Load tests of the marketing homepage', FALSE, 3),
  ('03500000-0000-4000-8000-000000001096', '03500000-0000-4000-8000-000000000524', 'Consumer-driven contract tests', TRUE,  4),
  -- Q9 (525): reversible migration
  ('03500000-0000-4000-8000-000000001097', '03500000-0000-4000-8000-000000000525', 'Feature flags and parallel running for reversibility', TRUE,  1),
  ('03500000-0000-4000-8000-000000001098', '03500000-0000-4000-8000-000000000525', 'A single frozen weekend for the whole system', FALSE, 2),
  ('03500000-0000-4000-8000-000000001099', '03500000-0000-4000-8000-000000000525', 'Copying code without writing any tests', FALSE, 3),
  ('03500000-0000-4000-8000-000000001100', '03500000-0000-4000-8000-000000000525', 'Deleting the monolith endpoint first', FALSE, 4),
  -- Q9 (525)q2: idempotency key
  ('03500000-0000-4000-8000-000000001101', '03500000-0000-4000-8000-000000000526', 'The password hash of the user', FALSE, 1),
  ('03500000-0000-4000-8000-000000001102', '03500000-0000-4000-8000-000000000526', 'The operation identifier the client sends with the request', TRUE,  2),
  ('03500000-0000-4000-8000-000000001103', '03500000-0000-4000-8000-000000000526', 'The timezone of the server', FALSE, 3),
  ('03500000-0000-4000-8000-000000001104', '03500000-0000-4000-8000-000000000526', 'The container image tag', FALSE, 4),
  -- Q9 (525)q3: SLO metric
  ('03500000-0000-4000-8000-000000001105', '03500000-0000-4000-8000-000000000527', 'The number of running pods', FALSE, 1),
  ('03500000-0000-4000-8000-000000001106', '03500000-0000-4000-8000-000000000527', 'The size of the database in bytes', FALSE, 2),
  ('03500000-0000-4000-8000-000000001107', '03500000-0000-4000-8000-000000000527', 'Error rate measured against the error budget', TRUE,  3),
  ('03500000-0000-4000-8000-000000001108', '03500000-0000-4000-8000-000000000527', 'The age of the deployment pipeline', FALSE, 4),
  -- Q9 (525)q4: readiness probe
  ('03500000-0000-4000-8000-000000001109', '03500000-0000-4000-8000-000000000528', 'It restarts the container immediately', FALSE, 1),
  ('03500000-0000-4000-8000-000000001110', '03500000-0000-4000-8000-000000000528', 'It replaces the need for a database', FALSE, 2),
  ('03500000-0000-4000-8000-000000001111', '03500000-0000-4000-8000-000000000528', 'It scales the cluster down automatically', FALSE, 3),
  ('03500000-0000-4000-8000-000000001112', '03500000-0000-4000-8000-000000000528', 'It removes unready instances from traffic rotation', TRUE,  4),
  -- Q9 (525)q5: slow request
  ('03500000-0000-4000-8000-000000001113', '03500000-0000-4000-8000-000000000529', 'Follow its trace spans across every service', TRUE,  1),
  ('03500000-0000-4000-8000-000000001114', '03500000-0000-4000-8000-000000000529', 'Reboot every server in the cluster at once', FALSE, 2),
  ('03500000-0000-4000-8000-000000001115', '03500000-0000-4000-8000-000000000529', 'Disable the logging pipeline for the fleet', FALSE, 3),
  ('03500000-0000-4000-8000-000000001116', '03500000-0000-4000-8000-000000000529', 'Delete the service registry to force resets', FALSE, 4)
ON CONFLICT (id) DO NOTHING;