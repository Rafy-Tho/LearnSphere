-- ============================================================================
-- SEED 059: Complete course — "Software-Defined Networking"
-- ----------------------------------------------------------------------------
-- Instructor : Sarah Chen        (10000000-0000-4000-8000-000000000001)
-- Category   : Networking        (20000000-0000-4000-8000-000000000006)
-- Level      : ADVANCED · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 SDN Foundations            → C1 What is SDN? · C2 Control & Data Plane
--   M2 SDN Architecture           → C3 Layers & Interfaces · C4 Controllers & Apps
--   M3 OpenFlow & Data Planes     → C5 The OpenFlow Protocol · C6 Virtual Switches & P4
--   M4 Virtualization & SD-WAN    → C7 Overlays & VXLAN · C8 Software-Defined WAN
--   M5 SDN in Production          → C9 NFV & White-Box · C10 IBN & Capstone
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options in `quizzes` and `quiz_options`.
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
  '03B00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '20000000-0000-4000-8000-000000000006',
  'Software-Defined Networking',
  'software-defined-networking',
  'Decouple the control plane from the data plane. Master the SDN architecture, OpenFlow and programmable data planes, network virtualization, SD-WAN, NFV, and white-box switching — then design and deploy an intent-driven network in the capstone.',
  'PUBLISHED',
  'ADVANCED',
  'SUBSCRIPTION',
  57
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03B00000-0000-4000-8000-000000000011', '03B00000-0000-4000-8000-000000000001', 'Explain why and how SDN decouples the control plane from the data plane.',                        1),
  ('03B00000-0000-4000-8000-000000000012', '03B00000-0000-4000-8000-000000000001', 'Describe the SDN architecture: application, control, and data planes with their interfaces.',  2),
  ('03B00000-0000-4000-8000-000000000013', '03B00000-0000-4000-8000-000000000001', 'Explain OpenFlow flow tables, match/action processing, and controller communication.',        3),
  ('03B00000-0000-4000-8000-000000000014', '03B00000-0000-4000-8000-000000000001', 'Design overlay networks and SD-WAN fabrics built on VXLAN and tunneled underlays.',              4),
  ('03B00000-0000-4000-8000-000000000015', '03B00000-0000-4000-8000-000000000001', 'Evaluate NFV, white-box switching, and intent-based networking for production deployment.',      5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03B00000-0000-4000-8000-000000000101', '03B00000-0000-4000-8000-000000000001', 1, 'SDN Foundations',            'Understand the SDN concept, its history, and the split of control and data planes.',   'PUBLISHED'),
  ('03B00000-0000-4000-8000-000000000102', '03B00000-0000-4000-8000-000000000001', 2, 'SDN Architecture',            'Map the planes, interfaces, controllers, and applications of a complete SDN stack.', 'PUBLISHED'),
  ('03B00000-0000-4000-8000-000000000103', '03B00000-0000-4000-8000-000000000001', 3, 'OpenFlow & Programmable Planes', 'Master the OpenFlow protocol, virtual switches, and next-generation forwarding.',     'PUBLISHED'),
  ('03B00000-0000-4000-8000-000000000104', '03B00000-0000-4000-8000-000000000001', 4, 'Network Virtualization & SD-WAN', 'Build overlay networks and software-defined WAN fabrics on real underlays.',         'PUBLISHED'),
  ('03B00000-0000-4000-8000-000000000105', '03B00000-0000-4000-8000-000000000001', 5, 'SDN in Production & Capstone', 'Apply NFV, white-box switching, and intent-based networking in a capstone design.',   'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03B00000-0000-4000-8000-000000000201', '03B00000-0000-4000-8000-000000000101', 1, 'What is SDN?',              'Origins, definitions, and the promise of programmable networks.',         'PUBLISHED'),
  ('03B00000-0000-4000-8000-000000000202', '03B00000-0000-4000-8000-000000000101', 2, 'Control & Data Plane',      'Why separating forwarding from decision-making changes everything.',       'PUBLISHED'),
  ('03B00000-0000-4000-8000-000000000203', '03B00000-0000-4000-8000-000000000102', 1, 'Architecture & Interfaces', 'The layers and APIs of a complete SDN stack.',                             'PUBLISHED'),
  ('03B00000-0000-4000-8000-000000000204', '03B00000-0000-4000-8000-000000000102', 2, 'Controllers & Applications','Get to know the brain of the network: the SDN controller.',               'PUBLISHED'),
  ('03B00000-0000-4000-8000-000000000205', '03B00000-0000-4000-8000-000000000103', 1, 'The OpenFlow Protocol',     'Flow tables, match/action, and controller communication.',                'PUBLISHED'),
  ('03B00000-0000-4000-8000-000000000206', '03B00000-0000-4000-8000-000000000103', 2, 'Virtual Switches & Next-Gen Forwarding', 'Open vSwitch, P4, and reconfigurable data planes.',            'PUBLISHED'),
  ('03B00000-0000-4000-8000-000000000207', '03B00000-0000-4000-8000-000000000104', 1, 'Network Virtualization & Overlays', 'VLANs, VXLAN, and tunneling for multi-tenant fabrics.',                  'PUBLISHED'),
  ('03B00000-0000-4000-8000-000000000208', '03B00000-0000-4000-8000-000000000104', 2, 'Software-Defined WAN',      'SD-WAN architecture, deployment, and security.',                          'PUBLISHED'),
  ('03B00000-0000-4000-8000-000000000209', '03B00000-0000-4000-8000-000000000105', 1, 'NFV & White-Box Networking','Virtualized functions and disaggregated hardware.',                       'PUBLISHED'),
  ('03B00000-0000-4000-8000-000000000210', '03B00000-0000-4000-8000-000000000105', 2, 'Intent-Based Networking & Capstone', 'IBN, deployment strategy, and the capstone design.',              'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03B00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03B00000-0000-4000-8000-000000000301', '03B00000-0000-4000-8000-000000000201', 1, 'What is Software-Defined Networking?', 'Get the definition, history, and core promise of SDN.',                  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03B00000-0000-4000-8000-000000000302', '03B00000-0000-4000-8000-000000000201', 2, 'Drivers & Benefits of SDN',            'Why operators are adopting programmable networks.',                        'TEXT',  'PUBLISHED', 'FREE', 10,  7),
  ('03B00000-0000-4000-8000-000000000303', '03B00000-0000-4000-8000-000000000201', 3, 'SDN Foundations Quiz',                 'Check your grasp of the SDN concept and its history.',                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03B00000-0000-4000-8000-000000000304', '03B00000-0000-4000-8000-000000000202', 1, 'Control Plane vs Data Plane',          'Separate the brains from the forwarding hardware.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03B00000-0000-4000-8000-000000000305', '03B00000-0000-4000-8000-000000000202', 2, 'The Forwarding Model: Flow Tables & Actions', 'See how match/action switches implement the data plane contract.',  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03B00000-0000-4000-8000-000000000306', '03B00000-0000-4000-8000-000000000202', 3, 'Control & Data Plane Quiz',            'Test your understanding of plane separation.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03B00000-0000-4000-8000-000000000307', '03B00000-0000-4000-8000-000000000203', 1, 'The SDN Architecture',                 'The application, control, and data planes and their interfaces.',         'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('03B00000-0000-4000-8000-000000000308', '03B00000-0000-4000-8000-000000000203', 2, 'The Southbound Interface',             'OpenFlow, OVSDB, and NETCONF as southbound APIs.',                        'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('03B00000-0000-4000-8000-000000000309', '03B00000-0000-4000-8000-000000000203', 3, 'Architecture & Interfaces Quiz',      'Verify you know the planes and the interfaces between them.',              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03B00000-0000-4000-8000-000000000310', '03B00000-0000-4000-8000-000000000204', 1, 'The Northbound Interface & Network Applications', 'Expose network state to apps via REST and intent APIs.',    'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('03B00000-0000-4000-8000-000000000311', '03B00000-0000-4000-8000-000000000204', 2, 'SDN Controllers',                     'ONOS, OpenDaylight, Ryu, and what makes a controller.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03B00000-0000-4000-8000-000000000312', '03B00000-0000-4000-8000-000000000204', 3, 'Controllers & Applications Quiz',     'Check your controller and application knowledge.',                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03B00000-0000-4000-8000-000000000313', '03B00000-0000-4000-8000-000000000205', 1, 'OpenFlow Flow Tables',                'Match, instruction, and action processing in detail.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03B00000-0000-4000-8000-000000000314', '03B00000-0000-4000-8000-000000000205', 2, 'OpenFlow Messages & the Handshake',   'How switches and controllers talk: packet-in, flow-mod, and barriers.',   'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03B00000-0000-4000-8000-000000000315', '03B00000-0000-4000-8000-000000000205', 3, 'The OpenFlow Protocol Quiz',          'Test your OpenFlow protocol knowledge.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03B00000-0000-4000-8000-000000000316', '03B00000-0000-4000-8000-000000000206', 1, 'Open vSwitch & Software Switching',   'Virtual switches for hypervisors and containers.',                        'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('03B00000-0000-4000-8000-000000000317', '03B00000-0000-4000-8000-000000000206', 2, 'Beyond OpenFlow: P4 & Programmable Data Planes', 'Reconfigurable match-action tables and protocol-independent forwarding.', 'TEXT', 'PUBLISHED', 'FREE', 10, 10),
  ('03B00000-0000-4000-8000-000000000318', '03B00000-0000-4000-8000-000000000206', 3, 'Programmable Data Planes Quiz',       'Verify your virtual switch and P4 knowledge.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03B00000-0000-4000-8000-000000000319', '03B00000-0000-4000-8000-000000000207', 1, 'Network Virtualization & Overlays',   'Multi-tenancy, tunneling, and the move beyond VLANs.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03B00000-0000-4000-8000-000000000320', '03B00000-0000-4000-8000-000000000207', 2, 'VXLAN & Overlay Architecture',        'VTEPs, inner and outer headers, and underlay design.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03B00000-0000-4000-8000-000000000321', '03B00000-0000-4000-8000-000000000207', 3, 'Network Virtualization Quiz',         'Check your overlay and VXLAN knowledge.',                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03B00000-0000-4000-8000-000000000322', '03B00000-0000-4000-8000-000000000208', 1, 'What is SD-WAN?',                     'The software-defined approach to wide-area networking.',                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03B00000-0000-4000-8000-000000000323', '03B00000-0000-4000-8000-000000000208', 2, 'SD-WAN Deployment & Security',        'Controllers, overlays, segmentation, and zero-trust principles.',         'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03B00000-0000-4000-8000-000000000324', '03B00000-0000-4000-8000-000000000208', 3, 'SD-WAN Quiz',                         'Test your SD-WAN architecture knowledge.',                                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03B00000-0000-4000-8000-000000000325', '03B00000-0000-4000-8000-000000000209', 1, 'Network Functions Virtualization',    'Run firewalls, load balancers, and routers as software.',                 'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('03B00000-0000-4000-8000-000000000326', '03B00000-0000-4000-8000-000000000209', 2, 'White-Box Switching',                 'Disaggregate hardware from network operating systems.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03B00000-0000-4000-8000-000000000327', '03B00000-0000-4000-8000-000000000210', 1, 'Intent-Based Networking & Capstone Design', 'Translate business intent into policy and design your SDN capstone.', 'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('03B00000-0000-4000-8000-000000000328', '03B00000-0000-4000-8000-000000000210', 2, 'Final Assessment',                    'Prove what you learned across the whole SDN course.',                     'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03B00000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03B00000-0000-4000-8000-000000000401',
  '03B00000-0000-4000-8000-000000000301',
  1,
  'What is Software-Defined Networking?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is Software-Defined Networking?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is Software-Defined Networking?</h1>
  <p>Software-Defined Networking (<span class="ic">SDN</span>) is an architecture that <strong>decouples the control plane from the data plane</strong>. Control logic moves out of individual switches and routers into a centralized software component — the <em>controller</em> — while the forwarding hardware keeps one job: pushing packets according to rules it receives.</p>
  <pre class="code-block">Traditional network                       SDN network
+----------------------+                 +----------------------+
| Router runs control  |                 | Controller (software)|
| AND data plane on    |    "brains" ->  | holds global view    |
| the same box         |                 +----------------------+
|                      |                        | southbound API
| data plane in ASIC   |                        v
+----------------------+                 +----------------------+
                                         | Simple forwarding    |
                                         | switches             |
                                         +----------------------+</pre>
  <h2>Why split the planes?</h2>
  <ul>
    <li>Forwarding hardware becomes simpler, cheaper, and faster.</li>
    <li>One controller sees the whole topology and can optimize paths globally.</li>
    <li>New behavior ships as software instead of an expensive hardware refresh.</li>
    <li>Operators automate with APIs instead of typing CLI commands box by box.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Definition</strong>
    <p>The Open Networking Foundation (ONF) describes SDN as a layered architecture where the data plane, control plane, and application plane are separated and connected by open interfaces.</p>
  </div>
  <h2>A short history</h2>
  <table>
    <tr><th>Year</th><th>Milestone</th></tr>
    <tr><td>2008</td><td>The OpenFlow paper from Stanford introduces match/action forwarding.</td></tr>
    <tr><td>2009</td><td>Google develops centralized control ideas for its internal backbone.</td></tr>
    <tr><td>2011</td><td>The Open Networking Foundation is founded to drive OpenFlow.</td></tr>
    <tr><td>2012</td><td>Google publishes B4, an SDN WAN across global data centers.</td></tr>
    <tr><td>2013+</td><td>Controllers, VXLAN overlays, and SD-WAN move SDN into production.</td></tr>
  </table>
  <div class="callout">
    <strong>Not a single product</strong>
    <p>SDN is a family of ideas. OpenFlow is one southbound protocol; VXLAN, SD-WAN, NFV, and white-box switching are all part of the same movement.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000402',
  '03B00000-0000-4000-8000-000000000302',
  1,
  'Drivers & Benefits of SDN',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Drivers & Benefits of SDN</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Drivers &amp; Benefits of SDN</h1>
  <p>Traditional networks work — until you need to change them. This lesson covers why operators and cloud providers decided the old model was the bottleneck and what SDN gives them in return.</p>
  <h2>Pain points that drove SDN</h2>
  <ul>
    <li><strong>Box-by-box configuration.</strong> Every change is a CLI session on hundreds of devices.</li>
    <li><strong>Static routing.</strong> Links and paths stay fixed for months, wasting capacity.</li>
    <li><strong>Vendor lock-in.</strong> Features arrive on proprietary hardware timelines.</li>
    <li><strong>Slow feature rollout.</strong> A new protocol means firmware upgrades across the fleet.</li>
    <li><strong>Little visibility.</strong> No single pane shows the real, current network state.</li>
  </ul>
  <h2>What SDN delivers</h2>
  <table>
    <tr><th>Capability</th><th>Result</th></tr>
    <tr><td>Programmability</td><td>Script the whole network with APIs, not CLIs.</td></tr>
    <tr><td>Centralized view</td><td>One controller knows topology, flows, and hosts.</td></tr>
    <tr><td>Rapid provisioning</td><td>Segment, open, or route traffic in seconds.</td></tr>
    <tr><td>Hardware choice</td><td>Any switch that speaks the southbound protocol works.</td></tr>
    <tr><td>Telemetry</td><td>Per-flow counters enable fine-grained monitoring and optimization.</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Capacity reclamation</strong>
    <p>With global visibility, a controller can steer bursty traffic onto underused links. Data center operators routinely raise link utilization from below 40% toward 80% with traffic engineering.</p>
  </div>
  <h2>SDN versus automation</h2>
  <p>Tools that push configs over <span class="ic">NETCONF</span> or <span class="ic">Ansible</span> automate the <em>old</em> control plane. SDN goes further: the forwarding tables themselves are computed centrally and installed through an open interface. Automation is a companion to SDN, not a substitute.</p>
  <div class="callout callout-info">
    <strong>Companion technologies</strong>
    <p>SDN often pairs with network automation, virtualization, and analytics. The payoff is compounding: automation handles the boring work, and SDN handles the intelligence.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000404',
  '03B00000-0000-4000-8000-000000000304',
  1,
  'Control Plane vs Data Plane',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Control Plane vs Data Plane</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Control Plane vs Data Plane</h1>
  <p>Every network device plays two different roles. The <strong>data plane</strong> (also called the forwarding plane) touches every packet, every time. The <strong>control plane</strong> decides how packets should be forwarded and installs the rules the data plane follows.</p>
  <h2>The data plane</h2>
  <p>Per-packet, high-speed work: match a header field, look up a table, and forward, drop, or modify. This is what switch ASICs are built to do, at billions of packets per second.</p>
  <pre class="code-block">on every packet {
    lookup(flow_table, packet.header)   # find a matching rule
    if (match) apply(entry.actions)      # forward / drop / modify
    else       send_to_controller()      # unanswered — control plane work
}</pre>
  <h2>The control plane</h2>
  <p>Slower, brain-like work: exchange routing protocols (<span class="ic">OSPF</span>, <span class="ic">BGP</span>), discover topology, compute paths, and populate forwarding tables. Time constraints are milliseconds or seconds, not nanoseconds.</p>
  <table>
    <tr><th>Dimension</th><th>Data plane</th><th>Control plane</th></tr>
    <tr><td>Work</td><td>Forward every packet</td><td>Compute forwarding rules</td></tr>
    <tr><td>Speed</td><td>Line rate (ns)</td><td>Event driven (ms)</td></tr>
    <tr><td>Location</td><td>ASIC / fast path</td><td>CPU / software</td></tr>
    <tr><td>State</td><td>Flow tables, ACLs</td><td>Topology, routes, policies</td></tr>
  </table>
  <h2>The management plane</h2>
  <p>Do not confuse it with the control plane. The management plane is how you talk to a device (<span class="ic">SNMP</span>, <span class="ic">SSH</span>, <span class="ic">NETCONF</span>): configuration, monitoring, and OAM. In SDN this plane shrinks to bootstrapping and troubleshooting.</p>
  <div class="callout">
    <strong>Where SDN changes things</strong>
    <p>A classic router runs control and data plane on the same box. In SDN the control plane moves to a controller; switches become pure data-plane devices.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Why it matters</strong>
    <p>Because the data plane is now a generic, cheap switch, innovation concentrates where it is cheapest: software.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000405',
  '03B00000-0000-4000-8000-000000000305',
  1,
  'The Forwarding Model: Flow Tables & Actions',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Forwarding Model: Flow Tables & Actions</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Forwarding Model: Flow Tables &amp; Actions</h1>
  <p>An SDN switch does not think — it <em>matches</em>. The controller installs <strong>flow entries</strong>, and the switch applies the entry whose match fields fit the packet. This is the match/action model.</p>
  <h2>Anatomy of a flow entry</h2>
  <ul>
    <li><strong>Match fields</strong> — the header values compared against the packet.</li>
    <li><strong>Priority</strong> — which entry wins when several match.</li>
    <li><strong>Counters</strong> — packets, bytes, and duration tracked per entry.</li>
    <li><strong>Instructions</strong> — a set of actions plus pipeline control.</li>
    <li><strong>Timeouts</strong> — how long the entry lives before the switch evicts it.</li>
  </ul>
  <pre class="code-block">flow entry
  match:  eth_type=0x0800, ip proto=6, tcp dst=443
  priority: 500
  instructions: { write-actions: set-field:tun_id=100, output:3 }
  counters: packets=1_204_551, bytes=214_881_022
  idle timeout: 30s</pre>
  <h2>Matched fields you can use</h2>
  <table>
    <tr><th>Layer</th><th>Match fields</th></tr>
    <tr><td>Ingress</td><td>in_port, tunnel_id, metadata</td></tr>
    <tr><td>Ethernet</td><td>eth_src, eth_dst, eth_type, vlan_vid, vlan_pcp</td></tr>
    <tr><td>IP</td><td>ip_src, ip_dst, ip_proto, ip_dscp</td></tr>
    <tr><td>L4</td><td>tcp_src, tcp_dst, udp_src, udp_dst</td></tr>
    <tr><td>MPLS</td><td>mpls_label, mpls_tc</td></tr>
  </table>
  <h2>Actions</h2>
  <p>An action is a single operation: <span class="ic">output</span> to a port, <span class="ic">drop</span>, <span class="ic">set-field</span> to rewrite a header, or <span class="ic">push/pop</span> to add or remove a VLAN or MPLS tag.</p>
  <div class="callout callout-info">
    <strong>Wildcards</strong>
    <p>Match fields support wildcards, so one entry can cover a subnet (<span class="ic">ip_dst=10.0.0.0/24</span>) while another targets an exact host. Priority resolves conflicts.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Table-miss</strong>
    <p>Every table ends in a special <em>table-miss</em> entry. Its job is usually to send the packet to the controller — turning an unknown flow into control-plane work.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000407',
  '03B00000-0000-4000-8000-000000000307',
  1,
  'The SDN Architecture',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The SDN Architecture</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The SDN Architecture</h1>
  <p>The ONF reference model organizes SDN into three planes and two interfaces. Learning this map makes every other topic in the course click into place.</p>
  <pre class="code-block">+------------------------------------------------------------+
|  Application plane  (network apps, traffic engineering,    |
|  security, orchestration)                                  |
+------------------------------------------------------------+
        |              northbound interface (REST, intent)
        v
+------------------------------------------------------------+
|  Control plane  (controller: global view, path computation)|
+------------------------------------------------------------+
        |              southbound interface (OpenFlow, etc.)
        v
+------------------------------------------------------------+
|  Data plane  (physical and virtual switches)               |
+------------------------------------------------------------+</pre>
  <h2>The three planes</h2>
  <table>
    <tr><th>Plane</th><th>Responsibility</th></tr>
    <tr><td>Application</td><td>Business logic expressed as network requests.</td></tr>
    <tr><td>Control</td><td>Builds the global view and derives forwarding rules.</td></tr>
    <tr><td>Data</td><td>Executes the rules on every packet at line rate.</td></tr>
  </table>
  <h2>The two interfaces</h2>
  <ul>
    <li><strong>Southbound</strong> — from controller to devices. Carries flow rules, stats, and device events (OpenFlow, OVSDB, NETCONF).</li>
    <li><strong>Northbound</strong> — from applications to controller. Carries network state and intent (REST, RESTCONF, gRPC).</li>
  </ul>
  <div class="callout callout-info">
    <strong>Global view</strong>
    <p>The controller builds a model of topology, hosts, links, and active flows in its <em>network information base</em>. Applications read and extend this model through the northbound API.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Thin southbound, rich northbound</strong>
    <p>Keep the southbound interface minimal — match and forward. Push all policy intelligence up to the application plane, where it is cheapest to change.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000408',
  '03B00000-0000-4000-8000-000000000308',
  1,
  'The Southbound Interface',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Southbound Interface</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Southbound Interface</h1>
  <p>The <strong>southbound interface</strong> is the contract between the controller and the forwarding devices. It is how rules travel down and state travels up.</p>
  <h2>OpenFlow — the flagship southbound</h2>
  <p>OpenFlow defines a match/action forwarding model over a secure channel. The switch exposes its ports, tables, and counters; the controller reads them and programs flow entries.</p>
  <pre class="code-block"># install a rule that sends web traffic (tcp/443) out port 3
$ ovs-ofctl add-flow br0 \
    "priority=500,eth_type=0x0800,ip_proto=6,tcp_dst=443,actions=output:3"

# dump everything the data plane currently knows
$ ovs-ofctl dump-flows br0</pre>
  <h2>Other southbound protocols</h2>
  <table>
    <tr><th>Protocol</th><th>Purpose</th><th>Model</th></tr>
    <tr><td>OpenFlow</td><td>Flow programming</td><td>Match/action</td></tr>
    <tr><td>OVSDB</td><td>Virtual switch config</td><td>Database tables</td></tr>
    <tr><td>NETCONF / YANG</td><td>Device configuration</td><td>Data models</td></tr>
    <tr><td>BGP-LS</td><td>Topology feed for WAN traffic engineering</td><td>Link state</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Controllers are polyglot</strong>
    <p>Real controllers speak several southbound protocols at once — OpenFlow to vSwitches, NETCONF to routers, OVSDB to virtual switch databases.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Secure the channel</strong>
    <p>OpenFlow supports TLS between switch and controller. The channel carries full control of the network, so never leave it unencrypted on untrusted links.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000410',
  '03B00000-0000-4000-8000-000000000310',
  1,
  'The Northbound Interface & Network Applications',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Northbound Interface & Network Applications</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Northbound Interface &amp; Network Applications</h1>
  <p>The <strong>northbound interface</strong> is the face the controller shows to the rest of the world. It turns network state into data and requests into network change.</p>
  <h2>What apps use the northbound API</h2>
  <ul>
    <li><strong>Traffic engineering</strong> — compute and pin paths by bandwidth or latency.</li>
    <li><strong>Security</strong> — quarantine a host the moment a detector flags it.</li>
    <li><strong>Virtual network management</strong> — create, move, and delete tenant networks.</li>
    <li><strong>Observability</strong> — export topology and per-flow metrics to dashboards.</li>
  </ul>
  <p>Most controllers expose a REST API. A flow insertion looks like this:</p>
  <pre class="code-block">curl -X POST http://controller:8181/onos/v1/flows/of:0000000000000001 \
  -H 'Content-Type: application/json' \
  -d '{"flows":[{"priority":40000,"selector":{},
       "treatment":{"instructions":[{"type":"OUTPUT","port":"2"}]}}]}'</pre>
  <h2>Intent — higher than REST</h2>
  <p>REST lets you push raw flows. <strong>Intent</strong> APIs let you express a goal: <em>connect host A to host B with at least 500 Mbps</em>. The controller decides the path and repairs it if links fail.</p>
  <div class="callout callout-tip">
    <strong>Separation of concerns</strong>
    <p>Applications declare <em>what</em> they want; the controller figures out <em>how</em>. That lets the network change under you while your application keeps working.</p>
  </div>
  <div class="callout callout-info">
    <strong>Northbound is not standardized</strong>
    <p>Unlike OpenFlow, the northbound API differs per controller. Vendor lock-in migrates upward: today you are locked to a controller API, not to a switch vendor.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000411',
  '03B00000-0000-4000-8000-000000000311',
  1,
  'SDN Controllers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SDN Controllers</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>SDN Controllers</h1>
  <p>The controller is the brain of the SDN. It assembles the global view, runs the logic, and programs every switch. It is also the network single point of failure — which is why production controllers are clustered.</p>
  <h2>What a controller provides</h2>
  <ul>
    <li><strong>Device service</strong> — discovers switches and advertises their ports.</li>
    <li><strong>Topology service</strong> — links devices into a real-time graph.</li>
    <li><strong>Host tracking</strong> — learns which MAC/IP lives on which port.</li>
    <li><strong>Path service</strong> — computes routes across the graph.</li>
    <li><strong>Northbound API</strong> — REST/intent access for applications.</li>
  </ul>
  <h2>Popular controllers</h2>
  <table>
    <tr><th>Controller</th><th>Style</th><th>Notable for</th></tr>
    <tr><td>ONOS</td><td>Open source</td><td>Carrier-grade scale, Java, clustering.</td></tr>
    <tr><td>OpenDaylight</td><td>Open source</td><td>Model-driven, YANG-based, broad southbound.</td></tr>
    <tr><td>Ryu</td><td>Open source</td><td>Python, friendly for labs and teaching.</td></tr>
    <tr><td>Floodlight</td><td>Open source</td><td>Java, simple, historically tied to OpenFlow.</td></tr>
    <tr><td>Commercial</td><td>Vendor</td><td>Cisco DNA/APIC, VMware NSX, Nuage, Juniper.</td></tr>
  </table>
  <h2>High availability</h2>
  <p>A cluster of controllers elects a leader and shares state; if the leader dies, a replica takes over and re-programs the switches. Loss of the controller does not stop existing forwarding, but it stops <em>learning</em> — so redundancy matters.</p>
  <pre class="code-block"># minimal Ryu app: a learning switch in a few lines
from ryu.base import app_manager
from ryu.controller.handler import MAIN_DISPATCHER
from ryu.controller import ofp_event

class SimpleSwitch(app_manager.RyuApp):
    def __init__(self, *_args, **_kwargs):
        super(SimpleSwitch, self).__init__(*_args, **_kwargs)</pre>
  <div class="callout callout-info">
    <strong>East-west interfaces</strong>
    <p>Controllers in a cluster talk over an east-west interface to share state and reach consensus. The control plane itself becomes a distributed system.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000413',
  '03B00000-0000-4000-8000-000000000313',
  1,
  'OpenFlow Flow Tables',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OpenFlow Flow Tables</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>OpenFlow Flow Tables</h1>
  <p>OpenFlow took the match/action model and standardized it. A switch exposes its <strong>pipeline</strong> — a chain of flow tables — and the controller fills it with entries. No entry, no behavior.</p>
  <h2>Pipeline processing</h2>
  <ol>
    <li>The packet enters on an ingress port.</li>
    <li>Table 0 looks for the highest-priority match.</li>
    <li>Matched instructions may hit the <em>next table</em> (<span class="ic">goto-table</span>) or finish.</li>
    <li>A group table can fan traffic out to multiple ports or paths.</li>
    <li>At the end, the action set executes and the packet exits.</li>
  </ol>
  <pre class="code-block">table 0:  ip_dst=10.1.1.0/24  -> go to table 20
table 20: tcp_dst=80          -> output:2
table 20: tcp_dst=443         -> set-field:tun_id=500, output:5
table-miss                      -> controller</pre>
  <h2>Instructions vs actions</h2>
  <table>
    <tr><th>Structure</th><th>Examples</th></tr>
    <tr><td>Instructions</td><td><span class="ic">apply-actions</span>, <span class="ic">write-actions</span>, <span class="ic">clear-actions</span>, <span class="ic">goto-table</span>, <span class="ic">meter</span></td></tr>
    <tr><td>Actions</td><td><span class="ic">output</span>, <span class="ic">drop</span>, <span class="ic">set-field</span>, <span class="ic">push-vlan</span>, <span class="ic">push-mpls</span></td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Write vs apply</strong>
    <p><span class="ic">apply-actions</span> executes immediately; <span class="ic">write-actions</span> saves actions to run at the end of the pipeline. The difference matters when tables cascade.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Timeouts</strong>
    <p>An <em>idle timeout</em> removes the entry when no matching traffic arrives; a <em>hard timeout</em> removes it after a fixed lifetime no matter what. Idle timeouts keep large flow tables tidy.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000414',
  '03B00000-0000-4000-8000-000000000314',
  1,
  'OpenFlow Messages & the Handshake',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OpenFlow Messages & the Handshake</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>OpenFlow Messages &amp; the Handshake</h1>
  <p>OpenFlow runs over a TCP (or TLS) channel between switch and controller. Messages fall into three buckets: <strong>controller-to-switch</strong>, <strong>asynchronous</strong> (switch to controller), and <strong>symmetric</strong> (either side).</p>
  <h2>The connection sequence</h2>
  <pre class="code-block">Switch                         Controller
  |---- HELLO ---------------------&gt;|
  |&lt;---- HELLO ---------------------|
  |---- FEATURES_REQUEST ---------&gt;|
  |&lt;---- FEATURES_REPLY ------------|
  |&lt;---- FLOW_MOD (seed rules) -----|
  |---- PACKET_IN (unknown frame) -&gt;|
  |&lt;---- FLOW_MOD (learn new rule) -|
  |&lt;---- PACKET_OUT ----------------|
  |---- STATS_REQUEST -------------&gt;|
  |&lt;---- STATS_REPLY ---------------|</pre>
  <h2>Messages you need to know</h2>
  <table>
    <tr><th>Message</th><th>Direction</th><th>Job</th></tr>
    <tr><td>hello</td><td>both</td><td>Negotiate the protocol version.</td></tr>
    <tr><td>feature-request/reply</td><td>c→s</td><td>Discover tables, buffers, capabilities.</td></tr>
    <tr><td>packet-in</td><td>s→c</td><td>Send an unmatched or matched-to-controller packet.</td></tr>
    <tr><td>packet-out</td><td>c→s</td><td>Ask the switch to send a buffered packet.</td></tr>
    <tr><td>flow-mod</td><td>c→s</td><td>Add, modify, or delete flow entries.</td></tr>
    <tr><td>port-status</td><td>s→c</td><td>Report a port coming up or going down.</td></tr>
    <tr><td>barrier</td><td>c→s</td><td>Wait until earlier commands are fully processed.</td></tr>
    <tr><td>echo</td><td>both</td><td>Keep the channel alive.</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Why barriers matter</strong>
    <p>Without a barrier, later messages can overtake earlier ones. A controller that deletes an old rule and installs a new one uses a barrier to guarantee order.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Reactive vs proactive</strong>
    <p><em>Reactive</em> controllers install rules on packet-in; <em>proactive</em> ones pre-install the whole policy. Reactive is flexible, proactive is fast — production mixes both.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000416',
  '03B00000-0000-4000-8000-000000000316',
  1,
  'Open vSwitch & Software Switching',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Open vSwitch & Software Switching</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Open vSwitch &amp; Software Switching</h1>
  <p>The data plane does not have to be hardware. <strong>Open vSwitch</strong> (OVS) is the open-source software switch that powers KVM, OpenStack, and container networking — and it speaks OpenFlow natively.</p>
  <h2>Why software switches matter</h2>
  <ul>
    <li>Every VM or container could get its own switch port with full policy.</li>
    <li>OVS integrates with the hypervisor, so flows follow vMotion and migration.</li>
    <li>A software datapath — OVN in OpenStack — adds logical networks on top.</li>
    <li>Developers test SDN behavior without buying any hardware.</li>
  </ul>
  <h2>OVS in practice</h2>
  <pre class="code-block"># create a bridge, add a physical port, point it at a controller
$ ovs-vsctl add-br br0
$ ovs-vsctl add-port br0 eth0
$ ovs-vsctl set-controller br0 tcp:10.0.0.2:6653

# inspect the flow pipeline the controller has installed
$ ovs-ofctl dump-flows br0

# add a tunnel port to a VXLAN overlay
$ ovs-vsctl add-port br0 vxlan0 -- set interface vxlan0 \
    type=vxlan options:remote_ip=10.0.0.3 options:key=5000</pre>
  <h2>Fast path and slow path</h2>
  <p>OVS splits work: a kernel module (or hardware offload) handles match/action at speed, while the userspace daemon <span class="ic">ovs-vswitchd</span> handles OpenFlow messages, learning, and meandering cases.</p>
  <div class="callout callout-info">
    <strong>OVN — networking for OpenStack</strong>
    <p>OVN adds native L2/L3 logical networks over OVS: distributed gateways, routers, ACLs, and DHCP all expressed as flows the controller derives.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Your lab is free</strong>
    <p>Mininet creates realistic topologies of OVS switches and containers in seconds. Every lab in this course runs on a laptop.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000417',
  '03B00000-0000-4000-8000-000000000317',
  1,
  'Beyond OpenFlow: P4 & Programmable Data Planes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Beyond OpenFlow: P4 & Programmable Data Planes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Beyond OpenFlow: P4 &amp; Programmable Data Planes</h1>
  <p>OpenFlow fixed <em>which headers</em> a switch could match. When the industry invents a new header, OpenFlow chips need a redesign. <strong>P4</strong> breaks that cycle: the data plane itself becomes programmable.</p>
  <h2>What P4 gives you</h2>
  <ul>
    <li><strong>Protocol independence</strong> — parse any header you can describe.</li>
    <li><strong>Target independence</strong> — one program compiles to ASICs, FPGAs, or CPUs.</li>
    <li><strong>Field reconfigurability</strong> — change the parser or tables in the field.</li>
  </ul>
  <h2>A P4 pipeline</h2>
  <pre class="code-block">parser MyParser(packet_in pkt, out headers hdr) {
    state start {
        pkt.extract(hdr.ethernet);
        transition select(hdr.ethernet.etherType) {
            0x0800: parse_ipv4;
            default: accept;
        }
    }
    state parse_ipv4 {
        pkt.extract(hdr.ipv4);
        transition accept;
    }
}

control MyControl(inout headers hdr, inout metadata meta) {
    apply {
        if (hdr.ipv4.isValid()) {
            meta.drop = false;   // decide policy here
        }
    }
}</pre>
  <h2>Where P4 sits next to SDN</h2>
  <table>
    <tr><th>Layer</th><th>OpenFlow switch</th><th>P4 switch</th></tr>
    <tr><td>Parser</td><td>Fixed set of headers</td><td>User-defined</td></tr>
    <tr><td>Match tables</td><td>Vendor pipeline</td><td>User-defined MATs</td></tr>
    <tr><td>New protocol</td><td>New silicon</td><td>Recompile</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>P4 is a language, not a control protocol</strong>
    <p>P4 describes the data plane. You still need a controller to populate the match-action tables at runtime — that is where SDN and P4 meet.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Targets</strong>
    <p>Start with the BMv2 software switch or P4-embedded NICs; graduate to programmable ASICs such as Tofino when you need line rate.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000419',
  '03B00000-0000-4000-8000-000000000319',
  1,
  'Network Virtualization & Overlays',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Network Virtualization & Overlays</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Network Virtualization &amp; Overlays</h1>
  <p>Cloud tenants expect isolated networks that move freely between servers. VLANs can only provide 4096 segments and depend on the physical topology. <strong>Overlays</strong> solve both problems.</p>
  <h2>Underlay vs overlay</h2>
  <ul>
    <li><strong>Underlay</strong> — the physical IP network that carries everything.</li>
    <li><strong>Overlay</strong> — logical networks built on top with tunnels.</li>
    <li>Tenants never see the underlay; they get a clean Layer 2 or Layer 3 view.</li>
  </ul>
  <h2>Encapsulation choices</h2>
  <table>
    <tr><th>Encapsulation</th><th>Transport</th><th>Use case</th></tr>
    <tr><td>VXLAN</td><td>UDP 4789</td><td>Ethernet over IP, cloud fabrics</td></tr>
    <tr><td>NVGRE</td><td>GRE</td><td>Generic routing encapsulation</td></tr>
    <tr><td>Geneve</td><td>UDP</td><td>Extensible encapsulation (NVGRE+VXLAN)</td></tr>
    <tr><td>GRE / IP-in-IP</td><td>IP</td><td>Simple point-to-point tunnels</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Overlay + SDN</strong>
    <p>Overlays decouple the tenant network from the physical fabric — and an SDN controller programs both: the logical network in the control plane, the tunnels in the data plane.</p>
  </div>
  <h2>Why tunnels beat VLANs at scale</h2>
  <pre class="code-block">VLAN:   16-bit id  ->  4094 segments, tied to a physical trunk
VXLAN:  24-bit VNI ->  16 million segments, carried over any IP path
MAC-in-UDP: the tenant frame rides inside a normal UDP packet,
so the underlay only needs ordinary IP forwarding.</pre>
  <div class="callout callout-tip">
    <strong>Move workloads freely</strong>
    <p>Because a tenant network is just a set of tunnel endpoints, a VM can migrate to a rack it has never used. The overlay reorganizes itself.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000420',
  '03B00000-0000-4000-8000-000000000320',
  1,
  'VXLAN & Overlay Architecture',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VXLAN & Overlay Architecture</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>VXLAN &amp; Overlay Architecture</h1>
  <p><strong>VXLAN</strong> (Virtual eXtensible LAN) carries tenant Ethernet frames inside UDP packets. A 24-bit <span class="ic">VNI</span> names the tenant segment — up to 16 million isolated networks.</p>
  <h2>How a frame travels</h2>
  <pre class="code-block">+--------+--------+--------+-----------------+----------+-------+----------+
| Outer  | Outer  | Outer  | VXLAN header    | Inner    | Inner | Payload  |
| MAC    | IP     | UDP    | (flags+VNI)     | MAC      | IP    |          |
+--------+--------+--------+-----------------+----------+-------+----------+
  to VTEP   src/dst   UDP     VNI = tenant     original  original
            (underlay) 4789   segment id       frame     headers</pre>
  <ul>
    <li>The <strong>VTEP</strong> (VXLAN Tunnel EndPoint) encapsulates at the edge.</li>
    <li>The <strong>VNI</strong> identifies the tenant network, like a much larger VLAN.</li>
    <li>The <strong>underlay</strong> only routes the outer IP headers — it never inspects the tenant frame.</li>
  </ul>
  <h2>Control plane: learning vs EVPN</h2>
  <p>The simple approach floods and learns like classic Ethernet. Production fabrics prefer <strong>BGP EVPN</strong>: the control plane advertises MAC and IP reachability, so the data plane avoids floods.</p>
  <div class="callout callout-info">
    <strong>Anycast gateways</strong>
    <p>A distributed VTEP gateway exposes the same gateway IP on every leaf. A tenant host keeps its default gateway no matter where it lands.</p>
  </div>
  <h2>Build one with OVS</h2>
  <pre class="code-block">$ ovs-vsctl add-port br0 vxlan0 -- set interface vxlan0 \
    type=vxlan options:remote_ip=10.0.0.4 options:key=5000

# key 5000 = VNI 5000 -> host on the far VTEP joins the tenant net</pre>
  <div class="callout callout-tip">
    <strong>Underlay hygiene</strong>
    <p>The underlay just needs solid IP routing, decent MTU (jumbo frames), and ECMP so VXLAN traffic balances across paths.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000422',
  '03B00000-0000-4000-8000-000000000322',
  1,
  'What is SD-WAN?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is SD-WAN?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What is SD-WAN?</h1>
  <p><strong>SD-WAN</strong> applies SDN thinking to the wide area. A central orchestrator and a set of overlay tunnels turn any transport — MPLS, broadband, LTE — into one manageable, application-aware network.</p>
  <h2>Classic WAN pain</h2>
  <ul>
    <li>Expensive MPLS circuits for everything.</li>
    <li>Routing chosen by the cheapest static policy, not the health of each path.</li>
    <li>New sites take weeks of truck-roll and CLI configuration.</li>
    <li>Little visibility into how applications actually perform.</li>
  </ul>
  <h2>The SD-WAN model</h2>
  <table>
    <tr><th>Part</th><th>Role</th></tr>
    <tr><td>Edge (uCPE)</td><td>Virtual router/firewall at each branch.</td></tr>
    <tr><td>Orchestrator</td><td>Controller in the cloud: policy and provisioning.</td></tr>
    <tr><td>Gateways</td><td>Entry points to cloud and backbone regions.</td></tr>
    <tr><td>Overlay</td><td>Encrypted tunnels (IPsec) over each transport.</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Application-aware routing</strong>
    <p>The controller measures latency, loss, and jitter on every path. Voice goes where it is least lossy, builds ship over the highest-bandwidth link — and traffic fails over when a path degrades.</p>
  </div>
  <h2>Why enterprises adopt it</h2>
  <pre class="code-block">before       after
MPLS only    MPLS + broadband + LTE used together
static path  per-app path selection, failover in seconds
CLI config   zero-touch provisioning from the cloud
local only   direct-to-cloud (SaaS) with security in front</pre>
  <div class="callout callout-tip">
    <strong>Cost is a feature</strong>
    <p>Replacing MPLS circuits with broadband plus LTE typically halves WAN spend while improving resilience — because two good links beat one expensive one.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000423',
  '03B00000-0000-4000-8000-000000000323',
  1,
  'SD-WAN Deployment & Security',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SD-WAN Deployment & Security</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>SD-WAN Deployment &amp; Security</h1>
  <p>Rolling out SD-WAN touches every site — so good deployment is as important as the technology. Then you layer security on top of the fabric.</p>
  <h2>Deployment models</h2>
  <ul>
    <li><strong>Branch edge</strong> — virtual network functions on a uCPE at each site.</li>
    <li><strong>Cloud-hosted</strong> — virtual edges inside the cloud regions you use.</li>
    <li><strong>Hybrid</strong> — MPLS lines for critical sites, broadband everywhere else.</li>
  </ul>
  <h2>Zero-touch provisioning</h2>
  <p>A new branch plugs in, boots, pulls its config from the orchestrator over the day-zero tunnel, and joins the fabric. No on-site engineer required.</p>
  <pre class="code-block">policy:
  application: office365
  preferred: [mpls, broadband]
  sla:
    latency_ms: 80
    loss_pct: 1
    jitter_ms: 20
  action: if any path meets sla, use best; else failover</pre>
  <h2>Security on the fabric</h2>
  <table>
    <tr><th>Concern</th><th>SD-WAN answer</th></tr>
    <tr><td>Confidentiality</td><td>IPsec tunnels on every overlay link.</td></tr>
    <tr><td>Segmentation</td><td>Tenant and role segments carried across the fabric.</td></tr>
    <tr><td>Direct internet</td><td>DIA plus a secure web gateway / cloud SASE.</td></tr>
    <tr><td>Trust</td><td>Zero-trust: identity-aware access, never implicit trust.</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>SASE convergence</strong>
    <p>SD-WAN plus cloud security — SWG, CASB, ZTNA — is becoming <em>Secure Access Service Edge</em>. The fabric and the security policy meet in the same cloud service.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000425',
  '03B00000-0000-4000-8000-000000000325',
  1,
  'Network Functions Virtualization',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Network Functions Virtualization</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Network Functions Virtualization</h1>
  <p><strong>NFV</strong> (defined by ETSI) takes the functions that used to live on dedicated appliances — firewalls, load balancers, routers, WAN accelerators — and runs them as software on standard servers.</p>
  <h2>VNFs and where they run</h2>
  <ul>
    <li><strong>VNF</strong> — a network function packaged as a VM or container.</li>
    <li><strong>NFVI</strong> — the compute/storage/network pool that hosts VNFs.</li>
    <li><strong>MANO</strong> — the management and orchestration stack that places and scales VNFs.</li>
  </ul>
  <pre class="code-block"># a firewall VNF as a container — clearer to deploy and scale
$ docker run -d --name vfw --cap-add NET_ADMIN firewall-image:latest
$ docker exec vfw firewallctl add-rule allow tcp/443
$ docker scale vfw=3   # more instances on demand</pre>
  <h2>Appliance vs VNF</h2>
  <table>
    <tr><th>Dimension</th><th>Physical appliance</th><th>VNF</th></tr>
    <tr><td>Procurement</td><td>Weeks, per-site</td><td>Software image, instant</td></tr>
    <tr><td>Scale</td><td>Buy another box</td><td>Spawn another instance</td></tr>
    <tr><td>Location</td><td>Where the box is</td><td>Anywhere there is compute</td></tr>
    <tr><td>Upgrade</td><td>Firmware lifecycle</td><td>Rolling software deploy</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>SDN vs NFV</strong>
    <p>They complement, not overlap. SDN makes the network programmable; NFV makes the functions swappable. The 5G core you use today is a giant collection of VNFs on an SDN fabric.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Performance</strong>
    <p>Packet-heavy VNFs need acceleration: SR-IOV passthrough, DPDK, or SmartNIC offload. A firewall doing 1 Gbps is easy; a core router doing 100 Gbps still wants hardware hooks.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000426',
  '03B00000-0000-4000-8000-000000000326',
  1,
  'White-Box Switching',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>White-Box Switching</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>White-Box Switching</h1>
  <p><strong>White-box switching</strong> — disaggregation — means buying the forwarding hardware separately from the network operating system that drives it. The box is bare metal; the OS is your choice.</p>
  <h2>How it works</h2>
  <pre class="code-block">bare-metal switch (ports + merchant silicon ASIC)
        |
        v
ONIE bootloader    <- picks an OS to install
        |
        +-- SONiC        (open source, Linux, containers)
        +-- Cumulus      (Linux with native networking)
        +-- FRR + OVS    (open routing + OpenFlow)
        +-- vendor NOS   (retail hardware)</pre>
  <h2>Traditional vs white-box</h2>
  <table>
    <tr><th>Dimension</th><th>Traditional switch</th><th>White-box switch</th></tr>
    <tr><td>Hardware + OS</td><td>One vendor bundle</td><td>Separate sourcing</td></tr>
    <tr><td>Upgrade path</td><td>Supplier roadmap</td><td>Your choice of OS</td></tr>
    <tr><td>Cost per port</td><td>Higher</td><td>Lower, commodity silicon</td></tr>
    <tr><td>Programmability</td><td>Vendor API</td><td>Linux + any controller</td></tr>
  </table>
  <h2>SONiC</h2>
  <p><span class="ic">SONiC</span> is a full Linux-based NOS that runs each network service in its own container, controlled through YANG models and a central Redis state store. It speaks OpenFlow and programs merchant silicon via the SAI interface.</p>
  <div class="callout callout-info">
    <strong>Merchant silicon</strong>
    <p>Most white boxes use merchant ASICs from Broadcom or NVIDIA/Mellanox. The SAI abstraction lets one OS drive many chips — the hardware layer behind disaggregation.</p>
  </div>
  <div class="callout callout-tip">
    <strong>SDN tie-in</strong>
    <p>White-box + SDN completes the disaggregation story: cheap hardware, an open data plane, and a controller that treats every switch identically.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03B00000-0000-4000-8000-000000000427',
  '03B00000-0000-4000-8000-000000000327',
  1,
  'Intent-Based Networking & Capstone Design',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Intent-Based Networking & Capstone Design</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #e0e7ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #eef2ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #e0e7ff; color: #312e81; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #1e1b4b; color: #a5b4fc; }
.dark .lesson-page .callout { background: #1e1b4b; border-left-color: #6366f1; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e1b4b; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Intent-Based Networking &amp; Capstone Design</h1>
  <p>Everything so far has been mechanics. <strong>Intent-based networking</strong> (IBN) adds the last layer: operators declare <em>what</em> the network should do, and the system derives, installs, and continuously verifies the policy to make it true.</p>
  <h2>The IBN loop</h2>
  <ol>
    <li><strong>Translation</strong> — business intent becomes concrete policies.</li>
    <li><strong>Activation</strong> — the controller programs flows across the fabric.</li>
    <li><strong>Assurance</strong> — the network is watched; deviations are repaired or reported.</li>
  </ol>
  <pre class="code-block"># intent, not config
add-intent voip-hq-branch --app voip --from HQ --to BR-1 --metric latency

# the system decides the path, installs it, and monitors the SLA</pre>
  <h2>The capstone design</h2>
  <p>Your capstone: a campus plus three branches, all SDN. Start small, then scale:</p>
  <ul>
    <li><strong>Fabric</strong> — two leaf spines, BGP/ECMP underlay, white-box or OVS links.</li>
    <li><strong>Controller</strong> — a cluster of two ONOS instances with redundant southbound links.</li>
    <li><strong>Overlay</strong> — VXLAN for each tenant with an EVPN control plane.</li>
    <li><strong>WAN</strong> — SD-WAN edges at each branch over broadband + MPLS tunnels.</li>
    <li><strong>Services</strong> — firewall and load-balancer VNFs instantiated on demand.</li>
    <li><strong>Intent</strong> — traffic-engineered intents for VoIP, video, and backup traffic.</li>
  </ul>
  <table>
    <tr><th>Layer</th><th>Your design choice</th><th>Why</th></tr>
    <tr><td>Data plane</td><td>OVS / white-box</td><td>Cheap, programmable, OpenFlow + P4 ready</td></tr>
    <tr><td>Control plane</td><td>ONOS cluster</td><td>High availability, carrier proven</td></tr>
    <tr><td>Virtualization</td><td>VXLAN + EVPN</td><td>Many tenants, no flooding</td></tr>
    <tr><td>WAN</td><td>SD-WAN overlay</td><td>App-aware routing and failover</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Prove it first</strong>
    <p>Prototype the whole capstone in Mininet before touching real gear. A topology of OVS switches on a laptop behaves like the production fabric.</p>
  </div>
  <div class="callout callout-info">
    <strong>Deployment order</strong>
    <p>Underlay first, then controller, then overlay, then WAN, then services, then intent. Each stage is testable before the next starts.</p>
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
  ('03B00000-0000-4000-8000-000000000501', '03B00000-0000-4000-8000-000000000303',
   'What does SDN fundamentally decouple?',
   'SDN separates the control plane from the data plane so forwarding devices stay simple.', 1),
  ('03B00000-0000-4000-8000-000000000502', '03B00000-0000-4000-8000-000000000303',
   'Which organization popularized the three-plane SDN reference architecture?',
   'The Open Networking Foundation (ONF) published the data/control/application plane model.', 2),
  ('03B00000-0000-4000-8000-000000000503', '03B00000-0000-4000-8000-000000000303',
   'Which idea sits at the heart of the SDN concept?',
   'Centralized control logic programs distributed forwarding hardware through open interfaces.', 3),
  ('03B00000-0000-4000-8000-000000000504', '03B00000-0000-4000-8000-000000000306',
   'Which plane decides how traffic should be forwarded?',
   'The control plane computes the paths and installs forwarding rules.', 1),
  ('03B00000-0000-4000-8000-000000000505', '03B00000-0000-4000-8000-000000000306',
   'What does the data plane do on a modern SDN switch?',
   'The data plane matches packets against flow tables and applies the configured actions at line rate.', 2),
  ('03B00000-0000-4000-8000-000000000506', '03B00000-0000-4000-8000-000000000306',
   'In an SDN switch, what determines the action applied to a matched packet?',
   'Each flow table entry carries match fields, counters, and instructions with actions.', 3),
  ('03B00000-0000-4000-8000-000000000507', '03B00000-0000-4000-8000-000000000309',
   'Which interface connects an SDN controller to the forwarding devices?',
   'The southbound interface carries rules from the controller down to the switches.', 1),
  ('03B00000-0000-4000-8000-000000000508', '03B00000-0000-4000-8000-000000000309',
   'Which protocol is the canonical southbound API for SDN switches?',
   'OpenFlow defines a match/action forwarding model spoken between switch and controller.', 2),
  ('03B00000-0000-4000-8000-000000000509', '03B00000-0000-4000-8000-000000000309',
   'Where do SDN network applications run?',
   'Applications sit above the controller and consume its northbound API.', 3),
  ('03B00000-0000-4000-8000-000000000510', '03B00000-0000-4000-8000-000000000312',
   'What is the primary job of an SDN controller?',
   'The controller keeps a global view of the network and programs every switch to match it.', 1),
  ('03B00000-0000-4000-8000-000000000511', '03B00000-0000-4000-8000-000000000312',
   'Which of these is an open-source SDN controller?',
   'ONOS is a carrier-grade open-source controller built for high availability.', 2),
  ('03B00000-0000-4000-8000-000000000512', '03B00000-0000-4000-8000-000000000312',
   'What is a northbound interface?',
   'It is the API network applications use to read state and request changes from the controller.', 3),
  ('03B00000-0000-4000-8000-000000000513', '03B00000-0000-4000-8000-000000000315',
   'What does an OpenFlow flow entry mainly contain?',
   'A flow entry bundles match fields, priority, counters, and instructions.', 1),
  ('03B00000-0000-4000-8000-000000000514', '03B00000-0000-4000-8000-000000000315',
   'Which message does a switch send when a packet matches no flow entry?',
   'The packet-in message hands the unhandled packet to the controller.', 2),
  ('03B00000-0000-4000-8000-000000000515', '03B00000-0000-4000-8000-000000000315',
   'Which message installs a rule in a switch flow table?',
   'The flow-mod message adds, modifies, or deletes flow entries.', 3),
  ('03B00000-0000-4000-8000-000000000516', '03B00000-0000-4000-8000-000000000318',
   'What is Open vSwitch?',
   'A software switch that supports OpenFlow and runs in hypervisors and containers.', 1),
  ('03B00000-0000-4000-8000-000000000517', '03B00000-0000-4000-8000-000000000318',
   'What does the P4 language describe?',
   'P4 describes the parser, match-action tables, and deparser of a data plane.', 2),
  ('03B00000-0000-4000-8000-000000000518', '03B00000-0000-4000-8000-000000000318',
   'What does P4 stand for?',
   'Programming Protocol-independent Packet Processors.', 3),
  ('03B00000-0000-4000-8000-000000000519', '03B00000-0000-4000-8000-000000000321',
   'Which technology carries Layer 2 frames over an IP underlay at scale?',
   'VXLAN encapsulates Ethernet in UDP and adds a 24-bit VNI.', 1),
  ('03B00000-0000-4000-8000-000000000520', '03B00000-0000-4000-8000-000000000321',
   'Which component encapsulates and decapsulates VXLAN traffic?',
   'The VTEP sits at the edge of the overlay on the host, switch, or router.', 2),
  ('03B00000-0000-4000-8000-000000000521', '03B00000-0000-4000-8000-000000000321',
   'What is the main win of overlay network virtualization?',
   'Tenant networks stay isolated and independent of the physical topology.', 3),
  ('03B00000-0000-4000-8000-000000000522', '03B00000-0000-4000-8000-000000000324',
   'What is the main purpose of SD-WAN?',
   'Centralized, application-aware routing of WAN traffic over any transport.', 1),
  ('03B00000-0000-4000-8000-000000000523', '03B00000-0000-4000-8000-000000000324',
   'Which feature is typical of SD-WAN?',
   'Dynamic path selection steers traffic per application and per link health.', 2),
  ('03B00000-0000-4000-8000-000000000524', '03B00000-0000-4000-8000-000000000324',
   'How does SD-WAN typically protect traffic on the overlay?',
   'By encrypting tunnels, often with IPsec, between edge devices.', 3),
  ('03B00000-0000-4000-8000-000000000525', '03B00000-0000-4000-8000-000000000328',
   'What is NFV?',
   'NFV runs network functions as software on standard servers rather than appliances.', 1),
  ('03B00000-0000-4000-8000-000000000526', '03B00000-0000-4000-8000-000000000328',
   'What is a VNF?',
   'A virtual network function is a network service packaged as a VM or container.', 2),
  ('03B00000-0000-4000-8000-000000000527', '03B00000-0000-4000-8000-000000000328',
   'What does white-box switching mean?',
   'Commodity forwarding hardware runs an independently chosen network OS.', 3),
  ('03B00000-0000-4000-8000-000000000528', '03B00000-0000-4000-8000-000000000328',
   'What is the core promise of intent-based networking?',
   'Declaring intent lets the system derive, enforce, and verify policy automatically.', 4),
  ('03B00000-0000-4000-8000-000000000529', '03B00000-0000-4000-8000-000000000328',
   'Which architecture makes a production SDN resilient?',
   'A clustered controller with redundant southbound links and automated failover.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): decouple planes
  ('03B00000-0000-4000-8000-000000001001', '03B00000-0000-4000-8000-000000000501', 'The control plane from the data plane', TRUE,  1),
  ('03B00000-0000-4000-8000-000000001002', '03B00000-0000-4000-8000-000000000501', 'Routing from switching', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001003', '03B00000-0000-4000-8000-000000000501', 'IPv4 from IPv6', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001004', '03B00000-0000-4000-8000-000000000501', 'The backbone from the access layer', FALSE, 4),
  -- Q1 (501)q2: ONF
  ('03B00000-0000-4000-8000-000000001005', '03B00000-0000-4000-8000-000000000502', 'The Open Networking Foundation (ONF)', TRUE,  1),
  ('03B00000-0000-4000-8000-000000001006', '03B00000-0000-4000-8000-000000000502', 'The Internet Society (ISOC)', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001007', '03B00000-0000-4000-8000-000000000502', 'The Wi-Fi Alliance', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001008', '03B00000-0000-4000-8000-000000000502', 'The World Wide Web Consortium (W3C)', FALSE, 4),
  -- Q1 (501)q3: central control
  ('03B00000-0000-4000-8000-000000001009', '03B00000-0000-4000-8000-000000000503', 'Distributed protocols on every box', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001010', '03B00000-0000-4000-8000-000000000503', 'Centralized control over programmable forwarding', TRUE,  2),
  ('03B00000-0000-4000-8000-000000001011', '03B00000-0000-4000-8000-000000000503', 'Faster CPUs in every router', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001012', '03B00000-0000-4000-8000-000000000503', 'Larger routing tables', FALSE, 4),
  -- Q2 (504): control plane
  ('03B00000-0000-4000-8000-000000001013', '03B00000-0000-4000-8000-000000000504', 'Data plane', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001014', '03B00000-0000-4000-8000-000000000504', 'Management plane', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001015', '03B00000-0000-4000-8000-000000000504', 'Control plane', TRUE,  3),
  ('03B00000-0000-4000-8000-000000001016', '03B00000-0000-4000-8000-000000000504', 'Application plane', FALSE, 4),
  -- Q2 (504)q2: data plane
  ('03B00000-0000-4000-8000-000000001017', '03B00000-0000-4000-8000-000000000505', 'It matches packets against flow tables and applies actions', TRUE,  1),
  ('03B00000-0000-4000-8000-000000001018', '03B00000-0000-4000-8000-000000000505', 'It runs BGP and OSPF for the whole network', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001019', '03B00000-0000-4000-8000-000000000505', 'It only forwards Ethernet broadcasts', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001020', '03B00000-0000-4000-8000-000000000505', 'It encrypts every payload', FALSE, 4),
  -- Q2 (504)q3: flow table
  ('03B00000-0000-4000-8000-000000001021', '03B00000-0000-4000-8000-000000000506', 'The IP address of the controller', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001022', '03B00000-0000-4000-8000-000000000506', 'The VLAN it belongs to', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001023', '03B00000-0000-4000-8000-000000000506', 'The flow table entry with its match fields and actions', TRUE,  3),
  ('03B00000-0000-4000-8000-000000001024', '03B00000-0000-4000-8000-000000000506', 'The MAC address of the next hop', FALSE, 4),
  -- Q3 (507): southbound
  ('03B00000-0000-4000-8000-000000001025', '03B00000-0000-4000-8000-000000000507', 'Northbound interface', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001026', '03B00000-0000-4000-8000-000000000507', 'Southbound interface', TRUE,  2),
  ('03B00000-0000-4000-8000-000000001027', '03B00000-0000-4000-8000-000000000507', 'East-west interface', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001028', '03B00000-0000-4000-8000-000000000507', 'Management interface', FALSE, 4),
  -- Q3 (507)q2: OpenFlow
  ('03B00000-0000-4000-8000-000000001029', '03B00000-0000-4000-8000-000000000508', 'OSPF', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001030', '03B00000-0000-4000-8000-000000000508', 'BGP', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001031', '03B00000-0000-4000-8000-000000000508', 'OpenFlow', TRUE,  3),
  ('03B00000-0000-4000-8000-000000001032', '03B00000-0000-4000-8000-000000000508', 'DHCP', FALSE, 4),
  -- Q3 (507)q3: apps
  ('03B00000-0000-4000-8000-000000001033', '03B00000-0000-4000-8000-000000000509', 'Below the southbound interface', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001034', '03B00000-0000-4000-8000-000000000509', 'Inside the forwarding ASIC', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001035', '03B00000-0000-4000-8000-000000000509', 'Above the controller, using the northbound API', TRUE,  3),
  ('03B00000-0000-4000-8000-000000001036', '03B00000-0000-4000-8000-000000000509', 'On the physical switch line cards', FALSE, 4),
  -- Q4 (510): controller role
  ('03B00000-0000-4000-8000-000000001037', '03B00000-0000-4000-8000-000000000510', 'It keeps a global network view and programs switches', TRUE,  1),
  ('03B00000-0000-4000-8000-000000001038', '03B00000-0000-4000-8000-000000000510', 'It forwards packets at line rate', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001039', '03B00000-0000-4000-8000-000000000510', 'It replaces the DNS server', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001040', '03B00000-0000-4000-8000-000000000510', 'It encrypts all network traffic', FALSE, 4),
  -- Q4 (510)q2: open source controller
  ('03B00000-0000-4000-8000-000000001041', '03B00000-0000-4000-8000-000000000511', 'Cisco IOS', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001042', '03B00000-0000-4000-8000-000000000511', 'Windows Server', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001043', '03B00000-0000-4000-8000-000000000511', 'ONOS', TRUE,  3),
  ('03B00000-0000-4000-8000-000000001044', '03B00000-0000-4000-8000-000000000511', 'macOS Server', FALSE, 4),
  -- Q4 (510)q3: northbound
  ('03B00000-0000-4000-8000-000000001045', '03B00000-0000-4000-8000-000000000512', 'The API used by applications above the controller', TRUE,  1),
  ('03B00000-0000-4000-8000-000000001046', '03B00000-0000-4000-8000-000000000512', 'The port a switch uses to send packets', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001047', '03B00000-0000-4000-8000-000000000512', 'The physical link between two routers', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001048', '03B00000-0000-4000-8000-000000000512', 'The control channel to a legacy switch CLI', FALSE, 4),
  -- Q5 (513): flow entry
  ('03B00000-0000-4000-8000-000000001049', '03B00000-0000-4000-8000-000000000513', 'Match fields, priority, counters, and instructions', TRUE,  1),
  ('03B00000-0000-4000-8000-000000001050', '03B00000-0000-4000-8000-000000000513', 'VLAN tag, MPLS label, and checksum', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001051', '03B00000-0000-4000-8000-000000000513', 'AS number and prefix', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001052', '03B00000-0000-4000-8000-000000000513', 'Only an output port', FALSE, 4),
  -- Q5 (513)q2: packet-in
  ('03B00000-0000-4000-8000-000000001053', '03B00000-0000-4000-8000-000000000514', 'packet-in', TRUE,  1),
  ('03B00000-0000-4000-8000-000000001054', '03B00000-0000-4000-8000-000000000514', 'flow-mod', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001055', '03B00000-0000-4000-8000-000000000514', 'port-status', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001056', '03B00000-0000-4000-8000-000000000514', 'barrier', FALSE, 4),
  -- Q5 (513)q3: flow-mod
  ('03B00000-0000-4000-8000-000000001057', '03B00000-0000-4000-8000-000000000515', 'hello', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001058', '03B00000-0000-4000-8000-000000000515', 'feature-request', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001059', '03B00000-0000-4000-8000-000000000515', 'packet-out', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001060', '03B00000-0000-4000-8000-000000000515', 'flow-mod', TRUE,  4),
  -- Q6 (516): OVS
  ('03B00000-0000-4000-8000-000000001061', '03B00000-0000-4000-8000-000000000516', 'A hardware switch from Cisco', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001062', '03B00000-0000-4000-8000-000000000516', 'An open-source virtual switch supporting OpenFlow', TRUE,  2),
  ('03B00000-0000-4000-8000-000000001063', '03B00000-0000-4000-8000-000000000516', 'A routing daemon only', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001064', '03B00000-0000-4000-8000-000000000516', 'A cloud load balancer', FALSE, 4),
  -- Q6 (516)q2: P4 describes
  ('03B00000-0000-4000-8000-000000001065', '03B00000-0000-4000-8000-000000000517', 'The network operator language of a controller', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001066', '03B00000-0000-4000-8000-000000000517', 'A language for describing data-plane packet pipelines', TRUE,  2),
  ('03B00000-0000-4000-8000-000000001067', '03B00000-0000-4000-8000-000000000517', 'A configuration format like JSON', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001068', '03B00000-0000-4000-8000-000000000517', 'A protocol for the northbound API', FALSE, 4),
  -- Q6 (516)q3: P4 stands for
  ('03B00000-0000-4000-8000-000000001069', '03B00000-0000-4000-8000-000000000518', 'Programming Protocol-independent Packet Processors', TRUE,  1),
  ('03B00000-0000-4000-8000-000000001070', '03B00000-0000-4000-8000-000000000518', 'Protocol Programming for Internet Compatibility', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001071', '03B00000-0000-4000-8000-000000000518', 'Packet Processors for Interoperable Networks', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001072', '03B00000-0000-4000-8000-000000000518', 'Parallel Protocol Instruction Notation', FALSE, 4),
  -- Q7 (519): VXLAN
  ('03B00000-0000-4000-8000-000000001073', '03B00000-0000-4000-8000-000000000519', 'VLAN', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001074', '03B00000-0000-4000-8000-000000000519', 'VXLAN', TRUE,  2),
  ('03B00000-0000-4000-8000-000000001075', '03B00000-0000-4000-8000-000000000519', 'MPLS', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001076', '03B00000-0000-4000-8000-000000000519', 'STP', FALSE, 4),
  -- Q7 (519)q2: VTEP
  ('03B00000-0000-4000-8000-000000001077', '03B00000-0000-4000-8000-000000000520', 'VTEP', TRUE,  1),
  ('03B00000-0000-4000-8000-000000001078', '03B00000-0000-4000-8000-000000000520', 'VNI', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001079', '03B00000-0000-4000-8000-000000000520', 'DHCP server', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001080', '03B00000-0000-4000-8000-000000000520', 'DNS resolver', FALSE, 4),
  -- Q7 (519)q3: overlays
  ('03B00000-0000-4000-8000-000000001081', '03B00000-0000-4000-8000-000000000521', 'Tenant isolation independent of physical topology', TRUE,  1),
  ('03B00000-0000-4000-8000-000000001082', '03B00000-0000-4000-8000-000000000521', 'Faster CPU cores', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001083', '03B00000-0000-4000-8000-000000000521', 'Bigger routing tables', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001084', '03B00000-0000-4000-8000-000000000521', 'Windows compatibility', FALSE, 4),
  -- Q8 (522): SD-WAN purpose
  ('03B00000-0000-4000-8000-000000001085', '03B00000-0000-4000-8000-000000000522', 'To replace Ethernet entirely', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001086', '03B00000-0000-4000-8000-000000000522', 'To centrally manage traffic over any WAN transport', TRUE,  2),
  ('03B00000-0000-4000-8000-000000001087', '03B00000-0000-4000-8000-000000000522', 'To increase raw link speed', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001088', '03B00000-0000-4000-8000-000000000522', 'To remove the need for IP addressing', FALSE, 4),
  -- Q8 (522)q2: app-aware
  ('03B00000-0000-4000-8000-000000001089', '03B00000-0000-4000-8000-000000000523', 'Manual static routes per box', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001090', '03B00000-0000-4000-8000-000000000523', 'Application-aware dynamic path selection', TRUE,  2),
  ('03B00000-0000-4000-8000-000000001091', '03B00000-0000-4000-8000-000000000523', 'Only one active link', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001092', '03B00000-0000-4000-8000-000000000523', 'No encryption support', FALSE, 4),
  -- Q8 (522)q3: tunnels
  ('03B00000-0000-4000-8000-000000001093', '03B00000-0000-4000-8000-000000000524', 'Plain text GRE tunnels', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001094', '03B00000-0000-4000-8000-000000000524', 'Encrypted tunnels such as IPsec', TRUE,  2),
  ('03B00000-0000-4000-8000-000000001095', '03B00000-0000-4000-8000-000000000524', 'Raw Ethernet broadcast', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001096', '03B00000-0000-4000-8000-000000000524', 'It does not protect anything', FALSE, 4),
  -- Q9 (525): NFV
  ('03B00000-0000-4000-8000-000000001097', '03B00000-0000-4000-8000-000000000525', 'Running network functions as software on commodity servers', TRUE,  1),
  ('03B00000-0000-4000-8000-000000001098', '03B00000-0000-4000-8000-000000000525', 'Moving functions into custom ASICs', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001099', '03B00000-0000-4000-8000-000000000525', 'Using only proprietary appliances', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001100', '03B00000-0000-4000-8000-000000000525', 'Eliminating all firewalls', FALSE, 4),
  -- Q9 (525)q2: VNF
  ('03B00000-0000-4000-8000-000000001101', '03B00000-0000-4000-8000-000000000526', 'A physical router card', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001102', '03B00000-0000-4000-8000-000000000526', 'A network function packaged as a VM or container', TRUE,  2),
  ('03B00000-0000-4000-8000-000000001103', '03B00000-0000-4000-8000-000000000526', 'A type of fiber optic cable', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001104', '03B00000-0000-4000-8000-000000000526', 'A management protocol', FALSE, 4),
  -- Q9 (525)q3: white-box
  ('03B00000-0000-4000-8000-000000001105', '03B00000-0000-4000-8000-000000000527', 'Hardware and software from one single vendor', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001106', '03B00000-0000-4000-8000-000000000527', 'Commodity hardware with a separate network OS', TRUE,  2),
  ('03B00000-0000-4000-8000-000000001107', '03B00000-0000-4000-8000-000000000527', 'Fiber instead of copper cabling', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001108', '03B00000-0000-4000-8000-000000000527', 'Only virtual switches', FALSE, 4),
  -- Q9 (525)q4: IBN
  ('03B00000-0000-4000-8000-000000001109', '03B00000-0000-4000-8000-000000000528', 'Operators declare intent and the system derives and enforces policy', TRUE,  1),
  ('03B00000-0000-4000-8000-000000001110', '03B00000-0000-4000-8000-000000000528', 'Operators type CLI commands on every device', FALSE, 2),
  ('03B00000-0000-4000-8000-000000001111', '03B00000-0000-4000-8000-000000000528', 'The network monitors nothing', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001112', '03B00000-0000-4000-8000-000000000528', 'Intent is a marketing term with no function', FALSE, 4),
  -- Q9 (525)q5: resilience
  ('03B00000-0000-4000-8000-000000001113', '03B00000-0000-4000-8000-000000000529', 'A single controller with one uplink', FALSE, 1),
  ('03B00000-0000-4000-8000-000000001114', '03B00000-0000-4000-8000-000000000529', 'Clustered controllers and redundant southbound links', TRUE,  2),
  ('03B00000-0000-4000-8000-000000001115', '03B00000-0000-4000-8000-000000000529', 'No controller and manual routing', FALSE, 3),
  ('03B00000-0000-4000-8000-000000001116', '03B00000-0000-4000-8000-000000000529', 'Broadcast-only networking', FALSE, 4)
ON CONFLICT (id) DO NOTHING;