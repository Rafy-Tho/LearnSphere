-- ============================================================================
-- SEED 058: Complete course — "Threat Modeling & Risk Assessment"
-- ----------------------------------------------------------------------------
-- Instructor : Elena Rodriguez   (10000000-0000-4000-8000-000000000005)
-- Category   : Cybersecurity     (20000000-0000-4000-8000-000000000005)
-- Level      : ADVANCED · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Foundations of Threat Modeling → C1 Why Threat Modeling · C2 System Inventory
--   M2 Identifying Threats             → C3 Modeling Techniques · C4 Prioritizing Threats
--   M3 Risk Assessment                 → C5 Rating Risk · C6 Managing Risk
--   M4 Mitigation & Review             → C7 Mitigation Controls · C8 Tools & Review
--   M5 Capstone: ShopSmart            → C9 Case Study Setup · C10 Case Study Delivery
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
  '03A00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000005',
  '20000000-0000-4000-8000-000000000005',
  'Threat Modeling & Risk Assessment',
  'threat-modeling-and-risk-assessment',
  'Learn how security professionals think about risk. Model systems systematically, identify threats with STRIDE and attack trees, score them with DREAD, build living risk registers, and choose mitigation controls — then apply the full workflow in a realistic capstone risk assessment.',
  'PUBLISHED',
  'ADVANCED',
  'SUBSCRIPTION',
  56
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03A00000-0000-4000-8000-000000000011', '03A00000-0000-4000-8000-000000000001', 'Explain why threat modeling matters and when to apply it during development.', 1),
  ('03A00000-0000-4000-8000-000000000012', '03A00000-0000-4000-8000-000000000001', 'Map assets, data flows, and trust boundaries into a system inventory.',            2),
  ('03A00000-0000-4000-8000-000000000013', '03A00000-0000-4000-8000-000000000001', 'Identify threats systematically with STRIDE, DREAD, and attack trees.',             3),
  ('03A00000-0000-4000-8000-000000000014', '03A00000-0000-4000-8000-000000000001', 'Score risk using likelihood and impact and record treatment decisions in a register.', 4),
  ('03A00000-0000-4000-8000-000000000015', '03A00000-0000-4000-8000-000000000001', 'Select mitigation controls, keep models current, and deliver a full risk assessment.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03A00000-0000-4000-8000-000000000101', '03A00000-0000-4000-8000-000000000001', 1, 'Foundations of Threat Modeling', 'Learn why modeling matters and how to map a system.',              'PUBLISHED'),
  ('03A00000-0000-4000-8000-000000000102', '03A00000-0000-4000-8000-000000000001', 2, 'Identifying Threats',             'Apply STRIDE, DREAD, and attack modeling.',                        'PUBLISHED'),
  ('03A00000-0000-4000-8000-000000000103', '03A00000-0000-4000-8000-000000000001', 3, 'Risk Assessment',                 'Score likelihood and impact, then manage the register.',           'PUBLISHED'),
  ('03A00000-0000-4000-8000-000000000104', '03A00000-0000-4000-8000-000000000001', 4, 'Mitigation & Review',             'Choose controls and keep models current over time.',               'PUBLISHED'),
  ('03A00000-0000-4000-8000-000000000105', '03A00000-0000-4000-8000-000000000001', 5, 'Capstone: ShopSmart',             'Deliver a complete risk assessment for a real case study.',        'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03A00000-0000-4000-8000-000000000201', '03A00000-0000-4000-8000-000000000101', 1, 'Why Threat Modeling',  'Goals, timing, and the security mindset.',                       'PUBLISHED'),
  ('03A00000-0000-4000-8000-000000000202', '03A00000-0000-4000-8000-000000000101', 2, 'System Inventory',     'Assets, data flows, and trust boundaries.',                       'PUBLISHED'),
  ('03A00000-0000-4000-8000-000000000203', '03A00000-0000-4000-8000-000000000102', 1, 'Modeling Techniques',  'STRIDE classification and its application.',                      'PUBLISHED'),
  ('03A00000-0000-4000-8000-000000000204', '03A00000-0000-4000-8000-000000000102', 2, 'Prioritizing Threats', 'DREAD scoring and attack trees.',                                 'PUBLISHED'),
  ('03A00000-0000-4000-8000-000000000205', '03A00000-0000-4000-8000-000000000103', 1, 'Rating Risk',          'Likelihood, impact, and risk matrices.',                          'PUBLISHED'),
  ('03A00000-0000-4000-8000-000000000206', '03A00000-0000-4000-8000-000000000103', 2, 'Managing Risk',        'Registers, treatment, and ownership.',                            'PUBLISHED'),
  ('03A00000-0000-4000-8000-000000000207', '03A00000-0000-4000-8000-000000000104', 1, 'Mitigation Controls',  'Preventive, detective, and compensating controls.',               'PUBLISHED'),
  ('03A00000-0000-4000-8000-000000000208', '03A00000-0000-4000-8000-000000000104', 2, 'Tools & Review',       'Threat modeling tools and refresh cadence.',                      'PUBLISHED'),
  ('03A00000-0000-4000-8000-000000000209', '03A00000-0000-4000-8000-000000000105', 1, 'Case Study Setup',     'Scope the ShopSmart risk assessment.',                            'PUBLISHED'),
  ('03A00000-0000-4000-8000-000000000210', '03A00000-0000-4000-8000-000000000105', 2, 'Case Study Delivery',  'Build threats, scoring, controls, and the final report.',         'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03A00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03A00000-0000-4000-8000-000000000301', '03A00000-0000-4000-8000-000000000201', 1, 'Why Threat Modeling?',          'Understand the goals, timing, and payoff of threat modeling.',      'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03A00000-0000-4000-8000-000000000302', '03A00000-0000-4000-8000-000000000201', 2, 'The Threat Modeling Mindset',   'Adopt an adversarial, systematic way of thinking about systems.',   'TEXT',  'PUBLISHED', 'FREE', 10,  7),
  ('03A00000-0000-4000-8000-000000000303', '03A00000-0000-4000-8000-000000000201', 3, 'Foundations Quiz',              'Check your understanding of threat modeling fundamentals.',         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03A00000-0000-4000-8000-000000000304', '03A00000-0000-4000-8000-000000000202', 1, 'Assets & Attack Surface',       'Identify what you protect and the doors attackers can use.',         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03A00000-0000-4000-8000-000000000305', '03A00000-0000-4000-8000-000000000202', 2, 'Data Flows & Trust Boundaries', 'Map where data moves and where trust changes hands.',               'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03A00000-0000-4000-8000-000000000306', '03A00000-0000-4000-8000-000000000202', 3, 'System Inventory Quiz',         'Test your knowledge of assets, flows, and boundaries.',             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03A00000-0000-4000-8000-000000000307', '03A00000-0000-4000-8000-000000000203', 1, 'STRIDE in Detail',              'Classify threats into six easy to remember categories.',            'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03A00000-0000-4000-8000-000000000308', '03A00000-0000-4000-8000-000000000203', 2, 'Applying STRIDE',               'Walk a login flow through every STRIDE category.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03A00000-0000-4000-8000-000000000309', '03A00000-0000-4000-8000-000000000203', 3, 'STRIDE Quiz',                   'Confirm you can classify threats by category.',                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03A00000-0000-4000-8000-000000000310', '03A00000-0000-4000-8000-000000000204', 1, 'DREAD Scoring',                 'Prioritize threats with a repeatable rating scale.',                'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03A00000-0000-4000-8000-000000000311', '03A00000-0000-4000-8000-000000000204', 2, 'Attack Trees & the Kill Chain', 'Model multi-step attacks end to end.',                              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03A00000-0000-4000-8000-000000000312', '03A00000-0000-4000-8000-000000000204', 3, 'Prioritization Quiz',           'Test your DREAD and attack modeling skills.',                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03A00000-0000-4000-8000-000000000313', '03A00000-0000-4000-8000-000000000205', 1, 'Likelihood & Impact',           'Estimate how probable and how damaging a threat is.',               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03A00000-0000-4000-8000-000000000314', '03A00000-0000-4000-8000-000000000205', 2, 'Risk Scoring & Matrices',       'Combine likelihood and impact into comparable ratings.',             'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03A00000-0000-4000-8000-000000000315', '03A00000-0000-4000-8000-000000000205', 3, 'Risk Rating Quiz',              'Check your grasp of likelihood and impact.',                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03A00000-0000-4000-8000-000000000316', '03A00000-0000-4000-8000-000000000206', 1, 'Risk Registers',                'Capture every risk, rating, and action in one place.',              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03A00000-0000-4000-8000-000000000317', '03A00000-0000-4000-8000-000000000206', 2, 'Treatment & Ownership',         'Decide risk responses and hold someone accountable.',               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03A00000-0000-4000-8000-000000000318', '03A00000-0000-4000-8000-000000000206', 3, 'Risk Management Quiz',          'Test your knowledge of registers and treatment.',                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03A00000-0000-4000-8000-000000000319', '03A00000-0000-4000-8000-000000000207', 1, 'Choosing Mitigation Controls',  'Translate risks into specific countermeasures.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03A00000-0000-4000-8000-000000000320', '03A00000-0000-4000-8000-000000000207', 2, 'Defense in Depth',              'Layer controls so no single failure is fatal.',                     'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03A00000-0000-4000-8000-000000000321', '03A00000-0000-4000-8000-000000000207', 3, 'Controls Quiz',                 'Verify you can match threats to the right controls.',               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03A00000-0000-4000-8000-000000000322', '03A00000-0000-4000-8000-000000000208', 1, 'Keeping Models Current',        'Schedule review and reassessment as systems change.',               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03A00000-0000-4000-8000-000000000323', '03A00000-0000-4000-8000-000000000208', 2, 'Threat Modeling Tools',         'Leverage tools for diagrams, libraries, and reports.',              'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03A00000-0000-4000-8000-000000000324', '03A00000-0000-4000-8000-000000000208', 3, 'Review & Tools Quiz',           'Check your understanding of maintaining models.',                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03A00000-0000-4000-8000-000000000325', '03A00000-0000-4000-8000-000000000209', 1, 'Case Study: Scope & Assets',    'Start a realistic risk assessment for ShopSmart.',                  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03A00000-0000-4000-8000-000000000326', '03A00000-0000-4000-8000-000000000210', 1, 'Case Study: Threats & Risk',    'Run STRIDE, DREAD, and risk scoring on the case study.',            'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03A00000-0000-4000-8000-000000000327', '03A00000-0000-4000-8000-000000000210', 2, 'Case Study: Controls & Report', 'Choose controls and finalize the risk report.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03A00000-0000-4000-8000-000000000328', '03A00000-0000-4000-8000-000000000210', 3, 'Final Assessment',              'Demonstrate the full threat modeling workflow.',                    'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03A00000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03A00000-0000-4000-8000-000000000401',
  '03A00000-0000-4000-8000-000000000301',
  1,
  'Why Threat Modeling?',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Why Threat Modeling?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Why Threat Modeling?</h1>
  <p><strong>Threat modeling</strong> is the practice of identifying what could go wrong with a system <em>before</em> it is built and shipped — then deciding in advance what to do about it. It turns security from a reaction into a design discipline.</p>
  <h2>The cost curve</h2>
  <table>
    <tr><th>When the flaw is found</th><th>Relative cost to fix</th></tr>
    <tr><td>In the design document</td><td>Least expensive</td></tr>
    <tr><td>During development</td><td>Moderate</td></tr>
    <tr><td>In testing</td><td>High</td></tr>
    <tr><td>In production, after an attack</td><td>Very expensive</td></tr>
  </table>
  <p>Fixing a bad decision in a requirements document costs hours. Fixing the same flaw after a breach costs money, trust, and reputation. Threat modeling pushes your security effort to the cheapest point on that curve.</p>
  <h2>What a threat model produces</h2>
  <ul>
    <li>A shared picture of the system — its components, data, and trust boundaries.</li>
    <li>A prioritized list of threats, ranked by how risky they actually are.</li>
    <li>A rationale for the controls you put in place, and for the ones you skip.</li>
    <li>Documentation your team can reuse every time the system changes.</li>
  </ul>
  <h2>When to do it</h2>
  <ul>
    <li><strong>New features or architectures</strong>, before code is written.</li>
    <li><strong>Major changes</strong> — a new data store, a new third-party integration.</li>
    <li><strong>After incidents</strong>, to understand what happened and what else the attacker could reach.</li>
    <li><strong>On a schedule</strong>, because systems drift from their original design.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Start small</strong>
    <p>You do not need to model the whole company at once. Model one feature, one component, one flow. Small models are accurate; giant ones are ignored.</p>
  </div>
  <div class="callout callout-info">
    <strong>Threat modeling vs. pentesting</strong>
    <p>Penetration testing finds bugs in what already exists. Threat modeling finds weaknesses in the design, often before a single line of code is written. The two complement each other; they do not replace each other.</p>
  </div>
  <h2>Who participates</h2>
  <p>Threat modeling is a team sport. The most effective sessions bring together the people who know different parts of the system:</p>
  <ul>
    <li><strong>Developers</strong> — they know where the real data flows and how it is stored.</li>
    <li><strong>Architects</strong> — they own the design decisions and the trade-offs behind them.</li>
    <li><strong>Operations</strong> — they see production config, dependencies, and reality.</li>
    <li><strong>Security engineers</strong> — they connect system findings to attacker behavior.</li>
    <li><strong>Product owners</strong> — they make the final call on scope and acceptance.</li>
  </ul>
  <p>One facilitator keeps the session moving and records findings; everyone else brings their slice of knowledge.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000402',
  '03A00000-0000-4000-8000-000000000302',
  1,
  'The Threat Modeling Mindset',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Threat Modeling Mindset</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>The Threat Modeling Mindset</h1>
  <p>Before you pick a framework, adopt a way of thinking. Tools and checklists are only as good as the perspective behind them.</p>
  <h2>Think like an attacker</h2>
  <p>Attacks are not random. Attackers have goals — money, data, disruption. When you look at a system, ask what an attacker would value:</p>
  <ol>
    <li>What is the most valuable data here, and where does it live?</li>
    <li>What is the easiest path from the internet to that data?</li>
    <li>Which component is least monitored and most likely to be forgotten?</li>
  </ol>
  <h2>Assume breach</h2>
  <p><span class="ic">Assume breach</span> means planning for the possibility that the perimeter has already failed. Instead of asking <em>can someone get in?</em>, ask <em>if someone got in, how far could they go?</em> That reframes the conversation around blast radius, segmentation, and detection.</p>
  <h2>Least privilege</h2>
  <p>Every account, process, and service should hold exactly the permissions it needs — and no more. A help-desk account that can drop tables is not an edge case; it is a threat waiting to be exploited.</p>
  <h2>Choose the right level of detail</h2>
  <p>You cannot model every packet. Decide the abstraction level up front: components and data flows, not individual lines of code. Too much detail buries the insights; too little hides them.</p>
  <h2>Enumerate, do not guess</h2>
  <p>The frameworks in this course — STRIDE, DREAD, attack trees — exist to make your exploration <em>systematic</em>. Use them to find threats you had not thought of, rather than the two or three you would have found by intuition.</p>
  <div class="callout">
    <strong>Pressure your assumptions</strong>
    <p>&ldquo;Only internal users can reach it&rdquo; and &ldquo;the network is trusted&rdquo; are exactly the assumptions that surface in painful post-mortems. Write them down and test them deliberately.</p>
  </div>
  <h2>An iterative practice</h2>
  <p>Threat modeling is rarely a single meeting. You revisit the model as the design converges, as code lands, and as production realities surface: a first pass at design, an update at first release, and a refresh whenever a boundary changes. That cadence keeps the model honest without turning it into ceremony.</p>
  <h2>A simple agenda</h2>
  <ol>
    <li>Name the components and their data flows.</li>
    <li>Sketch the trust boundaries around them.</li>
    <li>Apply STRIDE to each boundary.</li>
    <li>Score the shortlist with DREAD.</li>
    <li>Record findings, owners, and dates in the register.</li>
  </ol>
  <p>Keep the agenda to four hours or less. A focused session that ends on time gets repeated; a marathon that ends exhausted does not.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000404',
  '03A00000-0000-4000-8000-000000000304',
  1,
  'Assets & Attack Surface',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Assets & Attack Surface</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Assets &amp; Attack Surface</h1>
  <p>Threat modeling starts with inventory: what are you protecting, and where can an attacker touch it?</p>
  <h2>Assets</h2>
  <p>An <strong>asset</strong> is anything of value to the organization — data, system, or capability. You cannot protect what you have not named.</p>
  <table>
    <tr><th>Asset type</th><th>Examples</th></tr>
    <tr><td>Data</td><td>Customer records, payment data, intellectual property, backups</td></tr>
    <tr><td>Systems</td><td>Web servers, databases, identity providers, CI/CD pipelines</td></tr>
    <tr><td>Secrets</td><td>API keys, certificates, credentials, signing keys</td></tr>
    <tr><td>Trust &amp; reputation</td><td>Customer confidence, brand, compliance posture</td></tr>
    <tr><td>Availability</td><td>Production uptime, recovery capability</td></tr>
  </table>
  <h2>Attack surface</h2>
  <p>The <strong>attack surface</strong> is the sum of every reachable entry point. Common categories:</p>
  <ul>
    <li><strong>User input</strong> — forms, file uploads, query strings, message queues.</li>
    <li><strong>APIs</strong> — public, partner, and internal endpoints, including undocumented ones.</li>
    <li><strong>Storage</strong> — databases, object stores, logs, unencrypted backups.</li>
    <li><strong>Third parties</strong> — libraries, SaaS, and trusted integrations that inherit your trust.</li>
    <li><strong>Privileged functions</strong> — admin panels, debug endpoints, default accounts.</li>
  </ul>
  <h2>Minimize the surface</h2>
  <p>Every entry point you do not need is a liability. Close unused ports, remove legacy endpoints, and put admin functions behind separate, hardened access. A smaller surface is a simpler model.</p>
  <div class="callout callout-tip">
    <strong>Keep an inventory</strong>
    <p>A living list of assets and entry points is the backbone of every later step. The moment something is missing from the inventory, it is also missing from the threat model.</p>
  </div>
  <h2>Classification drives priority</h2>
  <p>Not all assets deserve the same attention. Tag each one with a sensitivity class — public, internal, confidential, restricted — and let that tag steer how much effort the model spends on it. A marketing brochure and a credential store are both assets; they are not equal.</p>
  <h2>A first inventory</h2>
  <p>The case study later in this course inventories customer records, order data, session tokens, the admin console, the staging database, and API keys. Each row names the asset, its sensitivity, its owner, and where its data flows next — a format you can reuse for any system.</p>
  <p>Start with what you know exists, then hold a review to find what you forgot. Forgotten assets are almost always found in the margins: cron scripts, staging clones, spreadsheets, and the account the previous admin created.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000405',
  '03A00000-0000-4000-8000-000000000305',
  1,
  'Data Flows & Trust Boundaries',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Data Flows & Trust Boundaries</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Data Flows &amp; Trust Boundaries</h1>
  <p>Security problems rarely live in a single component. They live at the <strong>edges</strong> — where data moves and where trust changes.</p>
  <h2>Data flows</h2>
  <p>A <strong>data flow</strong> describes how data moves between processes, stores, and external parties. If you cannot describe where a piece of data goes, you cannot protect it on its journey.</p>
  <h2>Trust boundaries</h2>
  <p>A <strong>trust boundary</strong> is the point at which data crosses from one level of trust to another. Every crossing deserves extra attention: it is where spoofing, tampering, and interception become possible.</p>
  <pre class="code-block">[User Browser] ---- HTTPS ----&gt; [Web App] ---- SQL ----&gt; [Database]
        |                              |
        |                           [Auth Service] --&gt; {Credentials}
        |                              |
        |---- API calls ----&gt; [Payment Provider] (third party)

&lt;-- Trust boundary A: internet to web tier
&lt;-- Trust boundary B: web tier to data tier
&lt;-- Trust boundary C: app to external provider
  </pre>
  <table>
    <tr><th>Boundary</th><th>Trust change</th></tr>
    <tr><td>Internet to application</td><td>Untrusted users gain semi-trusted access</td></tr>
    <tr><td>Application to database</td><td>App to data tier; credentials must be tight</td></tr>
    <tr><td>Application to third party</td><td>Your trust model is extended to a vendor</td></tr>
  </table>
  <h2>Draw the diagram</h2>
  <p>Data flow diagrams name every external entity, process, and data store, and show how they connect. Keep them simple enough to read in a meeting.</p>
  <div class="callout">
    <strong>Every boundary is a review point</strong>
    <p>When you later apply STRIDE, you will ask each question at each boundary. The diagram is what makes that unmissable.</p>
  </div>
  <h2>Label everything</h2>
  <p>Give every flow a name and a description. Labels prevent two teams from meaning different things by &ldquo;the API&rdquo;, and they keep the diagram reviewable: if a line has no label, someone in the room does not understand the system yet.</p>
  <h2>When in doubt, draw the line</h2>
  <p>Place a boundary wherever the trust level changes: network, process, privilege, or vendor. When you are unsure, add it anyway — one extra line on a diagram is cheap to review, while a missing line is only discovered in an incident.</p>
  <p>Defending a boundary in a review is easier than defending its absence. If the group cannot say why a flow is trusted, that flow deserves a boundary.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000407',
  '03A00000-0000-4000-8000-000000000307',
  1,
  'STRIDE in Detail',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>STRIDE in Detail</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>STRIDE in Detail</h1>
  <p>STRIDE is a mnemonic that classifies threats into six categories. Popularized at Microsoft, it is the most widely used starting point for threat identification. Its whole purpose is to stop you from missing entire families of attacks.</p>
  <table>
    <tr><th>Letter</th><th>Category</th><th>Think about&hellip;</th></tr>
    <tr><td>S</td><td>Spoofing</td><td>Pretending to be someone or something else</td></tr>
    <tr><td>T</td><td>Tampering</td><td>Unauthorized modification of data or code</td></tr>
    <tr><td>R</td><td>Repudiation</td><td>Denying that an action ever happened</td></tr>
    <tr><td>I</td><td>Information disclosure</td><td>Exposing data to people who must not see it</td></tr>
    <tr><td>D</td><td>Denial of service</td><td>Making a service unavailable to its users</td></tr>
    <tr><td>E</td><td>Elevation of privilege</td><td>Gaining more access than was granted</td></tr>
  </table>
  <h2>Spoofing</h2>
  <p>An attacker claims an identity or role they do not have — a fake user, a fake server, a fake email. Defenses include authentication, digital signatures, and source verification.</p>
  <h2>Tampering</h2>
  <p>Data or code is changed without authorization, at rest or in transit. Defenses include integrity checks, signing, write access control, and transport security.</p>
  <h2>Repudiation</h2>
  <p>An action cannot be tied back to its actor, so the actor can deny it. Defenses include tamper-evident audit logs and non-repudiable signatures.</p>
  <h2>Information disclosure</h2>
  <p>Confidentiality fails: data becomes readable by someone without authorization. Defenses include encryption, access control, and error messages that do not leak internals.</p>
  <h2>Denial of service</h2>
  <p>Legitimate users cannot reach the service. Defenses include rate limiting, capacity planning, redundancy, and abuse detection.</p>
  <h2>Elevation of privilege</h2>
  <p>A low-privileged actor obtains privileges they were not granted — often the endgame that follows another STRIDE category. Defenses include least privilege, sandboxing, and fixing the privilege-escalation bugs themselves.</p>
  <div class="callout callout-info">
    <strong>A reminder, not a limit</strong>
    <p>STRIDE guarantees you ask every category of question. It cannot invent threats on its own — pair it with real system knowledge and you will find the interesting ones.</p>
  </div>
  <h2>What STRIDE is not</h2>
  <p>STRIDE classifies attacker actions against security properties: spoofing and elevation attack authentication and authorization, tampering and repudiation attack integrity, disclosure attacks confidentiality, and denial attacks availability. It does not size them — that is DREAD&rsquo;s job — and it assumes you already understand the component under examination.</p>
  <h2>One letter at a time</h2>
  <p>Apply one category across every element before moving to the next. Working mechanically is what makes the review complete, and it also reveals the pattern that matters: an element that triggers the same letter everywhere is almost always your biggest gap.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000408',
  '03A00000-0000-4000-8000-000000000308',
  1,
  'Applying STRIDE',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Applying STRIDE</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Applying STRIDE</h1>
  <p>A framework is only useful when it changes how you look at a real system. Let us apply STRIDE to a typical <strong>password login flow</strong>.</p>
  <pre class="code-block">1. Browser submits username + password over HTTPS to /login
2. Web app validates credentials against the identity store
3. On success, the app issues a signed session token
4. The token is stored in a cookie on the client
5. Subsequent requests present the token; the app verifies it
6. Admin users receive additional privileges
  </pre>
  <h2>The STRIDE-per-element table</h2>
  <p>For each element in the diagram, ask all six questions. This becomes your working inventory.</p>
  <table>
    <tr><th>Category</th><th>Question to ask</th><th>Concrete threat on the login flow</th></tr>
    <tr><td>Spoofing</td><td>Can identity be claimed falsely?</td><td>Attacker replays a stolen token as a real user</td></tr>
    <tr><td>Tampering</td><td>Can data be modified?</td><td>Username or token tampered with in transit or storage</td></tr>
    <tr><td>Repudiation</td><td>Can actions be denied?</td><td>Login attempts are not logged, so abuse is untraceable</td></tr>
    <tr><td>Information disclosure</td><td>Can secrets leak?</td><td>Error message reveals whether an account exists</td></tr>
    <tr><td>Denial of service</td><td>Can the service be knocked out?</td><td>Unthrottled login endpoint floods and blocks users</td></tr>
    <tr><td>Elevation of privilege</td><td>Can access exceed grants?</td><td>Session token forgery that adds admin privileges</td></tr>
  </table>
  <h2>Turn findings into action</h2>
  <ol>
    <li>List each threat you found, one row per element-and-category pair.</li>
    <li>Note the proof — the specific request, input, or path that enables it.</li>
    <li>Move the prioritized ones into risk scoring, which DREAD covers next.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Go element by element</strong>
    <p>Do not brainstorm STRIDE against a whole system at once. Take one component, run all six letters, then move on. Completeness comes from structure, not inspiration.</p>
  </div>
  <h2>Handle the long tail</h2>
  <p>Most sessions surface a handful of serious findings and a long tail of low-severity items. Do not let the tail eat the meeting: log every finding, confirm proof for the top five, and route the rest to the risk register with an owner and a revisit date.</p>
  <h2>Walk a real request through</h2>
  <p>To make STRIDE concrete, pick a real user action — for instance a login — and follow it across the diagram. Each hop crosses a boundary and can fail each STRIDE category; walking the action by hand is the fastest way to produce findings with proof attached.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000410',
  '03A00000-0000-4000-8000-000000000310',
  1,
  'DREAD Scoring',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DREAD Scoring</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>DREAD Scoring</h1>
  <p>STRIDE tells you a threat exists. <strong>DREAD</strong> helps you decide how much to care. It scores each threat on five dimensions, typically 1&ndash;10, and averages them into a single priority number.</p>
  <table>
    <tr><th>Letter</th><th>Dimension</th><th>Asked as&hellip;</th></tr>
    <tr><td>D</td><td>Damage</td><td>How much harm if it succeeds?</td></tr>
    <tr><td>R</td><td>Reproducibility</td><td>How reliably can it be repeated?</td></tr>
    <tr><td>E</td><td>Exploitability</td><td>How much skill and effort does it take?</td></tr>
    <tr><td>A</td><td>Affected users</td><td>How many users or systems are hit?</td></tr>
    <tr><td>D</td><td>Discoverability</td><td>How easily would an attacker find it?</td></tr>
  </table>
  <h2>A worked score</h2>
  <pre class="code-block">Threat: unauthenticated user changes another user&rsquo;s profile

Damage          = 7   (data integrity harmed, trust broken)
Reproducibility = 9   (a few HTTP requests repeat it every time)
Exploitability  = 8   (no special skill; standard tooling)
Affected users  = 6   (any account in the system)
Discoverability = 7   (the endpoint is visible and guessable)

DREAD total     = (7+9+8+6+7)/5 = 7.4  &rarr; HIGH priority
  </pre>
  <h2>Consistency beats precision</h2>
  <p>The exact number matters less than using the same rubric everywhere. Score in a small group, agree on the meaning of 1 and 10, and let the numbers do the arguing instead of people.</p>
  <h2>Map scores to bands</h2>
  <table>
    <tr><th>Average</th><th>Band</th><th>Typical action</th></tr>
    <tr><td>8.0&ndash;10</td><td>Critical</td><td>Fix before release; escalate to leadership</td></tr>
    <tr><td>6.0&ndash;7.9</td><td>High</td><td>Plan remediation in the current cycle</td></tr>
    <tr><td>4.0&ndash;5.9</td><td>Medium</td><td>Schedule; track in the risk register</td></tr>
    <tr><td>0&ndash;3.9</td><td>Low</td><td>Document and monitor</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Score together</strong>
    <p>Two engineers scoring the same threat will quickly expose where you disagree about the system. That disagreement is an insight, not noise.</p>
  </div>
  <h2>When DREAD misbehaves</h2>
  <p>If every score lands between five and six, the rubric is too vague to discriminate — re-read your definitions of 1 and 10 and tighten the anchors. If a single threat tops every list, stop scoring and start designing countermeasures; the tool was meant to prioritize, not to justify.</p>
  <h2>Keep scores temporary</h2>
  <p>Treat DREAD numbers as a snapshot, not a verdict. Re-score when controls land, when the architecture changes, or when an incident arrives. The register should always show a current number rather than a historical one.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000411',
  '03A00000-0000-4000-8000-000000000311',
  1,
  'Attack Trees & the Kill Chain',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Attack Trees & the Kill Chain</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Attack Trees &amp; the Kill Chain</h1>
  <p>Some threats are single steps; the serious ones are journeys. Two models help you think in sequences.</p>
  <h2>Attack trees</h2>
  <p>An <strong>attack tree</strong> starts with the attacker&rsquo;s ultimate goal as the root, then branches into every way that goal could be achieved.</p>
  <pre class="code-block">Goal: read customer payment data
+-- OR 1. Steal the database backup
|       +-- 1.1 Access the backup bucket
|       +-- 1.2 Intercept the backup transfer
+-- OR 2. Break into the app
|       +-- 2.1 SQL injection in the search page
|       +-- 2.2 Abuse a forgotten admin endpoint
|       +-- 2.3 Use stolen employee credentials
+-- OR 3. Abuse a third-party payment provider
  </pre>
  <p><strong>OR</strong> nodes mean any branch leads to the goal; <strong>AND</strong> nodes mean every sub-branch is required. Once the tree exists, map one countermeasure per branch and you have a defense plan.</p>
  <h2>The Cyber Kill Chain</h2>
  <p>The Lockheed Martin kill chain describes the phases common to many intrusions:</p>
  <ol>
    <li>Reconnaissance</li>
    <li>Weaponization</li>
    <li>Delivery</li>
    <li>Exploitation</li>
    <li>Installation</li>
    <li>Command and control</li>
    <li>Actions on objectives</li>
  </ol>
  <p>Disrupt any phase and the attack stalls. Detect early phases and you stop it before the damaging ones.</p>
  <table>
    <tr><th>Phase</th><th>Example control</th></tr>
    <tr><td>Delivery</td><td>Email filtering, URL reputation, allow-listing</td></tr>
    <tr><td>Exploitation</td><td>Patching, least privilege, application firewalls</td></tr>
    <tr><td>Installation</td><td>Host integrity monitoring, signed software</td></tr>
    <tr><td>Actions on objectives</td><td>Outbound filtering, data-loss prevention, logging</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Trees and chains work together</strong>
    <p>Use the kill chain to think about timing and sequence; use attack trees to enumerate the options within each stage. Together they turn <em>someone could get in</em> into a specific, testable set of paths.</p>
  </div>
  <h2>Depth before breadth</h2>
  <p>Start from the goal, not the tooling. Teams often enumerate channels and call it a tree; a real tree branches toward a specific objective such as <em>take over an account</em>. Depth first, breadth second keeps the exercise focused and the branches testable.</p>
  <h2>Verify with a red team</h2>
  <p>Attack trees pair well with red-team exercises: you predict a path, the team tries it, and the tree grows new leaves. Teams also play the reverse game — given an incident, build the tree backward to see which branch was actually taken.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000413',
  '03A00000-0000-4000-8000-000000000313',
  1,
  'Likelihood & Impact',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Likelihood & Impact</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Likelihood &amp; Impact</h1>
  <p>Risk has two independent halves. <strong>Likelihood</strong>: will it happen? <strong>Impact</strong>: how bad if it does? Confusing the two is the most common error in security risk assessment.</p>
  <h2>What drives likelihood</h2>
  <ul>
    <li><strong>Exposure</strong> — how reachable the asset is from untrusted networks.</li>
    <li><strong>Ease</strong> — how little skill and effort the attack requires.</li>
    <li><strong>Existing controls</strong> — what already stands in the attacker&rsquo;s way.</li>
    <li><strong>Attacker motivation</strong> — who wants this, and why now?</li>
  </ul>
  <h2>What drives impact</h2>
  <ul>
    <li><strong>Confidentiality</strong> — how sensitive exposed data is.</li>
    <li><strong>Financial</strong> — direct loss, fines, and remediation costs.</li>
    <li><strong>Regulatory</strong> — breach notifications and legal exposure.</li>
    <li><strong>Operational</strong> — downtime and lost productivity.</li>
    <li><strong>Reputational</strong> — loss of customer trust and future sales.</li>
  </ul>
  <h2>Calibrate with a rubric</h2>
  <p>People disagree on adjectives, so bind each rating to concrete examples.</p>
  <table>
    <tr><th>Level</th><th>Likelihood meaning</th><th>Impact meaning</th></tr>
    <tr><td>Very low</td><td>Basically never; exceptional conditions</td><td>Minimal; cosmetic</td></tr>
    <tr><td>Low</td><td>Unlikely in a typical year</td><td>Minor disruption, small cost</td></tr>
    <tr><td>Medium</td><td>Possible; seen in similar organizations</td><td>Noticeable cost, customer impact</td></tr>
    <tr><td>High</td><td>Likely given current exposure</td><td>Serious financial or regulatory impact</td></tr>
    <tr><td>Very high</td><td>Expected to happen</td><td>Existential; company-threatening</td></tr>
  </table>
  <div class="callout">
    <strong>Watch your biases</strong>
    <p>Ratings skew toward the last news headline, or toward <em>it has never happened to us</em>. Calibrate against your own telemetry, not your neighbors&rsquo; breaches.</p>
  </div>
  <h2>Season the likelihood</h2>
  <p>Use threat intelligence lightly but deliberately: a technique now seeing active abuse changes the credibility of a path. Pair that external signal with your own controls — a mature patch pipeline lowers the effective likelihood of known exploits even when news coverage is loud.</p>
  <h2>Impact wins disputes</h2>
  <p>When likelihood and impact point in different directions, impact tends to decide urgency: a low-probability event that would end the company still demands a response. Assess them separately, argue candidly, and let the risk matrix reflect the outcome.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000414',
  '03A00000-0000-4000-8000-000000000314',
  1,
  'Risk Scoring & Matrices',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Risk Scoring & Matrices</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Risk Scoring &amp; Matrices</h1>
  <p>A <strong>risk matrix</strong> combines likelihood and impact into a single rating. The classic form is 5x5, but any consistent grid works as long as everyone understands it.</p>
  <pre class="code-block">                 IMPACT
              1    2    3    4    5
          1 [ 1 ] [ 2 ] [ 3 ] [ 4 ] [ 5 ]
          2 [ 2 ] [ 4 ] [ 6 ] [ 8 ] [10 ]
LIKELI-   3 [ 3 ] [ 6 ] [ 9 ] [12 ] [15 ]
HOOD      4 [ 4 ] [ 8 ] [12 ] [16 ] [20 ]
          5 [ 5 ] [10 ] [15 ] [20 ] [25 ]

Cells 1-6   &rarr; LOW      (monitor)
Cells 8-12  &rarr; MEDIUM   (schedule)
Cells 15    &rarr; HIGH     (plan this cycle)
Cells 16+   &rarr; CRITICAL (act now)
  </pre>
  <table>
    <tr><th>Band</th><th>Color</th><th>Expected treatment</th></tr>
    <tr><td>Low</td><td>Green</td><td>Accept or monitor</td></tr>
    <tr><td>Medium</td><td>Yellow</td><td>Mitigate within a defined timeframe</td></tr>
    <tr><td>High</td><td>Orange</td><td>Mitigate before release; escalate</td></tr>
    <tr><td>Critical</td><td>Red</td><td>Immediate action; leadership decision</td></tr>
  </table>
  <h2>A worked cell</h2>
  <p>An unauthenticated API exposing payment data is high-likelihood (exposed, easy) and high-impact (sensitive, regulated): likelihood 4 x impact 5 = 20, a critical cell that must not ship. The same finding at likelihood 1 scores 5 — still worth fixing, but the urgency differs.</p>
  <h2>Qualitative is a starting point</h2>
  <p>Ratings are a communication device, not a measurement. Pair them with facts where it matters: exposure counts, dollar exposure, patch age, exploit availability. The matrix makes the conversation fast; the numbers make it honest.</p>
  <div class="callout callout-tip">
    <strong>One language, everywhere</strong>
    <p>If engineering, operations, and compliance each use different bands, decisions get made on vibes. Agree on one matrix and publish it.</p>
  </div>
  <h2>Keep the matrix honest</h2>
  <p>Re-draw the matrix when the business changes, not just on a calendar. If a new regulation raises the cost of a leak, impact definitions must rise with it. A frozen matrix eventually produces confident but wrong decisions.</p>
  <h2>Run a sample through first</h2>
  <p>Before a big session, score three known findings against the matrix as a warm-up. The first rows expose where the rubric is ambiguous, so the team argues about definitions before the real risks are on the table.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000416',
  '03A00000-0000-4000-8000-000000000316',
  1,
  'Risk Registers',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Risk Registers</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Risk Registers</h1>
  <p>Threat models find risks; the <strong>risk register</strong> is where they live, get tracked, and get driven to resolution. It is a living document, not a compliance artifact.</p>
  <h2>What a register holds</h2>
  <table>
    <tr><th>Column</th><th>What it records</th></tr>
    <tr><td>ID</td><td>Unique, stable identifier per risk</td></tr>
    <tr><td>Description</td><td>The threat and the asset it touches</td></tr>
    <tr><td>Likelihood / Impact</td><td>Pre-mitigation ratings</td></tr>
    <tr><td>Score</td><td>Matrix result and band</td></tr>
    <tr><td>Treatment</td><td>Mitigate, transfer, avoid, or accept</td></tr>
    <tr><td>Controls</td><td>The specific countermeasures applied</td></tr>
    <tr><td>Owner</td><td>The person accountable</td></tr>
    <tr><td>Status</td><td>Open, in progress, accepted, closed</td></tr>
  </table>
  <h2>One entry, start to finish</h2>
  <pre class="code-block">RISK-014  Session token stored in a plaintext cookie
Asset     Session store / identity provider
L / I     Likelihood 4, Impact 3   &rarr; Score 12 (MEDIUM)
Treatment Mitigate
Controls  HttpOnly + Secure cookie flags; short expiry; rotation
Owner     Backend lead (A. Reyes)
Status    In progress - planned for next sprint
  </pre>
  <h2>Keep it alive</h2>
  <ul>
    <li>Update it when the threat model changes, not just at annual audits.</li>
    <li>Revisit open items on a fixed cadence — monthly works for most teams.</li>
    <li>Close an item only when evidence shows the risk is genuinely gone.</li>
  </ul>
  <div class="callout">
    <strong>Actionable, not archival</strong>
    <p>A register that nobody reopens is a tombstone. Give every row an owner and a next review date, and it becomes a work queue.</p>
  </div>
  <h2>Make entries tracible</h2>
  <p>Zero entries in get lost twice: once when the ticket is written, once when the model changes. Link each risk back to the data flow and STRIDE row that produced it, and link the evidence forward to the ticket that remediates it. Traceability is what lets a later review challenge old decisions instead of re-litigating them.</p>
  <h2>Typical columns</h2>
  <p>Most registers run ID, description, asset, likelihood, impact, score, band, treatment, controls, owner, status, and next-review date. Start narrow and add a column only when someone asks a question that a column would answer.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000417',
  '03A00000-0000-4000-8000-000000000317',
  1,
  'Treatment & Ownership',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Treatment & Ownership</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Treatment &amp; Ownership</h1>
  <p>For every scored risk you choose one of four <strong>treatments</strong> — and you name someone accountable. Treatment without ownership is a suggestion.</p>
  <table>
    <tr><th>Treatment</th><th>Meaning</th><th>Example</th></tr>
    <tr><td>Mitigate</td><td>Reduce likelihood or impact with controls</td><td>Add MFA, patch, segment the network</td></tr>
    <tr><td>Transfer</td><td>Shift the risk to another party</td><td>Cyber insurance, managed security provider</td></tr>
    <tr><td>Avoid</td><td>Remove the exposure altogether</td><td>Drop a risky feature, retire a legacy system</td></tr>
    <tr><td>Accept</td><td>Tolerate consciously and formally</td><td>Documented decision on a low residual risk</td></tr>
  </table>
  <h2>Acceptance is a decision</h2>
  <p>Accepting a risk is not ignoring it. The right accept looks like: residual likelihood and impact are understood, leadership signs off, and a review date is set. The wrong accept is a risk that quietly vanishes from the register.</p>
  <h2>Ownership</h2>
  <ul>
    <li>One <strong>named owner</strong> per risk — the accountable person, not a team.</li>
    <li>Owners have the authority to spend and decide, not just to report.</li>
    <li>Handoffs are recorded; a risk left behind by a departing owner is a gap, not a surprise.</li>
  </ul>
  <pre class="code-block">RISK-021  Public file upload without scanning
Treatment Mitigate (owner: platform team)  &rarr; antivirus + content checks
Residual  Likelihood 2, Impact 2 = score 4  &rarr; ACCEPT, revisit at Q3 review
  </pre>
  <div class="callout callout-tip">
    <strong>If nobody owns it, it does not exist</strong>
    <p>Before closing a meeting, read the list of open risks out loud and confirm each has an owner and a date. Short, repeated, and very effective.</p>
  </div>
  <h2>Residual risk is the point</h2>
  <p>Treatment rarely removes all risk; it moves the residual somewhere you will consciously defend. Write the residual score beside every treated item, confirm it is acceptable, and set a re-review date. An acceptable residual nobody rechecks slowly drifts back into a surprise.</p>
  <h2>Escalation thresholds</h2>
  <p>Agree in advance when a risk must be escalated: critical scores, accepted risks that miss their re-review, and entries without an owner. Escalation rules are what keep the register from becoming a place where risk goes to hide.</p>
  <p>Escalation is a busy signal, not a failure. A register that escalates early builds trust that the risk process works before the incident does the escalating for you.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000419',
  '03A00000-0000-4000-8000-000000000319',
  1,
  'Choosing Mitigation Controls',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Choosing Mitigation Controls</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Choosing Mitigation Controls</h1>
  <p>A control is anything that reduces risk — technology, process, or people. The skill is matching the right control to the right threat.</p>
  <h2>Control types</h2>
  <table>
    <tr><th>Type</th><th>Behavior</th><th>Example</th></tr>
    <tr><td>Preventive</td><td>Stops the event</td><td>Firewall, MFA, input validation</td></tr>
    <tr><td>Detective</td><td>Reveals the event</td><td>IDS, monitoring, audit logs</td></tr>
    <tr><td>Corrective</td><td>Repairs after the event</td><td>Backups, incident response, failover</td></tr>
    <tr><td>Deterrent</td><td>Discourages the actor</td><td>Warning banners, visible security</td></tr>
    <tr><td>Compensating</td><td>Substitutes for a missing control</td><td>Vendor-managed controls, manual review</td></tr>
  </table>
  <h2>Match controls to STRIDE</h2>
  <table>
    <tr><th>STRIDE</th><th>Defense pattern</th></tr>
    <tr><td>Spoofing</td><td>Strong authentication, session binding, signatures</td></tr>
    <tr><td>Tampering</td><td>Integrity checks, signing, write access control</td></tr>
    <tr><td>Repudiation</td><td>Tamper-evident logs, non-repudiation</td></tr>
    <tr><td>Disclosure</td><td>Encryption, least privilege, data classification</td></tr>
    <tr><td>Denial of service</td><td>Rate limiting, redundancy, load capacity</td></tr>
    <tr><td>Elevation</td><td>Hardening, sandboxing, patching, privilege separation</td></tr>
  </table>
  <h2>Proportion is the point</h2>
  <p>The register score sets the budget. A low-rated threat does not justify drowning the team in ceremony; a critical one does not get a TODO comment. Pick the simplest control that moves the rating into an acceptable band.</p>
  <div class="callout callout-tip">
    <strong>Controls have costs too</strong>
    <p>Every control costs time, money, and operational friction. Track what you applied and why — the next review will ask exactly that question.</p>
  </div>
  <h2>Sequence controls by leverage</h2>
  <p>Fix the single points of failure first: one control that cuts ten related findings beats ten controls that trim one each. Re-score after each batch so the register shows the delta, and keep the native controls your framework already offers instead of bolting on parallel mechanisms.</p>
  <h2>Verify the control works</h2>
  <p>A control that has never been tested is a hope. Pen-test, table-top, or simulate each selected control before you mark the risk closed, and note the test in the register so the evidence outlives the meeting.</p>
  <p>Re-test on a schedule, not only when something feels off. Configuration drift and forgotten rituals quietly disable protections; a quarterly smoke test keeps them real.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000420',
  '03A00000-0000-4000-8000-000000000320',
  1,
  'Defense in Depth',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Defense in Depth</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Defense in Depth</h1>
  <p><strong>Defense in depth</strong> means layering independent controls so a single failure does not unlock the whole system. Overlap is intentional: each layer compensates for the one behind it.</p>
  <pre class="code-block">Layers of defense

[Perimeter]        firewalls, edge WAF, DDoS protection
[Network]          segmentation, ACLs, egress filtering
[Host]             patching, hardening, EDR, least privilege
[Application]      input validation, authN/Z, secrets vaulting
[Data]             encryption at rest &amp; in transit, backups
[People &amp; Process]   training, reviews, incident response
  </pre>
  <h2>Why layering wins</h2>
  <p>Real breaches chain multiple failures: a phished password defeats authentication, an unpatched host defeats the firewall, a misconfigured bucket defeats the perimeter. If each layer operates alone, one mistake is a breach. If they are layered, the attacker must beat every layer, which changes the economics of the attack.</p>
  <p>Consider remote access: the VPN is layer one, MFA at login is layer two, network segmentation stops a session reaching beyond what the user needs is layer three, and monitoring of anomalous sessions is layer four. Phishing defeats layer one; MFA blunts it. Stolen tokens defeat layers one and two; segmentation limits the blast radius.</p>
  <h2>Independence matters more than count</h2>
  <p>Three controls that all fail on the same condition are one control. Verify the layers are genuinely independent — different vendors, different data, different failure modes — and test them: simulate the failure of one layer and confirm the others still hold.</p>
  <div class="callout callout-info">
    <strong>Map depth to the model</strong>
    <p>Return to your data flow diagram and annotate each boundary with its layers. Boundaries without a second layer are where you concentrate remediation effort.</p>
  </div>
  <h2>Prosperity, then measurement</h2>
  <p>Quiet onboarding of a single vendor tool sometimes removes the friction that made layering real. Whatever you adopt, keep a low-tech copy of the layer map in the same repository as the code, and treat the absence of tests that exercise a layer as an indicator the layer is nominal rather than real.</p>
  <p>Own the boring parts deliberately: inventory, owners, test dates. The layers that make headlines are the ones people fight about; the layers that keep the system up are the ones nobody remembers assigning.</p>
  <h2>Measure the layers</h2>
  <p>For each layer, name the test that would prove it: a firewall rule that drops, an MFA prompt that appears, a rate limit that trips, a backup restore that runs. Layers you cannot test stay on the map as aspiration.</p>
  <p>Pair the layer map with the team&rsquo;s real deployment. The map that reflects what actually runs — not what was once planned — is the only version worth defending in a review.</p>
  <p>Run these tests on a rhythm and celebrate the passes out loud. When people start seeing their layer hold up on schedule, defending it stops being a chore and becomes the norm.</p>
  <div class="callout callout-tip">
    <strong>One failure is a find</strong>
    <p>When a layer test fails, do not soften the report — log it, fix the root cause, and re-run. Each finding that turns into a repair is proof the layers are doing their low-noise job.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000422',
  '03A00000-0000-4000-8000-000000000322',
  1,
  'Keeping Models Current',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Keeping Models Current</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Keeping Models Current</h1>
  <p>A threat model is a photograph of the system at a moment in time. Systems change, so a model you never revisit becomes a confident lie.</p>
  <h2>What ages a model</h2>
  <ul>
    <li><strong>New features</strong> — a search box added to the old app is a new attack surface.</li>
    <li><strong>Architecture change</strong> — microservices, a new database, a new cloud region.</li>
    <li><strong>New data</strong> — sensitive data now stored where nothing sensitive was kept.</li>
    <li><strong>New integrations</strong> — every third party extends your trust boundary.</li>
    <li><strong>Incidents</strong> — the same class of attack may hit a sibling component.</li>
  </ul>
  <h2>A practical cadence</h2>
  <table>
    <tr><th>Trigger</th><th>Action</th></tr>
    <tr><td>Merge of a feature that takes user input</td><td>Quick STRIDE pass before merge</td></tr>
    <tr><td>Architecture or data-store change</td><td>Full re-model of the affected component</td></tr>
    <tr><td>New third-party integration</td><td>Update boundaries; review the vendor</td></tr>
    <tr><td>Security incident</td><td>Replay the model against the intrusion</td></tr>
    <tr><td>No change for a quarter</td><td>Scheduled refresh; verify the inventory</td></tr>
  </table>
  <h2>Version your models</h2>
  <p>Keep models in version control with the code they describe, dated and linked to the diagram. When the model is updated, export the diff to the risk register so ratings and owners follow.</p>
  <div class="callout">
    <strong>Stale models are worse than none</strong>
    <p>A confident, outdated diagram makes reviewers skip the real analysis. Add the model&rsquo;s last-review date to every page and treat old dates as findings.</p>
  </div>
  <h2>Own the refresh</h2>
  <p>Designate a renewal owner when the model is created, not when it goes stale. The automation that stamps <em>last reviewed</em> is only useful if someone is accountable for what the stamp reveals.</p>
  <h2>Refresh triggers together</h2>
  <p>Model refresh and register review should share a single trigger so they never drift apart. When the diagram changes so does the register; when the register changes so is the diagram checked — one entry point, two outputs.</p>
  <p>Fit the refresh into an existing event the team already respects, like the sprint review or the release checklist. A standing slot beats a reminder system nobody reads.</p>
  <p>If a component has not changed in a year, the review is short — the real signal is the component that changed and nobody noticed. Let the model tell you what to look at next.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000423',
  '03A00000-0000-4000-8000-000000000323',
  1,
  'Threat Modeling Tools',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Threat Modeling Tools</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Threat Modeling Tools</h1>
  <p>Tools make threat modeling repeatable: they render diagrams, keep threat libraries, and generate reports. They do not supply the thinking.</p>
  <h2>What a tool gives you</h2>
  <ul>
    <li><strong>Diagramming</strong> — draw data flows and trust boundaries that stay versionable.</li>
    <li><strong>Threat libraries</strong> — STRIDE, OWASP, and domain-specific catalogs to prompt coverage.</li>
    <li><strong>Reports</strong> — export findings, scoring, and controls in a form teams and auditors reuse.</li>
    <li><strong>Diffing</strong> — compare model versions to see what changed from a security lens.</li>
  </ul>
  <h2>Common options</h2>
  <table>
    <tr><th>Tool / method</th><th>Strength</th></tr>
    <tr><td>Microsoft Threat Modeling Tool</td><td>STRIDE-per-element prompts, diagram-first, quick sessions</td></tr>
    <tr><td>OWASP Threat Dragon</td><td>Open source, browser and desktop, sharing-friendly</td></tr>
    <tr><td>OWASP pytm</td><td>Describes the system in code; generates diagrams and threats</td></tr>
    <tr><td>PASTA</td><td>Seven-step methodology for risk-driven, business-aligned modeling</td></tr>
    <tr><td>LINDDUN</td><td>Privacy-focused threat categories paired with STRIDE</td></tr>
    <tr><td>OCTAVE</td><td>Organizational self-assessment aimed at larger risk programs</td></tr>
  </table>
  <h2>Adopt light, then harden</h2>
  <p>Start with a diagram tool and an agreed scoring rubric. Add automation only when the manual loop works — otherwise you automate chaos.</p>
  <div class="callout callout-info">
    <strong>Tools are memory, not intelligence</strong>
    <p>The best tooling still misses the threats everyone assumes away. Allocate time for human discussion and treat the tool as record-keeper and checklist.</p>
  </div>
  <h2>Compare on fit, not features</h2>
  <p>Diagram-first tools suit design sessions; code-first tools suit teams that ship often. Whichever you pick, every threat must export to the register and every register update must flow back — if the tool cannot round-trip, it silently forks your model.</p>
  <h2>Start unplugged</h2>
  <p>A whiteboard and a spreadsheet are enough to run the whole method. Tools add collaboration and versioning, but the method — the questions and the rubric — is what produces quality. Adopt tooling after the manual process already works.</p>
  <p>When you do adopt a tool, pilot it on a single component first. Prove the team will keep it updated before you migrate every diagram in the company.</p>
  <p>The choice between a checklist and a rich suite is a ladder, not a fork: start with the checklist, and let the complexity grow only where the risk register proves it is needed.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000425',
  '03A00000-0000-4000-8000-000000000325',
  1,
  'Case Study: Scope & Assets',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Case Study: Scope & Assets</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Case Study: Scope &amp; Assets</h1>
  <p>The capstone walks a full risk assessment for a fictional company, <strong>ShopSmart</strong> — a growing e-commerce platform. Across the next lessons you build the complete deliverable.</p>
  <h2>The scenario</h2>
  <pre class="code-block">ShopSmart
- Next.js storefront (items, cart, checkout)
- Node API layer, sessions in same-tier Redis
- PostgreSQL holding users + order history
- Payment via PCI-compliant provider (ShopPay)
- Staging copy of production DB (weekly snapshot)
- Admin console with broad account management
  </pre>
  <h2>Step 1: define scope</h2>
  <ul>
    <li>Bound the assessment: storefront, API, checkout, admin, and supporting storage.</li>
    <li>Exclude the payment provider&rsquo;s internals — the boundary sits at the API.</li>
    <li>State assumptions: staging is reachable from the corporate VPN only.</li>
  </ul>
  <h2>Step 2: list assets</h2>
  <table>
    <tr><th>Asset</th><th>Why it matters</th></tr>
    <tr><td>Customer PII and order history</td><td>Regulated; damage to trust is severe</td></tr>
    <tr><td>Session tokens</td><td>Account takeover path to everything else</td></tr>
    <tr><td>Admin console</td><td>High blast radius; management, refunds, accounts</td></tr>
    <tr><td>Staging DB snapshot</td><td>Unexpected copy of production data</td></tr>
    <tr><td>API keys and secrets</td><td>Keys to integrations and infrastructure</td></tr>
    <tr><td>Availability of checkout</td><td>Revenue loss per minute of outage</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Write your assumptions down</strong>
    <p>Reviewers will ask why the payment provider is out of scope and why staging is considered internal. A stated assumption is a scoped decision; an unstated one is a hole.</p>
  </div>
  <h2>Eleven boundaries, then trim</h2>
  <p>The team sketched eleven boundaries before converging: browser-to-web, web-to-API, API-to-database, API-to-payment, admin-to-console, cron-to-jobs, staging-to-prod, DNS and CDN, email delivery, support impersonation, and the office network. The draft warned them where effort would concentrate, and the trimmed list became the agreed review body for the next session.</p>
  <h2>Scope rule of thumb</h2>
  <p>Include anything that stores or transmits customer data, anything reachable over the network, and every vendor that touches either. Exclude only what the team can justify in writing — then keep that justification with the model.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000426',
  '03A00000-0000-4000-8000-000000000326',
  1,
  'Case Study: Threats & Risk',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Case Study: Threats & Risk</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Case Study: Threats &amp; Risk</h1>
  <p>Now run the workflow from the earlier modules on the ShopSmart system — diagram, STRIDE, then DREAD scoring.</p>
  <h2>Diagram and boundaries</h2>
  <pre class="code-block">[Shopper] --HTTPS--&gt; [Storefront] --API--&gt; [Node API] --SQL--&gt; [PostgreSQL]
    |                        |
    |                  +--- session ---&gt; [Redis]
    |                        |
    |--- payment ---&gt; [ShopPay (external), boundary C]
    |
&lt;-- Trust boundary A: shopper to storefront
&lt;-- Trust boundary B: web tier to data tier (Redis, PostgreSQL)
&lt;-- Trust boundary C: app to payment provider
  </pre>
  <h2>STRIDE findings</h2>
  <table>
    <tr><th>STRIDE</th><th>ShopSmart finding</th><th>Proof point</th></tr>
    <tr><td>Spoofing</td><td>Session forge or fixation on the Redis-held token</td><td>Cookies lack HttpOnly and Secure flags</td></tr>
    <tr><td>Tampering</td><td>Order records altered via admin console misuse</td><td>No change audit trail</td></tr>
    <tr><td>Repudiation</td><td>Refund actions cannot be traced</td><td>Admin logs not tamper-evident</td></tr>
    <tr><td>Information disclosure</td><td>Staging snapshot leaks real customer data</td><td>Production copy runs in staging</td></tr>
    <tr><td>Denial of service</td><td>Checkout rate-limit gap under promotion traffic</td><td>Carts blocked, revenue lost</td></tr>
    <tr><td>Elevation of privilege</td><td>Broad admin roles; DB credentials shared across tiers</td><td>Least privilege not applied</td></tr>
  </table>
  <h2>DREAD scoring, top three</h2>
  <pre class="code-block">Session theft      D8 R9 E7 A9 F6  &rarr; 7.8  HIGH
Staging data leak  D9 R8 E6 A9 F7  &rarr; 7.8  HIGH
Checkout DoS       D7 R8 E9 A8 F6  &rarr; 7.6  HIGH
  </pre>
  <p>Scoring debates surfaced the true ordering: session theft is the highest leverage because it feeds account takeover, and account takeover feeds the rest.</p>
  <div class="callout callout-info">
    <strong>Score pre-mitigation</strong>
    <p>Rate threats with existing controls in mind but before planning new ones. That gives you the gap to measure remediation against later.</p>
  </div>
  <h2>The ordering changed the plan</h2>
  <p>Nothing about the three scores screamed surprise; the insight was the ordering. Because session theft feeds every other account path, the roadmap moved session hardening ahead of the staging fix, and the checkout rate-limit fix was slotted as a release-blocking task. Ranking is only useful when the team commits to the ordering it produced.</p>
  <h2>Debrief in minutes</h2>
  <p>Close with a two-minute read-out: the top three findings, the decision each needs, and the owner. If the room cannot name all three from memory, the session buried its outcomes — write them where the team will see them again the next day.</p>
</div>
</body>
</html>
$html$
),
(
  '03A00000-0000-4000-8000-000000000427',
  '03A00000-0000-4000-8000-000000000327',
  1,
  'Case Study: Controls & Report',
$html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Case Study: Controls & Report</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #dc2626; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #b91c1c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fef2f2; color: #b91c1c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fee2e2; border-left: 4px solid #ef4444; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fef2f2; color: #b91c1c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #f87171; }
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
  <h1>Case Study: Controls &amp; Report</h1>
  <p>Finish the assessment: choose controls, compute residual risk, update the register, and publish a readable report.</p>
  <h2>Controls for the top threats</h2>
  <table>
    <tr><th>Threat</th><th>Control</th><th>Type</th><th>Owner</th></tr>
    <tr><td>Session theft</td><td>HttpOnly, Secure, SameSite cookies; short expiry; rotation; MFA on login</td><td>Preventive</td><td>Web lead</td></tr>
    <tr><td>Staging data leak</td><td>Anonymize the snapshot; restrict access; tighten VPN posture</td><td>Preventive</td><td>Platform lead</td></tr>
    <tr><td>Checkout DoS</td><td>Rate limiting and auto-scaling on checkout</td><td>Preventive / Detective</td><td>SRE</td></tr>
    <tr><td>Admin misuse / repudiation</td><td>Tamper-evident audit log; role separation</td><td>Detective</td><td>Security lead</td></tr>
  </table>
  <h2>Residual risk</h2>
  <pre class="code-block">Session theft   pre 7.8 HIGH   post 3.2 LOW    &rarr; close after rollout
Staging leak    pre 7.8 HIGH   post 4.4 MEDIUM &rarr; track in register
Checkout DoS    pre 7.6 HIGH   post 4.0 MEDIUM &rarr; track in register
  </pre>
  <h2>Register rows</h2>
  <p>Each open risk becomes a register entry with ID, scores, treatment, owner, and a next-review date. Everything unresolved flows there.</p>
  <h2>The final report</h2>
  <ul>
    <li>Executive summary with the score bands and the top three risks.</li>
    <li>System description with the data flow diagram and boundaries.</li>
    <li>Method — the STRIDE, DREAD rubric, and matrix used.</li>
    <li>Findings table with proof points, controls, and residual scores.</li>
    <li>Prioritized recommendations, each with an owner and a date.</li>
    <li>Register snapshot, assumptions, and the next review date.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Make it decidable</strong>
    <p>A good report leads every recommendation with the decision you want: mitigate, transfer, avoid, or accept — and who has signed it.</p>
  </div>
  <h2>After you deliver</h2>
  <p>Book the follow-up before the review happens and bring the register to it. A report that lands and then disappears is a filing event; the same report with a calendar entry, an owner per item, and a fixed revisit date is the opening move of a remediation cycle.</p>
  <h2>The register closes the loop</h2>
  <p>Every report finding lands in the register the same day with its decision, owner, and re-review date. That single hand-off is what turns a one-off analysis into a sustainable practice.</p>
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
  ('03A00000-0000-4000-8000-000000000501', '03A00000-0000-4000-8000-000000000303',
   'What is the primary goal of threat modeling?',
   'Threat modeling finds design weaknesses early, so they can be fixed before they ship.', 1),
  ('03A00000-0000-4000-8000-000000000502', '03A00000-0000-4000-8000-000000000303',
   'When in the software development lifecycle should threat modeling ideally begin?',
   'Design-time review is the cheapest and most effective, before code exists.', 2),
  ('03A00000-0000-4000-8000-000000000503', '03A00000-0000-4000-8000-000000000303',
   'Which mindset best describes effective threat modeling?',
   'Effective reviewers think adversarially and assume the system will be attacked.', 3),
  ('03A00000-0000-4000-8000-000000000504', '03A00000-0000-4000-8000-000000000306',
   'In threat modeling, what is an asset?',
   'Assets are the data, systems, and capabilities worth protecting.', 1),
  ('03A00000-0000-4000-8000-000000000505', '03A00000-0000-4000-8000-000000000306',
   'What is an attack surface?',
   'The attack surface is the sum of every reachable entry point.', 2),
  ('03A00000-0000-4000-8000-000000000506', '03A00000-0000-4000-8000-000000000306',
   'What does a trust boundary represent in a data flow diagram?',
   'A trust boundary marks where data crosses between different trust zones.', 3),
  ('03A00000-0000-4000-8000-000000000507', '03A00000-0000-4000-8000-000000000309',
   'In STRIDE, what does the letter S stand for?',
   'S is for Spoofing - impersonating someone or something else.', 1),
  ('03A00000-0000-4000-8000-000000000508', '03A00000-0000-4000-8000-000000000309',
   'Which STRIDE category describes unauthorized modification of data?',
   'Tampering is any unauthorized change to data or code.', 2),
  ('03A00000-0000-4000-8000-000000000509', '03A00000-0000-4000-8000-000000000309',
   'Which STRIDE category is about exposing data to unauthorized parties?',
   'Information Disclosure is exposing data to parties who must not see it.', 3),
  ('03A00000-0000-4000-8000-000000000510', '03A00000-0000-4000-8000-000000000312',
   'What is DREAD used for in threat modeling?',
   'DREAD is a scoring rubric used to rate and prioritize threats.', 1),
  ('03A00000-0000-4000-8000-000000000511', '03A00000-0000-4000-8000-000000000312',
   'In DREAD, what does Reproducibility measure?',
   'Reproducibility asks how reliably the attacker can recreate the attack.', 2),
  ('03A00000-0000-4000-8000-000000000512', '03A00000-0000-4000-8000-000000000312',
   'What is an attack tree?',
   'An attack tree branches every path an attacker can take to a root goal.', 3),
  ('03A00000-0000-4000-8000-000000000513', '03A00000-0000-4000-8000-000000000315',
   'In risk assessment, what is likelihood?',
   'Likelihood estimates how probable a threat event is over a timeframe.', 1),
  ('03A00000-0000-4000-8000-000000000514', '03A00000-0000-4000-8000-000000000315',
   'What does impact measure in risk assessment?',
   'Impact captures the severity of harm if the threat event occurs.', 2),
  ('03A00000-0000-4000-8000-000000000515', '03A00000-0000-4000-8000-000000000315',
   'How is a basic risk score typically calculated?',
   'A basic risk score is the product of likelihood and impact.', 3),
  ('03A00000-0000-4000-8000-000000000516', '03A00000-0000-4000-8000-000000000318',
   'What is a risk register?',
   'The register is the living home for every risk, rating, owner, and treatment.', 1),
  ('03A00000-0000-4000-8000-000000000517', '03A00000-0000-4000-8000-000000000318',
   'Which risk treatment option involves insurance or outsourcing?',
   'Transfer shifts the risk to a third party such as an insurer.', 2),
  ('03A00000-0000-4000-8000-000000000518', '03A00000-0000-4000-8000-000000000318',
   'Who is responsible for managing a specific risk?',
   'Each risk needs a single accountable owner who drives its treatment.', 3),
  ('03A00000-0000-4000-8000-000000000519', '03A00000-0000-4000-8000-000000000321',
   'What is a preventive control?',
   'Preventive controls stop an incident before it starts.', 1),
  ('03A00000-0000-4000-8000-000000000520', '03A00000-0000-4000-8000-000000000321',
   'What is defense in depth?',
   'Defense in depth layers independent controls so no single failure is fatal.', 2),
  ('03A00000-0000-4000-8000-000000000521', '03A00000-0000-4000-8000-000000000321',
   'Which of the following is a detective control?',
   'Intrusion detection reveals that an attack is happening or happened.', 3),
  ('03A00000-0000-4000-8000-000000000522', '03A00000-0000-4000-8000-000000000324',
   'When should an existing threat model be reviewed?',
   'Models go stale, so review them on a schedule and after significant changes.', 1),
  ('03A00000-0000-4000-8000-000000000523', '03A00000-0000-4000-8000-000000000324',
   'What is the main benefit of using a threat modeling tool?',
   'Tools standardize the process and keep the analysis documented and shareable.', 2),
  ('03A00000-0000-4000-8000-000000000524', '03A00000-0000-4000-8000-000000000324',
   'Why do data flow diagrams stay useful across reviews?',
   'Diagrams document assets, trust boundaries, and the movement of data.', 3),
  ('03A00000-0000-4000-8000-000000000525', '03A00000-0000-4000-8000-000000000328',
   'What is the correct first step in a typical threat modeling workflow?',
   'The workflow always starts by scoping and understanding the system.', 1),
  ('03A00000-0000-4000-8000-000000000526', '03A00000-0000-4000-8000-000000000328',
   'Which STRIDE category is violated when someone denies performing an action?',
   'Repudiation is when an actor can deny an action for lack of proof.', 2),
  ('03A00000-0000-4000-8000-000000000527', '03A00000-0000-4000-8000-000000000328',
   'On a 5x5 likelihood and impact matrix, a high-likelihood and high-impact event is rated:',
   'High likelihood combined with high impact sits in the highest risk cell.', 3),
  ('03A00000-0000-4000-8000-000000000528', '03A00000-0000-4000-8000-000000000328',
   'When a risk register shows an accepted risk, what does that decision require?',
   'Accepting a risk is an explicit, signed management decision.', 4),
  ('03A00000-0000-4000-8000-000000000529', '03A00000-0000-4000-8000-000000000328',
   'A capstone risk assessment should end with:',
   'Good assessments close with prioritized, owned recommendations.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): threat modeling goal
  ('03A00000-0000-4000-8000-000000001001', '03A00000-0000-4000-8000-000000000501', 'To find and fix design weaknesses before attackers exploit them', TRUE,  1),
  ('03A00000-0000-4000-8000-000000001002', '03A00000-0000-4000-8000-000000000501', 'To scan every line of code after release', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001003', '03A00000-0000-4000-8000-000000000501', 'To certify a product is completely unhackable', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001004', '03A00000-0000-4000-8000-000000000501', 'To react to incidents after they occur', FALSE, 4),
  -- Q1 (501)q2: when to model
  ('03A00000-0000-4000-8000-000000001005', '03A00000-0000-4000-8000-000000000502', 'After the software is released', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001006', '03A00000-0000-4000-8000-000000000502', 'During the design phase', TRUE,  2),
  ('03A00000-0000-4000-8000-000000001007', '03A00000-0000-4000-8000-000000000502', 'Only during a security audit', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001008', '03A00000-0000-4000-8000-000000000502', 'When a breach has already happened', FALSE, 4),
  -- Q1 (501)q3: mindset
  ('03A00000-0000-4000-8000-000000001009', '03A00000-0000-4000-8000-000000000503', 'Trust internal users completely', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001010', '03A00000-0000-4000-8000-000000000503', 'Focus only on compliance checkboxes', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001011', '03A00000-0000-4000-8000-000000000503', 'Think like an attacker and assume breach', TRUE,  3),
  ('03A00000-0000-4000-8000-000000001012', '03A00000-0000-4000-8000-000000000503', 'Assume the product is safe until proven otherwise', FALSE, 4),
  -- Q2 (504): asset
  ('03A00000-0000-4000-8000-000000001013', '03A00000-0000-4000-8000-000000000504', 'A piece of firewall hardware', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001014', '03A00000-0000-4000-8000-000000000504', 'The threat actor behind an attack', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001015', '03A00000-0000-4000-8000-000000000504', 'The HTTP requests sent to a server', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001016', '03A00000-0000-4000-8000-000000000504', 'Any data or system of value that needs protection', TRUE,  4),
  -- Q2 (504)q2: attack surface
  ('03A00000-0000-4000-8000-000000001017', '03A00000-0000-4000-8000-000000000505', 'The collection of all reachable entry points into a system', TRUE,  1),
  ('03A00000-0000-4000-8000-000000001018', '03A00000-0000-4000-8000-000000000505', 'The number of servers a company owns', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001019', '03A00000-0000-4000-8000-000000000505', 'The physical area of the data center', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001020', '03A00000-0000-4000-8000-000000000505', 'The graphical user interface of an application', FALSE, 4),
  -- Q2 (504)q3: trust boundary
  ('03A00000-0000-4000-8000-000000001021', '03A00000-0000-4000-8000-000000000506', 'A place where encryption keys are stored', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001022', '03A00000-0000-4000-8000-000000000506', 'The point where trust levels change as data moves', TRUE,  2),
  ('03A00000-0000-4000-8000-000000001023', '03A00000-0000-4000-8000-000000000506', 'A single row in a table', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001024', '03A00000-0000-4000-8000-000000000506', 'The server where the database is hosted', FALSE, 4),
  -- Q3 (507): STRIDE S
  ('03A00000-0000-4000-8000-000000001025', '03A00000-0000-4000-8000-000000000507', 'Social engineering', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001026', '03A00000-0000-4000-8000-000000000507', 'Salting', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001027', '03A00000-0000-4000-8000-000000000507', 'Spoofing', TRUE,  3),
  ('03A00000-0000-4000-8000-000000001028', '03A00000-0000-4000-8000-000000000507', 'Scraping', FALSE, 4),
  -- Q3 (507)q2: tampering
  ('03A00000-0000-4000-8000-000000001029', '03A00000-0000-4000-8000-000000000508', 'Spoofing', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001030', '03A00000-0000-4000-8000-000000000508', 'Denial of Service', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001031', '03A00000-0000-4000-8000-000000000508', 'Elevation of Privilege', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001032', '03A00000-0000-4000-8000-000000000508', 'Tampering', TRUE,  4),
  -- Q3 (507)q3: information disclosure
  ('03A00000-0000-4000-8000-000000001033', '03A00000-0000-4000-8000-000000000509', 'Information Disclosure', TRUE,  1),
  ('03A00000-0000-4000-8000-000000001034', '03A00000-0000-4000-8000-000000000509', 'Repudiation', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001035', '03A00000-0000-4000-8000-000000000509', 'Spoofing', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001036', '03A00000-0000-4000-8000-000000000509', 'Denial of Service', FALSE, 4),
  -- Q4 (510): DREAD use
  ('03A00000-0000-4000-8000-000000001037', '03A00000-0000-4000-8000-000000000510', 'Drawing data flow diagrams', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001038', '03A00000-0000-4000-8000-000000000510', 'Rating and prioritizing threats', TRUE,  2),
  ('03A00000-0000-4000-8000-000000001039', '03A00000-0000-4000-8000-000000000510', 'Encrypting stored data', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001040', '03A00000-0000-4000-8000-000000000510', 'Writing security policies', FALSE, 4),
  -- Q4 (510)q2: reproducibility
  ('03A00000-0000-4000-8000-000000001041', '03A00000-0000-4000-8000-000000000511', 'How many users are affected', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001042', '03A00000-0000-4000-8000-000000000511', 'How much damage the attack does', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001043', '03A00000-0000-4000-8000-000000000511', 'How consistently the attack can be recreated', TRUE,  3),
  ('03A00000-0000-4000-8000-000000001044', '03A00000-0000-4000-8000-000000000511', 'How likely the threat is to disappear', FALSE, 4),
  -- Q4 (510)q3: attack tree
  ('03A00000-0000-4000-8000-000000001045', '03A00000-0000-4000-8000-000000000512', 'A diagram of the company hierarchy', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001046', '03A00000-0000-4000-8000-000000000512', 'A list of firewall rules', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001047', '03A00000-0000-4000-8000-000000000512', 'A type of network topology', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001048', '03A00000-0000-4000-8000-000000000512', 'A branching model of all paths to an attacker goal', TRUE,  4),
  -- Q5 (513): likelihood
  ('03A00000-0000-4000-8000-000000001049', '03A00000-0000-4000-8000-000000000513', 'How probable a threat event is in a given timeframe', TRUE,  1),
  ('03A00000-0000-4000-8000-000000001050', '03A00000-0000-4000-8000-000000000513', 'The monetary cost of a breach', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001051', '03A00000-0000-4000-8000-000000000513', 'The number of controls already deployed', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001052', '03A00000-0000-4000-8000-000000000513', 'The time it takes to patch a server', FALSE, 4),
  -- Q5 (513)q2: impact
  ('03A00000-0000-4000-8000-000000001053', '03A00000-0000-4000-8000-000000000514', 'The number of attackers available', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001054', '03A00000-0000-4000-8000-000000000514', 'The severity of harm if the threat event occurs', TRUE,  2),
  ('03A00000-0000-4000-8000-000000001055', '03A00000-0000-4000-8000-000000000514', 'The complexity of the attack tree', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001056', '03A00000-0000-4000-8000-000000000514', 'The cost of buying insurance', FALSE, 4),
  -- Q5 (513)q3: risk score
  ('03A00000-0000-4000-8000-000000001057', '03A00000-0000-4000-8000-000000000515', 'Likelihood minus impact', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001058', '03A00000-0000-4000-8000-000000000515', 'Likelihood plus impact', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001059', '03A00000-0000-4000-8000-000000000515', 'Likelihood times impact', TRUE,  3),
  ('03A00000-0000-4000-8000-000000001060', '03A00000-0000-4000-8000-000000000515', 'Impact divided by likelihood', FALSE, 4),
  -- Q6 (516): risk register
  ('03A00000-0000-4000-8000-000000001061', '03A00000-0000-4000-8000-000000000516', 'A spreadsheet of employee salaries', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001062', '03A00000-0000-4000-8000-000000000516', 'A backup copy of the database', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001063', '03A00000-0000-4000-8000-000000000516', 'A log of firewall events', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001064', '03A00000-0000-4000-8000-000000000516', 'A living record of risks, owners, and treatments', TRUE,  4),
  -- Q6 (516)q2: transfer
  ('03A00000-0000-4000-8000-000000001065', '03A00000-0000-4000-8000-000000000517', 'Transfer', TRUE,  1),
  ('03A00000-0000-4000-8000-000000001066', '03A00000-0000-4000-8000-000000000517', 'Mitigate', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001067', '03A00000-0000-4000-8000-000000000517', 'Accept', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001068', '03A00000-0000-4000-8000-000000000517', 'Avoid', FALSE, 4),
  -- Q6 (516)q3: owner
  ('03A00000-0000-4000-8000-000000001069', '03A00000-0000-4000-8000-000000000518', 'No one, systems manage themselves', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001070', '03A00000-0000-4000-8000-000000000518', 'A named risk owner who is accountable', TRUE,  2),
  ('03A00000-0000-4000-8000-000000001071', '03A00000-0000-4000-8000-000000000518', 'Every employee equally', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001072', '03A00000-0000-4000-8000-000000000518', 'The external auditor', FALSE, 4),
  -- Q7 (519): preventive control
  ('03A00000-0000-4000-8000-000000001073', '03A00000-0000-4000-8000-000000000519', 'A control that detects an attack in progress', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001074', '03A00000-0000-4000-8000-000000000519', 'A control that restores service after an outage', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001075', '03A00000-0000-4000-8000-000000000519', 'A control that stops threats before they occur', TRUE,  3),
  ('03A00000-0000-4000-8000-000000001076', '03A00000-0000-4000-8000-000000000519', 'A control that records events for audit', FALSE, 4),
  -- Q7 (519)q2: defense in depth
  ('03A00000-0000-4000-8000-000000001077', '03A00000-0000-4000-8000-000000000520', 'Building one very thick perimeter wall', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001078', '03A00000-0000-4000-8000-000000000520', 'Using only the strongest password policy', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001079', '03A00000-0000-4000-8000-000000000520', 'Turning on every firewall rule available', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001080', '03A00000-0000-4000-8000-000000000520', 'Layering independent controls so one failure is not fatal', TRUE,  4),
  -- Q7 (519)q3: detective control
  ('03A00000-0000-4000-8000-000000001081', '03A00000-0000-4000-8000-000000000521', 'An intrusion detection system', TRUE,  1),
  ('03A00000-0000-4000-8000-000000001082', '03A00000-0000-4000-8000-000000000521', 'A firewall that blocks traffic', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001083', '03A00000-0000-4000-8000-000000000521', 'Encryption at rest', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001084', '03A00000-0000-4000-8000-000000000521', 'Regular patching', FALSE, 4),
  -- Q8 (522): review cadence
  ('03A00000-0000-4000-8000-000000001085', '03A00000-0000-4000-8000-000000000522', 'Never, once it is complete', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001086', '03A00000-0000-4000-8000-000000000522', 'On a schedule and after any significant change', TRUE,  2),
  ('03A00000-0000-4000-8000-000000001087', '03A00000-0000-4000-8000-000000000522', 'Only when a breach occurs', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001088', '03A00000-0000-4000-8000-000000000522', 'When the marketing team requests it', FALSE, 4),
  -- Q8 (522)q2: tool benefit
  ('03A00000-0000-4000-8000-000000001089', '03A00000-0000-4000-8000-000000000523', 'It automatically fixes vulnerabilities', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001090', '03A00000-0000-4000-8000-000000000523', 'It replaces the need for security review', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001091', '03A00000-0000-4000-8000-000000000523', 'It enforces consistent process and keeps analysis documented', TRUE,  3),
  ('03A00000-0000-4000-8000-000000001092', '03A00000-0000-4000-8000-000000000523', 'It guarantees the system cannot be attacked', FALSE, 4),
  -- Q8 (522)q3: diagrams
  ('03A00000-0000-4000-8000-000000001093', '03A00000-0000-4000-8000-000000000524', 'Diagrams matter only for the initial design', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001094', '03A00000-0000-4000-8000-000000000524', 'Trust boundaries appear only when encryption is involved', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001095', '03A00000-0000-4000-8000-000000000524', 'Data flow diagrams are only useful for physical networks', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001096', '03A00000-0000-4000-8000-000000000524', 'Data flow diagrams document assets, trust boundaries, and data movement', TRUE,  4),
  -- Q9 (525): first step
  ('03A00000-0000-4000-8000-000000001097', '03A00000-0000-4000-8000-000000000525', 'Define the scope and understand the system', TRUE,  1),
  ('03A00000-0000-4000-8000-000000001098', '03A00000-0000-4000-8000-000000000525', 'Buy a vulnerability scanner', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001099', '03A00000-0000-4000-8000-000000000525', 'Assign risk scores before drawing anything', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001100', '03A00000-0000-4000-8000-000000000525', 'Write the final report first', FALSE, 4),
  -- Q9 (525)q2: repudiation
  ('03A00000-0000-4000-8000-000000001101', '03A00000-0000-4000-8000-000000000526', 'Tampering', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001102', '03A00000-0000-4000-8000-000000000526', 'Repudiation', TRUE,  2),
  ('03A00000-0000-4000-8000-000000001103', '03A00000-0000-4000-8000-000000000526', 'Spoofing', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001104', '03A00000-0000-4000-8000-000000000526', 'Elevation of Privilege', FALSE, 4),
  -- Q9 (525)q3: matrix result
  ('03A00000-0000-4000-8000-000000001105', '03A00000-0000-4000-8000-000000000527', 'Low risk', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001106', '03A00000-0000-4000-8000-000000000527', 'No risk', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001107', '03A00000-0000-4000-8000-000000000527', 'High risk', TRUE,  3),
  ('03A00000-0000-4000-8000-000000001108', '03A00000-0000-4000-8000-000000000527', 'Impossible to rate', FALSE, 4),
  -- Q9 (525)q4: accepted risk
  ('03A00000-0000-4000-8000-000000001109', '03A00000-0000-4000-8000-000000000528', 'Nothing happens and it is ignored', FALSE, 1),
  ('03A00000-0000-4000-8000-000000001110', '03A00000-0000-4000-8000-000000000528', 'The risk is automatically transferred', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001111', '03A00000-0000-4000-8000-000000000528', 'The system must be decommissioned', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001112', '03A00000-0000-4000-8000-000000000528', 'An explicit management decision to tolerate the risk', TRUE,  4),
  -- Q9 (525)q5: capstone outcome
  ('03A00000-0000-4000-8000-000000001113', '03A00000-0000-4000-8000-000000000529', 'Prioritized recommendations with assigned owners', TRUE,  1),
  ('03A00000-0000-4000-8000-000000001114', '03A00000-0000-4000-8000-000000000529', 'A list of threats with no actions', FALSE, 2),
  ('03A00000-0000-4000-8000-000000001115', '03A00000-0000-4000-8000-000000000529', 'A promise that everything is secure', FALSE, 3),
  ('03A00000-0000-4000-8000-000000001116', '03A00000-0000-4000-8000-000000000529', 'A diagram with no explanation', FALSE, 4)
ON CONFLICT (id) DO NOTHING;