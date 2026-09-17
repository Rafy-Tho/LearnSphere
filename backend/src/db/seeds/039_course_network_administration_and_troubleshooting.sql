-- ============================================================================
-- SEED 039: Complete course — "Network Administration & Troubleshooting"
-- ----------------------------------------------------------------------------
-- Instructor : Sarah Chen        (10000000-0000-4000-8000-000000000001)
-- Category   : Networking        (20000000-0000-4000-8000-000000000006)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Network Administration Fundamentals → C1 The Network Administrator's Role · C2 IP Planning & Addressing
--   M2 Core Network Services          → C3 DNS & Client Configuration · C4 Switching & VLAN Administration
--   M3 Routing, Security & Wireless   → C5 Routing & Route Tables · C6 Firewalls & Access Rules
--   M4 Wireless & Monitoring          → C7 Wireless Network Administration · C8 Monitoring & Log Management
--   M5 Troubleshooting & Capstone     → C9 Troubleshooting Methodology · C10 Capstone: Office Network Project
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
  '02700000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '20000000-0000-4000-8000-000000000006',
  'Network Administration & Troubleshooting',
  'network-administration-and-troubleshooting',
  'Operate a network like a professional. Master planning and IP addressing, DNS, switching, routing, firewalls, Wi-Fi, and monitoring — then apply a systematic OSI-based methodology to troubleshoot real faults and deliver a finished office network.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  37
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02700000-0000-4000-8000-000000000011', '02700000-0000-4000-8000-000000000001', 'Describe the duties, tools, and operational processes of a network administrator.',         1),
  ('02700000-0000-4000-8000-000000000012', '02700000-0000-4000-8000-000000000001', 'Design IPv4 subnets and manage static and DHCP address assignment.',                        2),
  ('02700000-0000-4000-8000-000000000013', '02700000-0000-4000-8000-000000000001', 'Configure and administer DNS, switching, VLANs, routing, firewalls, and Wi-Fi.',           3),
  ('02700000-0000-4000-8000-000000000014', '02700000-0000-4000-8000-000000000001', 'Monitor network health and interpret logs to detect and diagnose problems.',               4),
  ('02700000-0000-4000-8000-000000000015', '02700000-0000-4000-8000-000000000001', 'Apply a systematic OSI-based methodology to resolve network faults end to end.',            5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02700000-0000-4000-8000-000000000101', '02700000-0000-4000-8000-000000000001', 1, 'Network Administration Fundamentals', 'The admin role, environments, and clean IP planning.',        'PUBLISHED'),
  ('02700000-0000-4000-8000-000000000102', '02700000-0000-4000-8000-000000000001', 2, 'Core Network Services',             'Reliable DNS, switching, and VLANs.',                        'PUBLISHED'),
  ('02700000-0000-4000-8000-000000000103', '02700000-0000-4000-8000-000000000001', 3, 'Routing, Security & Wireless',      'Predictable routing and a strong enforcement edge.',         'PUBLISHED'),
  ('02700000-0000-4000-8000-000000000104', '02700000-0000-4000-8000-000000000001', 4, 'Wireless & Monitoring',            'Plan Wi-Fi and keep watch over network health.',             'PUBLISHED'),
  ('02700000-0000-4000-8000-000000000105', '02700000-0000-4000-8000-000000000001', 5, 'Troubleshooting & Capstone',       'Fix faults methodically and deliver a finished network.',    'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02700000-0000-4000-8000-000000000201', '02700000-0000-4000-8000-000000000101', 1, 'The Network Administrator''s Role', 'Roles, duties, and the operational processes that keep networks healthy.', 'PUBLISHED'),
  ('02700000-0000-4000-8000-000000000202', '02700000-0000-4000-8000-000000000101', 2, 'IP Planning & Addressing',          'Design subnets and plan address assignment.',                          'PUBLISHED'),
  ('02700000-0000-4000-8000-000000000203', '02700000-0000-4000-8000-000000000102', 1, 'DNS & Client Configuration',        'Make name resolution and client networking reliable.',                 'PUBLISHED'),
  ('02700000-0000-4000-8000-000000000204', '02700000-0000-4000-8000-000000000102', 2, 'Switching & VLAN Administration',   'Isolate and organize traffic with VLANs.',                             'PUBLISHED'),
  ('02700000-0000-4000-8000-000000000205', '02700000-0000-4000-8000-000000000103', 1, 'Routing & Route Tables',            'Forward traffic between networks predictably.',                         'PUBLISHED'),
  ('02700000-0000-4000-8000-000000000206', '02700000-0000-4000-8000-000000000103', 2, 'Firewalls & Access Rules',          'Enforce security policy at the network edge.',                         'PUBLISHED'),
  ('02700000-0000-4000-8000-000000000207', '02700000-0000-4000-8000-000000000104', 1, 'Wireless Network Administration',   'Plan, secure, and operate Wi-Fi.',                                     'PUBLISHED'),
  ('02700000-0000-4000-8000-000000000208', '02700000-0000-4000-8000-000000000104', 2, 'Monitoring & Log Management',       'See network health and learn from logs.',                              'PUBLISHED'),
  ('02700000-0000-4000-8000-000000000209', '02700000-0000-4000-8000-000000000105', 1, 'Troubleshooting Methodology',       'A systematic, layer-based approach to fault resolution.',               'PUBLISHED'),
  ('02700000-0000-4000-8000-000000000210', '02700000-0000-4000-8000-000000000105', 2, 'Capstone: Office Network Project',  'Design, validate, and hand over a real office network.',                'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02700000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02700000-0000-4000-8000-000000000301', '02700000-0000-4000-8000-000000000201', 1, 'The Network Administrator''s Role',   'Learn the core duties, tools, and processes of a network administrator.',  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02700000-0000-4000-8000-000000000302', '02700000-0000-4000-8000-000000000201', 2, 'Environments You Will Manage',        'From small offices to hybrid clouds, know your gear and access methods.',  'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02700000-0000-4000-8000-000000000303', '02700000-0000-4000-8000-000000000201', 3, 'Admin Role Quiz',                     'Check your understanding of the administrator''s role and duties.',        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02700000-0000-4000-8000-000000000304', '02700000-0000-4000-8000-000000000202', 1, 'IP Addressing & Subnet Planning',     'Design IPv4 subnets that scale cleanly.',                                 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02700000-0000-4000-8000-000000000305', '02700000-0000-4000-8000-000000000202', 2, 'Static Assignments & DHCP Management', 'Balance fixed addresses with dynamic IP allocation.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02700000-0000-4000-8000-000000000306', '02700000-0000-4000-8000-000000000202', 3, 'IP Planning Quiz',                    'Check your understanding of subnet and address planning.',                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02700000-0000-4000-8000-000000000307', '02700000-0000-4000-8000-000000000203', 1, 'DNS: How Names Become Addresses',     'Understand zones, records, and the resolution path.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02700000-0000-4000-8000-000000000308', '02700000-0000-4000-8000-000000000203', 2, 'Client Configuration & DNS Integration','Configure servers and clients for reliable name resolution.',             'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02700000-0000-4000-8000-000000000309', '02700000-0000-4000-8000-000000000203', 3, 'DNS Quiz',                           'Verify your DNS knowledge and record types.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02700000-0000-4000-8000-000000000310', '02700000-0000-4000-8000-000000000204', 1, 'Switching Fundamentals & VLAN Design', 'Forward frames and segment traffic with VLANs.',                         'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02700000-0000-4000-8000-000000000311', '02700000-0000-4000-8000-000000000204', 2, 'Administering VLANs',                'Create VLANs, configure trunks, and route between them.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02700000-0000-4000-8000-000000000312', '02700000-0000-4000-8000-000000000204', 3, 'Switching & VLAN Quiz',              'Check switching and VLAN administration concepts.',                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02700000-0000-4000-8000-000000000313', '02700000-0000-4000-8000-000000000205', 1, 'Routing Concepts & Route Tables',    'Understand how routers choose paths.',                                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02700000-0000-4000-8000-000000000314', '02700000-0000-4000-8000-000000000205', 2, 'Configuring & Maintaining Routes',   'Deploy static and dynamic routes and keep them healthy.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02700000-0000-4000-8000-000000000315', '02700000-0000-4000-8000-000000000205', 3, 'Routing Quiz',                       'Test routing tables, routes, and path selection.',                        'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02700000-0000-4000-8000-000000000316', '02700000-0000-4000-8000-000000000206', 1, 'Firewall Fundamentals & Rule Design','Base your security policy on zones and deny-by-default.',                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02700000-0000-4000-8000-000000000317', '02700000-0000-4000-8000-000000000206', 2, 'Managing Firewall Rule Sets',        'Build, order, and audit NAT and filter rules.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02700000-0000-4000-8000-000000000318', '02700000-0000-4000-8000-000000000206', 3, 'Firewall Quiz',                      'Verify firewall rules, zones, and NAT.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02700000-0000-4000-8000-000000000319', '02700000-0000-4000-8000-000000000207', 1, 'Wireless Networking & Administration','Plan Wi-Fi coverage, channels, and management.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02700000-0000-4000-8000-000000000320', '02700000-0000-4000-8000-000000000207', 2, 'Securing & Managing Wi-Fi Networks', 'Protect wireless access with WPA3, VLANs, and 802.1X.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02700000-0000-4000-8000-000000000321', '02700000-0000-4000-8000-000000000207', 3, 'Wi-Fi Quiz',                         'Check wireless planning and security fundamentals.',                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02700000-0000-4000-8000-000000000322', '02700000-0000-4000-8000-000000000208', 1, 'Monitoring Network Health',          'Track utilization, errors, and baselines with SNMP.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02700000-0000-4000-8000-000000000323', '02700000-0000-4000-8000-000000000208', 2, 'Log Management & Analysis',          'Collect, store, and interpret network logs.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02700000-0000-4000-8000-000000000324', '02700000-0000-4000-8000-000000000208', 3, 'Monitoring & Logs Quiz',             'Check monitoring metrics and syslog severity.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02700000-0000-4000-8000-000000000325', '02700000-0000-4000-8000-000000000209', 1, 'Systematic Troubleshooting (OSI)',   'Apply a methodical layer-based process to failures.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02700000-0000-4000-8000-000000000326', '02700000-0000-4000-8000-000000000210', 1, 'Capstone: Office Network Design & Build','Plan and implement the office network project.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02700000-0000-4000-8000-000000000327', '02700000-0000-4000-8000-000000000210', 2, 'Capstone: Validation, Documentation & Handover','Verify, document, and hand over the network.',                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02700000-0000-4000-8000-000000000328', '02700000-0000-4000-8000-000000000210', 3, 'Final Assessment',                   'Prove what you learned across the whole course.',                         'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02700000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02700000-0000-4000-8000-000000000401',
  '02700000-0000-4000-8000-000000000301',
  1,
  'The Network Administrator''s Role',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Network Administrator's Role</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Network Administrator&rsquo;s Role</h1>
  <p>The network administrator keeps the infrastructure available, fast, and secure. Job titles vary &mdash; <span class="ic">network admin</span>, <span class="ic">network engineer</span>, <span class="ic">IT coordinator</span> &mdash; but the work is consistent: networks are designed, built, operated, and repaired by people, and those people follow repeatable routines.</p>
  <h2>Core duties</h2>
  <ul>
    <li><strong>Plan</strong> &mdash; capacity, IP addressing, topology, and purchases.</li>
    <li><strong>Deploy</strong> &mdash; switches, routers, firewalls, access points, and cabling.</li>
    <li><strong>Operate</strong> &mdash; monitor health, back up configurations, update firmware.</li>
    <li><strong>Secure</strong> &mdash; firewall rules, access control, and wireless security.</li>
    <li><strong>Troubleshoot</strong> &mdash; resolve incidents quickly and methodically.</li>
  </ul>
  <h2>Responsibilities at a glance</h2>
  <table>
    <tr><th>Area</th><th>Typical responsibilities</th><th>Common tools</th></tr>
    <tr><td>Addressing</td><td>plan subnets, manage static and DHCP</td><td><span class="ic">ipcalc</span>, DHCP console</td></tr>
    <tr><td>DNS</td><td>zones, records, forwarding</td><td><span class="ic">dig</span>, <span class="ic">nslookup</span></td></tr>
    <tr><td>Switching</td><td>VLANs, trunks, port configuration</td><td>switch CLI, SNMP</td></tr>
    <tr><td>Routing</td><td>route tables, gateways</td><td>ping, traceroute, route tables</td></tr>
    <tr><td>Security</td><td>firewall rules, Wi-Fi authentication</td><td>firewall UI, RADIUS</td></tr>
    <tr><td>Monitoring</td><td>uptime, capacity, logs</td><td>SNMP collectors, syslog</td></tr>
  </table>
  <h2>Operational processes</h2>
  <p>Three processes keep changes safe and knowledge shared:</p>
  <ul>
    <li><strong>Change management</strong> &mdash; a formal record of every change: why it is needed, what will be done, and how to roll back.</li>
    <li><strong>Incident management</strong> &mdash; tickets that capture the symptom, diagnosis, fix, and follow-up.</li>
    <li><strong>Documentation</strong> &mdash; diagrams, an IP plan, device inventory, and passwords in a vault.</li>
  </ul>
  <div class="callout">
    <strong>Documentation is part of the job</strong>
    <p>The network you administer today will be maintained by someone else tomorrow. Good records are the difference between a two-minute fix and a two-day hunt.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Build the habit</strong>
    <p>Before every change, write down the rollback. If the change breaks something, the rollback lets you restore service before users even notice.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000402',
  '02700000-0000-4000-8000-000000000302',
  1,
  'Environments You Will Manage',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Environments You Will Manage</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Environments You Will Manage</h1>
  <p>Networks come in all sizes. The techniques in this course apply everywhere, but the scale, gear, and priorities change with the environment.</p>
  <h2>Where admins work</h2>
  <ul>
    <li><strong>Small business</strong> &mdash; one firewall, one or two switches, a few access points, a handful of servers.</li>
    <li><strong>Campus</strong> &mdash; many floors and buildings, core and access switches, WAN links, and hundreds of users.</li>
    <li><strong>Data center</strong> &mdash; dense switching, redundant paths, and strict rack and cable standards.</li>
    <li><strong>Hybrid cloud</strong> &mdash; on-premises networks connected to cloud environments with VPNs.</li>
  </ul>
  <h2>Devices you will touch</h2>
  <table>
    <tr><th>Device</th><th>Layer</th><th>What it does</th></tr>
    <tr><td>Switch</td><td>2 (or 3)</td><td>forwards frames between hosts; many enterprise switches also route</td></tr>
    <tr><td>Router</td><td>3</td><td>forwards packets between networks</td></tr>
    <tr><td>Firewall</td><td>3-7</td><td>filters and inspects traffic, performs NAT</td></tr>
    <tr><td>Access point</td><td>2</td><td>bridges wireless clients into the wired LAN</td></tr>
    <tr><td>Gateway / modem</td><td>3</td><td>connects your network to the ISP</td></tr>
  </table>
  <h2>Accessing devices</h2>
  <ul>
    <li><strong>Out-of-band</strong> &mdash; console or serial connection used when the network itself is down.</li>
    <li><strong>In-band</strong> &mdash; SSH and HTTPS management interfaces, plus SNMP for monitoring.</li>
  </ul>
  <div class="callout">
    <strong>Management hygiene</strong>
    <p>Give every device a hostname, a management address, NTP, logging, and strong admin credentials. Disable services you do not use.</p>
  </div>
  <div class="callout callout-info">
    <strong>Dedicated management VLAN</strong>
    <p>Put device management on its own VLAN so a compromised user device cannot reach switch and router admin interfaces directly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000403',
  '02700000-0000-4000-8000-000000000304',
  1,
  'IP Addressing & Subnet Planning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IP Addressing & Subnet Planning</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>IP Addressing &amp; Subnet Planning</h1>
  <p>Every interface on the network needs an address that fits a plan. Good planning prevents renumbering later &mdash; and renumbering is one of the most painful jobs in networking.</p>
  <h2>IPv4 refresher</h2>
  <p>An IPv4 address is 32 bits, written as four octets: <span class="ic">192.168.10.0</span>. The address has a <strong>network part</strong> and a <strong>host part</strong>. The subnet mask (or CIDR prefix) marks the boundary: <span class="ic">/24</span> means the first 24 bits are the network.</p>
  <h2>Common subnet sizes</h2>
  <table>
    <tr><th>Prefix</th><th>Mask</th><th>Addresses</th><th>Usable hosts</th></tr>
    <tr><td>/24</td><td>255.255.255.0</td><td>256</td><td>254</td></tr>
    <tr><td>/25</td><td>255.255.255.128</td><td>128</td><td>126</td></tr>
    <tr><td>/26</td><td>255.255.255.192</td><td>64</td><td>62</td></tr>
    <tr><td>/27</td><td>255.255.255.224</td><td>32</td><td>30</td></tr>
    <tr><td>/28</td><td>255.255.255.240</td><td>16</td><td>14</td></tr>
    <tr><td>/29</td><td>255.255.255.248</td><td>8</td><td>6</td></tr>
  </table>
  <h2>Addresses you can never assign</h2>
  <ul>
    <li><strong>Network address</strong> &mdash; host bits all zero; identifies the subnet.</li>
    <li><strong>Broadcast address</strong> &mdash; host bits all one; reaches every host.</li>
    <li><strong>Gateway</strong> &mdash; usually the first usable address; the router exit.</li>
  </ul>
  <h2>Private ranges (RFC 1918)</h2>
  <ul>
    <li><span class="ic">10.0.0.0/8</span> &mdash; very large networks</li>
    <li><span class="ic">172.16.0.0/12</span> &mdash; medium networks</li>
    <li><span class="ic">192.168.0.0/16</span> &mdash; small networks and offices</li>
  </ul>
  <h2>Planning example</h2>
  <table>
    <tr><th>Subnet</th><th>Purpose</th><th>Usable hosts</th></tr>
    <tr><td>192.168.10.0/24</td><td>Finance workstations</td><td>254</td></tr>
    <tr><td>192.168.20.0/24</td><td>Engineering workstations</td><td>254</td></tr>
    <tr><td>192.168.30.0/24</td><td>Marketing workstations</td><td>254</td></tr>
    <tr><td>192.168.100.0/24</td><td>Management VLAN</td><td>254</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Room to grow</strong>
    <p>Give departments a /24 even if they need only 20 addresses today. Renumbering later is far more expensive than reserving a subnet now.</p>
  </div>
  <div class="callout callout-info">
    <strong>Write it down</strong>
    <p>Keep the plan in a spreadsheet or an IPAM (IP address management) tool. Every address you assign should be findable later.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000404',
  '02700000-0000-4000-8000-000000000305',
  1,
  'Static Assignments & DHCP Management',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Static Assignments & DHCP Management</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Static Assignments &amp; DHCP Management</h1>
  <p>Addresses are either assigned once, by hand (<strong>static</strong>), or handed out automatically by DHCP. A healthy network uses both &mdash; in the right places.</p>
  <h2>Static or DHCP?</h2>
  <table>
    <tr><th>Device type</th><th>Method</th><th>Why</th></tr>
    <tr><td>Servers, switches, routers, printers</td><td>Static (or reservation)</td><td>others must find them reliably</td></tr>
    <tr><td>Workstations</td><td>DHCP</td><td>easy to move, renumber, manage</td></tr>
    <tr><td>Guest devices</td><td>DHCP</td><td>temporary and numerous</td></tr>
  </table>
  <h2>How DHCP works</h2>
  <pre class="code-block">1. Client sends DHCPDISCOVER  (broadcast: "is there a DHCP server?")
2. Server replies DHCPOFFER    ("use this address")
3. Client requests DHCPREQUEST (broadcast: "I accept")
4. Server confirms DHCPACK     ("done - here are options")</pre>
  <h2>Scope components</h2>
  <ul>
    <li><strong>Pool</strong> &mdash; the range DHCP may assign.</li>
    <li><strong>Exclusions</strong> &mdash; addresses withheld from the pool (static hosts).</li>
    <li><strong>Reservations</strong> &mdash; a specific MAC always gets a specific IP.</li>
    <li><strong>Options</strong> &mdash; extra settings sent to clients.</li>
  </ul>
  <h2>Key DHCP options</h2>
  <table>
    <tr><th>Option</th><th>Meaning</th></tr>
    <tr><td>3</td><td>Router &mdash; the default gateway</td></tr>
    <tr><td>6</td><td>DNS servers</td></tr>
    <tr><td>15</td><td>Domain name / search suffix</td></tr>
    <tr><td>42</td><td>NTP time server</td></tr>
    <tr><td>51</td><td>Lease time</td></tr>
  </table>
  <h2>Leases</h2>
  <p>An address is borrowed, not owned. The client tries to renew at 50 percent of the lease (T1) and rebind at roughly 87 percent (T2) if the original server is unreachable.</p>
  <div class="callout">
    <strong>169.254.x.x is a clue</strong>
    <p>Clients that cannot reach a DHCP server self-assign an Automatic Private IP Address in the 169.254.0.0/16 range. Seeing one usually means DHCP is unreachable &mdash; check the server, the scope, and the network path.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Verify quickly</strong>
    <p><span class="ic">ipconfig /all</span> on Windows or <span class="ic">ip addr</span> on Linux shows the lease, the gateway, and the DNS servers. Compare what the client actually got with what you designed.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000405',
  '02700000-0000-4000-8000-000000000307',
  1,
  'DNS: How Names Become Addresses',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DNS: How Names Become Addresses</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>DNS: How Names Become Addresses</h1>
  <p>Nobody wants to memorize 192.168.10.42. The Domain Name System (DNS) turns names into addresses &mdash; and it does the reverse too.</p>
  <h2>The hierarchy</h2>
  <p>Names are read right to left: <span class="ic">www.example.com</span> sits under <span class="ic">example.com</span>, which sits under the <span class="ic">.com</span> top-level domain, which sits under the <span class="ic">root</span>. Each level is served by devices that answer for part of the tree.</p>
  <h2>Key terms</h2>
  <ul>
    <li><strong>Resolver</strong> &mdash; the client-side code that asks questions on the user&rsquo;s behalf.</li>
    <li><strong>Recursive resolver</strong> &mdash; a server that does the full walk and caches answers.</li>
    <li><strong>Authoritative server</strong> &mdash; holds the actual zone data and answers authoritatively.</li>
    <li><strong>Zone</strong> &mdash; the set of records for a domain or subdomain.</li>
  </ul>
  <h2>Common record types</h2>
  <table>
    <tr><th>Type</th><th>Purpose</th></tr>
    <tr><td>A</td><td>hostname to IPv4 address</td></tr>
    <tr><td>AAAA</td><td>hostname to IPv6 address</td></tr>
    <tr><td>CNAME</td><td>alias pointing at another name</td></tr>
    <tr><td>MX</td><td>where mail for the domain is delivered</td></tr>
    <tr><td>NS</td><td>which servers are authoritative</td></tr>
    <tr><td>PTR</td><td>reverse &mdash; address to name</td></tr>
    <tr><td>SRV</td><td>locates services (such as SIP)</td></tr>
  </table>
  <h2>Forward and reverse</h2>
  <p>A <strong>forward zone</strong> answers name-to-address queries. A <strong>reverse zone</strong> (in-addr.arpa) answers address-to-name queries, which is how mail servers and diagnostic tools identify peers.</p>
  <div class="callout callout-info">
    <strong>The lookup walk</strong>
    <p>Your workstation asks the recursive resolver for <span class="ic">www.example.com</span>. The resolver follows referrals from root to <span class="ic">.com</span> to the authoritative server for <span class="ic">example.com</span>, then caches the answer so the next query is fast.</p>
  </div>
  <div class="callout callout-tip">
    <strong>TTL matters</strong>
    <p>Short TTLs (300 seconds) make planned changes appear quickly; long TTLs (86400) reduce query load. Lower the TTL before a change and raise it afterwards.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000406',
  '02700000-0000-4000-8000-000000000308',
  1,
  'Client Configuration & DNS Integration',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Client Configuration & DNS Integration</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Client Configuration &amp; DNS Integration</h1>
  <p>Address records are only half the job. Servers must be built correctly and clients must know where to query &mdash; inside the network, results should point at internal resources.</p>
  <h2>Server configuration</h2>
  <ul>
    <li>Create a <strong>forward zone</strong> for your domain (for example <span class="ic">example.local</span>) and add A records for internal hosts.</li>
    <li>Create a <strong>reverse zone</strong> so address queries resolve back to names.</li>
    <li>Configure <strong>forwarders</strong> to upstream servers for queries you cannot answer.</li>
    <li>Keep the public root hints: without them, recursion cannot start.</li>
  </ul>
  <h2>DHCP and DNS together</h2>
  <ul>
    <li>Hand out the internal DNS server via <strong>DHCP option 6</strong> so every client queries locally.</li>
    <li>Keep records for servers in the DNS zone, not in scattered spreadsheets.</li>
    <li>Use the same names in DHCP reservations and DNS records for printers and servers.</li>
  </ul>
  <h2>Client-side basics</h2>
  <pre class="code-block"># Linux (/etc/resolv.conf or systemd-resolved)
nameserver 192.168.10.5
search example.local

# Windows
netsh interface ip set dns "Ethernet" static 192.168.10.5</pre>
  <h2>Split-horizon DNS</h2>
  <p>One name can answer differently inside and outside the network. The internal server may resolve <span class="ic">mail.example.com</span> to an internal address while the public view answers with the external address. This keeps internal traffic internal.</p>
  <div class="callout">
    <strong>Test from a real client</strong>
    <p>Use tools the way clients do: <span class="ic">nslookup</span> or <span class="ic">dig</span> pointed at your server, from a workstation on the LAN. What your server thinks matters less than what clients see.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Verify the whole ring</strong>
    <p>Resolve forward and reverse: <span class="ic">dig www.example.local A</span> and <span class="ic">dig -x 192.168.10.42</span>. Missing PTR records trigger long timeouts in some tools.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000407',
  '02700000-0000-4000-8000-000000000310',
  1,
  'Switching Fundamentals & VLAN Design',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Switching Fundamentals & VLAN Design</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Switching Fundamentals &amp; VLAN Design</h1>
  <p>Switches connect the cables and forward the traffic. VLANs (Virtual Local Area Networks) split one switch into several separate broadcast domains.</p>
  <h2>How a switch forwards</h2>
  <ul>
    <li>The switch <strong>learns</strong> which MAC address lives on which port.</li>
    <li>Known unicast frames go only to the destination port.</li>
    <li>Unknown unicast and broadcasts are <strong>flooded</strong> to every port in the VLAN.</li>
  </ul>
  <h2>Why VLANs</h2>
  <ul>
    <li><strong>Security</strong> &mdash; separate departments, guests, and management traffic.</li>
    <li><strong>Performance</strong> &mdash; smaller broadcast domains.</li>
    <li><strong>Predictability</strong> &mdash; traffic is isolated and firewalls can enforce rules between VLANs.</li>
  </ul>
  <h2>How VLANs travel between switches</h2>
  <p>Between switches, a <strong>trunk</strong> carries many VLANs at once. IEEE <strong>802.1Q</strong> adds a four-byte tag with the VLAN ID to each frame. Ports are usually configured in one of two modes:</p>
  <table>
    <tr><th>Port type</th><th>Traffic carried</th><th>Typical use</th></tr>
    <tr><td>Access</td><td>one untagged VLAN</td><td>workstations, printers</td></tr>
    <tr><td>Trunk</td><td>many tagged VLANs</td><td>switch-to-switch, switch-to-router</td></tr>
  </table>
  <h2>Design rules of thumb</h2>
  <ul>
    <li>Give each department or function its own VLAN.</li>
    <li>Put device <strong>management</strong> on its own VLAN.</li>
    <li>Keep <strong>guest</strong> traffic isolated and never route it internally.</li>
    <li>Reserve a few VLAN numbers for future use.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Voice deserves a VLAN</strong>
    <p>VoIP phones work best on their own VLAN, often with quality-of-service markings. The phone tags its own voice traffic while the PC behind it stays on the data VLAN.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Keep VLAN numbers tidy</strong>
    <p>A simple convention &mdash; 10 data, 20 voice, 30 management, 40 guest &mdash; makes trunks and firewall rules readable and reviewable.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000408',
  '02700000-0000-4000-8000-000000000311',
  1,
  'Administering VLANs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Administering VLANs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Administering VLANs</h1>
  <p>Configuring VLANs means three jobs: create them, assign ports, and enable routing between them. Here is the pattern in vendor command style &mdash; the concepts apply everywhere.</p>
  <h2>1. Create the VLAN and assign an access port</h2>
  <pre class="code-block">vlan 10
 name DATA
 exit
interface GigabitEthernet0/1
 switchport mode access
 switchport access vlan 10</pre>
  <h2>2. Build the trunk to the next switch</h2>
  <pre class="code-block">interface GigabitEthernet0/24
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30,40</pre>
  <div class="callout">
    <strong>Trim the trunk</strong>
    <p>Only list the VLANs you actually need. A trunk that allows every VLAN spreads broadcasts everywhere and leaks management traffic.</p>
  </div>
  <h2>3. Route between VLANs</h2>
  <p>Each VLAN needs a gateway. Two common designs:</p>
  <ul>
    <li><strong>Router on a stick</strong> &mdash; one router interface with <span class="ic">802.1Q</span> subinterfaces, one per VLAN.</li>
    <li><strong>Layer 3 switch</strong> &mdash; a switched virtual interface (SVI) per VLAN with <span class="ic">ip routing</span> enabled.</li>
  </ul>
  <h2>Verify and troubleshoot</h2>
  <ul>
    <li><span class="ic">show vlan brief</span> &mdash; which VLANs exist and which ports use them.</li>
    <li><span class="ic">show interfaces trunk</span> &mdash; what each trunk carries.</li>
    <li>Ping the gateway from a host in each VLAN, then ping across VLANs.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Common VLAN bugs</strong>
    <p>An access port stuck in the default VLAN, a trunk missing a VLAN from the allowed list, or a native-VLAN mismatch between switches. Check the two ends of every link when things look odd.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000409',
  '02700000-0000-4000-8000-000000000313',
  1,
  'Routing Concepts & Route Tables',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Routing Concepts & Route Tables</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Routing Concepts &amp; Route Tables</h1>
  <p>A router moves packets <em>between</em> networks. To know where each packet goes, it looks up the destination in a <strong>route table</strong>.</p>
  <h2>Anatomy of a route</h2>
  <table>
    <tr><th>Column</th><th>Example</th><th>Meaning</th></tr>
    <tr><td>Destination</td><td>192.168.50.0/24</td><td>the network being reached</td></tr>
    <tr><td>Next hop</td><td>10.0.0.2</td><td>the next router to forward to</td></tr>
    <tr><td>Interface</td><td>GigabitEthernet0/1</td><td>where to send the packet</td></tr>
    <tr><td>Protocol</td><td>C / S / O</td><td>connected, static, or OSPF</td></tr>
    <tr><td>Metric / distance</td><td>1 / 110</td><td>preference between competing routes</td></tr>
  </table>
  <h2>Three kinds of route</h2>
  <ul>
    <li><strong>Directly connected</strong> &mdash; learned because an interface is configured and up.</li>
    <li><strong>Static</strong> &mdash; typed by an administrator; predictable and easy to audit.</li>
    <li><strong>Dynamic</strong> &mdash; learned from routing protocols as the network changes.</li>
  </ul>
  <h2>The default route</h2>
  <p><span class="ic">0.0.0.0/0</span> matches everything. It is the last resort &mdash; the route that catches traffic no more specific entry matched, which is why most edge routers point it at the ISP gateway.</p>
  <h2>Choosing between routes</h2>
  <p>When several routes match a destination, the router applies <strong>longest prefix match</strong>: the most specific route wins. Ties are broken by administrative distance (protocol preference), then metric.</p>
  <div class="callout callout-tip">
    <strong>Read the table</strong>
    <p>The answer to &ldquo;why does this traffic go that way?&rdquo; is almost always in the route table. Check the destination, next hop, and protocol before touching anything else.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000410',
  '02700000-0000-4000-8000-000000000314',
  1,
  'Configuring & Maintaining Routes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Configuring & Maintaining Routes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Configuring &amp; Maintaining Routes</h1>
  <p>Now you put the concepts to work: add static routes, choose a dynamic protocol when the network gets complex, and keep the table clean.</p>
  <h2>Static routes</h2>
  <pre class="code-block"># static route to the remote office LAN via the next-hop router
ip route 192.168.50.0 255.255.255.0 10.0.0.2
# default route toward the ISP
ip route 0.0.0.0 0.0.0.0 203.0.113.1</pre>
  <h2>Floating static routes</h2>
  <p>Add the same destination with a higher <strong>administrative distance</strong>. It stays in the table as a backup and takes over only when the preferred route disappears.</p>
  <pre class="code-block">ip route 192.168.50.0 255.255.255.0 10.0.0.2            # distance 1 (preferred)
ip route 192.168.50.0 255.255.255.0 10.0.0.3 distance 250 # backup</pre>
  <h2>When to go dynamic</h2>
  <ul>
    <li><strong>OSPF</strong> &mdash; link-state, fast convergence, ideal for campus networks.</li>
    <li><strong>RIP</strong> &mdash; tiny and simple, hop-count based, fine for very small sites.</li>
    <li><strong>BGP</strong> &mdash; used between organizations and ISPs, not inside a LAN.</li>
  </ul>
  <p>Dynamic protocols detect failed links and reroute automatically. Static routes fit small, stable networks where manual control beats extra complexity.</p>
  <h2>Checking the table</h2>
  <pre class="code-block">show ip route
show ip route 192.168.50.0</pre>
  <div class="callout">
    <strong>A route that says no</strong>
    <p>If a remote network is unreachable, check the route table first: is the route present, is the next hop reachable, and is the administrative distance lower than competing sources? Then trace with <span class="ic">ping</span> to the next hop and <span class="ic">traceroute</span> to the destination.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000411',
  '02700000-0000-4000-8000-000000000316',
  1,
  'Firewall Fundamentals & Rule Design',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Firewall Fundamentals & Rule Design</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Firewall Fundamentals &amp; Rule Design</h1>
  <p>A firewall is an enforcement point between trust zones. It decides which traffic may pass, and correct rule design is what makes it useful rather than annoying.</p>
  <h2>Stateful vs stateless</h2>
  <table>
    <tr><th>Type</th><th>Behavior</th></tr>
    <tr><td>Stateless</td><td>evaluates every packet independently</td></tr>
    <tr><td>Stateful</td><td>tracks connections; return traffic is allowed automatically</td></tr>
    <tr><td>Next-gen (NGFW)</td><td>adds application and user awareness</td></tr>
  </table>
  <h2>Rule anatomy</h2>
  <p>Every rule needs a name, an order, source, destination, service, and action:</p>
  <pre class="code-block">name:    allow_lan_to_internet_https
source:  LAN 192.168.0.0/16
dest:    Internet
service: tcp/443
action:  allow, log</pre>
  <h2>Zones</h2>
  <p>Group interfaces into zones with similar trust: <span class="ic">LAN</span>, <span class="ic">Guest</span>, <span class="ic">DMZ</span>, and <span class="ic">WAN</span>. Rules are written between zones &mdash; for example <span class="ic">LAN to WAN</span> or <span class="ic">LAN to DMZ</span>.</p>
  <h2>Deny-by-default</h2>
  <div class="callout">
    <strong>The golden rule</strong>
    <p>Start from nothing allowed and add only what is needed. The final implicit rule is <em>deny everything</em>. Explicit allow lists scale far better than blocklists.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Order matters</strong>
    <p>Most firewalls apply rules top to bottom and stop at the first match. Put the specific, high-volume allows near the top and broad denies last.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000412',
  '02700000-0000-4000-8000-000000000317',
  1,
  'Managing Firewall Rule Sets',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Managing Firewall Rule Sets</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Managing Firewall Rule Sets</h1>
  <p>Good rules are the product of a calm process, not a panic. Every rule should exist for a reason and still make sense six months later.</p>
  <h2>Know your services</h2>
  <table>
    <tr><th>Service</th><th>Protocol / port</th></tr>
    <tr><td>HTTPS</td><td>TCP 443</td></tr>
    <tr><td>HTTP</td><td>TCP 80</td></tr>
    <tr><td>SSH</td><td>TCP 22</td></tr>
    <tr><td>DNS</td><td>UDP/TCP 53</td></tr>
    <tr><td>DHCP</td><td>UDP 67/68</td></tr>
    <tr><td>SNMP</td><td>UDP 161</td></tr>
    <tr><td>RDP</td><td>TCP 3389</td></tr>
  </table>
  <h2>A basic outbound set</h2>
  <pre class="code-block">1 allow LAN -> WAN tcp/443    (HTTPS everywhere)
2 allow LAN -> WAN tcp/80     (HTTP fallback)
3 allow LAN -> WAN udp/53     (DNS)
4 deny  LAN -> WAN any        (implicit catch)</pre>
  <h2>Translating addresses (NAT)</h2>
  <ul>
    <li><strong>SNAT</strong> &mdash; hides internal addresses behind a public one for outbound traffic.</li>
    <li><strong>PAT (overload)</strong> &mdash; shares one public IP among many internal flows via unique ports.</li>
    <li><strong>DNAT (port forward)</strong> &mdash; sends inbound traffic to an internal server.</li>
  </ul>
  <h2>Rule hygiene</h2>
  <ul>
    <li>Describe every rule and attach the ticket or change-reference number.</li>
    <li>Put protocol and ports in a service definition, not free text.</li>
    <li>Log what matters and review denied traffic monthly.</li>
    <li>Remove rules that are no longer referenced.</li>
  </ul>
  <div class="callout">
    <strong>Change management applies</strong>
    <p>A firewall change is a change: request it, test it on a copy or schedule it, verify after, and keep the previous rule until the change has stabilized.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000413',
  '02700000-0000-4000-8000-000000000319',
  1,
  'Wireless Networking & Administration',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wireless Networking & Administration</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Wireless Networking &amp; Administration</h1>
  <p>Wi-Fi is the network users actually feel. The administrator&rsquo;s job is to make it available, fast, and secure everywhere it is promised.</p>
  <h2>The standards you will see</h2>
  <table>
    <tr><th>Standard</th><th>Wi-Fi</th><th>Bands</th><th>Key point</th></tr>
    <tr><td>802.11n</td><td>4</td><td>2.4 / 5 GHz</td><td>fast, very common</td></tr>
    <tr><td>802.11ac</td><td>5</td><td>5 GHz</td><td>wide channels, fast</td></tr>
    <tr><td>802.11ax</td><td>6</td><td>2.4 / 5 / 6 GHz</td><td>many clients at once</td></tr>
    <tr><td>802.11be</td><td>7</td><td>6 GHz</td><td>the newest generation</td></tr>
  </table>
  <h2>Administrative tasks</h2>
  <ul>
    <li>AP placement for coverage and roaming.</li>
    <li>SSIDs for each user class.</li>
    <li>Channel planning &mdash; in 2.4 GHz use only 1, 6, and 11.</li>
    <li>Radio power so cells overlap but do not shout over one another.</li>
    <li>Firmware, security, and client capacity per AP.</li>
  </ul>
  <h2>Management models</h2>
  <table>
    <tr><th>Model</th><th>How it works</th></tr>
    <tr><td>Standalone</td><td>each AP configured individually</td></tr>
    <tr><td>Controller</td><td>thin APs managed centrally (CAPWAP)</td></tr>
    <tr><td>Cloud</td><td>management in the vendor cloud; APs fetch configuration</td></tr>
  </table>
  <h2>Roaming</h2>
  <p>Clients move between APs; a clean handoff keeps sessions alive. Overlap cell edges by roughly 15 to 20 percent and use the same SSID, security, and band plan across the site.</p>
  <div class="callout callout-info">
    <strong>Capacity is the real work</strong>
    <p>Coverage means a usable signal; capacity means enough APs and channels for the client count. Dozens of laptops on one overloaded AP defeat any radio-tuning trick.</p>
  </div>
  <div class="callout callout-tip">
    <strong>The 2.4 GHz truth</strong>
    <p>2.4 GHz only offers three non-overlapping channels (1, 6, 11). Keep 2.4 for legacy and IoT devices and move modern clients to 5 or 6 GHz.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000414',
  '02700000-0000-4000-8000-000000000320',
  1,
  'Securing & Managing Wi-Fi Networks',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Securing & Managing Wi-Fi Networks</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Securing &amp; Managing Wi-Fi Networks</h1>
  <p>Wireless is radio: anyone in range can hear it. Security decides who may use it and how each class of user is isolated.</p>
  <h2>Security generations</h2>
  <ul>
    <li><strong>WEP</strong> &mdash; broken for twenty years. Never use it.</li>
    <li><strong>WPA2</strong> &mdash; strong, but weak against offline attacks when using a short passphrase.</li>
    <li><strong>WPA3</strong> &mdash; current best practice; enables management-frame protection (PMF).</li>
  </ul>
  <h2>Personal vs enterprise</h2>
  <table>
    <tr><th>Mode</th><th>Auth method</th><th>Best for</th></tr>
    <tr><td>WPA3-Personal</td><td>a shared passphrase</td><td>small offices, home</td></tr>
    <tr><td>WPA3-Enterprise</td><td>802.1X / EAP with RADIUS, per-user credentials</td><td>mid-size and larger</td></tr>
  </table>
  <h2>SSID design</h2>
  <ul>
    <li><strong>Employee SSID</strong> &mdash; enterprise authentication, internal DHCP, full access.</li>
    <li><strong>Guest SSID</strong> &mdash; isolated VLAN, internet only, rate-limited.</li>
    <li><strong>IoT SSID</strong> &mdash; devices on their own VLAN with no access to anything else.</li>
  </ul>
  <h2>Defending the airwaves</h2>
  <ul>
    <li>Watch for <strong>rogue APs</strong>: periodic scans, wired-side detection, disabled spare switch ports.</li>
    <li>Keep client isolation enabled on guest networks.</li>
    <li>Update firmware; access points are network devices and need patching yearly.</li>
  </ul>
  <div class="callout">
    <strong>Guest networks never route home</strong>
    <p>A guest SSID must be firewalled: out to the internet, never back into the internal subnets. That is the difference between hospitality and a data leak.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pin the radios</strong>
    <p>Set channel and power deliberately rather than leaving all APs on auto. A site survey (signal heatmap) shows where coverage is thin and where cells collide.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000415',
  '02700000-0000-4000-8000-000000000322',
  1,
  'Monitoring Network Health',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Monitoring Network Health</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Monitoring Network Health</h1>
  <p>Monitoring answers three questions: is it up, is it fast enough, and is it getting worse? Good monitoring finds failures while they are still small.</p>
  <h2>Metrics that matter</h2>
  <table>
    <tr><th>Metric</th><th>Healthy sign</th><th>Watch out</th></tr>
    <tr><td>Interface utilization</td><td>below about 70% at peak</td><td>sustained 90%+ saturation</td></tr>
    <tr><td>Errors / discards</td><td>near zero</td><td>CRC errors and drops mean physical or duplex trouble</td></tr>
    <tr><td>Round-trip time</td><td>stable and low</td><td>jitter or creeping latency</td></tr>
    <tr><td>Packet loss</td><td>0%</td><td>even 1% hurts voice and video</td></tr>
    <tr><td>Device CPU / memory</td><td>moderate</td><td>consistently pegged switches and routers</td></tr>
    <tr><td>Link flaps</td><td>rare</td><td>repeated up/down signals failing hardware or cabling</td></tr>
  </table>
  <h2>How data gets collected</h2>
  <ul>
    <li><strong>SNMP</strong> &mdash; the collector polls counters (in/out octets, errors) from devices.</li>
    <li><strong>sFlow / NetFlow</strong> &mdash; sampled packet or flow data for traffic analysis.</li>
    <li><strong>Active checks</strong> &mdash; scheduled pings of critical hosts and services.</li>
  </ul>
  <h2>Baselines and thresholds</h2>
  <p>Collect a <strong>baseline</strong> first: a record of normal behavior, ideally per hour of day and weekday. Then set thresholds from that baseline, with alerting and an escalation path.</p>
  <div class="callout">
    <strong>You can only fix what you can see</strong>
    <p>Alert on trends, not just outages. A link creeping from 30 to 95 percent utilization over three weeks is a prediction, not an incident.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Keep device clocks honest</strong>
    <p>Configure NTP everywhere. Comparisons across time-stamped metrics and logs are only useful when every device agrees on the time.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000416',
  '02700000-0000-4000-8000-000000000323',
  1,
  'Log Management & Analysis',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Log Management & Analysis</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Log Management &amp; Analysis</h1>
  <p>Logs are the memory of the network. Stored centrally, they turn &ldquo;something happened&rdquo; into &ldquo;here is exactly when and where.&rdquo;</p>
  <h2>What gets logged</h2>
  <ul>
    <li>Interface and link state changes</li>
    <li>Authentication events (VPN, RADIUS, console)</li>
    <li>DHCP grants and failures</li>
    <li>DNS queries, when configured</li>
    <li>Firewall allows and denies</li>
  </ul>
  <h2>Syslog severity</h2>
  <table>
    <tr><th>Level</th><th>Name</th><th>Example</th></tr>
    <tr><td>0</td><td>Emergency</td><td>system unusable</td></tr>
    <tr><td>1</td><td>Alert</td><td>immediate action needed</td></tr>
    <tr><td>2</td><td>Critical</td><td>partial failure</td></tr>
    <tr><td>3</td><td>Error</td><td>a feature failed</td></tr>
    <tr><td>4</td><td>Warning</td><td>may need attention</td></tr>
    <tr><td>5</td><td>Notice</td><td>normal but notable</td></tr>
    <tr><td>6</td><td>Informational</td><td>normal events</td></tr>
    <tr><td>7</td><td>Debug</td><td>developer detail</td></tr>
  </table>
  <h2>Central collection</h2>
  <ul>
    <li>Point every device at a <strong>syslog server</strong> on the management VLAN.</li>
    <li>Synchronize time with NTP before anything else.</li>
    <li>Define a retention policy &mdash; often 30 to 90 days, longer where compliance requires it.</li>
  </ul>
  <h2>Patterns that deserve attention</h2>
  <ul>
    <li>Bursts of firewall <em>denies</em> &mdash; possible scan or misrouting.</li>
    <li>Repeated failed authentications.</li>
    <li>Configuration changes at odd hours.</li>
    <li>CRC or resource-deficiency messages on switches.</li>
  </ul>
  <div class="callout">
    <strong>Logs alone are silent</strong>
    <p>Pair log review with monitoring graphs. Logs say <em>what</em>; trend graphs say <em>how much and for how long</em>. Together they make an incident reproducible.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Store, protect, rotate</strong>
    <p>Logs are evidence too. Keep them append-only where you can, restrict access, and make sure rotation does not silently delete what you will need next audit cycle.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000417',
  '02700000-0000-4000-8000-000000000325',
  1,
  'Systematic Troubleshooting (OSI)',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Systematic Troubleshooting (OSI)</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Systematic Troubleshooting (OSI)</h1>
  <p>Random poking fixes simple problems and hides real ones. A methodical process finds the actual cause the first time.</p>
  <h2>Map the symptom to a layer</h2>
  <table>
    <tr><th>Layer</th><th>What to test</th></tr>
    <tr><td>1 Physical</td><td>cables, connectors, link lights, power</td></tr>
    <tr><td>2 Data Link</td><td>switch ports, VLANs, duplex, MAC learning</td></tr>
    <tr><td>3 Network</td><td>IP, subnet, gateway, route table, ping</td></tr>
    <tr><td>4 Transport</td><td>TCP/UDP ports, sessions, firewall</td></tr>
    <tr><td>5-7 Application</td><td>the service itself, its config, credentials</td></tr>
  </table>
  <h2>The process</h2>
  <ol>
    <li><strong>Define the problem</strong> &mdash; what, who, where, since when, how much impact.</li>
    <li><strong>Gather facts</strong> &mdash; ask users, inspect configurations, run tools.</li>
    <li><strong>List possible causes</strong> &mdash; then order them by likelihood.</li>
    <li><strong>Test hypotheses</strong> &mdash; one change at a time, cleanly.</li>
    <li><strong>Isolate and confirm</strong> &mdash; identify the offending path or device.</li>
    <li><strong>Fix it</strong> &mdash; with change management, then verify and monitor.</li>
    <li><strong>Document</strong> &mdash; update the ticket and the knowledge base.</li>
  </ol>
  <h2>Strategies</h2>
  <ul>
    <li><strong>Bottom-up</strong> &mdash; verify the physical layer first; it is cheap and catches many causes.</li>
    <li><strong>Top-down</strong> &mdash; start where the user notices the problem: the application.</li>
    <li><strong>Divide and conquer</strong> &mdash; pick the layer where the symptom seems to live and test on both sides.</li>
  </ul>
  <div class="callout">
    <strong>Worked example</strong>
    <p>&ldquo;Users can reach the internet but not the intranet.&rdquo; Scope: everyone, so focus on the path to the intranet. Check DNS for the internal name first, then the route toward the intranet subnet, then the firewall rule between VLANs.</p>
  </div>
  <div class="callout callout-tip">
    <strong>One variable at a time</strong>
    <p>Change one thing, test, and record the result. Changing three settings in a row and finding the network fixed teaches you nothing about which one mattered.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000418',
  '02700000-0000-4000-8000-000000000326',
  1,
  'Capstone: Office Network Design & Build',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Office Network Design & Build</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Office Network Design &amp; Build</h1>
  <p>Every idea in this course lands in one project: design and build the network for a new 120-person office with Finance, Engineering, and Marketing teams, plus guest Wi-Fi and a small server room.</p>
  <h2>Requirements</h2>
  <ul>
    <li>Three teams isolated from each other by VLAN.</li>
    <li>Guest Wi-Fi with internet only.</li>
    <li>A management network for switches, APs, and the firewall.</li>
    <li>Servers for DNS, DHCP, files, and printing in one subnet.</li>
    <li>One internet link, with room to grow.</li>
  </ul>
  <h2>IP and VLAN plan</h2>
  <table>
    <tr><th>VLAN</th><th>Subnet</th><th>Gateway</th><th>Purpose</th></tr>
    <tr><td>10</td><td>192.168.10.0/24</td><td>192.168.10.1</td><td>Finance</td></tr>
    <tr><td>20</td><td>192.168.20.0/24</td><td>192.168.20.1</td><td>Engineering</td></tr>
    <tr><td>30</td><td>192.168.30.0/24</td><td>192.168.30.1</td><td>Marketing</td></tr>
    <tr><td>40</td><td>192.168.40.0/24</td><td>192.168.40.1</td><td>Guest (internet only)</td></tr>
    <tr><td>50</td><td>192.168.50.0/24</td><td>192.168.50.1</td><td>Servers</td></tr>
    <tr><td>100</td><td>192.168.100.0/24</td><td>192.168.100.1</td><td>Management</td></tr>
  </table>
  <h2>Build order</h2>
  <ol>
    <li>Rack and cable: switches, firewall, UPS, structured cabling.</li>
    <li>Base configuration: hostnames, management addresses, NTP, logging, admin accounts.</li>
    <li>VLANs on core and access switches; trunks between them.</li>
    <li>Inter-VLAN routing on the layer 3 core, or router on a stick.</li>
    <li>DHCP scopes per VLAN with reservations for servers and printers.</li>
    <li>DNS zones for the internal domain; forwarders for everything else.</li>
    <li>Firewall zones and rules: LAN out, guest to internet only, NAT/PAT outbound.</li>
    <li>Wi-Fi: APs on the data and management VLANs, employee and guest SSIDs.</li>
    <li>Test every requirement, then write it all down.</li>
  </ol>
  <div class="callout">
    <strong>Every step is a change</strong>
    <p>Number the steps and note the rollback for each. If step 7 breaks the internet, the rollback is known before anyone notices it broke.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Reservations beat statics</strong>
    <p>Use DHCP reservations for servers and printers instead of hand-typed static entries: one place to see every address, and no duplicate-IP surprises.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02700000-0000-4000-8000-000000000419',
  '02700000-0000-4000-8000-000000000327',
  1,
  'Capstone: Validation, Documentation & Handover',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Validation, Documentation & Handover</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eff6ff; color: #1d4ed8; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eff6ff; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #60a5fa; }
.dark .lesson-page h2 { color: #93c5fd; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #3b82f6; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Validation, Documentation &amp; Handover</h1>
  <p>The build is not finished until it is <em>proven</em>, written down, and handed to the people who will run it every day.</p>
  <h2>Validation checklist</h2>
  <ul>
    <li><strong>Links</strong> &mdash; all switch ports and trunks show up; every AP is registered.</li>
    <li><strong>DHCP</strong> &mdash; a fresh client in each VLAN gets the right subnet, gateway, and DNS.</li>
    <li><strong>DNS</strong> &mdash; forward and reverse resolution works from a workstation.</li>
    <li><strong>Routing</strong> &mdash; every VLAN pings its gateway and the others; internet works.</li>
    <li><strong>Firewall</strong> &mdash; allowed traffic passes, denied traffic is blocked and logged.</li>
    <li><strong>Wi-Fi</strong> &mdash; signal is usable in every corner; roaming hands off cleanly; guests stay isolated.</li>
  </ul>
  <pre class="code-block">ping 192.168.10.1        # gateway of your own VLAN
ping 192.168.50.1        # server VLAN gateway
nslookup ns.example.local
traceroute 8.8.8.8       # whole path to the internet</pre>
  <h2>Documentation to produce</h2>
  <table>
    <tr><th>Document</th><th>Contents</th></tr>
    <tr><td>Network diagram</td><td>layer 2 and layer 3 views, links, VLANs</td></tr>
    <tr><td>IP plan</td><td>subnets, reservations, statics</td></tr>
    <tr><td>Device inventory</td><td>models, serials, firmware, passwords in a vault</td></tr>
    <tr><td>Runbooks</td><td>the top operator tasks, with step-by-step instructions</td></tr>
    <tr><td>Standard templates</td><td>a repeatable switch or access-point configuration</td></tr>
    <tr><td>Monitoring dashboard</td><td>alerts, thresholds, and who to call</td></tr>
  </table>
  <h2>Handover</h2>
  <ul>
    <li>Walk the operations team through the dashboard and runbooks.</li>
    <li>Demonstrate a real recovery: restore a configuration, reboot an AP.</li>
    <li>Agree on review dates for firmware, rules, and unused accounts.</li>
  </ul>
  <div class="callout">
    <strong>Done means someone else can run it</strong>
    <p>The network is finished when a reasonable colleague, reading only your documentation, can add a user, a VLAN, and a firewall rule without calling you.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Close the ticket</strong>
    <p>Record the outcome of every verification in the change record. In six months that record is the baseline that lets the next change be safe.</p>
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
  ('02700000-0000-4000-8000-000000000501', '02700000-0000-4000-8000-000000000303',
   'Which device forwards Ethernet frames based on MAC addresses?',
   'A switch learns MAC addresses on ports and forwards frames within a LAN.', 1),
  ('02700000-0000-4000-8000-000000000502', '02700000-0000-4000-8000-000000000303',
   'What does RFC 1918 define?',
   'It defines the private IPv4 ranges used on internal networks.', 2),
  ('02700000-0000-4000-8000-000000000503', '02700000-0000-4000-8000-000000000303',
   'What should every production network change begin with?',
   'A change request records the reason, plan, and rollback before the change.', 3),
  ('02700000-0000-4000-8000-000000000504', '02700000-0000-4000-8000-000000000306',
   'Which address in a subnet has all host bits set to zero?',
   'The network address identifies the subnet and is never assigned to a host.', 1),
  ('02700000-0000-4000-8000-000000000505', '02700000-0000-4000-8000-000000000306',
   'Which devices typically receive static IP assignments?',
   'Servers and infrastructure need stable, findable addresses.', 2),
  ('02700000-0000-4000-8000-000000000506', '02700000-0000-4000-8000-000000000306',
   'Which DHCP option sends the default gateway to clients?',
   'Option 3 (Router) delivers the default gateway address.', 3),
  ('02700000-0000-4000-8000-000000000507', '02700000-0000-4000-8000-000000000309',
   'Which DNS record maps a hostname to an IPv4 address?',
   'An A record stores an IPv4 address for a name.', 1),
  ('02700000-0000-4000-8000-000000000508', '02700000-0000-4000-8000-000000000309',
   'Which server can answer authoritatively for a domain?',
   'The authoritative nameserver holds the zone data for a domain.', 2),
  ('02700000-0000-4000-8000-000000000509', '02700000-0000-4000-8000-000000000309',
   'Which record type creates an alias for another name?',
   'A CNAME points one name at another instead of at an address.', 3),
  ('02700000-0000-4000-8000-000000000510', '02700000-0000-4000-8000-000000000312',
   'Which standard carries VLAN tags on trunk links?',
   'IEEE 802.1Q adds a VLAN ID tag to frames on trunks.', 1),
  ('02700000-0000-4000-8000-000000000511', '02700000-0000-4000-8000-000000000312',
   'Which switch port type carries a single untagged VLAN?',
   'An access port belongs to exactly one VLAN.', 2),
  ('02700000-0000-4000-8000-000000000512', '02700000-0000-4000-8000-000000000312',
   'Which design routes traffic between VLANs?',
   'A router on a stick or a Layer 3 switch routes inter-VLAN traffic.', 3),
  ('02700000-0000-4000-8000-000000000513', '02700000-0000-4000-8000-000000000315',
   'When several routes match a destination, which one wins?',
   'The most specific (longest prefix) route is preferred.', 1),
  ('02700000-0000-4000-8000-000000000514', '02700000-0000-4000-8000-000000000315',
   'What is the purpose of the default route?',
   'It catches traffic not matched by any more specific route.', 2),
  ('02700000-0000-4000-8000-000000000515', '02700000-0000-4000-8000-000000000315',
   'Which of these is a dynamic routing protocol?',
   'OSPF is a link-state dynamic routing protocol.', 3),
  ('02700000-0000-4000-8000-000000000516', '02700000-0000-4000-8000-000000000318',
   'Which firewall policy is safest by default?',
   'Deny-by-default only allows traffic that is explicitly permitted.', 1),
  ('02700000-0000-4000-8000-000000000517', '02700000-0000-4000-8000-000000000318',
   'Which technique shares one public address among many internal clients?',
   'PAT (port address translation) maps many internal flows to one public IP.', 2),
  ('02700000-0000-4000-8000-000000000518', '02700000-0000-4000-8000-000000000318',
   'Which service does SSH use?',
   'SSH listens on TCP port 22.', 3),
  ('02700000-0000-4000-8000-000000000519', '02700000-0000-4000-8000-000000000321',
   'Which wireless security is the current best practice?',
   'WPA3 is the strongest Wi-Fi security and enables PMF.', 1),
  ('02700000-0000-4000-8000-000000000520', '02700000-0000-4000-8000-000000000321',
   'How should guest wireless be isolated from internal networks?',
   'A dedicated guest SSID on an isolated VLAN prevents internal access.', 2),
  ('02700000-0000-4000-8000-000000000521', '02700000-0000-4000-8000-000000000321',
   'Why do adjacent access points use different channels?',
   'Non-overlapping channels reduce co-channel interference.', 3),
  ('02700000-0000-4000-8000-000000000522', '02700000-0000-4000-8000-000000000324',
   'Which protocol collects utilization and error counters from devices?',
   'SNMP polls statistics such as utilization and errors.', 1),
  ('02700000-0000-4000-8000-000000000523', '02700000-0000-4000-8000-000000000324',
   'Which syslog level marks the most urgent event?',
   'Severity 0 (Emergency) is the most urgent level.', 2),
  ('02700000-0000-4000-8000-000000000524', '02700000-0000-4000-8000-000000000324',
   'What is a network baseline?',
   'It is a measured pattern of normal behavior used to spot anomalies.', 3),
  ('02700000-0000-4000-8000-000000000525', '02700000-0000-4000-8000-000000000328',
   'A host reaches the internet but not the internal intranet. What is the first step?',
   'Gather facts and confirm the exact symptom and scope before acting.', 1),
  ('02700000-0000-4000-8000-000000000526', '02700000-0000-4000-8000-000000000328',
   'A workstation shows an address beginning with 169.254. What does that mean?',
   'The client could not reach a DHCP server and self-assigned an address.', 2),
  ('02700000-0000-4000-8000-000000000527', '02700000-0000-4000-8000-000000000328',
   'Two servers hold the same IP address. What is the expected symptom?',
   'Address conflicts cause intermittent or total loss of connectivity.', 3),
  ('02700000-0000-4000-8000-000000000528', '02700000-0000-4000-8000-000000000328',
   'A firewall rule change locks everyone out of a web service. What is the best response?',
   'Consult the change record and roll back the recent rule.', 4),
  ('02700000-0000-4000-8000-000000000529', '02700000-0000-4000-8000-000000000328',
   'Which command lists the routes a router will use?',
   'show ip route displays the routing table and its selection.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): switch
  ('02700000-0000-4000-8000-000000001001', '02700000-0000-4000-8000-000000000501', 'Switch', TRUE,  1),
  ('02700000-0000-4000-8000-000000001002', '02700000-0000-4000-8000-000000000501', 'Router', FALSE, 2),
  ('02700000-0000-4000-8000-000000001003', '02700000-0000-4000-8000-000000000501', 'Firewall', FALSE, 3),
  ('02700000-0000-4000-8000-000000001004', '02700000-0000-4000-8000-000000000501', 'Access point', FALSE, 4),
  -- Q1 (502): RFC 1918
  ('02700000-0000-4000-8000-000000001005', '02700000-0000-4000-8000-000000000502', 'Public IPv6 allocation ranges', FALSE, 1),
  ('02700000-0000-4000-8000-000000001006', '02700000-0000-4000-8000-000000000502', 'Private IPv4 ranges for internal use', TRUE,  2),
  ('02700000-0000-4000-8000-000000001007', '02700000-0000-4000-8000-000000000502', 'Default route requirements', FALSE, 3),
  ('02700000-0000-4000-8000-000000001008', '02700000-0000-4000-8000-000000000502', 'DHCP lease timers', FALSE, 4),
  -- Q1 (503): change management
  ('02700000-0000-4000-8000-000000001009', '02700000-0000-4000-8000-000000000503', 'Apply the change directly in production', FALSE, 1),
  ('02700000-0000-4000-8000-000000001010', '02700000-0000-4000-8000-000000000503', 'Reboot the core switch before testing', FALSE, 2),
  ('02700000-0000-4000-8000-000000001011', '02700000-0000-4000-8000-000000000503', 'A change request with a rollback plan', TRUE,  3),
  ('02700000-0000-4000-8000-000000001012', '02700000-0000-4000-8000-000000000503', 'A chat message shared with the team', FALSE, 4),
  -- Q2 (504): network address
  ('02700000-0000-4000-8000-000000001013', '02700000-0000-4000-8000-000000000504', 'Broadcast address', FALSE, 1),
  ('02700000-0000-4000-8000-000000001014', '02700000-0000-4000-8000-000000000504', 'Gateway address', FALSE, 2),
  ('02700000-0000-4000-8000-000000001015', '02700000-0000-4000-8000-000000000504', 'Usable host address', FALSE, 3),
  ('02700000-0000-4000-8000-000000001016', '02700000-0000-4000-8000-000000000504', 'Network address', TRUE,  4),
  -- Q2 (505): static assignments
  ('02700000-0000-4000-8000-000000001017', '02700000-0000-4000-8000-000000000505', 'Servers and core infrastructure', TRUE,  1),
  ('02700000-0000-4000-8000-000000001018', '02700000-0000-4000-8000-000000000505', 'Guest laptops', FALSE, 2),
  ('02700000-0000-4000-8000-000000001019', '02700000-0000-4000-8000-000000000505', 'Conference room visitors', FALSE, 3),
  ('02700000-0000-4000-8000-000000001020', '02700000-0000-4000-8000-000000000505', 'Random user smartphones', FALSE, 4),
  -- Q2 (506): DHCP option 3
  ('02700000-0000-4000-8000-000000001021', '02700000-0000-4000-8000-000000000506', 'Option 6 (DNS)', FALSE, 1),
  ('02700000-0000-4000-8000-000000001022', '02700000-0000-4000-8000-000000000506', 'Option 3 (Router)', TRUE,  2),
  ('02700000-0000-4000-8000-000000001023', '02700000-0000-4000-8000-000000000506', 'Option 15 (Domain name)', FALSE, 3),
  ('02700000-0000-4000-8000-000000001024', '02700000-0000-4000-8000-000000000506', 'Option 51 (Lease time)', FALSE, 4),
  -- Q3 (507): A record
  ('02700000-0000-4000-8000-000000001025', '02700000-0000-4000-8000-000000000507', 'CNAME record', FALSE, 1),
  ('02700000-0000-4000-8000-000000001026', '02700000-0000-4000-8000-000000000507', 'MX record', FALSE, 2),
  ('02700000-0000-4000-8000-000000001027', '02700000-0000-4000-8000-000000000507', 'A record', TRUE,  3),
  ('02700000-0000-4000-8000-000000001028', '02700000-0000-4000-8000-000000000507', 'PTR record', FALSE, 4),
  -- Q3 (508): authoritative server
  ('02700000-0000-4000-8000-000000001029', '02700000-0000-4000-8000-000000000508', 'Recursive resolver only', FALSE, 1),
  ('02700000-0000-4000-8000-000000001030', '02700000-0000-4000-8000-000000000508', 'DHCP server', FALSE, 2),
  ('02700000-0000-4000-8000-000000001031', '02700000-0000-4000-8000-000000000508', 'RADIUS server', FALSE, 3),
  ('02700000-0000-4000-8000-000000001032', '02700000-0000-4000-8000-000000000508', 'Authoritative nameserver', TRUE,  4),
  -- Q3 (509): CNAME
  ('02700000-0000-4000-8000-000000001033', '02700000-0000-4000-8000-000000000509', 'CNAME', TRUE,  1),
  ('02700000-0000-4000-8000-000000001034', '02700000-0000-4000-8000-000000000509', 'A', FALSE, 2),
  ('02700000-0000-4000-8000-000000001035', '02700000-0000-4000-8000-000000000509', 'AAAA', FALSE, 3),
  ('02700000-0000-4000-8000-000000001036', '02700000-0000-4000-8000-000000000509', 'NS', FALSE, 4),
  -- Q4 (510): 802.1Q
  ('02700000-0000-4000-8000-000000001037', '02700000-0000-4000-8000-000000000510', 'IEEE 802.3af', FALSE, 1),
  ('02700000-0000-4000-8000-000000001038', '02700000-0000-4000-8000-000000000510', 'IEEE 802.1Q', TRUE,  2),
  ('02700000-0000-4000-8000-000000001039', '02700000-0000-4000-8000-000000000510', 'IEEE 802.11ac', FALSE, 3),
  ('02700000-0000-4000-8000-000000001040', '02700000-0000-4000-8000-000000000510', 'IEEE 802.1X', FALSE, 4),
  -- Q4 (511): access port
  ('02700000-0000-4000-8000-000000001041', '02700000-0000-4000-8000-000000000511', 'Trunk port', FALSE, 1),
  ('02700000-0000-4000-8000-000000001042', '02700000-0000-4000-8000-000000000511', 'Uplink port', FALSE, 2),
  ('02700000-0000-4000-8000-000000001043', '02700000-0000-4000-8000-000000000511', 'Access port', TRUE,  3),
  ('02700000-0000-4000-8000-000000001044', '02700000-0000-4000-8000-000000000511', 'Console port', FALSE, 4),
  -- Q4 (512): inter-VLAN routing
  ('02700000-0000-4000-8000-000000001045', '02700000-0000-4000-8000-000000000512', 'A DHCP scope', FALSE, 1),
  ('02700000-0000-4000-8000-000000001046', '02700000-0000-4000-8000-000000000512', 'A DNS forwarder', FALSE, 2),
  ('02700000-0000-4000-8000-000000001047', '02700000-0000-4000-8000-000000000512', 'A firewall rule', FALSE, 3),
  ('02700000-0000-4000-8000-000000001048', '02700000-0000-4000-8000-000000000512', 'A router or Layer 3 switch', TRUE,  4),
  -- Q5 (513): longest prefix
  ('02700000-0000-4000-8000-000000001049', '02700000-0000-4000-8000-000000000513', 'The most specific route (longest prefix)', TRUE,  1),
  ('02700000-0000-4000-8000-000000001050', '02700000-0000-4000-8000-000000000513', 'The route with the highest metric', FALSE, 2),
  ('02700000-0000-4000-8000-000000001051', '02700000-0000-4000-8000-000000000513', 'The last route in the table', FALSE, 3),
  ('02700000-0000-4000-8000-000000001052', '02700000-0000-4000-8000-000000000513', 'The route learned first', FALSE, 4),
  -- Q5 (514): default route
  ('02700000-0000-4000-8000-000000001053', '02700000-0000-4000-8000-000000000514', 'Blocks unwanted traffic', FALSE, 1),
  ('02700000-0000-4000-8000-000000001054', '02700000-0000-4000-8000-000000000514', 'Catches traffic no specific route matches', TRUE,  2),
  ('02700000-0000-4000-8000-000000001055', '02700000-0000-4000-8000-000000000514', 'Resolves domain names', FALSE, 3),
  ('02700000-0000-4000-8000-000000001056', '02700000-0000-4000-8000-000000000514', 'Assigns IP addresses', FALSE, 4),
  -- Q5 (515): OSPF
  ('02700000-0000-4000-8000-000000001057', '02700000-0000-4000-8000-000000000515', 'HTTP', FALSE, 1),
  ('02700000-0000-4000-8000-000000001058', '02700000-0000-4000-8000-000000000515', 'DHCP', FALSE, 2),
  ('02700000-0000-4000-8000-000000001059', '02700000-0000-4000-8000-000000000515', 'OSPF', TRUE,  3),
  ('02700000-0000-4000-8000-000000001060', '02700000-0000-4000-8000-000000000515', 'TCP', FALSE, 4),
  -- Q6 (516): deny-by-default
  ('02700000-0000-4000-8000-000000001061', '02700000-0000-4000-8000-000000000516', 'Allow all outbound traffic', FALSE, 1),
  ('02700000-0000-4000-8000-000000001062', '02700000-0000-4000-8000-000000000516', 'No rules at all', FALSE, 2),
  ('02700000-0000-4000-8000-000000001063', '02700000-0000-4000-8000-000000000516', 'Blocklist with implicit allow', FALSE, 3),
  ('02700000-0000-4000-8000-000000001064', '02700000-0000-4000-8000-000000000516', 'Deny-by-default with explicit allows', TRUE,  4),
  -- Q6 (517): PAT
  ('02700000-0000-4000-8000-000000001065', '02700000-0000-4000-8000-000000000517', 'PAT (port address translation)', TRUE,  1),
  ('02700000-0000-4000-8000-000000001066', '02700000-0000-4000-8000-000000000517', 'DNAT for a single host', FALSE, 2),
  ('02700000-0000-4000-8000-000000001067', '02700000-0000-4000-8000-000000000517', 'Static route redistribution', FALSE, 3),
  ('02700000-0000-4000-8000-000000001068', '02700000-0000-4000-8000-000000000517', 'DHCP relay', FALSE, 4),
  -- Q6 (518): SSH port
  ('02700000-0000-4000-8000-000000001069', '02700000-0000-4000-8000-000000000518', 'UDP 53', FALSE, 1),
  ('02700000-0000-4000-8000-000000001070', '02700000-0000-4000-8000-000000000518', 'TCP 22', TRUE,  2),
  ('02700000-0000-4000-8000-000000001071', '02700000-0000-4000-8000-000000000518', 'TCP 443', FALSE, 3),
  ('02700000-0000-4000-8000-000000001072', '02700000-0000-4000-8000-000000000518', 'UDP 161', FALSE, 4),
  -- Q7 (519): WPA3
  ('02700000-0000-4000-8000-000000001073', '02700000-0000-4000-8000-000000000519', 'WEP', FALSE, 1),
  ('02700000-0000-4000-8000-000000001074', '02700000-0000-4000-8000-000000000519', 'Open (no encryption)', FALSE, 2),
  ('02700000-0000-4000-8000-000000001075', '02700000-0000-4000-8000-000000000519', 'WPA3', TRUE,  3),
  ('02700000-0000-4000-8000-000000001076', '02700000-0000-4000-8000-000000000519', 'WPA2-PSK alone', FALSE, 4),
  -- Q7 (520): guest isolation
  ('02700000-0000-4000-8000-000000001077', '02700000-0000-4000-8000-000000000520', 'Reuse the employee SSID', FALSE, 1),
  ('02700000-0000-4000-8000-000000001078', '02700000-0000-4000-8000-000000000520', 'Connect guests on the management VLAN', FALSE, 2),
  ('02700000-0000-4000-8000-000000001079', '02700000-0000-4000-8000-000000000520', 'Give guests full internal access', FALSE, 3),
  ('02700000-0000-4000-8000-000000001080', '02700000-0000-4000-8000-000000000520', 'A dedicated guest SSID on an isolated VLAN', TRUE,  4),
  -- Q7 (521): channels
  ('02700000-0000-4000-8000-000000001081', '02700000-0000-4000-8000-000000000521', 'To avoid co-channel interference', TRUE,  1),
  ('02700000-0000-4000-8000-000000001082', '02700000-0000-4000-8000-000000000521', 'To speed up DHCP', FALSE, 2),
  ('02700000-0000-4000-8000-000000001083', '02700000-0000-4000-8000-000000000521', 'To strengthen encryption', FALSE, 3),
  ('02700000-0000-4000-8000-000000001084', '02700000-0000-4000-8000-000000000521', 'To enlarge the subnet', FALSE, 4),
  -- Q8 (522): SNMP
  ('02700000-0000-4000-8000-000000001085', '02700000-0000-4000-8000-000000000522', 'HTTP', FALSE, 1),
  ('02700000-0000-4000-8000-000000001086', '02700000-0000-4000-8000-000000000522', 'SNMP', TRUE,  2),
  ('02700000-0000-4000-8000-000000001087', '02700000-0000-4000-8000-000000000522', 'DHCP', FALSE, 3),
  ('02700000-0000-4000-8000-000000001088', '02700000-0000-4000-8000-000000000522', 'ARP', FALSE, 4),
  -- Q8 (523): syslog severity
  ('02700000-0000-4000-8000-000000001089', '02700000-0000-4000-8000-000000000523', '4 (Warning)', FALSE, 1),
  ('02700000-0000-4000-8000-000000001090', '02700000-0000-4000-8000-000000000523', '6 (Informational)', FALSE, 2),
  ('02700000-0000-4000-8000-000000001091', '02700000-0000-4000-8000-000000000523', '0 (Emergency)', TRUE,  3),
  ('02700000-0000-4000-8000-000000001092', '02700000-0000-4000-8000-000000000523', '7 (Debug)', FALSE, 4),
  -- Q8 (524): baseline
  ('02700000-0000-4000-8000-000000001093', '02700000-0000-4000-8000-000000000524', 'A list of static addresses', FALSE, 1),
  ('02700000-0000-4000-8000-000000001094', '02700000-0000-4000-8000-000000000524', 'The default subnet mask', FALSE, 2),
  ('02700000-0000-4000-8000-000000001095', '02700000-0000-4000-8000-000000000524', 'A single firewall rule', FALSE, 3),
  ('02700000-0000-4000-8000-000000001096', '02700000-0000-4000-8000-000000000524', 'A recorded pattern of normal behavior', TRUE,  4),
  -- Q9 (525): first step
  ('02700000-0000-4000-8000-000000001097', '02700000-0000-4000-8000-000000000525', 'Confirm the exact symptom and scope', TRUE,  1),
  ('02700000-0000-4000-8000-000000001098', '02700000-0000-4000-8000-000000000525', 'Rebuild the intranet server', FALSE, 2),
  ('02700000-0000-4000-8000-000000001099', '02700000-0000-4000-8000-000000000525', 'Replace the core switch', FALSE, 3),
  ('02700000-0000-4000-8000-000000001100', '02700000-0000-4000-8000-000000000525', 'Disable the user firewall', FALSE, 4),
  -- Q9 (526): 169.254
  ('02700000-0000-4000-8000-000000001101', '02700000-0000-4000-8000-000000000526', 'The DNS server is offline', FALSE, 1),
  ('02700000-0000-4000-8000-000000001102', '02700000-0000-4000-8000-000000000526', 'The DHCP request failed', TRUE,  2),
  ('02700000-0000-4000-8000-000000001103', '02700000-0000-4000-8000-000000000526', 'The gateway is overloaded', FALSE, 3),
  ('02700000-0000-4000-8000-000000001104', '02700000-0000-4000-8000-000000000526', 'The switch port is untagged', FALSE, 4),
  -- Q9 (527): duplicate IP
  ('02700000-0000-4000-8000-000000001105', '02700000-0000-4000-8000-000000000527', 'Guaranteed full-duplex operation', FALSE, 1),
  ('02700000-0000-4000-8000-000000001106', '02700000-0000-4000-8000-000000000527', 'Faster name resolution', FALSE, 2),
  ('02700000-0000-4000-8000-000000001107', '02700000-0000-4000-8000-000000000527', 'Intermittent or dropped connectivity', TRUE,  3),
  ('02700000-0000-4000-8000-000000001108', '02700000-0000-4000-8000-000000000527', 'Improved bandwidth efficiency', FALSE, 4),
  -- Q9 (528): rollback
  ('02700000-0000-4000-8000-000000001109', '02700000-0000-4000-8000-000000000528', 'Disable the firewall entirely', FALSE, 1),
  ('02700000-0000-4000-8000-000000001110', '02700000-0000-4000-8000-000000000528', 'Reboot every workstation', FALSE, 2),
  ('02700000-0000-4000-8000-000000001111', '02700000-0000-4000-8000-000000000528', 'Change the server subnet', FALSE, 3),
  ('02700000-0000-4000-8000-000000001112', '02700000-0000-4000-8000-000000000528', 'Roll back the recent rule via the change record', TRUE,  4),
  -- Q9 (529): route table command
  ('02700000-0000-4000-8000-000000001113', '02700000-0000-4000-8000-000000000529', 'show ip route', TRUE,  1),
  ('02700000-0000-4000-8000-000000001114', '02700000-0000-4000-8000-000000000529', 'ipconfig /all', FALSE, 2),
  ('02700000-0000-4000-8000-000000001115', '02700000-0000-4000-8000-000000000529', 'arp -d', FALSE, 3),
  ('02700000-0000-4000-8000-000000001116', '02700000-0000-4000-8000-000000000529', 'netstat -o', FALSE, 4)
ON CONFLICT (id) DO NOTHING;