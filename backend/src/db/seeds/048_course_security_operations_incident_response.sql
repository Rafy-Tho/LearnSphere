-- ============================================================================
-- SEED 048: Complete course — "Security Operations & Incident Response"
-- ----------------------------------------------------------------------------
-- Instructor : Elena Rodriguez   (10000000-0000-4000-8000-000000000005)
-- Category   : Cybersecurity     (20000000-0000-4000-8000-000000000005)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Security Operations Fundamentals → C1 The SOC: Roles & Functions · C2 Defense in Depth & Workflows
--   M2 Monitoring & Detection          → C3 Log Sources & Collection · C4 SIEM & Alerting
--   M3 Intelligence & Handling         → C5 Threat Intelligence · C6 Playbooks & Escalation
--   M4 Incident Response Lifecycle     → C7 The NIST Lifecycle · C8 Containment, Recovery & Forensics
--   M5 Capstone: SOC Program          → C9 Lessons Learned & Improvement · C10 Building a SOC & Capstone
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
  '03000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000005',
  '20000000-0000-4000-8000-000000000005',
  'Security Operations & Incident Response',
  'security-operations-incident-response',
  'Run security operations like a professional. Master SOC functions, log collection and SIEM, alert tuning, threat intelligence, and playbooks — then execute the NIST incident response lifecycle from detection through containment, eradication, recovery, and lessons learned, and finish by designing a complete incident response plan.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  46
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03000000-0000-4000-8000-000000000011', '03000000-0000-4000-8000-000000000001', 'Explain the mission and structure of a security operations center and its defense-in-depth mindset.',    1),
  ('03000000-0000-4000-8000-000000000012', '03000000-0000-4000-8000-000000000001', 'Design log collection and SIEM pipelines that surface reliable, tunable alerts.',                           2),
  ('03000000-0000-4000-8000-000000000013', '03000000-0000-4000-8000-000000000001', 'Apply threat intelligence and documented playbooks to triage, scope, and escalate incidents.',               3),
  ('03000000-0000-4000-8000-000000000014', '03000000-0000-4000-8000-000000000001', 'Execute the NIST incident response lifecycle, including containment, eradication, recovery, and evidence handling.', 4),
  ('03000000-0000-4000-8000-000000000015', '03000000-0000-4000-8000-000000000001', 'Build and measure a SOC program and author a complete, usable incident response plan.',                      5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03000000-0000-4000-8000-000000000101', '03000000-0000-4000-8000-000000000001', 1, 'Security Operations Fundamentals', 'Understand the SOC mission, its people, and the defense-in-depth mindset.', 'PUBLISHED'),
  ('03000000-0000-4000-8000-000000000102', '03000000-0000-4000-8000-000000000001', 2, 'Monitoring & Detection',          'Collect logs, analyze them in a SIEM, and turn signals into reliable alerts.', 'PUBLISHED'),
  ('03000000-0000-4000-8000-000000000103', '03000000-0000-4000-8000-000000000001', 3, 'Intelligence & Handling',         'Apply threat intelligence, triage alerts, and follow documented playbooks.', 'PUBLISHED'),
  ('03000000-0000-4000-8000-000000000104', '03000000-0000-4000-8000-000000000001', 4, 'Incident Response Lifecycle',     'Run the NIST lifecycle from detection through containment, recovery, and review.', 'PUBLISHED'),
  ('03000000-0000-4000-8000-000000000105', '03000000-0000-4000-8000-000000000001', 5, 'Capstone: SOC Program',          'Build a SOC program and design a complete incident response plan.', 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03000000-0000-4000-8000-000000000201', '03000000-0000-4000-8000-000000000101', 1, 'The SOC: Roles & Functions',    'Why the SOC exists and how it operates.',                        'PUBLISHED'),
  ('03000000-0000-4000-8000-000000000202', '03000000-0000-4000-8000-000000000101', 2, 'Defense in Depth & Workflows',  'Layered controls and everyday security operations.',             'PUBLISHED'),
  ('03000000-0000-4000-8000-000000000203', '03000000-0000-4000-8000-000000000102', 1, 'Log Sources & Collection',      'What to collect and how to normalize it.',                       'PUBLISHED'),
  ('03000000-0000-4000-8000-000000000204', '03000000-0000-4000-8000-000000000102', 2, 'SIEM & Alerting',               'Centralize data and write reliable detection rules.',            'PUBLISHED'),
  ('03000000-0000-4000-8000-000000000205', '03000000-0000-4000-8000-000000000103', 1, 'Threat Intelligence',           'Turn external knowledge into detection and response.',           'PUBLISHED'),
  ('03000000-0000-4000-8000-000000000206', '03000000-0000-4000-8000-000000000103', 2, 'Playbooks & Escalation',        'Documented response procedures and smart alert triage.',         'PUBLISHED'),
  ('03000000-0000-4000-8000-000000000207', '03000000-0000-4000-8000-000000000104', 1, 'The NIST Lifecycle',            'The four-phase incident response cycle.',                        'PUBLISHED'),
  ('03000000-0000-4000-8000-000000000208', '03000000-0000-4000-8000-000000000104', 2, 'Containment, Recovery & Forensics', 'Stop, clean, restore, and preserve evidence.',               'PUBLISHED'),
  ('03000000-0000-4000-8000-000000000209', '03000000-0000-4000-8000-000000000105', 1, 'Lessons Learned & Improvement', 'Turn every incident into a better process.',                     'PUBLISHED'),
  ('03000000-0000-4000-8000-000000000210', '03000000-0000-4000-8000-000000000105', 2, 'Building the Program',         'Stand up a SOC and run the capstone design exercise.',            'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03000000-0000-4000-8000-000000000301', '03000000-0000-4000-8000-000000000201', 1, 'The SOC: Mission & Functions',          'Define the SOC mission, its teams, and core service functions.',                 'TEXT', 'PUBLISHED', 'FREE', 10,  6),
  ('03000000-0000-4000-8000-000000000302', '03000000-0000-4000-8000-000000000201', 2, 'The Detection Stack',                   'See how SIEM, EDR, and network sensors work together.',                          'TEXT', 'PUBLISHED', 'FREE', 10,  7),
  ('03000000-0000-4000-8000-000000000303', '03000000-0000-4000-8000-000000000201', 3, 'SOC Foundations Quiz',                  'Check your understanding of SOC fundamentals.',                                 'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03000000-0000-4000-8000-000000000304', '03000000-0000-4000-8000-000000000202', 1, 'Defense in Depth in Practice',          'Layer independent controls across the attack surface.',                          'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03000000-0000-4000-8000-000000000305', '03000000-0000-4000-8000-000000000202', 2, 'Workflows, SLAs & Metrics',             'Run detection workflows and measure team performance.',                         'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03000000-0000-4000-8000-000000000306', '03000000-0000-4000-8000-000000000202', 3, 'Operations Concepts Quiz',              'Verify defense-in-depth and operational concepts.',                             'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03000000-0000-4000-8000-000000000307', '03000000-0000-4000-8000-000000000203', 1, 'Log Sources & Normalization',           'Recognize key log sources and standardize their fields.',                       'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03000000-0000-4000-8000-000000000308', '03000000-0000-4000-8000-000000000203', 2, 'Collecting & Storing Logs',             'Forward, centralize, and retain security telemetry.',                           'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03000000-0000-4000-8000-000000000309', '03000000-0000-4000-8000-000000000203', 3, 'Logging & Collection Quiz',             'Test your knowledge of logging fundamentals.',                                  'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03000000-0000-4000-8000-000000000310', '03000000-0000-4000-8000-000000000204', 1, 'SIEM Architecture & Correlation',       'Design a SIEM pipeline and write correlation logic.',                            'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03000000-0000-4000-8000-000000000311', '03000000-0000-4000-8000-000000000204', 2, 'Writing & Tuning Detection Rules',      'Create alert rules and keep them accurate.',                                     'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03000000-0000-4000-8000-000000000312', '03000000-0000-4000-8000-000000000204', 3, 'SIEM & Alerting Quiz',                 'Prove your SIEM and alerting skills.',                                           'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03000000-0000-4000-8000-000000000313', '03000000-0000-4000-8000-000000000205', 1, 'Threat Intelligence Fundamentals',      'Classify intelligence types and judge source quality.',                          'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03000000-0000-4000-8000-000000000314', '03000000-0000-4000-8000-000000000205', 2, 'From IoCs to TTPs',                    'Use indicators, the diamond model, and ATT&amp;CK.',                             'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03000000-0000-4000-8000-000000000315', '03000000-0000-4000-8000-000000000205', 3, 'Threat Intelligence Quiz',             'Check your threat intelligence knowledge.',                                      'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03000000-0000-4000-8000-000000000316', '03000000-0000-4000-8000-000000000206', 1, 'Incident Playbooks & Runbooks',        'Document repeatable response procedures.',                                        'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03000000-0000-4000-8000-000000000317', '03000000-0000-4000-8000-000000000206', 2, 'Triage, Severity & Escalation',        'Validate alerts, score severity, and escalate on time.',                        'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03000000-0000-4000-8000-000000000318', '03000000-0000-4000-8000-000000000206', 3, 'Playbooks & Escalation Quiz',          'Verify playbook and escalation skills.',                                         'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03000000-0000-4000-8000-000000000319', '03000000-0000-4000-8000-000000000207', 1, 'The NIST Response Lifecycle',          'Master the four-phase NIST incident response cycle.',                            'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03000000-0000-4000-8000-000000000320', '03000000-0000-4000-8000-000000000207', 2, 'Detection vs Response',                'Understand how detection and response feed each other.',                         'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03000000-0000-4000-8000-000000000321', '03000000-0000-4000-8000-000000000207', 3, 'Lifecycle & Detection Quiz',           'Test lifecycle and detection concepts.',                                         'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03000000-0000-4000-8000-000000000322', '03000000-0000-4000-8000-000000000208', 1, 'Containment & Eradication',            'Isolate the adversary and remove the root cause.',                               'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03000000-0000-4000-8000-000000000323', '03000000-0000-4000-8000-000000000208', 2, 'Recovery & Evidence Collection',       'Restore services and preserve forensic evidence.',                               'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03000000-0000-4000-8000-000000000324', '03000000-0000-4000-8000-000000000208', 3, 'IR Execution Quiz',                    'Prove your containment and forensics skills.',                                   'QUIZ', 'PUBLISHED', 'FREE', 15,  5),
  ('03000000-0000-4000-8000-000000000325', '03000000-0000-4000-8000-000000000209', 1, 'Lessons Learned & Improvement',        'Turn every incident into measurable improvement.',                               'TEXT', 'PUBLISHED', 'FREE', 10,  8),
  ('03000000-0000-4000-8000-000000000326', '03000000-0000-4000-8000-000000000210', 1, 'Building a SOC Program',               'Plan people, process, technology, and metrics for a SOC.',                       'TEXT', 'PUBLISHED', 'FREE', 10,  9),
  ('03000000-0000-4000-8000-000000000327', '03000000-0000-4000-8000-000000000210', 2, 'Capstone: Designing an IR Plan',      'Build a complete incident response plan for a real scenario.',                   'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03000000-0000-4000-8000-000000000328', '03000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                     'Demonstrate mastery of the entire course.',                                      'QUIZ', 'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
--    Accent: crimson — Security Operations & Incident Response.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03000000-0000-4000-8000-000000000401',
  '03000000-0000-4000-8000-000000000301',
  1,
  'The SOC: Mission & Functions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The SOC: Mission & Functions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The SOC: Mission &amp; Functions</h1>
  <p>A <strong>Security Operations Center (SOC)</strong> is the team that watches over an organization&rsquo;s systems around the clock. Its mission is simple to state and hard to execute: <em>monitor, detect, analyze, and respond to security events before they become damage</em>.</p>
  <p>The SOC is a function, not a room. It can be in-house, outsourced, or a hybrid of both — the defining quality is continuous, repeatable operation.</p>
  <h2>Core service functions</h2>
  <ul>
    <li><strong>Continuous monitoring</strong> — triage alerts from SIEM, EDR, network, cloud, and identity sources.</li>
    <li><strong>Threat detection</strong> — tune rules, hunt for missed activity, and search for indicators.</li>
    <li><strong>Incident response</strong> — validate events, scope impact, and coordinate containment.</li>
    <li><strong>Reporting</strong> — keep stakeholders informed with metrics such as MTTD and MTTR.</li>
    <li><strong>Intelligence</strong> — consume threat feeds and turn them into actionable detections.</li>
  </ul>
  <h2>How the team is structured</h2>
  <table>
    <tr><th>Tier</th><th>Focus</th><th>Typical duties</th></tr>
    <tr><td>Tier 1</td><td>Triage</td><td>Validate alerts, filter false positives, assign severity</td></tr>
    <tr><td>Tier 2</td><td>Investigate</td><td>Deep-dive into confirmed incidents, hunt for scope</td></tr>
    <tr><td>Tier 3</td><td>Expert analysis</td><td>Reverse engineer, build detections, own containment</td></tr>
    <tr><td>Management</td><td>Program</td><td>Metrics, staffing, process, executive communication</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>24/7 vs on-call</strong>
    <p>A 24/7 operation needs enough people to cover every shift. Smaller teams use on-call rotation with an escalation chain — document when each tier must wake up.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Follow-the-sun</strong>
    <p>Global teams hand off unworked queues to the next region at shift change. A written handoff note (open alerts, active incidents, context) prevents dropped work.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000402',
  '03000000-0000-4000-8000-000000000302',
  1,
  'The Detection Stack',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Detection Stack</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Detection Stack</h1>
  <p>A SOC does not run on one tool. It runs on a <strong>stack</strong> of layered sensors and a central brain that makes sense of their output. Each layer sees a slice of the environment; together they cover the gaps.</p>
  <h2>Core components</h2>
  <table>
    <tr><th>Layer</th><th>What it sees</th><th>Example signal</th></tr>
    <tr><td>EDR</td><td>Endpoint processes and behavior</td><td>Powershell launching cmd.exe</td></tr>
    <tr><td>SIEM</td><td>Correlated logs from many sources</td><td>5 failed logins then success</td></tr>
    <tr><td>Network IDS</td><td>Raw traffic patterns</td><td>Traffic to a C2 domain</td></tr>
    <tr><td>DNS/Web proxy</td><td>Lookups and HTTP requests</td><td>DGA-domain requests</td></tr>
    <tr><td>Cloud/identity</td><td>Authentication and API activity</td><td>Impossible travel login</td></tr>
    <tr><td>Threat feed</td><td>External reputation data</td><td>Known bad IP contacted</td></tr>
  </table>
  <h2>How the pipeline flows</h2>
  <ol>
    <li><strong>Collect</strong> — agents and forwarders ship logs to a central bus.</li>
    <li><strong>Normalize</strong> — map fields into a common schema.</li>
    <li><strong>Correlate</strong> — rules and analytics join events into hypotheses.</li>
    <li><strong>Alert</strong> — only meaningful signals reach the analyst queue.</li>
    <li><strong>Respond</strong> — playbooks, automation, and humans take over.</li>
  </ol>
  <p>An event leaving a sensor might look like this:</p>
  <pre class="code-block">{
  "log_source": "edr",
  "event_time": "2026-09-17T08:41:02Z",
  "host": "sales-lt-042",
  "process": "powershell.exe",
  "parent": "outlook.exe",
  "cmdline": "powershell -enc AQBlAHEAdQBlAHMAdAA=",
  "verdict": "suspicious"
}</pre>
  <div class="callout">
    <strong>Coverage gaps are the enemy</strong>
    <p>If a sensor is blind for a host, a network segment, or a cloud account, an attacker will find it. Run coverage reviews that map every asset to at least one detection source.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Start with what you can answer</strong>
    <p>Before adding a shiny new tool, confirm you can answer: what did the event do, who did it, on which asset, when, and what happened next? Tools fill the gaps to those questions.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000404',
  '03000000-0000-4000-8000-000000000304',
  1,
  'Defense in Depth in Practice',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Defense in Depth in Practice</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Defense in Depth in Practice</h1>
  <p><strong>Defense in depth</strong> means placing <em>independent</em>, overlapping controls at every layer so that defeating one does not compromise the whole. Attackers must break multiple barriers, and each barrier buys detection time.</p>
  <h2>Controls by layer</h2>
  <table>
    <tr><th>Layer</th><th>Example controls</th></tr>
    <tr><td>Perimeter</td><td>Firewalls, VPN, DDoS protection, mail gateway filters</td></tr>
    <tr><td>Network internal</td><td>Segmentation, micro-segmentation, network IDS, egress filtering</td></tr>
    <tr><td>Endpoint</td><td>EDR, application allow-listing, local firewall, patching</td></tr>
    <tr><td>Application</td><td>Secure defaults, runtime protection, code review, WAF</td></tr>
    <tr><td>Data</td><td>Encryption at rest and in transit, strict access, DLP</td></tr>
    <tr><td>Identity</td><td>MFA, least privilege, session monitoring, user awareness</td></tr>
  </table>
  <h2>What makes the layers work</h2>
  <ul>
    <li><strong>Independence</strong> — one control being bypassed must not neutralize the next.</li>
    <li><strong>Detection built in</strong> — every layer should also generate telemetry, not just block.</li>
    <li><strong>Tested overlap</strong> — run exercises that assume the perimeter already failed.</li>
  </ul>
  <p>A minimal segmentation model might look like this:</p>
  <pre class="code-block">zone: "internal-lab"
rule:
  - from: "user-wlans"
    to:   "db-tier"
    action: deny
rule:
  - from: "app-tier"
    to:   "db-tier"
    action: allow
    only: "tcp/5432"</pre>
  <div class="callout callout-tip">
    <strong>Assume breach</strong>
    <p>Design every detection and response procedure as if an attacker is already inside. This mindset drives egress filtering, least privilege, and credential monitoring harder than any checklist.</p>
  </div>
  <div class="callout">
    <strong>Danger: a paper castle</strong>
    <p>A policy with no enforcement is worse than no policy — it creates false confidence. Defense in depth counts only controls that are deployed, monitored, and verified to actually block.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000405',
  '03000000-0000-4000-8000-000000000305',
  1,
  'Workflows, SLAs & Metrics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Workflows, SLAs & Metrics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Workflows, SLAs &amp; Metrics</h1>
  <p>Security operations is a production line: alerts flow in, each must be worked, and nothing may fall off the table. A well-defined <strong>workflow</strong> plus clear <strong>SLAs</strong> keeps work moving and makes the team measurable.</p>
  <h2>The detection workflow</h2>
  <ol>
    <li><strong>Ingest</strong> — the alert lands in the queue with its raw context.</li>
    <li><strong>Triage</strong> — validate, score severity, assign an owner.</li>
    <li><strong>Investigate</strong> — collect evidence and scope affected assets.</li>
    <li><strong>Respond</strong> — contain, mitigate, or acknowledge per playbook.</li>
    <li><strong>Document &amp; close</strong> — record actions, lessons, and metrics.</li>
  </ol>
  <h2>Severity model</h2>
  <p>Severity = <em>impact</em> × <em>urgency</em>. The same alert is higher severity against a crown-jewel system.</p>
  <table>
    <tr><th>Severity</th><th>Meaning</th><th>Example</th></tr>
    <tr><td>1 Critical</td><td>Active breach, high-value assets</td><td>Ransomware encrypting servers</td></tr>
    <tr><td>2 High</td><td>Confirmed compromise, limited spread</td><td>Credential theft from an admin</td></tr>
    <tr><td>3 Medium</td><td>Suspicious but unconfirmed</td><td>Beaconing traffic to a new domain</td></tr>
    <tr><td>4 Low</td><td>Informational</td><td>Policy warning, single blocked attempt</td></tr>
  </table>
  <h2>Example SLA targets</h2>
  <table>
    <tr><th>Metric</th><th>Definition</th><th>Typical target</th></tr>
    <tr><td>MTTD</td><td>Time from event to detection</td><td>Minimize; 1–15 min for critical</td></tr>
    <tr><td>MTTR</td><td>Time from detection to containment</td><td>1 h critical · 24 h high</td></tr>
    <tr><td>Alert backlog</td><td>Alerts not yet triaged</td><td>Zero older than 1 shift</td></tr>
    <tr><td>Timeout</td><td>Max time an alert waits for a decision</td><td>Usually 10–30 min per tier</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Escalate by time, not pride</strong>
    <p>An alert that crosses its SLA must escalate to the next tier automatically. Time-based escalation keeps incidents from silently aging in the queue.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Measure honestly</strong>
    <p>Teams game the metrics they are judged on. If MTTR is the only metric, analysts skip investigation. Track MTTR together with quality checks like missed-rule reviews and false-positive rate.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000407',
  '03000000-0000-4000-8000-000000000307',
  1,
  'Log Sources & Normalization',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Log Sources & Normalization</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Log Sources &amp; Normalization</h1>
  <p>Detection is only as good as the telemetry feeding it. Every device and service emits logs in its own dialect; the analyst&rsquo;s job is to gather the important ones and translate them into one consistent language.</p>
  <h2>Key security-relevant sources</h2>
  <table>
    <tr><th>Source</th><th>Most valuable signals</th></tr>
    <tr><td>Authentication</td><td>Logons, failures, lockouts, account changes</td></tr>
    <tr><td>Firewall / IDS</td><td>Allowed/denied flows, intrusion attempts</td></tr>
    <tr><td>DNS</td><td>Query names, NXDOMAIN bursts, DGA patterns</td></tr>
    <tr><td>Web proxy / mail</td><td>URLs, downloads, phishing delivery</td></tr>
    <tr><td>EDR</td><td>Process chains, memory events, persistence</td></tr>
    <tr><td>Cloud &amp; identity</td><td>API calls, risky sign-ins, privilege grants</td></tr>
    <tr><td>Application</td><td>SQL errors, API abuse, unusual business activity</td></tr>
  </table>
  <h2>The anatomy of an event</h2>
  <ul>
    <li><strong>Timestamp</strong> — when the event happened (store in UTC).</li>
    <li><strong>Source</strong> — which host, sensor, or service produced it.</li>
    <li><strong>Actor</strong> — user, process, or service that did the action.</li>
    <li><strong>Action</strong> — what was attempted or performed.</li>
    <li><strong>Target</strong> — the object affected, such as a file or account.</li>
    <li><strong>Outcome</strong> — succeeded, failed, or blocked.</li>
  </ul>
  <p><strong>Normalization</strong> maps vendor-specific fields into a shared schema so events can be compared and correlated:</p>
  <pre class="code-block">{
  "schema_version": "1.0",
  "event_time": "2026-09-17T09:12:33Z",
  "src_host": "build-srv-07",
  "src_user": "deploy-bot",
  "action": "logon",
  "outcome": "failure",
  "raw_vendor": "windows",
  "raw_event_id": 4625
}</pre>
  <div class="callout callout-info">
    <strong>UTC everywhere</strong>
    <p>Store all timestamps in UTC with explicit timezone info. A detection that works only in local time silently breaks during daylight-saving shifts.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Keep the raw record</strong>
    <p>Normalize to a copy, never destructively. Keep the original log for forensics — normalization can drop fields you will need later.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000408',
  '03000000-0000-4000-8000-000000000308',
  1,
  'Collecting & Storing Logs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Collecting & Storing Logs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Collecting &amp; Storing Logs</h1>
  <p>A log that stays on the device it came from is nearly useless for detection. The SOC needs <strong>centralized</strong> collection so it can search, correlate, and retain activity across the estate.</p>
  <h2>Collection options</h2>
  <ul>
    <li><strong>Agent-based</strong> — small collectors on each host ship logs over TLS (best coverage).</li>
    <li><strong>Syslog</strong> — standard UDP/TCP forwarding for network gear and Linux.</li>
    <li><strong>Event forwarding</strong> — native forwarding for Windows event log.</li>
    <li><strong>Cloud-native</strong> — managed logging built into cloud platforms.</li>
    <li><strong>API pulls</strong> — services the vendor only exposes via API.</li>
  </ul>
  <h2>A minimal Linux forwarder</h2>
  <pre class="code-block"># /etc/rsyslog.d/50-soc.conf — forward auth + sudo to the collector
module(load="imfile")
input(type="imfile" File="/var/log/auth.log" Tag="auth:")
input(type="imfile" File="/var/log/sudo.log" Tag="sudo:")
*.* action(type="omfwd" Target="loghub.example.com" Port="6514" Protocol="tcp" TLS="on")</pre>
  <h2>Retention: enough, but not forever</h2>
  <table>
    <tr><th>Log type</th><th>Typical retention</th><th>Why</th></tr>
    <tr><td>Authentication</td><td>1 year</td><td>Account-based investigations</td></tr>
    <tr><td>EDR / process</td><td>90 days–1 year</td><td>Behavioral and incident review</td></tr>
    <tr><td>Firewall / network</td><td>90 days–1 year</td><td>Access tracing</td></tr>
    <tr><td>Financial/regulated</td><td>3–7 years</td><td>Compliance and legal hold</td></tr>
  </table>
  <div class="callout">
    <strong>Retention is a trade</strong>
    <p>Longer retention costs money and expands breach-notification exposure. Set retention by security need first, then regulation, then budget — not the reverse.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Make logs tamper-evident</strong>
    <p>An attacker who can edit logs will. Ship logs to an out-of-band store and consider append-only or WORM storage for audit-critical sources.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000410',
  '03000000-0000-4000-8000-000000000310',
  1,
  'SIEM Architecture & Correlation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SIEM Architecture & Correlation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>SIEM Architecture &amp; Correlation</h1>
  <p>A <strong>Security Information and Event Management (SIEM)</strong> system is the SOC&rsquo;s central brain: it ingests logs, normalizes them, stores them for search, and applies correlation logic that turns many small events into one meaningful alert.</p>
  <h2>Anatomy of a SIEM pipeline</h2>
  <ol>
    <li><strong>Ingest</strong> — connectors receive events from agents, syslog, and APIs.</li>
    <li><strong>Parse &amp; normalize</strong> — raw records become schema-conforming events.</li>
    <li><strong>Correlate</strong> — the rule engine joins events across time and sources.</li>
    <li><strong>Enrich</strong> — threat feeds, asset metadata, and geo data are attached.</li>
    <li><strong>Store &amp; alert</strong> — events are indexed for search and rules fire alerts.</li>
  </ol>
  <h2>A correlation rule in practice</h2>
  <p>Correlation logic is often expressed like a detection query. This one flags a single host failing many logons then succeeding:</p>
  <pre class="code-block">detection:
  selection_failures:
    event.action: logon_failure
    event.host: { count: &gt; 10, window: 5m }
  selection_success:
    event.action: logon_success
    event.host: { count: &gt; 0, window: 1m }
  condition: selection_failures and selection_success
meta:
  name: "Brute force followed by success"
  severity: high</pre>
  <h2>Strengths and limits</h2>
  <table>
    <tr><th>Strength</th><th>Limit</th></tr>
    <tr><td>One searchable store for all logs</td><td>No visibility into what it never receives</td></tr>
    <tr><td>Time-boxed correlation across sources</td><td>Rule quality depends on log quality</td></tr>
    <tr><td>Compliance reporting and retention</td><td>Storage and licensing can grow costly</td></tr>
  </table>
  <div class="callout">
    <strong>A SIEM is not a magic detector</strong>
    <p>An empty SIEM is a very expensive dashboard. Value comes from tuned rules, fed and verified data, and analysts who actually search it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Map rules to ATT&amp;CK</strong>
    <p>Tag every rule with the MITRE ATT&amp;CK tactic and technique it covers. Coverage gaps surface instantly when a chain of techniques has no rule.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000411',
  '03000000-0000-4000-8000-000000000311',
  1,
  'Writing & Tuning Detection Rules',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Writing & Tuning Detection Rules</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Writing &amp; Tuning Detection Rules</h1>
  <p>A detection rule is a hypothesis about what an attacker looks like. Well-designed rules produce <strong>true positives</strong> that matter and stay quiet the rest of the time.</p>
  <h2>Anatomy of a good rule</h2>
  <ul>
    <li><strong>Clear intent</strong> — the technique it detects, not the noise it happens to match.</li>
    <li><strong>Precise fields</strong> — filter on normalized fields, not raw text.</li>
    <li><strong>Well-chosen window</strong> — long enough to see the behavior, short enough to stay relevant.</li>
    <li><strong>Known baselines</strong> — suppress activities proven benign in your environment.</li>
    <li><strong>An owner</strong> — someone responsible when it fires too much or not at all.</li>
  </ul>
  <h2>Example rule</h2>
  <pre class="code-block">detection:
  selection:
    process.name: mshta.exe
    process.parent.name: outlook.exe
  condition: selection
meta:
  name: "Office document launching mshta"
  tactic: execution
  technique: T1218.005
  severity: high
  owner: detection-team</pre>
  <h2>True, false, and missed</h2>
  <table>
    <tr><th>Term</th><th>Meaning</th><th>Wanted</th></tr>
    <tr><td>True positive</td><td>Rule fired and the threat was real</td><td>Yes</td></tr>
    <tr><td>False positive</td><td>Rule fired but no threat existed</td><td>Reduce</td></tr>
    <tr><td>False negative</td><td>Rule stayed quiet while a threat occurred</td><td>Eliminate</td></tr>
  </table>
  <h2>The tuning loop</h2>
  <ol>
    <li>Review every alert: was it right, useful, or noise?</li>
    <li>Suppress confirmed noise with precise exceptions.</li>
    <li>Run the rule against past events to gauge volume.</li>
    <li>Promote only rules with acceptable precision.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Alert fatigue is real</strong>
    <p>A hundred low-value alerts teach analysts to ignore the queue. Fewer, sharper alerts with context get better response and better coverage.</p>
  </div>
  <div class="callout callout-info">
    <strong>Tune, do not delete</strong>
    <p>When a rule is too noisy, adjust and re-test rather than deleting it — a deleted rule is a permanent blind spot nobody will notice until it is too late.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000413',
  '03000000-0000-4000-8000-000000000313',
  1,
  'Threat Intelligence Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Threat Intelligence Fundamentals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Threat Intelligence Fundamentals</h1>
  <p><strong>Threat intelligence</strong> is analyzed information about adversaries, their capabilities, and their intent — used to make security decisions. Raw data is not intelligence; analysis and context make it useful.</p>
  <h2>Four kinds of intelligence</h2>
  <table>
    <tr><th>Type</th><th>Audience</th><th>Example</th></tr>
    <tr><td>Strategic</td><td>Executives</td><td>Industry risk trends, adversary motives</td></tr>
    <tr><td>Tactical</td><td>Defenders</td><td>Tooling, procedures, TTP patterns</td></tr>
    <tr><td>Operational</td><td>Investigators</td><td>Planned campaigns against the sector</td></tr>
    <tr><td>Technical</td><td>Sensors/detection</td><td>Hashes, IPs, domains (IoCs)</td></tr>
  </table>
  <h2>Where intelligence comes from</h2>
  <ul>
    <li><strong>OSINT</strong> — open sources: vendor blogs, databases, public research.</li>
    <li><strong>Commercial feeds</strong> — curated, high-confidence indicators.</li>
    <li><strong>ISACs/ISAOs</strong> — sector sharing communities (finance, health, energy).</li>
    <li><strong>Internal</strong> — your own incidents, hunts, and sensor telemetry.</li>
  </ul>
  <h2>Judging quality</h2>
  <ul>
    <li><strong>Relevance</strong> — does it apply to your sector, stack, and geography?</li>
    <li><strong>Timeliness</strong> — is it current, or is the campaign long over?</li>
    <li><strong>Accuracy</strong> — has the source been right before?</li>
  </ul>
  <div class="callout">
    <strong>Intelligence clutter</strong>
    <p>Subscribing to twenty feeds usually produces noise, not coverage. Curate fewer, higher-quality sources and measure each feed by how many real detections it enabled.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Close the loop</strong>
    <p>Intelligence that never changes a rule or a decision is decoration. Track how each intel product influenced detection tuning, blocking, or executive risk reporting.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000414',
  '03000000-0000-4000-8000-000000000314',
  1,
  'From IoCs to TTPs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>From IoCs to TTPs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>From IoCs to TTPs</h1>
  <p>Mature operations think about adversaries as <strong>TTPs</strong> — Tactics, Techniques, and Procedures — because indicators decay, but behavior repeats. Indicators tell you <em>what</em> to look for; TTPs tell you <em>how to think</em>.</p>
  <h2>Common indicator types</h2>
  <table>
    <tr><th>Indicator</th><th>Lifetime</th><th>Answer it gives</th></tr>
    <tr><td>File hash</td><td>Hours–days</td><td>Was this exact sample observed?</td></tr>
    <tr><td>IP address</td><td>Days–weeks</td><td>Did the host talk to it?</td></tr>
    <tr><td>Domain</td><td>Weeks</td><td>What resolved where?</td></tr>
    <tr><td>Email header/sender</td><td>Campaign-bound</td><td>Is this the same phish run?</td></tr>
    <tr><td>File path / registry</td><td>Long-lived</td><td>Is persistence installed here?</td></tr>
  </table>
  <h2>The diamond model</h2>
  <pre class="code-block">        Adversary
          /    \
        /        \
Infrastructure ---- Victim

                |
             Capability

Pivot: find the adversary by joining events at any two nodes.</pre>
  <p>The diamond model frames every intrusion as an <strong>adversary</strong> using a <strong>capability</strong> over an <strong>infrastructure</strong> against a <strong>victim</strong>. Pivoting between the four nodes is the core investigation technique: a domain resolves from a known IP, that IP was used for a phishing send, and so on.</p>
  <h2>ATT&amp;CK mapping</h2>
  <pre class="code-block">campaign: summer-2026-phish
techniques:
  - tactic: initial-access
    technique: T1566.001  # spear-phishing with attachment
  - tactic: execution
    technique: T1204.002  # user executes the payload
  - tactic: persistence
    technique: T1547.001  # registry run key</pre>
  <div class="callout callout-info">
    <strong>IoCs expire</strong>
    <p>Treat indicators as transient clues, not ground truth. An IP that was malicious yesterday may host a web shop today — always validate before blocking.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Behavior beats artifacts</strong>
    <p>Design detections around technique patterns, not just observed hashes. A detection that spots the method will catch the next variant too.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000416',
  '03000000-0000-4000-8000-000000000316',
  1,
  'Incident Playbooks & Runbooks',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Incident Playbooks & Runbooks</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Incident Playbooks &amp; Runbooks</h1>
  <p>Under pressure, humans forget. A <strong>playbook</strong> is the written answer to &ldquo;what do we do now?&rdquo; for a specific incident type — the steps, roles, decision points, and communication rules that keep a response consistent.</p>
  <h2>Anatomy of a playbook</h2>
  <ul>
    <li><strong>Trigger</strong> — which alerts or observations start it.</li>
    <li><strong>Preconditions</strong> — confirmations required before acting.</li>
    <li><strong>Steps</strong> — ordered, concrete, executable actions.</li>
    <li><strong>Decision points</strong> — branches with the criteria for each path.</li>
    <li><strong>Roles &amp; comms</strong> — who does what, who gets told, and when.</li>
    <li><strong>Exit criteria</strong> — how you know the incident is resolved.</li>
  </ul>
  <h2>A playbook skeleton</h2>
  <pre class="code-block">playbook: phishing-campaign
trigger: user-reported email OR mail-gateway match
step 1: quarantine the message (confirm sender + link target)
step 2: check if the link was opened by any user
  if opened =&gt; escalate to incident, wipe nothing yet
step 3: contact affected users with safe instructions
step 4: block sender + domain in mail and proxy
step 5: document and close; feed IoCs to detection
exit: no affected user has evidence of compromise</pre>
  <h2>Two common examples</h2>
  <table>
    <tr><th>Type</th><th>First actions</th><th>Biggest risk</th></tr>
    <tr><td>Phishing</td><td>Quarantine, confirm spread, block sender</td><td>Credential theft before you act</td></tr>
    <tr><td>Ransomware</td><td>Isolate host, snapshot, preserve evidence</td><td>Encryption spreading laterally</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Test playbooks, do not file them</strong>
    <p>A playbook that has never been walked through in a tabletop exercise will fail at the worst moment. Drill the high-severity ones every quarter.</p>
  </div>
  <div class="callout callout-info">
    <strong>Automate the mechanical parts</strong>
    <p>Quarantining a message or blocking a domain are deterministic steps — good candidates for SOAR automation. Save human judgment for the branches.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000417',
  '03000000-0000-4000-8000-000000000317',
  1,
  'Triage, Severity & Escalation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Triage, Severity & Escalation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Triage, Severity &amp; Escalation</h1>
  <p>Most alerts are false positives; a few are catastrophes. <strong>Triage</strong> is the discipline of telling them apart quickly and getting the right resources on the real ones.</p>
  <h2>The triage sequence</h2>
  <ol>
    <li><strong>Verify</strong> — does the signal reflect a real event, or a bad rule?</li>
    <li><strong>Scope</strong> — which hosts, accounts, and data are involved?</li>
    <li><strong>Classify</strong> — map to threat, technique, and severity.</li>
    <li><strong>Prioritize</strong> — queue against everything else pending.</li>
    <li><strong>Act</strong> — follow the matching playbook or hold with justification.</li>
  </ol>
  <h2>Severity = impact × urgency</h2>
  <table>
    <tr><th></th><th>High impact</th><th>Low impact</th></tr>
    <tr><td><strong>Active</strong></td><td>SEV 1 — contain immediately</td><td>SEV 2 — investigate today</td></tr>
    <tr><td><strong>Dormant</strong></td><td>SEV 2 — monitor and plan</td><td>SEV 3 — normal queue</td></tr>
  </table>
  <p>Escalation thresholds should be pre-agreed: <em>any confirmed breach of customer data, any domain-credential exposure, or any impact to a regulated system escalates to the on-call manager within X minutes.</em></p>
  <h2>Communication during an incident</h2>
  <pre class="code-block">INCIDENT NOTIFICATION
Severity: SEV 1
Type:    Suspected account takeover — payroll system
Detected: 2026-09-17 14:02 UTC by rule PAY-003
Scope:    User pay-user-88, host hr-app-01 (initial)
Containment: Account disabled, egress session terminated
Status:  Under investigation — updates every 30 minutes</pre>
  <div class="callout callout-tip">
    <strong>Escalation is a feature, not a failure</strong>
    <p>Escalating early buys time and expertise. The goal is to raise the flag before impact crosses the threshold, not after — err on the side of ringing the bell.</p>
  </div>
  <div class="callout callout-info">
    <strong>Document as you go</strong>
    <p>Every action taken during response belongs in the timeline immediately. Memory is unreliable after the fact, and the timeline is your evidence and your after-action report.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000419',
  '03000000-0000-4000-8000-000000000319',
  1,
  'The NIST Response Lifecycle',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The NIST Response Lifecycle</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The NIST Response Lifecycle</h1>
  <p>NIST Special Publication 800-61 defines the organizing framework every security team should follow: <strong>Preparation → Detection &amp; Analysis → Containment, Eradication &amp; Recovery → Post-Incident Activity</strong>.</p>
  <pre class="code-block">     Preparation
          |
          v
 Detection &amp; Analysis
          |
          v
 Containment, Eradication &amp; Recovery
          |
          v
   Post-Incident Activity
          |
          +---- feeds back to Preparation</pre>
  <h2>The four phases</h2>
  <table>
    <tr><th>Phase</th><th>Main activities</th></tr>
    <tr><td>Preparation</td><td>IR plan, tools, training, playbooks, comms, retainer</td></tr>
    <tr><td>Detection &amp; Analysis</td><td>Triage, scoping, indicator collection, root-cause clues</td></tr>
    <tr><td>Containment, Eradication &amp; Recovery</td><td>Limit spread, remove adversary, restore and validate</td></tr>
    <tr><td>Post-Incident Activity</td><td>Lessons learned, report, metric updates, process fixes</td></tr>
  </table>
  <h2>Preparation is the quiet win</h2>
  <ul>
    <li>Keep the incident response plan current and reachable offline.</li>
    <li>Pre-position playbooks, IR toolkits, and forensic images.</li>
    <li>Run tabletop exercises so roles are familiar before pressure hits.</li>
    <li>Pre-arrange external help: legal, forensics, breach counsel, and IR retainer.</li>
  </ul>
  <p>Detection and analysis is the phase where most teams are weakest: it is where the decision to elevate from &ldquo;alert&rdquo; to &ldquo;incident&rdquo; is made, so evidence discipline matters from the very first minute.</p>
  <div class="callout callout-info">
    <strong>The cycle feeds itself</strong>
    <p>Post-incident findings — missed detections, slow tools, unclear roles — flow straight back into preparation. Every incident should make the next one shorter.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Practice the boring parts</strong>
    <p>Security incidents are not the only disaster. DNS outages, cloud key rotations, and lost laptops all run the same lifecycle and strengthen the same muscles.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000420',
  '03000000-0000-4000-8000-000000000320',
  1,
  'Detection vs Response',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Detection vs Response</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Detection vs Response</h1>
  <p><strong>Detection</strong> is seeing the threat: the rule, feed, or hunt that reveals suspicious activity. <strong>Response</strong> is acting on it: containing, investigating, and recovering. They are two jobs that must feed each other continuously.</p>
  <h2>How they differ</h2>
  <table>
    <tr><th></th><th>Detection</th><th>Response</th></tr>
    <tr><td>Goal</td><td>Find the adversary</td><td>Limit and repair damage</td></tr>
    <tr><td>Output</td><td>Alerts, leads, coverage gaps</td><td>Containment, eradication, recovery</td></tr>
    <tr><td>Mistake</td><td>Too noisy to trust, or blind</td><td>Too slow, or destructive to evidence</td></tr>
    <tr><td>Owner</td><td>Detection engineers, analysts</td><td>Incident responders, hunts</td></tr>
  </table>
  <h2>The detection continuum</h2>
  <ul>
    <li><strong>Prevention</strong> — block what you can (patches, filters, allow-lists).</li>
    <li><strong>Detection</strong> — see what prevention misses.</li>
    <li><strong>Response</strong> — act before damage compounds.</li>
  </ul>
  <p>Prevention failures are inevitable; that is exactly why detection exists. A firewall is useful, but the SOC exists because traffic still reaches the user.</p>
  <h2>The feedback loop</h2>
  <p>Every response teaches detection. When an incident is closed, ask: <em>which alert should have fired earlier, and which rule fired without value?</em> The answers become new rules, suppressed noise, and better sensors.</p>
  <pre class="code-block">response findings --&gt; rule updates --&gt; new alerts --&gt; better response
        ^                                                    |
        +-----------------------------------------------------+</pre>
  <div class="callout callout-tip">
    <strong>Do not respond to noise</strong>
    <p>If the team spends response hours on false positives, real signals decay in the queue. Invest continuously in detection quality so response capacity is spent where it matters.</p>
  </div>
  <div class="callout callout-info">
    <strong>Detection engineering is a craft</strong>
    <p>Treat rules and hunts as code: versioned, reviewed, tested against known-good and known-bad data, and owned by a named engineer. That discipline is what makes detection trustworthy.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000422',
  '03000000-0000-4000-8000-000000000322',
  1,
  'Containment & Eradication',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Containment & Eradication</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Containment &amp; Eradication</h1>
  <p>Once an incident is confirmed, speed matters: <strong>containment</strong> stops the adversary from spreading while the team works, and <strong>eradication</strong> removes the adversary and the conditions that let it in.</p>
  <h2>Containment strategies</h2>
  <table>
    <tr><th>Strategy</th><th>When to use</th><th>Watch out for</th></tr>
    <tr><td>Isolate host</td><td>Single endpoint compromised</td><td>Attacker may move before isolation</td></tr>
    <tr><td>Segment network</td><td>Lateral movement observed</td><td>Segmentation must already exist</td></tr>
    <tr><td>Block C2 / domains</td><td>Beaconing traffic confirmed</td><td>Alerting the adversary to your presence</td></tr>
    <tr><td>Disable account / session</td><td>Account takeover</td><td>Locking out the real user too</td></tr>
  </table>
  <div class="callout">
    <strong>Preserve evidence before killing</strong>
    <p>Before you reimage or power down, capture memory and a forensic image. Containment that destroys evidence turns a recoverable incident into an unanswerable one.</p>
  </div>
  <h2>The eradication sequence</h2>
  <ol>
    <li>Identify every infection point and persistence mechanism.</li>
    <li>Remove malware, implants, and modified binaries.</li>
    <li>Patch or remediate the vulnerability that was exploited.</li>
    <li>Reset all credentials the adversary could have touched.</li>
    <li>Re-verify with a clean scan and re-check access.</li>
  </ol>
  <p>A working eradication checklist for a single host:</p>
  <pre class="code-block">[ ] continue monitoring
[ ] quarantine host from lateral paths
[ ] confirm backdoor/persistence gone
[ ] rebuild from trusted media or clean image
[ ] rotate all local + domain credentials used on host
[ ] rejoin host only after clean scan</pre>
  <div class="callout callout-tip">
    <strong>Contain the account, not just the box</strong>
    <p>Attackers rarely live on one host. Contain the user identity, session tokens, and any service accounts used anywhere in the path — not just the endpoint where you saw the click.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000423',
  '03000000-0000-4000-8000-000000000323',
  1,
  'Recovery & Evidence Collection',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recovery & Evidence Collection</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Recovery &amp; Evidence Collection</h1>
  <p>Recovery brings systems back with confidence that the adversary is gone, and forensic collection preserves the facts for analysis, legal action, and notification. Evidence comes first — live state evaporates.</p>
  <h2>The order of volatility</h2>
  <table>
    <tr><th>Order</th><th>Artifact</th><th>If you wait, you lose</th></tr>
    <tr><td>1</td><td>RAM / running processes</td><td>Encrypted content, live malware</td></tr>
    <tr><td>2</td><td>Network state</td><td>Active connections, sessions</td></tr>
    <tr><td>3</td><td>Disk / files</td><td>Deleted and staged artifacts</td></tr>
    <tr><td>4</td><td>Backups</td><td>Historical state and timeline</td></tr>
  </table>
  <h2>Capturing evidence</h2>
  <p>On live systems, collect memory before touching disk, writing only to external media:</p>
  <pre class="code-block"># Windows (example with a memory-capture tool)
winpmem.exe --output evidence\mem.raw

# Linux (classic acquisition toolbox)
sudo dc3dd if=/dev/sda of=evidence\disk.img hash=sha256

# Verify the image afterwards
sha256sum evidence\disk.img</pre>
  <h2>Chain of custody</h2>
  <ul>
    <li>Label every item with case, system, date, and collector.</li>
    <li>Record who held it and when — an unbroken log from collection to court.</li>
    <li>Work on copies; store originals write-protected and unchanged.</li>
    <li>Log each access to the evidence.</li>
  </ul>
  <h2>The recovery path</h2>
  <ol>
    <li>Restore from trusted backups taken <em>before</em> the compromise.</li>
    <li>Validate restored systems: scans, credentials, and data integrity.</li>
    <li>Reintroduce systems in stages behind the monitoring stack.</li>
    <li>Watch for repeat indicators and re-compromise signals.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Never trust old backups blindly</strong>
    <p>If the backup window overlapped the intrusion, the restore inherits the infection. Scan restored data and confirm the timeline before trusting it.</p>
  </div>
  <div class="callout callout-info">
    <strong>Evidence is for two audiences</strong>
    <p>One copy of the evidence is for your analytics; a second, pristine copy is for law enforcement and counsel. Keep the pristine copy sealed and untouched.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000425',
  '03000000-0000-4000-8000-000000000325',
  1,
  'Lessons Learned & Improvement',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lessons Learned & Improvement</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Lessons Learned &amp; Improvement</h1>
  <p>The post-incident phase is where experience becomes<br><strong>capability</strong>. A response that ends with the system restored but nothing changed has thrown away its most valuable outcome.</p>
  <h2>Hold a blameless review</h2>
  <p>Convene within days, while memory is fresh. The purpose is to understand the system, not to assign blame — people do not contribute honest detail to a witch hunt.</p>
  <h2>Structure the session</h2>
  <table>
    <tr><th>Question</th><th>Purpose</th></tr>
    <tr><td>What went well?</td><td>Protect and repeat the good process</td></tr>
    <tr><td>What went poorly?</td><td>Find the weakest moments in the timeline</td></tr>
    <tr><td>What should we do differently?</td><td>Translate findings into concrete change</td></tr>
  </table>
  <h2>The incident report</h2>
  <pre class="code-block">INCIDENT REPORT — IR-2026-048
1. Executive summary (impact, status)
2. Timeline of events
3. Detection and analysis detail
4. Containment, eradication, recovery actions
5. Root cause(s)
6. Evidence and artifacts
7. Lessons learned
8. Action items with owners and due dates</pre>
  <h2>Action items that stick</h2>
  <ul>
    <li>Each action item needs an <strong>owner</strong> and a <strong>due date</strong>.</li>
    <li>Prioritize by recurrence risk: what lets the same thing happen again?</li>
    <li>Re-run the affected detection rule against the incident data.</li>
    <li>Update the relevant playbook and metrics targets.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Metrics reflect improvement</strong>
    <p>Watch post-incident trends in MTTD, MTTR, and recurrence. Shorter detections, faster containment, and no re-infection are the proof that learning happened.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Small incidents are free lessons</strong>
    <p>Do not reserve the review for big breaches. A quick retro after a minor phishing or a false-alarm wave trains the same muscles cheaply.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000426',
  '03000000-0000-4000-8000-000000000326',
  1,
  'Building a SOC Program',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building a SOC Program</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Building a SOC Program</h1>
  <p>A SOC is people, process, and technology held together by budget and metrics. Build it in stages, measure what matters, and resist the urge to buy tools ahead of the team that will use them.</p>
  <h2>People: the team model</h2>
  <table>
    <tr><th>Role</th><th>Count (starter)</th><th>Focus</th></tr>
    <tr><td>Analysts (tier 1–2)</td><td>3–5</td><td>Triage and investigation per shift</td></tr>
    <tr><td>Detection engineer</td><td>1–2</td><td>Rules, tuning, hunting</td></tr>
    <tr><td>IR lead / manager</td><td>1</td><td>Escalation, process, stakeholders</td></tr>
    <tr><td>On-call / rotation</td><td>shared</td><td>Coverage outside business hours</td></tr>
  </table>
  <h2>Process: the operating rhythm</h2>
  <ul>
    <li>Defined alert lifecycle with SLAs and time-based escalation.</li>
    <li>Playbooks for the incidents you actually see, tested routinely.</li>
    <li>Shift handoff ritual with a written, checked queue.</li>
    <li>Weekly detection review and monthly report to leadership.</li>
  </ul>
  <h2>Technology: a minimum viable stack</h2>
  <ul>
    <li><strong>Collection</strong> — log forwarders with unified schema.</li>
    <li><strong>SIEM</strong> — searchable store and correlation engine.</li>
    <li><strong>EDR</strong> — endpoint behavior across the estate.</li>
    <li><strong>Ticketing</strong> — every alert tracked to closure.</li>
  </ul>
  <h2>Metrics you actually report</h2>
  <table>
    <tr><th>Metric</th><th>Healthy direction</th></tr>
    <tr><td>MTTD / MTTR</td><td>Steadily down</td></tr>
    <tr><td>False-positive rate</td><td>Low and stable</td></tr>
    <tr><td>Alert backlog</td><td>Near zero each shift</td></tr>
    <tr><td>Coverage per technique</td><td>ATT&amp;CK coverage that grows</td></tr>
  </table>
  <p>A pragmatic 12-month roadmap keeps the program honest:</p>
  <pre class="code-block">Q1: collect + centralize the top 5 log sources
Q2: launch 25 tuned detection rules
Q3: build ransomware + phishing playbooks, tabletop test
Q4: add threat intel feed and hunting hour; report trends</pre>
  <div class="callout callout-info">
    <strong>Build vs buy</strong>
    <p>Managed SOC services make sense at small scale. Keep ownership of the questions that matter: who is accountable for detection, and can anyone prove the coverage?</p>
  </div>
  <div class="callout callout-tip">
    <strong>Start with the load</strong>
    <p>Right-size from alert volume, not vendor marketing. If the team is drowning, tune; if coverage is thin, collect more. Tooling follows the gap.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03000000-0000-4000-8000-000000000427',
  '03000000-0000-4000-8000-000000000327',
  1,
  'Capstone: Designing an IR Plan',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Designing an IR Plan</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef2f2; border-left: 4px solid #dc2626; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #ef4444; }
.dark .lesson-page h2 { color: #fca5a5; }
.dark .lesson-page .ic { background: #450a0a; color: #fca5a5; }
.dark .lesson-page .callout { background: #450a0a; border-left-color: #ef4444; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #450a0a; color: #fca5a5; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Designing an IR Plan</h1>
  <p>Your capstone is to produce a complete, usable <strong>incident response plan</strong> for a fictional company — not a theory document, but a plan a tired on-call analyst could follow at 2 a.m.</p>
  <h2>The briefing</h2>
  <blockquote>
    <p>Northwind Retail runs an online store, a warehouse system, and a payment platform with card data. It has 140 employees, a managed SIEM, EDR on all endpoints, a small infra team, and no dedicated staff. There is no current response plan and no tabletop exercise ever held.</p>
  </blockquote>
  <h2>Required plan structure</h2>
  <ol>
    <li><strong>Purpose &amp; scope</strong> — what the plan covers and who it protects.</li>
    <li><strong>Roles &amp; call tree</strong> — who does what, with 24/7 contact paths.</li>
    <li><strong>Severity &amp; escalation</strong> — criteria with time-based triggers.</li>
    <li><strong>Phases</strong> — preparation, detection, containment, eradication, recovery, post-incident.</li>
    <li><strong>Communication</strong> — internal, customers, regulators, and media templates.</li>
    <li><strong>Playbooks</strong> — at least: phishing, account takeover, ransomware, data exfiltration.</li>
  </ol>
  <h2>Scenario walkthrough</h2>
  <p>Walk one scenario through the plan end to end to prove it works. Example:</p>
  <pre class="code-block">DETECTION: SIEM flags admin user &ldquo;db-admin&rdquo; logon from a
           foreign IP at 03:12 UTC on a payment server.
TRIAGE:    SEV 1 — account is privileged, host is in scope.
CONTAIN:   disable account, kill session, block source IP, snapshot host.
ERADICATE: reset creds, inspect persistence, patch the open RDP service.
RECOVER:   restore from pre-breach backup, verify clean, re-enable with MFA.
POST:      write report, add rule for impossible travel, schedule tabletop.</pre>
  <h2>Deliverables checklist</h2>
  <ul>
    <li>The complete plan document with the six required sections.</li>
    <li>One worked scenario with a timeline table (time, action, owner).</li>
    <li>Three metrics the company will use to judge improvement.</li>
    <li>One action item the company must do tomorrow (practice).</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Make it executable</strong>
    <p>A plan nobody can open offline, that names roles nobody has, or that cites tools nobody owns is decoration. Test every line against the real constraints of Northwind Retail.</p>
  </div>
  <div class="callout callout-info">
    <strong>Evaluated on decisions</strong>
    <p>Good plans are judged by their choices: escalation triggers, containment order, evidence handling, and who communicates with regulators. Justify each decision in a page of notes.</p>
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
  ('03000000-0000-4000-8000-000000000501', '03000000-0000-4000-8000-000000000303',
   'What is the core mission of a Security Operations Center?',
   'The SOC mission is continuous monitoring, detection, analysis, and response across the environment.', 1),
  ('03000000-0000-4000-8000-000000000502', '03000000-0000-4000-8000-000000000303',
   'Which component turns raw logs from many sources into correlated, searchable data?',
   'A SIEM centralizes logs and applies correlation rules to surface suspicious activity.', 2),
  ('03000000-0000-4000-8000-000000000503', '03000000-0000-4000-8000-000000000303',
   'Which role usually performs the first triage of a newly confirmed alert?',
   'Tier 1 analysts validate and prioritize alerts before escalation to deeper analysis.', 3),
  ('03000000-0000-4000-8000-000000000504', '03000000-0000-4000-8000-000000000306',
   'Which strategy uses overlapping controls so a single failure does not lead to compromise?',
   'Defense in depth layers independent controls that an attacker must defeat one by one.', 1),
  ('03000000-0000-4000-8000-000000000505', '03000000-0000-4000-8000-000000000306',
   'What does Mean Time to Respond (MTTR) measure for a security team?',
   'MTTR is the average time between detecting an incident and containing or resolving it.', 2),
  ('03000000-0000-4000-8000-000000000506', '03000000-0000-4000-8000-000000000306',
   'In security operations, an SLA most commonly defines what?',
   'An SLA sets targets such as alert response time and reporting cadence for stakeholders.', 3),
  ('03000000-0000-4000-8000-000000000507', '03000000-0000-4000-8000-000000000309',
   'Which of these is a security-relevant log source to collect?',
   'Authentication logs record successful and failed login attempts needed to detect credential abuse.', 1),
  ('03000000-0000-4000-8000-000000000508', '03000000-0000-4000-8000-000000000309',
   'Why normalize logs before analysis?',
   'Normalization gives all events consistent field names and timestamps so they can be correlated.', 2),
  ('03000000-0000-4000-8000-000000000509', '03000000-0000-4000-8000-000000000309',
   'Log retention tuning balances which two goals?',
   'Keep logs long enough for investigations while controlling storage cost and legal exposure.', 3),
  ('03000000-0000-4000-8000-000000000510', '03000000-0000-4000-8000-000000000312',
   'What is a SIEM correlation rule?',
   'A correlation rule defines a pattern of events that together indicate likely malicious activity.', 1),
  ('03000000-0000-4000-8000-000000000511', '03000000-0000-4000-8000-000000000312',
   'Alert tuning mainly reduces which of the following?',
   'Tuning filters false positives while preserving coverage of real threats.', 2),
  ('03000000-0000-4000-8000-000000000512', '03000000-0000-4000-8000-000000000312',
   'How does an incident differ from an alert?',
   'An alert becomes an incident once it is validated and assessed for impact, scope, and response need.', 3),
  ('03000000-0000-4000-8000-000000000513', '03000000-0000-4000-8000-000000000315',
   'Which list captures the four main types of threat intelligence?',
   'Intelligence spans strategic, tactical, operational, and technical layers, from board to sensor.', 1),
  ('03000000-0000-4000-8000-000000000514', '03000000-0000-4000-8000-000000000315',
   'Which of these is an indicator of compromise (IoC)?',
   'IoCs are observable artifacts such as a known bad hash, IP address, domain, or file name.', 2),
  ('03000000-0000-4000-8000-000000000515', '03000000-0000-4000-8000-000000000315',
   'STIX and TAXII are standards primarily used for what?',
   'STIX models intelligence and TAXII transports it so organizations can share structured data.', 3),
  ('03000000-0000-4000-8000-000000000516', '03000000-0000-4000-8000-000000000318',
   'What is an incident response playbook?',
   'A playbook documents a written, repeatable response procedure for a known incident type.', 1),
  ('03000000-0000-4000-8000-000000000517', '03000000-0000-4000-8000-000000000318',
   'What is the first priority during alert triage?',
   'Validate that the alert is real, then scope the affected assets before deciding how to respond.', 2),
  ('03000000-0000-4000-8000-000000000518', '03000000-0000-4000-8000-000000000318',
   'When should a responder escalate an incident?',
   'Escalate when severity or impact crosses the threshold set in the response plan.', 3),
  ('03000000-0000-4000-8000-000000000519', '03000000-0000-4000-8000-000000000321',
   'Which four phases make up the NIST incident response lifecycle?',
   'NIST SP 800-61 defines Preparation, Detection and Analysis, Containment Eradication and Recovery, and Post-Incident Activity.', 1),
  ('03000000-0000-4000-8000-000000000520', '03000000-0000-4000-8000-000000000321',
   'Which statement best distinguishes detection from response?',
   'Detection identifies threats and response mitigates them; each one feeds the other.', 2),
  ('03000000-0000-4000-8000-000000000521', '03000000-0000-4000-8000-000000000321',
   'Which of these is a detection control?',
   'A SIEM correlation rule that alerts on repeated failed logins is a classic detection control.', 3),
  ('03000000-0000-4000-8000-000000000522', '03000000-0000-4000-8000-000000000324',
   'Which action is an example of containment?',
   'Isolating or segmenting an affected host limits the ability of the attacker to move laterally.', 1),
  ('03000000-0000-4000-8000-000000000523', '03000000-0000-4000-8000-000000000324',
   'What does eradication accomplish in incident response?',
   'Eradication removes the root cause, malware, and attacker persistence from affected systems.', 2),
  ('03000000-0000-4000-8000-000000000524', '03000000-0000-4000-8000-000000000324',
   'Which step best preserves digital evidence?',
   'Capture volatile memory and create forensic images before performing any invasive analysis.', 3),
  ('03000000-0000-4000-8000-000000000525', '03000000-0000-4000-8000-000000000328',
   'Which order matches the NIST incident lifecycle?',
   'The cycle runs Preparation, Detection and Analysis, Containment Eradication and Recovery, then Post-Incident Activity.', 1),
  ('03000000-0000-4000-8000-000000000526', '03000000-0000-4000-8000-000000000328',
   'A SIEM relies most heavily on which input?',
   'SIEM value depends on centralized, normalized log data collected from many sources.', 2),
  ('03000000-0000-4000-8000-000000000527', '03000000-0000-4000-8000-000000000328',
   'What is the main purpose of the post-incident lessons-learned phase?',
   'It improves processes, fixes gaps, and reduces the chance that the incident repeats.', 3),
  ('03000000-0000-4000-8000-000000000528', '03000000-0000-4000-8000-000000000328',
   'A host shows signs of lateral movement. What is the best near-term action?',
   'Containment, such as isolating the host, is the fastest way to stop further spread.', 4),
  ('03000000-0000-4000-8000-000000000529', '03000000-0000-4000-8000-000000000328',
   'Which metric best reflects response effectiveness?',
   'Mean Time to Respond gauges how quickly the team detects and acts on incidents.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): SOC mission
  ('03000000-0000-4000-8000-000000001001', '03000000-0000-4000-8000-000000000501', 'Monitor, detect, analyze, and respond to threats', TRUE,  1),
  ('03000000-0000-4000-8000-000000001002', '03000000-0000-4000-8000-000000000501', 'Patch applications and restart servers', FALSE, 2),
  ('03000000-0000-4000-8000-000000001003', '03000000-0000-4000-8000-000000000501', 'Write product code for new features', FALSE, 3),
  ('03000000-0000-4000-8000-000000001004', '03000000-0000-4000-8000-000000000501', 'Conduct annual employee training only', FALSE, 4),
  -- Q1 (501)q2: SIEM
  ('03000000-0000-4000-8000-000000001005', '03000000-0000-4000-8000-000000000502', 'A web application firewall', FALSE, 1),
  ('03000000-0000-4000-8000-000000001006', '03000000-0000-4000-8000-000000000502', 'A load balancer', FALSE, 2),
  ('03000000-0000-4000-8000-000000001007', '03000000-0000-4000-8000-000000000502', 'A SIEM platform', TRUE,  3),
  ('03000000-0000-4000-8000-000000001008', '03000000-0000-4000-8000-000000000502', 'A ticketing system', FALSE, 4),
  -- Q1 (501)q3: first triage
  ('03000000-0000-4000-8000-000000001009', '03000000-0000-4000-8000-000000000503', 'The external auditor', FALSE, 1),
  ('03000000-0000-4000-8000-000000001010', '03000000-0000-4000-8000-000000000503', 'Tier 1 security analyst', TRUE,  2),
  ('03000000-0000-4000-8000-000000001011', '03000000-0000-4000-8000-000000000503', 'The Chief Information Security Officer', FALSE, 3),
  ('03000000-0000-4000-8000-000000001012', '03000000-0000-4000-8000-000000000503', 'The database administrator', FALSE, 4),
  -- Q2 (504): defense in depth
  ('03000000-0000-4000-8000-000000001013', '03000000-0000-4000-8000-000000000504', 'Defense in depth', TRUE,  1),
  ('03000000-0000-4000-8000-000000001014', '03000000-0000-4000-8000-000000000504', 'Single point of failure', FALSE, 2),
  ('03000000-0000-4000-8000-000000001015', '03000000-0000-4000-8000-000000000504', 'Perimeter-only filtering', FALSE, 3),
  ('03000000-0000-4000-8000-000000001016', '03000000-0000-4000-8000-000000000504', 'Open-source everything', FALSE, 4),
  -- Q2 (504)q2: MTTR
  ('03000000-0000-4000-8000-000000001017', '03000000-0000-4000-8000-000000000505', 'How fast logs are deleted', FALSE, 1),
  ('03000000-0000-4000-8000-000000001018', '03000000-0000-4000-8000-000000000505', 'The average frequency of security scans', FALSE, 2),
  ('03000000-0000-4000-8000-000000001019', '03000000-0000-4000-8000-000000000505', 'The time to rotate every password', FALSE, 3),
  ('03000000-0000-4000-8000-000000001020', '03000000-0000-4000-8000-000000000505', 'Average time to detect and resolve an incident', TRUE,  4),
  -- Q2 (504)q3: SLA
  ('03000000-0000-4000-8000-000000001021', '03000000-0000-4000-8000-000000000506', 'Password complexity rules only', FALSE, 1),
  ('03000000-0000-4000-8000-000000001022', '03000000-0000-4000-8000-000000000506', 'Guaranteed response and reporting times', TRUE,  2),
  ('03000000-0000-4000-8000-000000001023', '03000000-0000-4000-8000-000000000506', 'Monthly feature release dates', FALSE, 3),
  ('03000000-0000-4000-8000-000000001024', '03000000-0000-4000-8000-000000000506', 'Number of VPN sessions allowed', FALSE, 4),
  -- Q3 (507): log source
  ('03000000-0000-4000-8000-000000001025', '03000000-0000-4000-8000-000000000507', 'Authentication logs', TRUE,  1),
  ('03000000-0000-4000-8000-000000001026', '03000000-0000-4000-8000-000000000507', 'Browser tab history', FALSE, 2),
  ('03000000-0000-4000-8000-000000001027', '03000000-0000-4000-8000-000000000507', 'Font cache telemetry', FALSE, 3),
  ('03000000-0000-4000-8000-000000001028', '03000000-0000-4000-8000-000000000507', 'Typing autocomplete history', FALSE, 4),
  -- Q3 (507)q2: normalization
  ('03000000-0000-4000-8000-000000001029', '03000000-0000-4000-8000-000000000508', 'To shrink file sizes automatically', FALSE, 1),
  ('03000000-0000-4000-8000-000000001030', '03000000-0000-4000-8000-000000000508', 'To give all events consistent fields and timing', TRUE,  2),
  ('03000000-0000-4000-8000-000000001031', '03000000-0000-4000-8000-000000000508', 'To hide sensitive data from analysts', FALSE, 3),
  ('03000000-0000-4000-8000-000000001032', '03000000-0000-4000-8000-000000000508', 'To make logs impossible to read', FALSE, 4),
  -- Q3 (507)q3: retention
  ('03000000-0000-4000-8000-000000001033', '03000000-0000-4000-8000-000000000509', 'Bandwidth and latency', FALSE, 1),
  ('03000000-0000-4000-8000-000000001034', '03000000-0000-4000-8000-000000000509', 'Uptime and reboot speed', FALSE, 2),
  ('03000000-0000-4000-8000-000000001035', '03000000-0000-4000-8000-000000000509', 'Cost and security needs', TRUE,  3),
  ('03000000-0000-4000-8000-000000001036', '03000000-0000-4000-8000-000000000509', 'Memory and cache size', FALSE, 4),
  -- Q4 (510): correlation rule
  ('03000000-0000-4000-8000-000000001037', '03000000-0000-4000-8000-000000000510', 'A pattern of events indicating possible malicious activity', TRUE,  1),
  ('03000000-0000-4000-8000-000000001038', '03000000-0000-4000-8000-000000000510', 'A backup scheduling job', FALSE, 2),
  ('03000000-0000-4000-8000-000000001039', '03000000-0000-4000-8000-000000000510', 'A user dashboard theme', FALSE, 3),
  ('03000000-0000-4000-8000-000000001040', '03000000-0000-4000-8000-000000000510', 'A storage retention limit', FALSE, 4),
  -- Q4 (510)q2: alert tuning
  ('03000000-0000-4000-8000-000000001041', '03000000-0000-4000-8000-000000000511', 'True positive volume', FALSE, 1),
  ('03000000-0000-4000-8000-000000001042', '03000000-0000-4000-8000-000000000511', 'False positives', TRUE,  2),
  ('03000000-0000-4000-8000-000000001043', '03000000-0000-4000-8000-000000000511', 'Hardware costs only', FALSE, 3),
  ('03000000-0000-4000-8000-000000001044', '03000000-0000-4000-8000-000000000511', 'Employee salaries', FALSE, 4),
  -- Q4 (510)q3: alert vs incident
  ('03000000-0000-4000-8000-000000001045', '03000000-0000-4000-8000-000000000512', 'They are the same concept', FALSE, 1),
  ('03000000-0000-4000-8000-000000001046', '03000000-0000-4000-8000-000000000512', 'An incident is only reported through email', FALSE, 2),
  ('03000000-0000-4000-8000-000000001047', '03000000-0000-4000-8000-000000000512', 'An incident is a validated event with assessed impact', TRUE,  3),
  ('03000000-0000-4000-8000-000000001048', '03000000-0000-4000-8000-000000000512', 'Incidents are always caused by users', FALSE, 4),
  -- Q5 (513): intel types
  ('03000000-0000-4000-8000-000000001049', '03000000-0000-4000-8000-000000000513', 'Strategic, tactical, operational, technical', TRUE,  1),
  ('03000000-0000-4000-8000-000000001050', '03000000-0000-4000-8000-000000000513', 'Docx, pdf, csv, json', FALSE, 2),
  ('03000000-0000-4000-8000-000000001051', '03000000-0000-4000-8000-000000000513', 'Red, blue, green, purple', FALSE, 3),
  ('03000000-0000-4000-8000-000000001052', '03000000-0000-4000-8000-000000000513', 'Open, closed, local, hidden', FALSE, 4),
  -- Q5 (513)q2: IoC
  ('03000000-0000-4000-8000-000000001053', '03000000-0000-4000-8000-000000000514', 'A department budget document', FALSE, 1),
  ('03000000-0000-4000-8000-000000001054', '03000000-0000-4000-8000-000000000514', 'A software patch release note', FALSE, 2),
  ('03000000-0000-4000-8000-000000001055', '03000000-0000-4000-8000-000000000514', 'A help-desk ticket template', FALSE, 3),
  ('03000000-0000-4000-8000-000000001056', '03000000-0000-4000-8000-000000000514', 'A known malicious IP address', TRUE,  4),
  -- Q5 (513)q3: STIX/TAXII
  ('03000000-0000-4000-8000-000000001057', '03000000-0000-4000-8000-000000000515', 'Scanning internal ports', FALSE, 1),
  ('03000000-0000-4000-8000-000000001058', '03000000-0000-4000-8000-000000000515', 'Storing encrypted backups', FALSE, 2),
  ('03000000-0000-4000-8000-000000001059', '03000000-0000-4000-8000-000000000515', 'Sharing structured threat intelligence', TRUE,  3),
  ('03000000-0000-4000-8000-000000001060', '03000000-0000-4000-8000-000000000515', 'Blocking advertisement trackers', FALSE, 4),
  -- Q6 (516): playbook
  ('03000000-0000-4000-8000-000000001061', '03000000-0000-4000-8000-000000000516', 'A written, repeatable response procedure', TRUE,  1),
  ('03000000-0000-4000-8000-000000001062', '03000000-0000-4000-8000-000000000516', 'A list of vendor passwords', FALSE, 2),
  ('03000000-0000-4000-8000-000000001063', '03000000-0000-4000-8000-000000000516', 'A firewall packet filter', FALSE, 3),
  ('03000000-0000-4000-8000-000000001064', '03000000-0000-4000-8000-000000000516', 'A quarterly sales target', FALSE, 4),
  -- Q6 (516)q2: triage first priority
  ('03000000-0000-4000-8000-000000001065', '03000000-0000-4000-8000-000000000517', 'Reboot all servers immediately', FALSE, 1),
  ('03000000-0000-4000-8000-000000001066', '03000000-0000-4000-8000-000000000517', 'Verify the alert and scope the affected assets', TRUE,  2),
  ('03000000-0000-4000-8000-000000001067', '03000000-0000-4000-8000-000000000517', 'Disconnect the internet for the whole building', FALSE, 3),
  ('03000000-0000-4000-8000-000000001068', '03000000-0000-4000-8000-000000000517', 'Email every employee for confirmation', FALSE, 4),
  -- Q6 (516)q3: escalate
  ('03000000-0000-4000-8000-000000001069', '03000000-0000-4000-8000-000000000518', 'On absolutely every alert received', FALSE, 1),
  ('03000000-0000-4000-8000-000000001070', '03000000-0000-4000-8000-000000000518', 'Never, unless the CEO asks', FALSE, 2),
  ('03000000-0000-4000-8000-000000001071', '03000000-0000-4000-8000-000000000518', 'After waiting 30 days', FALSE, 3),
  ('03000000-0000-4000-8000-000000001072', '03000000-0000-4000-8000-000000000518', 'When impact exceeds the defined severity threshold', TRUE,  4),
  -- Q7 (519): NIST phases
  ('03000000-0000-4000-8000-000000001073', '03000000-0000-4000-8000-000000000519', 'Preparation, Detection and Analysis, Containment Eradication and Recovery, Post-Incident Activity', TRUE,  1),
  ('03000000-0000-4000-8000-000000001074', '03000000-0000-4000-8000-000000000519', 'Plan, Deploy, Operate, Retire', FALSE, 2),
  ('03000000-0000-4000-8000-000000001075', '03000000-0000-4000-8000-000000000519', 'Scoping, Scanning, Patching, Archiving', FALSE, 3),
  ('03000000-0000-4000-8000-000000001076', '03000000-0000-4000-8000-000000000519', 'Threat, Risk, Control, Audit', FALSE, 4),
  -- Q7 (519)q2: detection vs response
  ('03000000-0000-4000-8000-000000001077', '03000000-0000-4000-8000-000000000520', 'Detection responds while response detects', FALSE, 1),
  ('03000000-0000-4000-8000-000000001078', '03000000-0000-4000-8000-000000000520', 'Detection identifies threats and response mitigates them', TRUE,  2),
  ('03000000-0000-4000-8000-000000001079', '03000000-0000-4000-8000-000000000520', 'Detection only runs on weekends', FALSE, 3),
  ('03000000-0000-4000-8000-000000001080', '03000000-0000-4000-8000-000000000520', 'Response happens before threats are seen', FALSE, 4),
  -- Q7 (519)q3: detection control
  ('03000000-0000-4000-8000-000000001081', '03000000-0000-4000-8000-000000000521', 'A firewall default-deny rule', FALSE, 1),
  ('03000000-0000-4000-8000-000000001082', '03000000-0000-4000-8000-000000000521', 'A back-to-work policy', FALSE, 2),
  ('03000000-0000-4000-8000-000000001083', '03000000-0000-4000-8000-000000000521', 'An alerting rule for repeated failed logins', TRUE,  3),
  ('03000000-0000-4000-8000-000000001084', '03000000-0000-4000-8000-000000000521', 'An encrypted laptop drive', FALSE, 4),
  -- Q8 (522): containment
  ('03000000-0000-4000-8000-000000001085', '03000000-0000-4000-8000-000000000522', 'Isolating the affected host from the network', TRUE,  1),
  ('03000000-0000-4000-8000-000000001086', '03000000-0000-4000-8000-000000000522', 'Deleting all logs for the month', FALSE, 2),
  ('03000000-0000-4000-8000-000000001087', '03000000-0000-4000-8000-000000000522', 'Disabling antivirus updates', FALSE, 3),
  ('03000000-0000-4000-8000-000000001088', '03000000-0000-4000-8000-000000000522', 'Paying any ransom demand immediately', FALSE, 4),
  -- Q8 (522)q2: eradication
  ('03000000-0000-4000-8000-000000001089', '03000000-0000-4000-8000-000000000523', 'Restores customer confidence', FALSE, 1),
  ('03000000-0000-4000-8000-000000001090', '03000000-0000-4000-8000-000000000523', 'Removes the root cause and attacker presence', TRUE,  2),
  ('03000000-0000-4000-8000-000000001091', '03000000-0000-4000-8000-000000000523', 'Preserves the original breach as evidence', FALSE, 3),
  ('03000000-0000-4000-8000-000000001092', '03000000-0000-4000-8000-000000000523', 'Cuts ties with the managed SIEM vendor', FALSE, 4),
  -- Q8 (522)q3: evidence
  ('03000000-0000-4000-8000-000000001093', '03000000-0000-4000-8000-000000000524', 'Reinstall the operating system immediately', FALSE, 1),
  ('03000000-0000-4000-8000-000000001094', '03000000-0000-4000-8000-000000000524', 'Open every file on the live system', FALSE, 2),
  ('03000000-0000-4000-8000-000000001095', '03000000-0000-4000-8000-000000000524', 'Delete suspicious email attachments', FALSE, 3),
  ('03000000-0000-4000-8000-000000001096', '03000000-0000-4000-8000-000000000524', 'Capture memory and image the disk before analysis', TRUE,  4),
  -- Q9 (525): NIST order
  ('03000000-0000-4000-8000-000000001097', '03000000-0000-4000-8000-000000000525', 'Preparation, Detection and Analysis, Containment Eradication and Recovery, Post-Incident Activity', TRUE,  1),
  ('03000000-0000-4000-8000-000000001098', '03000000-0000-4000-8000-000000000525', 'Detection, Preparation, Post-Incident, Recovery', FALSE, 2),
  ('03000000-0000-4000-8000-000000001099', '03000000-0000-4000-8000-000000000525', 'Recovery, Eradication, Detection, Preparation', FALSE, 3),
  ('03000000-0000-4000-8000-000000001100', '03000000-0000-4000-8000-000000000525', 'Containment, Preparation, Analysis, Reporting', FALSE, 4),
  -- Q9 (525)q2: SIEM input
  ('03000000-0000-4000-8000-000000001101', '03000000-0000-4000-8000-000000000526', 'An internet search history', FALSE, 1),
  ('03000000-0000-4000-8000-000000001102', '03000000-0000-4000-8000-000000000526', 'Raw logs from many sources', TRUE,  2),
  ('03000000-0000-4000-8000-000000001103', '03000000-0000-4000-8000-000000000526', 'A single server uptime counter', FALSE, 3),
  ('03000000-0000-4000-8000-000000001104', '03000000-0000-4000-8000-000000000526', 'DNS lookups alone', FALSE, 4),
  -- Q9 (525)q3: lessons learned
  ('03000000-0000-4000-8000-000000001105', '03000000-0000-4000-8000-000000000527', 'Improve processes and prevent recurrence', TRUE,  1),
  ('03000000-0000-4000-8000-000000001106', '03000000-0000-4000-8000-000000000527', 'Assign blame to a single employee', FALSE, 2),
  ('03000000-0000-4000-8000-000000001107', '03000000-0000-4000-8000-000000000527', 'Delete evidence to save storage', FALSE, 3),
  ('03000000-0000-4000-8000-000000001108', '03000000-0000-4000-8000-000000000527', 'Publish internal passwords', FALSE, 4),
  -- Q9 (525)q4: lateral movement
  ('03000000-0000-4000-8000-000000001109', '03000000-0000-4000-8000-000000000528', 'Wait for the weekend to act', FALSE, 1),
  ('03000000-0000-4000-8000-000000001110', '03000000-0000-4000-8000-000000000528', 'Ignore it until proof is found', FALSE, 2),
  ('03000000-0000-4000-8000-000000001111', '03000000-0000-4000-8000-000000000528', 'Restart the host and continue monitoring', FALSE, 3),
  ('03000000-0000-4000-8000-000000001112', '03000000-0000-4000-8000-000000000528', 'Isolate or contain the host immediately', TRUE,  4),
  -- Q9 (525)q5: response metric
  ('03000000-0000-4000-8000-000000001113', '03000000-0000-4000-8000-000000000529', 'Mean Time to Respond', TRUE,  1),
  ('03000000-0000-4000-8000-000000001114', '03000000-0000-4000-8000-000000000529', 'Number of GPU cores in use', FALSE, 2),
  ('03000000-0000-4000-8000-000000001115', '03000000-0000-4000-8000-000000000529', 'Total lines of policy text', FALSE, 3),
  ('03000000-0000-4000-8000-000000001116', '03000000-0000-4000-8000-000000000529', 'Count of employee birthdays', FALSE, 4)
ON CONFLICT (id) DO NOTHING;