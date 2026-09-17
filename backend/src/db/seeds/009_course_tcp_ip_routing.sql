-- ============================================================================
-- SEED 009: Complete course — "TCP/IP & Routing Fundamentals"
-- ----------------------------------------------------------------------------
-- Instructor : Sarah Chen        (10000000-0000-4000-8000-000000000001)
-- Category   : Networking        (20000000-0000-4000-8000-000000000006)
-- Level      : BEGINNER · Access : FREE · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Networking Foundations      → C1 Networks & the OSI Model · C2 IPv4 Addressing & Subnets
--   M2 Core Protocols              → C3 ARP, DNS & DHCP · C4 TCP & UDP in Detail
--   M3 Routing Basics              → C5 Routing Concepts & Static Routes · C6 Routing Protocols (OSPF & RIP)
--   M4 Applications & Operations   → C7 HTTP, NAT & Firewalls · C8 Troubleshooting & Tools
--   M5 Capstone: Small Office Network → C9 Project Setup & Design · C10 Building & Verifying
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
  '90000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '20000000-0000-4000-8000-000000000006',
  'TCP/IP & Routing Fundamentals',
  'tcp-ip-routing-fundamentals',
  'Every open tab, video call, and message you send crosses interconnected networks carried by IP packets. Learn how data really travels — from IPv4 addressing and subnetting to ARP, DNS, DHCP, TCP, UDP, and dynamic routing — then design, build, and verify your own small office network using real command-line tools.',
  'PUBLISHED',
  'BEGINNER',
  'FREE',
  7
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('90000000-0000-4000-8000-000000000011', '90000000-0000-4000-8000-000000000001', 'Explain how data travels across a network using the TCP/IP model and its layers.', 1),
  ('90000000-0000-4000-8000-000000000012', '90000000-0000-4000-8000-000000000001', 'Read and work with IPv4 addresses, subnet masks, and CIDR notation.', 2),
  ('90000000-0000-4000-8000-000000000013', '90000000-0000-4000-8000-000000000001', 'Describe the roles of ARP, DNS, DHCP, TCP, and UDP in real communication.', 3),
  ('90000000-0000-4000-8000-000000000014', '90000000-0000-4000-8000-000000000001', 'Explain how routers forward packets and how static and dynamic routing differ.', 4),
  ('90000000-0000-4000-8000-000000000015', '90000000-0000-4000-8000-000000000001', 'Design, build, and verify a small office network using real diagnostic tools.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('90000000-0000-4000-8000-000000000101', '90000000-0000-4000-8000-000000000001', 1, 'Networking Foundations',     'Understand how devices connect and how the Internet Protocol Suite organizes communication.',  'PUBLISHED'),
  ('90000000-0000-4000-8000-000000000102', '90000000-0000-4000-8000-000000000001', 2, 'Core Protocols',              'Dive into the protocols that move data reliably: ARP, DNS, DHCP, TCP, and UDP.',               'PUBLISHED'),
  ('90000000-0000-4000-8000-000000000103', '90000000-0000-4000-8000-000000000001', 3, 'Routing Basics',              'Learn how decisions are made to send packets across networks, from static routes to dynamic protocols.', 'PUBLISHED'),
  ('90000000-0000-4000-8000-000000000104', '90000000-0000-4000-8000-000000000001', 4, 'Applications & Operations',   'See how applications use the network and how to troubleshoot real connectivity problems.',      'PUBLISHED'),
  ('90000000-0000-4000-8000-000000000105', '90000000-0000-4000-8000-000000000001', 5, 'Capstone: Small Office Network', 'Design, build, and verify a complete small office network end to end.',                       'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('90000000-0000-4000-8000-000000000201', '90000000-0000-4000-8000-000000000101', 1, 'Networks & the OSI Model',        'What a network is and how the OSI model organizes it.',            'PUBLISHED'),
  ('90000000-0000-4000-8000-000000000202', '90000000-0000-4000-8000-000000000101', 2, 'IPv4 Addressing & Subnets',       'IP addresses, binary, and subnetting in plain terms.',            'PUBLISHED'),
  ('90000000-0000-4000-8000-000000000203', '90000000-0000-4000-8000-000000000102', 1, 'ARP, DNS & DHCP',                 'The supporting protocols that make IP usable.',                   'PUBLISHED'),
  ('90000000-0000-4000-8000-000000000204', '90000000-0000-4000-8000-000000000102', 2, 'TCP & UDP in Detail',             'How transport protocols deliver data reliably or quickly.',       'PUBLISHED'),
  ('90000000-0000-4000-8000-000000000205', '90000000-0000-4000-8000-000000000103', 1, 'Routing Concepts & Static Routes','How routers decide where packets go.',                            'PUBLISHED'),
  ('90000000-0000-4000-8000-000000000206', '90000000-0000-4000-8000-000000000103', 2, 'Routing Protocols (OSPF & RIP)',  'How routers learn paths automatically.',                          'PUBLISHED'),
  ('90000000-0000-4000-8000-000000000207', '90000000-0000-4000-8000-000000000104', 1, 'HTTP, NAT & Firewalls',           'Applications on top of the network, and how boundaries are enforced.', 'PUBLISHED'),
  ('90000000-0000-4000-8000-000000000208', '90000000-0000-4000-8000-000000000104', 2, 'Troubleshooting & Tools',         'Real tools for diagnosing connectivity problems.',                'PUBLISHED'),
  ('90000000-0000-4000-8000-000000000209', '90000000-0000-4000-8000-000000000105', 1, 'Project Setup & Design',          'Plan a small office network before touching a single cable.',     'PUBLISHED'),
  ('90000000-0000-4000-8000-000000000210', '90000000-0000-4000-8000-000000000105', 2, 'Building & Verifying',            'Assemble the network and prove it works.',                        'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 90000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('90000000-0000-4000-8000-000000000301', '90000000-0000-4000-8000-000000000201', 1, 'What is a Network?',                    'How devices connect and communicate across LANs and WANs.',                         'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('90000000-0000-4000-8000-000000000302', '90000000-0000-4000-8000-000000000201', 2, 'The OSI Model & the TCP/IP Stack',       'The layers that organize every network conversation.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('90000000-0000-4000-8000-000000000303', '90000000-0000-4000-8000-000000000201', 3, 'Networking Basics Quiz',                 'Check your understanding of networks and the OSI model.',                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('90000000-0000-4000-8000-000000000304', '90000000-0000-4000-8000-000000000202', 1, 'IPv4 Addresses & Binary',                'How IP addresses are written and what they really mean.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('90000000-0000-4000-8000-000000000305', '90000000-0000-4000-8000-000000000202', 2, 'Subnetting & Subnet Masks',              'Splitting networks into subnets with masks and CIDR.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('90000000-0000-4000-8000-000000000306', '90000000-0000-4000-8000-000000000202', 3, 'IPv4 Addressing Quiz',                   'Test your grasp of addresses, binary, and subnetting.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('90000000-0000-4000-8000-000000000307', '90000000-0000-4000-8000-000000000203', 1, 'MAC Addresses & ARP',                    'Hardware addressing and how IP is mapped to Ethernet.',                            'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('90000000-0000-4000-8000-000000000308', '90000000-0000-4000-8000-000000000203', 2, 'DNS & DHCP',                             'Name resolution and automatic IP assignment.',                                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('90000000-0000-4000-8000-000000000309', '90000000-0000-4000-8000-000000000203', 3, 'ARP, DNS & DHCP Quiz',                   'Verify the supporting protocols of a network.',                                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('90000000-0000-4000-8000-000000000310', '90000000-0000-4000-8000-000000000204', 1, 'Ports & Sockets',                        'How transport layer ports identify applications.',                                 'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('90000000-0000-4000-8000-000000000311', '90000000-0000-4000-8000-000000000204', 2, 'TCP vs UDP',                             'Reliable delivery versus speed, side by side.',                                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('90000000-0000-4000-8000-000000000312', '90000000-0000-4000-8000-000000000204', 3, 'TCP & UDP Quiz',                         'Check your transport layer knowledge.',                                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('90000000-0000-4000-8000-000000000313', '90000000-0000-4000-8000-000000000205', 1, 'The Routing Table',                      'How routers choose the next hop for a packet.',                                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('90000000-0000-4000-8000-000000000314', '90000000-0000-4000-8000-000000000205', 2, 'Static Routes & Default Gateways',       'Hand-configured paths and the last-resort route.',                                 'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('90000000-0000-4000-8000-000000000315', '90000000-0000-4000-8000-000000000205', 3, 'Routing Concepts Quiz',                  'Test your understanding of path selection.',                                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('90000000-0000-4000-8000-000000000316', '90000000-0000-4000-8000-000000000206', 1, 'Distance-Vector Routing & RIP',          'Routers sharing hop counts with their neighbors.',                                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('90000000-0000-4000-8000-000000000317', '90000000-0000-4000-8000-000000000206', 2, 'Link-State Routing & OSPF',              'Building a map of the network and finding the shortest paths.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('90000000-0000-4000-8000-000000000318', '90000000-0000-4000-8000-000000000206', 3, 'Routing Protocols Quiz',                 'Check your dynamic routing knowledge.',                                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('90000000-0000-4000-8000-000000000319', '90000000-0000-4000-8000-000000000207', 1, 'HTTP & the Application Layer',           'What happens when a browser talks over TCP.',                                      'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('90000000-0000-4000-8000-000000000320', '90000000-0000-4000-8000-000000000207', 2, 'NAT & Firewalls',                        'Sharing addresses and filtering traffic at the edge.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('90000000-0000-4000-8000-000000000321', '90000000-0000-4000-8000-000000000207', 3, 'Applications & Security Quiz',           'Test how applications and security sit on top of IP.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('90000000-0000-4000-8000-000000000322', '90000000-0000-4000-8000-000000000208', 1, 'ping, traceroute & ICMP',                'Verifying path and round-trip times.',                                             'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('90000000-0000-4000-8000-000000000323', '90000000-0000-4000-8000-000000000208', 2, 'ipconfig, netstat & Digging Deeper',     'Inspecting local state, ports, and DNS lookup failures.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('90000000-0000-4000-8000-000000000324', '90000000-0000-4000-8000-000000000208', 3, 'Troubleshooting Quiz',                   'Check your diagnostic tool knowledge.',                                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('90000000-0000-4000-8000-000000000325', '90000000-0000-4000-8000-000000000209', 1, 'Planning a Small Office Network',        'Requirements, addressing plan, and device layout.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('90000000-0000-4000-8000-000000000326', '90000000-0000-4000-8000-000000000210', 1, 'Building the Network',                   'Cabling, IP assignment, and router configuration.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('90000000-0000-4000-8000-000000000327', '90000000-0000-4000-8000-000000000210', 2, 'Verifying & Hardening the Network',      'Testing connectivity, DNS, and basic security.',                                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('90000000-0000-4000-8000-000000000328', '90000000-0000-4000-8000-000000000210', 3, 'Final Assessment',                       'Prove what you learned across the whole course.',                                  'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 90000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '90000000-0000-4000-8000-000000000401',
  '90000000-0000-4000-8000-000000000301',
  1,
  'What is a Network?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What is a Network?</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>What is a Network?</h1>
  <p>A <strong>computer network</strong> is two or more devices connected so they can exchange data. Your phone, the office printer, a database server, and the router in the closet are all nodes on some network — and when they talk to each other, every conversation uses a shared set of rules called protocols.</p>
  <p>Think of it like the postal service: each device has an <em>address</em> that identifies it, a <em>format</em> for putting messages into envelopes, and a <em>delivery path</em> determined by routing. TCP/IP is the postal system that the entire internet runs on.</p>
  <h2>LANs, WANs, and the internet</h2>
  <table>
    <thead>
      <tr><th>Network type</th><th>Scope</th><th>Example</th></tr>
    </thead>
    <tbody>
      <tr><td>LAN (Local Area Network)</td><td>A single building or office</td><td>Office desktops and printer on a switch</td></tr>
      <tr><td>WAN (Wide Area Network)</td><td>Connects distant sites</td><td>A company HQ linked to a branch office</td></tr>
      <tr><td>The Internet</td><td>The global WAN of WANs</td><td>Every ISP network joined together</td></tr>
    </tbody>
  </table>
  <h2>Devices you will meet</h2>
  <ul>
    <li><strong>Switch</strong> — connects devices on the same LAN and forwards frames by MAC address.</li>
    <li><strong>Router</strong> — joins separate networks and forwards packets by IP address.</li>
    <li><strong>Access point</strong> — bridges wireless clients onto the wired LAN.</li>
    <li><strong>Firewall</strong> — filters traffic between networks based on policy.</li>
    <li><strong>Host</strong> — any device that sends or receives traffic, like a laptop or server.</li>
  </ul>
  <pre class="code-block">[ Laptop ] --\                 /-- [ Web Server ]
                 [ Switch ] -- [ Router ] -- (Internet)
[ Printer ] --/                 \-- [ Firewall ]</pre>
  <div class="callout callout-info">
    <strong>Key idea</strong>
    <p>Switches operate <em>inside</em> a network; routers connect <em>between</em> networks. If a packet must leave the local subnet, a router has to carry it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Throughout this course you will use real commands. On Windows open <span class="ic">cmd</span>; on macOS or Linux open a terminal. Every example works there.</p>
  </div>
  <h2>Why TCP/IP matters</h2>
  <p>The TCP/IP protocol suite (<em>Transmission Control Protocol / Internet Protocol</em>) defines how data is addressed, fragmented, transported, and delivered. Every layer of it will appear in the lessons ahead — start here and build up.</p>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000402',
  '90000000-0000-4000-8000-000000000302',
  1,
  'The OSI Model & the TCP/IP Stack',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The OSI Model &amp; the TCP/IP Stack</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>The OSI Model &amp; the TCP/IP Stack</h1>
  <p>Networking is complex, so it is organized into <strong>layers</strong>. Each layer has one job, talks to the layer above and below it, and hides its internals. The <strong>OSI model</strong> (7 layers) is the classic teaching reference; the <strong>TCP/IP model</strong> condenses it into 4 working layers that maps directly to real protocols.</p>
  <table>
    <thead>
      <tr><th>OSI layer</th><th>TCP/IP layer</th><th>What happens here</th><th>Example</th></tr>
    </thead>
    <tbody>
      <tr><td>7 – Application</td><td>Application</td><td>User-facing data</td><td>HTTP, DNS, SMTP</td></tr>
      <tr><td>6 – Presentation</td><td>Application</td><td>Encoding and encryption</td><td>TLS, JPEG</td></tr>
      <tr><td>5 – Session</td><td>Application</td><td>Dialogue management</td><td>TCP sessions, RPC</td></tr>
      <tr><td>4 – Transport</td><td>Transport</td><td>End-to-end delivery, ports</td><td>TCP, UDP</td></tr>
      <tr><td>3 – Network</td><td>Internet</td><td>Addressing and routing</td><td>IP, ICMP</td></tr>
      <tr><td>2 – Data Link</td><td>Network Access</td><td>Frames on local media</td><td>Ethernet, Wi-Fi</td></tr>
      <tr><td>1 – Physical</td><td>Network Access</td><td>Bits on the wire</td><td>Copper, fiber, radio</td></tr>
    </tbody>
  </table>
  <h2>Layering in action</h2>
  <p>When a browser sends a request, each layer wraps the data with its own header. The receiving host unwraps it layer by layer, like opening Matryoshka dolls:</p>
  <pre class="code-block">[ HTTP request ]                     (application data)
[ TCP header | HTTP request ]        (transport: port + sequence)
[ IP header  | TCP header | ... ]    (internet: source/dest IP)
[ ETH header | IP header | ... ]     (link: source/dest MAC)</pre>
  <h2>The one-page cheat sheet</h2>
  <ul>
    <li><strong>Application</strong> — protocols people use directly (HTTP, DNS, DHCP).</li>
    <li><strong>Transport</strong> — TCP for reliability, UDP for speed. Adds port numbers.</li>
    <li><strong>Internet</strong> — IP addressing and routing across networks.</li>
    <li><strong>Network Access</strong> — moving frames over Ethernet or Wi-Fi.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Mnemonic</strong>
    <p>Remember the 7 OSI layers from bottom to top: <em>Please Do Not Throw Salami Pizza Away</em> — Physical, Data Link, Network, Transport, Session, Presentation, Application.</p>
  </div>
  <div class="callout callout-info">
    <strong>Why this matters</strong>
    <p>When something breaks, engineers isolate the problem to a layer. "Can you ping it?" tests layers 3 and below; "Does the browser load?" tests layers 4-7. Layer-centric thinking is your superpower later in this course.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000403',
  '90000000-0000-4000-8000-000000000304',
  1,
  'IPv4 Addresses & Binary',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IPv4 Addresses &amp; Binary</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>IPv4 Addresses &amp; Binary</h1>
  <p>An <strong>IPv4 address</strong> is a 32-bit number that identifies a host on a network. It is written as <em>dotted decimal</em> — four octets (8-bit groups) separated by dots, like <span class="ic">192.168.1.10</span>. Every octet ranges from 0 to 255.</p>
  <pre class="code-block">192.168.1.10
 = 11000000 . 10101000 . 00000001 . 00001010

Octet 1: 192 = 128 + 64        = 11000000
Octet 2: 168 = 128 + 32 + 8    = 10101000
Octet 3:   1 = 1                = 00000001
Octet 4:  10 = 8 + 2            = 00001010</pre>
  <h2>Two parts: network and host</h2>
  <p>An IP address has two logical halves. The <strong>network</strong> part identifies the subnet; the <strong>host</strong> part identifies a specific device inside it. The <em>subnet mask</em> (covered in the next lesson) marks where the split falls.</p>
  <h2>Special addresses to know</h2>
  <table>
    <thead>
      <tr><th>Address</th><th>Meaning</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">127.0.0.1</span></td><td>Loopback — the host itself</td></tr>
      <tr><td><span class="ic">0.0.0.0</span></td><td>Default / all interfaces, or any address</td></tr>
      <tr><td><span class="ic">255.255.255.255</span></td><td>Directed broadcast on the local subnet</td></tr>
    </tbody>
  </table>
  <h2>Public vs private addresses</h2>
  <p>The IANA reserves ranges that anyone may use freely inside a private network. They are never routed on the public internet:</p>
  <table>
    <thead>
      <tr><th>Private range</th><th>CIDR</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">10.0.0.0 – 10.255.255.255</span></td><td><span class="ic">10.0.0.0/8</span></td></tr>
      <tr><td><span class="ic">172.16.0.0 – 172.31.255.255</span></td><td><span class="ic">172.16.0.0/12</span></td></tr>
      <tr><td><span class="ic">192.168.0.0 – 192.168.255.255</span></td><td><span class="ic">192.168.0.0/16</span></td></tr>
    </tbody>
  </table>
  <h2>Reading a binary octet</h2>
  <p>Bits carry weights from 128 down to 1. Add the weights where the bit is 1:</p>
  <pre class="code-block">1 1 1 1 1 1 1 1   = 128+64+32+16+8+4+2+1 = 255
1 0 1 0 1 0 1 0   = 128+0+32+0+8+0+2+0   = 170
0 0 0 0 0 0 0 1   =                        = 1</pre>
  <div class="callout callout-info">
    <strong>Why binary?</strong>
    <p>Subnetting, wildcard masks, and access-list math all rest on binary. Drill this conversion now and every later lesson becomes easier.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Handy check</strong>
    <p>Run <span class="ic">ipconfig</span> (Windows) or <span class="ic">ip addr</span> (Linux/macOS) to see your own address, subnet mask, and default gateway — real examples make the theory stick.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000404',
  '90000000-0000-4000-8000-000000000305',
  1,
  'Subnetting & Subnet Masks',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Subnetting &amp; Subnet Masks</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Subnetting &amp; Subnet Masks</h1>
  <p>The <strong>subnet mask</strong> tells a host exactly where its network ends and the host part begins. A mask of <span class="ic">255.255.255.0</span> means "the first three octets are the network, the last octet is the host." The same idea is written in <strong>CIDR notation</strong> as a slash and the count of network bits:</p>
  <table>
    <thead>
      <tr><th>CIDR</th><th>Subnet mask</th><th>Host bits</th><th>Usable addresses</th></tr>
    </thead>
    <tbody>
      <tr><td><span class="ic">/8</span></td><td><span class="ic">255.0.0.0</span></td><td>24</td><td>16,777,214</td></tr>
      <tr><td><span class="ic">/16</span></td><td><span class="ic">255.255.0.0</span></td><td>16</td><td>65,534</td></tr>
      <tr><td><span class="ic">/24</span></td><td><span class="ic">255.255.255.0</span></td><td>8</td><td>254</td></tr>
      <tr><td><span class="ic">/25</span></td><td><span class="ic">255.255.255.128</span></td><td>7</td><td>126</td></tr>
      <tr><td><span class="ic">/30</span></td><td><span class="ic">255.255.255.252</span></td><td>2</td><td>2</td></tr>
    </tbody>
  </table>
  <h2>The count rule: 2^n − 2</h2>
  <p>With <span class="ic">n</span> host bits there are <span class="ic">2^n</span> total addresses. Two are never usable for hosts: the <strong>network address</strong> (all host bits 0) and the <strong>broadcast address</strong> (all host bits 1). So usable hosts = <span class="ic">2^n − 2</span>.</p>
  <pre class="code-block">192.168.1.0/24
  Network   : 192.168.1.0
  First host: 192.168.1.1
  Last host : 192.168.1.254
  Broadcast : 192.168.1.255
  Usable    : 254 addresses</pre>
  <h2>A /30 in practice</h2>
  <p>Point-to-point connections between two routers use a /30 to waste nothing — exactly two usable addresses, one for each end:</p>
  <pre class="code-block">10.0.0.0/30
  10.0.0.1  -> router A (WAN interface)
  10.0.0.2  -> router B (WAN interface)
  10.0.0.0  network · 10.0.0.3 broadcast</pre>
  <h2>Why subnet?</h2>
  <ul>
    <li>Contain broadcast traffic so it does not swamp the whole site.</li>
    <li>Isolate departments or security zones from one another.</li>
    <li>Use address space efficiently instead of wasting huge flat ranges.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Practice drill</strong>
    <p>For <span class="ic">10.1.20.0/24</span>, write the network, first host, last host, and broadcast. Then repeat with <span class="ic">/25</span> and verify your answers with any subnet calculator.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000405',
  '90000000-0000-4000-8000-000000000307',
  1,
  'MAC Addresses & ARP',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAC Addresses &amp; ARP</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>MAC Addresses &amp; ARP</h1>
  <p>IP addresses identify hosts across the entire internet, but a frame on an Ethernet cable is delivered using a different identifier: the <strong>MAC address</strong>. A MAC (Media Access Control) address is a 48-bit hardware address burned into every network interface by its manufacturer.</p>
  <pre class="code-block">MAC:   A4:83:E7:0B:1C:3F
       |---| |-------|
      vendor   serial
    (24 bits) (24 bits)</pre>
  <h2>IP vs MAC — who needs which</h2>
  <table>
    <thead>
      <tr><th>Address</th><th>Scope</th><th>Lifetime</th><th>Example</th></tr>
    </thead>
    <tbody>
      <tr><td>IP</td><td>Worldwide (routing)</td><td>Can change (DHCP)</td><td><span class="ic">192.168.1.10</span></td></tr>
      <tr><td>MAC</td><td>Local segment only</td><td>Hardware, permanent</td><td><span class="ic">A4:83:E7:0B:1C:3F</span></td></tr>
    </tbody>
  </table>
  <h2>Address Resolution Protocol (ARP)</h2>
  <p>Before sending to another host on the same subnet, a machine must learn that host's MAC. <strong>ARP</strong> asks the local segment: "Who has 192.168.1.10? Tell 192.168.1.1." The owner replies with its MAC, and the answer is cached.</p>
  <pre class="code-block">Host A                       Host B
  |  ARP request (broadcast)   |
  |  "Who has 192.168.1.10?"  |
  |---------------------------&gt;|
  |  ARP reply (unicast)       |
  |  "A4:83:E7:0B:1C:3F"      |
  |&lt;---------------------------|</pre>
  <h2>Seeing it on your machine</h2>
  <p>Inspect the local ARP cache — the mapping table IP to MAC — on Windows or Linux/macOS:</p>
  <pre class="code-block">arp -a            (Windows, Linux, macOS)

Interface: 192.168.1.1 --- 0x4
  Internet Address      Physical Address      Type
  192.168.1.10          a4-83-e7-0b-1c-3f     dynamic</pre>
  <div class="callout callout-info">
    <strong>Same subnet or not?</strong>
    <p>A host sends directly to the destination MAC only when the destination is on the same subnet. Otherwise the frame goes to the <em>default gateway's</em> MAC, and the router handles the rest.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>A changed MAC or a stale ARP cache can cause baffling connectivity issues. Tools like <span class="ic">arp -d</span> flush specific entries; rebooting clears the whole cache.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000406',
  '90000000-0000-4000-8000-000000000308',
  1,
  'DNS & DHCP',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DNS &amp; DHCP</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>DNS &amp; DHCP</h1>
  <p>Two services make the modern network usable at all. <strong>DNS</strong> (Domain Name System) translates names to numbers — <span class="ic">example.com</span> to an IP address. <strong>DHCP</strong> (Dynamic Host Configuration Protocol) hands out IP settings automatically so you do not configure every device by hand.</p>
  <h2>DNS record types</h2>
  <table>
    <thead>
      <tr><th>Type</th><th>Maps</th><th>Example</th></tr>
    </thead>
    <tbody>
      <tr><td>A</td><td>Name → IPv4</td><td><span class="ic">shop.example.com → 93.184.216.34</span></td></tr>
      <tr><td>AAAA</td><td>Name → IPv6</td><td><span class="ic">shop.example.com → 2606::c00</span></td></tr>
      <tr><td>CNAME</td><td>Name → another name</td><td><span class="ic">www → shop.example.com</span></td></tr>
      <tr><td>MX</td><td>Domain → mail servers</td><td><span class="ic">mail.example.com (priority 10)</span></td></tr>
      <tr><td>PTR</td><td>IP → name (reverse)</td><td><span class="ic">34.216.184.93 → example.com</span></td></tr>
    </tbody>
  </table>
  <pre class="code-block">nslookup example.com            ; what IP answers for the name?
nslookup -type=MX example.com   ; find the mail servers</pre>
  <h2>How a lookup flows</h2>
  <ol>
    <li>Your computer checks its local resolver cache.</li>
    <li>It asks your configured DNS server (often your router or ISP).</li>
    <li>That server queries root, TLD, and authoritative servers as needed.</li>
    <li>The answer is returned and cached for its TTL.</li>
  </ol>
  <h2>DHCP: four steps, remembered as DORA</h2>
  <pre class="code-block">D - Discover : "Is there a DHCP server?"
O - Offer    : "Here is an address you may use."
R - Request  : "I will take 192.168.1.10."
A - Ack      : "Done; here is your lease."</pre>
  <p>A DHCP lease normally includes the <strong>IP address</strong>, <strong>subnet mask</strong>, <strong>default gateway</strong>, and <strong>DNS servers</strong> — a complete boot-up kit for the host.</p>
  <pre class="code-block">ipconfig /release       ; drop the current lease
ipconfig /renew         ; ask DHCP for a fresh one</pre>
  <div class="callout callout-info">
    <strong>Static vs DHCP</strong>
    <p>Servers and printers usually get <em>reservations</em> — a fixed address pinned inside DHCP — so their IP never changes. Ordinary desktops lease addresses dynamically.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Common gotcha</strong>
    <p>"I cannot reach the website" is often DNS, not routing. If ping to an IP works but a browser fails on the name, test name resolution first.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000407',
  '90000000-0000-4000-8000-000000000310',
  1,
  'Ports & Sockets',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ports &amp; Sockets</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Ports &amp; Sockets</h1>
  <p>An IP address finds the <em>host</em>; a <strong>port</strong> finds the <em>application</em> on that host. The transport layer (TCP and UDP) labels every conversation with a 16-bit port number, from 0 to 65,535. The combination of an address and a port is a <strong>socket</strong>:</p>
  <pre class="code-block">socket  =  IP address : port
example =  192.168.1.10:443</pre>
  <h2>Well-known ports</h2>
  <table>
    <thead>
      <tr><th>Port</th><th>Protocol</th><th>Service</th></tr>
    </thead>
    <tbody>
      <tr><td>21</td><td>TCP</td><td>FTP</td></tr>
      <tr><td>22</td><td>TCP</td><td>SSH</td></tr>
      <tr><td>25</td><td>TCP</td><td>SMTP (email)</td></tr>
      <tr><td>53</td><td>UDP/TCP</td><td>DNS</td></tr>
      <tr><td>80</td><td>TCP</td><td>HTTP</td></tr>
      <tr><td>443</td><td>TCP</td><td>HTTPS</td></tr>
      <tr><td>3389</td><td>TCP</td><td>RDP (Windows Remote Desktop)</td></tr>
    </tbody>
  </table>
  <p>Ports below 1024 are <em>well-known</em> and generally reserved for system services. Applications pick ephemeral ports (49,152+ on modern systems) for the client side of a connection.</p>
  <h2>Two sides of one connection</h2>
  <p>A web request has two sockets: the server listens on <span class="ic">0.0.0.0:443</span>, and your browser uses a random local source port, like <span class="ic">192.168.1.10:52400</span>. Together they form the full conversation endpoints.</p>
  <pre class="code-block">netstat -an        ; list active TCP/UDP sockets

Proto  Local Address          Foreign Address        State
TCP    192.168.1.10:52400     93.184.216.34:443      ESTABLISHED</pre>
  <div class="callout callout-info">
    <strong>Listen</strong>
    <p>A service in state <span class="ic">LISTENING</span> waits on a port for connections. State <span class="ic">ESTABLISHED</span> means an active conversation exists. These cues drive almost every troubleshooting session later.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Security note</strong>
    <p>Every open listener is an exposed surface. Fewer listening ports means fewer attacks — a theme the firewall lesson will build on.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000408',
  '90000000-0000-4000-8000-000000000311',
  1,
  'TCP vs UDP',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TCP vs UDP</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>TCP vs UDP</h1>
  <p>The transport layer offers two personalities. <strong>TCP</strong> guarantees delivery, order, and error checking at the cost of overhead. <strong>UDP</strong> is minimal: fire the datagram and hope it arrives. Choosing the right one is a design decision made by each application.</p>
  <table>
    <thead>
      <tr><th>Feature</th><th>TCP</th><th>UDP</th></tr>
    </thead>
    <tbody>
      <tr><td>Connection</td><td>Connection-oriented</td><td>Connectionless</td></tr>
      <tr><td>Reliability</td><td>Retransmits lost data</td><td>None, best effort</td></tr>
      <tr><td>Ordering</td><td>Sequenced packets</td><td>No ordering guarantee</td></tr>
      <tr><td>Overhead</td><td>Higher (flags, windows, ACKs)</td><td>Lower (8-byte header)</td></tr>
      <tr><td>Typical use</td><td>Web, email, SSH, file transfer</td><td>DNS, video, voice, gaming</td></tr>
    </tbody>
  </table>
  <h2>The three-way handshake</h2>
  <p>TCP opens every session with three exchanges. This is why a web page is slower to start than a ping:</p>
  <pre class="code-block">Client                Server
  |  SYN ------------&gt; |
  | &lt;------------ SYN-ACK |
  |  ACK ------------&gt; |
  |  (connection open) |
  |  data -----------&gt; |</pre>
  <h2>TCP guarantees in action</h2>
  <p>Each segment carries a <strong>sequence number</strong>. If an ACK is missing, the sender retransmits. The receive window prevents a fast sender from flooding a slow receiver. Together these make TCP look like a reliable pipe over an unreliable network.</p>
  <h2>When UDP wins</h2>
  <p>In a video call, a few lost frames matter less than waiting for retransmission. DNS, which answers in one round trip, uses UDP by default for the same reason. Speed beats repair where fresh data arrives constantly.</p>
  <div class="callout callout-info">
    <strong>Remember</strong>
    <p>Both protocols still use IP underneath and still carry port numbers. TCP adds the sequence numbers, ACKs, and flow control that make it reliable.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Watch a session</strong>
    <p>Leave <span class="ic">netstat -an</span> running while you load a website and you will see SYN, ESTABLISHED, then the port pair closing — TCP storytelling in real time.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000409',
  '90000000-0000-4000-8000-000000000313',
  1,
  'The Routing Table',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Routing Table</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>The Routing Table</h1>
  <p>Routing is <em>path selection</em>. A router answers one question for every packet: "Which neighbor moves this packet closest to its destination?" The answer lives in a <strong>routing table</strong> — a list of destination networks paired with the next hop.</p>
  <h2>Anatomy of a route</h2>
  <pre class="code-block">Destination    Mask/Gateway     Interface     Metric
  0.0.0.0/0      192.168.1.1     WAN          0
  10.1.0.0/16    192.168.1.250   LAN          1
  192.168.1.0/24 connected       LAN          0</pre>
  <ul>
    <li><strong>Destination</strong> — the network prefix the route serves.</li>
    <li><strong>Next hop</strong> — the neighbor to hand the packet to.</li>
    <li><strong>Interface</strong> — the local port used to reach that neighbor.</li>
    <li><strong>Metric</strong> — a cost; lower generally wins between two routes.</li>
  </ul>
  <h2>Connected, static, dynamic</h2>
  <table>
    <thead>
      <tr><th>Route source</th><th>How it appears</th></tr>
    </thead>
    <tbody>
      <tr><td>Connected</td><td>Automatically, for each directly attached subnet.</td></tr>
      <tr><td>Static</td><td>Typed by an administrator, one route at a time.</td></tr>
      <tr><td>Dynamic</td><td>Learned automatically from routing protocols (RIP, OSPF).</td></tr>
    </tbody>
  </table>
  <h2>Longest prefix match</h2>
  <p>When several entries match a packet's destination, the router uses the <strong>most specific</strong> one — the longest network prefix:</p>
  <pre class="code-block">Packet to 10.1.2.5 matches both routes below; /16 wins:

  10.0.0.0/8   -> next hop A
  10.1.0.0/16  -> next hop B   (chosen — more specific)</pre>
  <p>The <strong>default route</strong> <span class="ic">0.0.0.0/0</span> is the least specific entry of all — the last resort when nothing else matches.</p>
  <pre class="code-block">route print        ; Windows routing table
netstat -rn        ; Linux/macOS and Windows routing table</pre>
  <div class="callout callout-info">
    <strong>Mental model</strong>
    <p>Routing is not a map of the whole internet — it is a series of local decisions. Each router only knows the next hop and trusts the chain to deliver.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Try it</strong>
    <p>Run <span class="ic">route print</span> on your machine. Notice the default route pointing at your gateway — that single line is why your whole computer can reach the world.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000410',
  '90000000-0000-4000-8000-000000000314',
  1,
  'Static Routes & Default Gateways',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Static Routes &amp; Default Gateways</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Static Routes &amp; Default Gateways</h1>
  <p>A <strong>static route</strong> is a path an administrator types by hand. It never changes until someone changes it — no protocol chatter, no surprises, and full control. The trade-offs are exactly as you would expect: predictable but labor-intensive on large networks.</p>
  <h2>The default gateway</h2>
  <p>Every host needs a way out of its own subnet. The <strong>default gateway</strong> is the router on the local segment that answers the question "where do I send everything I cannot reach directly?" It is implemented as a static default route: <span class="ic">0.0.0.0/0</span>.</p>
  <pre class="code-block"># Host 192.168.1.50 on a /24
ip route add default via 192.168.1.1

  0.0.0.0/0 -> 192.168.1.1   (the router)</pre>
  <h2>When to add a static route</h2>
  <p>Small sites, simple topologies, and branches with one link to the core are perfect static candidates. Suppose two routers connect two offices:</p>
  <pre class="code-block"># On office A router, reach the 10.2.0.0/16 LAN
# through the point-to-point link to office B:
ip route add 10.2.0.0/16 via 10.0.0.2</pre>
  <h2>Static route types at a glance</h2>
  <table>
    <thead>
      <tr><th>Route</th><th>Meaning</th></tr>
    </thead>
    <tbody>
      <tr><td>Default</td><td><span class="ic">0.0.0.0/0</span> — catch-all for everything unknown.</td></tr>
      <tr><td>Network</td><td>A specific remote subnet, like <span class="ic">10.2.0.0/16</span>.</td></tr>
      <tr><td>Host</td><td>A single host, like <span class="ic">10.2.5.1/32</span> (rarely needed).</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Direction matters</strong>
    <p>Routes are directional. If office A has a route to office B, office B still needs its own route back. A missing return route causes the classic "can ping one way but not the other" mystery.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Good hygiene</strong>
    <p>Document every static route you add. They look obvious on Tuesday and confusing in six weeks — a comment in the config saves the next engineer hours.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000411',
  '90000000-0000-4000-8000-000000000316',
  1,
  'Distance-Vector Routing & RIP',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Distance-Vector Routing &amp; RIP</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Distance-Vector Routing &amp; RIP</h1>
  <p>Hand-typing every route stops working beyond a handful of routers, so dynamic protocols let routers <em>learn</em> paths from each other. The simplest family, <strong>distance vector</strong>, works on a rumor: each router tells its neighbors what it knows, in the form "destination, distance." The most famous member is <strong>RIP</strong>.</p>
  <h2>The core idea</h2>
  <pre class="code-block">Neighbor B tells router A: "I can reach 10.2.0.0/16, distance 2."
A adds its link cost (1 hop)      = distance 3
If no better route exists, A uses B as the next hop.</pre>
  <p>Distance vector has no map — every router only knows the vector (direction + distance) its neighbors advertise. It converges gradually, advertising updates to neighbors on a timer.</p>
  <h2>RIP specifics</h2>
  <ul>
    <li><strong>Metric</strong> — hop count. Simple and crude.</li>
    <li><strong>Maximum</strong> — 15 hops. A 16-hop network is declared unreachable.</li>
    <li><strong>Update</strong> — neighbors trade the full table every 30 seconds.</li>
    <li><strong>Usage</strong> — tiny networks today; mostly educational and legacy.</li>
  </ul>
  <pre class="code-block"># Enable RIP (conceptual IOS-style configuration)
router rip
  version 2
  network 192.168.1.0
  network 10.1.0.0</pre>
  <h2>The counting problem</h2>
  <p>If a link dies, neighbors keep advertising the old path in a loop, incrementing the hop count every few seconds — <strong>count to infinity</strong> — until the 16-rip threshold finally marks the route dead. Split horizon and route poisoning are two of the fixes invented for it.</p>
  <div class="callout callout-info">
    <strong>Trade-off</strong>
    <p>Simple to configure, modest CPU and memory, but slow to converge and scale-limited. RIP works beautifully on a small office; it falls apart on a campus or an ISP.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Modern cousin</strong>
    <p>Spiritually, RIP paved the way for EIGRP and the BGP distance concepts. Learn the rules here and the fancier protocols behave more predictably.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000412',
  '90000000-0000-4000-8000-000000000317',
  1,
  'Link-State Routing & OSPF',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Link-State Routing &amp; OSPF</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Link-State Routing &amp; OSPF</h1>
  <p>Where distance vector trades rumors, <strong>link-state routing</strong> builds the truth. Every router collects information about every link in the network, assembles a complete graph, and computes the best paths itself.</p>
  <h2>How it works</h2>
  <ol>
    <li><strong>Discover neighbors</strong> — each router says hello to the routers it can reach directly.</li>
    <li><strong>Flood the map</strong> — Link State Advertisements (LSAs) circulate so everyone holds the same topology.</li>
    <li><strong>Run SPF</strong> — Dijkstra's shortest-path-first algorithm converts the graph into a routing tree.</li>
    <li><strong>Install routes</strong> — the best path to each network becomes a routing table entry.</li>
  </ol>
  <p>Because every router has the full picture, it converges fast and can keep loops from forming. <strong>OSPF</strong> (Open Shortest Path First) is the flagship link-state protocol and the default choice for mid-size and enterprise networks.</p>
  <h2>OSPF details</h2>
  <ul>
    <li><strong>Metric</strong> — cost, typically derived from link bandwidth (faster link = lower cost).</li>
    <li><strong>Areas</strong> — networks are split into areas to scale; area 0 is the backbone.</li>
    <li><strong>Update</strong> — incremental: only changes trigger floods, not a full table every 30 seconds.</li>
  </ul>
  <pre class="code-block"># Enable OSPF (conceptual IOS-style configuration)
router ospf 1
  network 10.1.0.0 0.0.255.255 area 0
  network 192.168.1.0 0.0.0.255 area 0</pre>
  <h2>RIP vs OSPF in one table</h2>
  <table>
    <thead>
      <tr><th>Feature</th><th>RIP</th><th>OSPF</th></tr>
    </thead>
    <tbody>
      <tr><td>Family</td><td>Distance vector</td><td>Link state</td></tr>
      <tr><td>Metric</td><td>Hop count</td><td>Cost (bandwidth)</td></tr>
      <tr><td>Topology view</td><td>None, just neighbors</td><td>Full network map</td></tr>
      <tr><td>Convergence</td><td>Slow (count to infinity)</td><td>Fast</td></tr>
      <tr><td>Scale</td><td>Small (max 15 hops)</td><td>Large, area-based</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Why SPF wins</strong>
    <p>Knowing the whole network lets OSPF choose genuinely optimal paths and avoid loops by design — without the poisoned rumors RIP needs to stay sane.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Real life</strong>
    <p>The internet itself is stitched together with BGP between organizations, but inside a single large organization, OSPF is far and away the most common internal protocol you will meet.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000413',
  '90000000-0000-4000-8000-000000000319',
  1,
  'HTTP & the Application Layer',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HTTP &amp; the Application Layer</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>HTTP &amp; the Application Layer</h1>
  <p><strong>HTTP</strong> (Hypertext Transfer Protocol) is the application-layer language of the web. A browser sends an HTTP <em>request</em>; a web server replies with an HTTP <em>response</em>. Underneath, every HTTP exchange rides over a TCP connection to port 80 — or port 443 when protected by TLS (HTTPS).</p>
  <pre class="code-block">Request
  GET /courses/tcp-ip HTTP/1.1
  Host: academy.example.com
  User-Agent: Mozilla/5.0

Response
  HTTP/1.1 200 OK
  Content-Type: text/html
  Content-Length: 5321

  &lt;html&gt;&lt;body&gt;Learning TCP/IP&lt;/body&gt;&lt;/html&gt;</pre>
  <h2>Common methods</h2>
  <table>
    <thead>
      <tr><th>Method</th><th>Purpose</th></tr>
    </thead>
    <tbody>
      <tr><td>GET</td><td>Fetch a resource (read only).</td></tr>
      <tr><td>POST</td><td>Submit data, often creating a resource.</td></tr>
      <tr><td>PUT</td><td>Replace a resource entirely.</td></tr>
      <tr><td>DELETE</td><td>Remove a resource.</td></tr>
      <tr><td>HEAD</td><td>Fetch only the headers, no body.</td></tr>
    </tbody>
  </table>
  <h2>Status codes you will actually meet</h2>
  <table>
    <thead>
      <tr><th>Code</th><th>Meaning</th></tr>
    </thead>
    <tbody>
      <tr><td>200</td><td>OK — the request succeeded.</td></tr>
      <tr><td>301</td><td>Moved permanently — the resource relocated.</td></tr>
      <tr><td>403</td><td>Forbidden — you may not access it.</td></tr>
      <tr><td>404</td><td>Not found — nothing lives at that URL.</td></tr>
      <tr><td>500</td><td>Server error — the application on the server failed.</td></tr>
    </tbody>
  </table>
  <h2>Stateless but session-full</h2>
  <p>HTTP itself remembers nothing between requests. Sites recreate state in two ways: <strong>cookies</strong> stored by the browser, and <strong>sessions</strong> kept on the server keyed by those cookies.</p>
  <div class="callout callout-info">
    <strong>Layers recap</strong>
    <p>Type a URL and the whole stack runs: DNS resolves the name, TCP opens the session through three-way handshake, TLS encrypts it, HTTP carries the request, and IP routes every segment through the internet. One page load, every layer.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Try it for real</strong>
    <p>Open a browser console or run <span class="ic">curl -v https://example.com</span>. You will see the DNS lookup, TCP handshake, TLS negotiation, and HTTP response printed in order — a complete layer tour in one command.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000414',
  '90000000-0000-4000-8000-000000000320',
  1,
  'NAT & Firewalls',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NAT &amp; Firewalls</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>NAT &amp; Firewalls</h1>
  <p>Two devices defend and multiply the modern network's address space. <strong>NAT</strong> lets an entire office share one public IP. A <strong>firewall</strong> decides what traffic may cross the boundary in the first place.</p>
  <h2>NAT: one public, many private</h2>
  <p>Private ranges (<span class="ic">192.168.x.x</span>, <span class="ic">10.x.x.x</span>) are not routable on the internet. NAT rewrites the source address as packets leave, swapping the private IP for the router's public one, and tracks the mapping to return replies correctly. <strong>PAT</strong> (a form of NAT) adds the source port to the table, letting thousands of sessions share a single address.</p>
  <pre class="code-block">Inside (private)                 Outside (public)
 192.168.1.50:52000  --&gt;  203.0.113.9:52000
      reply          &lt;--  203.0.113.9:52000
        (mapping kept in the NAT table)</pre>
  <table>
    <thead>
      <tr><th>NAT flavor</th><th>Use case</th></tr>
    </thead>
    <tbody>
      <tr><td>Source NAT / PAT</td><td>Internet access for private hosts.</td></tr>
      <tr><td>Destination NAT</td><td>Forward an external port to an internal server (port forwarding).</td></tr>
      <tr><td>One-to-one</td><td>Map a public IP to a specific internal server.</td></tr>
    </tbody>
  </table>
  <h2>Firewalls: policy at the edge</h2>
  <p>A firewall inspects each packet against rules and permits or drops it. Stateful firewalls track ongoing connections so a reply to an allowed conversation returns without a separate rule.</p>
  <pre class="code-block"># Conceptual rule set
allow out   203.0.113.9 any 443      ; staff HTTPS out
allow in    any 203.0.113.9 443      ; public web service
allow in    any 203.0.113.9 22       ; admin SSH (restricted hosts)
deny  all   any any any              ; everything else</pre>
  <h2>Defense in layers</h2>
  <ul>
    <li>An <strong>edge firewall</strong> separates the LAN from the internet.</li>
    <li>Host firewalls (Windows Defender Firewall, iptables, ufw) guard each machine.</li>
    <li>Segments split traffic: guest Wi-Fi never reaches the finance subnet.</li>
  </ul>
  <div class="callout callout-info">
    <strong>NAT is not security</strong>
    <p>Often misread as a firewall because it hides hosts, NAT only translates addresses. Real protection still comes from explicit firewall rules.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Least privilege</strong>
    <p>Expose the smallest possible surface: only the ports a service truly needs, only to the source ranges that should reach them, deny everything else.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000415',
  '90000000-0000-4000-8000-000000000322',
  1,
  'ping, traceroute & ICMP',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ping, traceroute &amp; ICMP</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>ping, traceroute &amp; ICMP</h1>
  <p>The quickest way to test a network is <strong>ICMP</strong> (Internet Control Message Protocol), IP's built-in messenger. It carries status reports and the two workhorses of troubleshooting: echo request/reply (<span class="ic">ping</span>) and time-exceeded messages that <span class="ic">traceroute</span> exploits.</p>
  <h2>ping — is it alive, and how fast?</h2>
  <p>ping sends an echo request and waits for a reply, timing every round trip:</p>
  <pre class="code-block">ping 8.8.8.8

64 bytes from 8.8.8.8: icmp_seq=1 ttl=116 time=12.3 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=116 time=11.8 ms
--- 8.8.8.8 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss</pre>
  <ul>
    <li><strong>Replies</strong> — the host is reachable at layer 3.</li>
    <li><strong>Request timed out</strong> — no route, host down, or the host drops ICMP.</li>
    <li><strong>TTL</strong> — how many hops the packet survived; it begins at 64, 128, or 255.</li>
  </ul>
  <h2>traceroute — the actual path</h2>
  <p>traceroute sends packets that expire one hop away, then two, then three. Each time it learns the router that reported the packet dead, so the full chain appears:</p>
  <pre class="code-block">traceroute academy.example.com   ; traceroute / tracert

 1  192.168.1.1         1.1 ms
 2  203.0.113.5         5.2 ms
 3  core-nyc.example.net 9.8 ms
 4  * * *               ; no replies (often fine)</pre>
  <p><span class="ic">tracert</span> is the Windows spelling. Rows of asterisks mean those hops do not answer ICMP — not that the path is broken.</p>
  <h2>Reading results like a pro</h2>
  <table>
    <thead>
      <tr><th>Observation</th><th>Likely cause</th></tr>
    </thead>
    <tbody>
      <tr><td>ping fails only by name</td><td>DNS problem, not connectivity</td></tr>
      <tr><td>ping fails to gateway too</td><td>Local link or cable / Wi-Fi issue</td></tr>
      <tr><td>trace dies at hop 2 consistently</td><td>Path stops past your edge router</td></tr>
      <tr><td>Pings succeed, page fails</td><td>Application, port, or firewall issue</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Layer check</strong>
    <p>ping tests the Internet layer (IP/ICMP). Success there does not prove a web server works — that needs a TCP test, which comes next.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Loopback first</strong>
    <p>Before suspecting the network, verify the stack itself: <span class="ic">ping 127.0.0.1</span> should always answer. If it does not, the problem is the host, not the network.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000416',
  '90000000-0000-4000-8000-000000000323',
  1,
  'ipconfig, netstat & Digging Deeper',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ipconfig, netstat &amp; Digging Deeper</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>ipconfig, netstat &amp; Digging Deeper</h1>
  <p>Once you know the command set, most troubleshooting follows a script: inspect the local interface, check the ports in play, then test DNS. These three tools cover all of it.</p>
  <h2>1. Your own interface — ipconfig</h2>
  <pre class="code-block">ipconfig            ; Windows (Linux/macOS: ip addr)
ipconfig /all       ; full detail incl. DHCP and DNS

Ethernet adapter LAN:
   IPv4 Address . . : 192.168.1.50
   Subnet Mask  . . : 255.255.255.0
   Default Gateway  : 192.168.1.1</pre>
  <p>Answer three questions first: Do you have an address? Is it on the right subnet? Does the gateway match the plan? An errant <span class="ic">169.254.x.x</span> (APIPA) address means DHCP never answered.</p>
  <h2>2. What is actually happening — netstat</h2>
  <pre class="code-block">netstat -an         ; all sockets, numeric ports
netstat -an | findstr :443   ; Windows: filter HTTPS
netstat -an | grep ':80'     ; Linux/macOS</pre>
  <p><span class="ic">LISTENING</span> reveals services waiting; <span class="ic">ESTABLISHED</span> shows live conversations. A wanted port missing from <span class="ic">LISTENING</span> means the service is not running — not a routing problem.</p>
  <h2>3. Names — DNS lookups</h2>
  <pre class="code-block">nslookup academy.example.com    ; classic lookups
; Linux/macOS also: dig academy.example.com

ipconfig /flushdns  ; clear the local DNS cache (Windows)
sudo dscacheutil -flushcache    ; macOS</pre>
  <p>If the lookup returns the wrong answer or times out, suspect the DNS server setting, a broken resolver, or the DHCP lease that provided it.</p>
  <h2>The one-shot toolbox</h2>
  <table>
    <thead>
      <tr><th>Tool</th><th>Answers</th></tr>
    </thead>
    <tbody>
      <tr><td>ping / tracert</td><td>Path and reachability at the IP layer</td></tr>
      <tr><td>ipconfig</td><td>My address, mask, gateway, DNS</td></tr>
      <tr><td>netstat</td><td>Listening services and open connections</td></tr>
      <tr><td>nslookup / dig</td><td>Name resolution results</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Work top-down</strong>
    <p>Check the interface, then the DNS, then the route, then the port. Eliminating layers in order turns a scary outage into a 30-second diagnosis.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Change discipline</strong>
    <p>Flush caches, renew leases, and change DNS settings one at a time. Test after each change so you always know what actually fixed it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000417',
  '90000000-0000-4000-8000-000000000325',
  1,
  'Planning a Small Office Network',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Planning a Small Office Network</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Planning a Small Office Network</h1>
  <p>Time to tie the whole course together. Your capstone: connect a small office — about a dozen employees, one shared printer, a file server, and guest Wi-Fi — to the internet as securely and simply as possible. Sketching the plan is the entire goal of this lesson.</p>
  <h2>1. List the requirements</h2>
  <table>
    <thead>
      <tr><th>Need</th><th>Solutions it drives</th></tr>
    </thead>
    <tbody>
      <tr><td>12 staff workstations</td><td>Wired LAN for desktops</td></tr>
      <tr><td>Shared printer</td><td>A static (reserved) address</td></tr>
      <tr><td>File server</td><td>A static (reserved) address</td></tr>
      <tr><td>Guests on Wi-Fi</td><td>A separate VLAN/subnet, no LAN access</td></tr>
      <tr><td>Internet for all</td><td>Edge router with NAT and firewall</td></tr>
    </tbody>
  </table>
  <h2>2. Choose an addressing plan</h2>
  <pre class="code-block">Office LAN   : 192.168.10.0/24   (254 usable hosts)
Guest Wi-Fi  : 192.168.20.0/24   (isolated)
Interconnect : 10.0.0.0/30       (router to router)

Gateway        : 192.168.10.1
File server    : 192.168.10.10   (DHCP reservation)
Printer        : 192.168.10.11   (DHCP reservation)
DHCP pool      : 192.168.10.100 - 192.168.10.200</pre>
  <h2>3. Draw the topology</h2>
  <pre class="code-block">                    (Internet)
                        |
                   [Edge Router/Firewall]  192.168.10.1
                 /                        \
        [Switch A]                [Guest AP/Segment]
         /   |   \                   192.168.20.0/24
   [Desktops] [Printer]          (isolated from LAN)
        |
   [File Server 192.168.10.10]</pre>
  <p>Guests must reach only the internet — no route from <span class="ic">192.168.20.0/24</span> back into the office LAN, plus a firewall rule enforcing it.</p>
  <h2>4. Plan the config values</h2>
  <ul>
    <li>LAN DHCP hands out address, mask, gateway, and DNS.</li>
    <li>DNS: your ISP or a public resolver like <span class="ic">1.1.1.1</span>.</li>
    <li>Edge firewall: allow established traffic plus outbound web; block everything else inbound.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Why plan first?</strong>
    <p>Assigning addresses by hand in the field is how conflicts and duplicated printers are born. A written plan turns the build into following instructions.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Leave room</strong>
    <p>A /24 gives 254 addresses for a 12-person office for a reason: future growth, IoT devices, and security zones all want addresses. Sizing generously now avoids renumbering later.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000418',
  '90000000-0000-4000-8000-000000000326',
  1,
  'Building the Network',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building the Network</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Building the Network</h1>
  <p>The plan is approved; now assemble the hardware. The build order always wins when you start at the edge and work inward: modem/internet, then the edge router, then the switch, then the hosts.</p>
  <h2>1. The physical layer</h2>
  <pre class="code-block">Internet -- [ISP modem] -- [Edge router] -- [Switch] -- [hosts]
                                  \---- [Guest segment]</pre>
  <ul>
    <li>Patch cables: <span class="ic">T568B</span> on both ends (straight-through) from host to switch.</li>
    <li>Connect the modem to the router's WAN/<span class="ic">INTERNET</span> port.</li>
    <li>Connect the switch to a router LAN port; watch link lights on every port.</li>
  </ul>
  <h2>2. Edge router configuration</h2>
  <p>Configure LAN IP, DHCP, and NAT either in a web admin panel or on the CLI. The values mirror the plan exactly:</p>
  <pre class="code-block">interface lan
  ip address 192.168.10.1 255.255.255.0
!
ip dhcp pool office
  network 192.168.10.0 255.255.255.0
  default-router 192.168.10.1
  dns-server 1.1.1.1
  lease 1 0 0
!
ip dhcp excluded-address 192.168.10.1 192.168.10.99
ip dhcp excluded-address 192.168.10.201 192.168.10.254
!
ip route 0.0.0.0 0.0.0.0 &lt;isp-gateway&gt;   ; default route out</pre>
  <h2>3. Reservations for services</h2>
  <p>Pin the file server and printer to fixed addresses so users and rules always find them. Reserve by MAC address inside DHCP: <span class="ic">192.168.10.10</span> for the server, <span class="ic">192.168.10.11</span> for the printer.</p>
  <h2>4. Guest segment isolation</h2>
  <pre class="code-block">! Guest network is a separate subnet with no route back
interface guest
  ip address 192.168.20.1 255.255.255.0
!
! NAT guests to the internet, but do not advertise a
! route from the office LAN into the guest subnet</pre>
  <div class="callout callout-info">
    <strong>Order of operations</strong>
    <p>Verify each link as you go: after each cable, check the link light; after the router config, ping the gateway from one host. Building and testing in steps localizes any mistake instantly.</p>
  </div>
  <div class="callout callout-tip">
    <strong>DHCP gut check</strong>
    <p>After configuration, have one workstation run <span class="ic">ipconfig /release</span> then <span class="ic">ipconfig /renew</span>. A clean lease with the right <span class="ic">192.168.10.x</span>, mask, gateway, and DNS confirms the core is alive.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '90000000-0000-4000-8000-000000000419',
  '90000000-0000-4000-8000-000000000327',
  1,
  'Verifying & Hardening the Network',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Verifying &amp; Hardening the Network</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #3730a3; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #fef3c7; border-left: 4px solid #f59e0b; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #3730a3; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>

</head>
<body>
<div class="lesson-page">
  <h1>Verifying &amp; Hardening the Network</h1>
  <p>A network is only finished when it is <em>proven</em> to work and reasonably protected. This lesson runs the verification ladder from your own desktop to the internet, then locks the doors.</p>
  <h2>1. The verification ladder</h2>
  <pre class="code-block">ping 127.0.0.1          ; my own stack
ping 192.168.10.1        ; my gateway
ping 192.168.10.10       ; file server on the LAN
nslookup academy.example.com ; DNS resolution still works
ping academy.example.com ; name-based reachability
curl -v https://academy.example.com ; end-to-end web test</pre>
  <p>Each step that works eliminates a layer. The moment one fails, you know exactly where to look: cable, DHCP, routing, or application.</p>
  <h2>2. Keep an eye on the obvious</h2>
  <table>
    <thead>
      <tr><th>State</th><th>Interpretation</th></tr>
    </thead>
    <tbody>
      <tr><td>Lease shows correct subnet and gateway</td><td>DHCP healthy</td></tr>
      <tr><td>nslookup returns the right IP</td><td>DNS healthy</td></tr>
      <tr><td>Port 443 answers with a valid page</td><td>Web service healthy</td></tr>
    </tbody>
  </table>
  <h2>3. Hardening checklist</h2>
  <ul>
    <li>Change every default password on routers, switches, and the printer.</li>
    <li>Disable remote admin from the internet; manage the router over its LAN only.</li>
    <li>Turn off WPS and set guest Wi-Fi to its own SSID with isolation.</li>
    <li>Block outbound to nothing needed; deny all inbound unless a rule exists.</li>
    <li>Check for open ports: <span class="ic">netstat -an</span> shows listeners from the local side.</li>
  </ul>
  <pre class="code-block"># Firewall essence for the edge
allow established,related
allow outbound http(s) and dns from office LAN
allow inbound https to public web server only
deny everything else inbound and outbound</pre>
  <div class="callout callout-info">
    <strong>Document it</strong>
    <p>Write down the addressing plan, the passwords storage policy, and the rule list. The next engineer — possibly future you — will be grateful.</p>
  </div>
  <div class="callout callout-tip">
    <strong>You built a network</strong>
    <p>LAN, addressing, DHCP, DNS, NAT, routing, firewall, and verification — that is a complete small office build. Congratulations, and finish the journey with the final assessment.</p>
  </div>
</div>
</body>
</html>
$html$
)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 6. QUIZZES (9 quiz lessons, 29 questions)
--    Q1 → lesson L3  (501) · Q2 → L6 (502) · Q3 → L9 (503) · Q4 → L12 (504)
--    Q5 → L15 (505)  · Q6 → L18 (506) · Q7 → L21 (507) · Q8 → L24 (508)
--    Q9 → L28 (509)
-- ----------------------------------------------------------------------------

INSERT INTO quizzes (id, lesson_id, question, explanation, position) VALUES
  ('90000000-0000-4000-8000-000000000501', '90000000-0000-4000-8000-000000000303',
   'Which protocol is responsible for addressing and routing packets across networks?',
   'The Internet Protocol handles addressing and forwarding of packets between networks.', 1),
  ('90000000-0000-4000-8000-000000000502', '90000000-0000-4000-8000-000000000303',
   'Which device forwards packets between different networks based on IP addresses?',
   'Routers inspect IP addresses and consult routing tables to forward packets between networks.', 2),
  ('90000000-0000-4000-8000-000000000503', '90000000-0000-4000-8000-000000000303',
   'What does a MAC address identify?',
   'A MAC address is the hardware address of a network interface, unique on the local segment.', 3),
  ('90000000-0000-4000-8000-000000000504', '90000000-0000-4000-8000-000000000306',
   'How many bits long is an IPv4 address?',
   'An IPv4 address is 32 bits, normally written as four octets in dotted decimal.', 1),
  ('90000000-0000-4000-8000-000000000505', '90000000-0000-4000-8000-000000000306',
   'Which subnet mask corresponds to a /24 prefix?',
   'A /24 prefix sets the first 24 bits, which is the mask 255.255.255.0.', 2),
  ('90000000-0000-4000-8000-000000000506', '90000000-0000-4000-8000-000000000306',
   'Which range is reserved for private use and commonly seen on home LANs?',
   'The 192.168.0.0/16 block is private and is never routed on the public internet.', 3),
  ('90000000-0000-4000-8000-000000000507', '90000000-0000-4000-8000-000000000309',
   'Which protocol maps an IP address to a MAC address on a local network?',
   'ARP, the Address Resolution Protocol, resolves IP addresses into MAC addresses.', 1),
  ('90000000-0000-4000-8000-000000000508', '90000000-0000-4000-8000-000000000309',
   'Which DNS record maps a host name to an IPv4 address?',
   'An A record translates a host name such as shop.example.com into an IPv4 address.', 2),
  ('90000000-0000-4000-8000-000000000509', '90000000-0000-4000-8000-000000000309',
   'Which protocol hands out IP configuration automatically?',
   'DHCP assigns an IP address, mask, gateway, and DNS settings to hosts automatically.', 3),
  ('90000000-0000-4000-8000-000000000510', '90000000-0000-4000-8000-000000000312',
   'Which transport protocol guarantees reliable, ordered delivery?',
   'TCP provides sequencing, acknowledgements, and retransmission for reliable delivery.', 1),
  ('90000000-0000-4000-8000-000000000511', '90000000-0000-4000-8000-000000000312',
   'Which protocol would a video call most likely use to keep latency low?',
   'UDP adds minimal overhead, which makes it the choice for real-time media where speed matters.', 2),
  ('90000000-0000-4000-8000-000000000512', '90000000-0000-4000-8000-000000000312',
   'Which well-known TCP port does HTTPS use?',
   'HTTPS uses TCP port 443; plain HTTP uses port 80.', 3),
  ('90000000-0000-4000-8000-000000000513', '90000000-0000-4000-8000-000000000315',
   'What is the next hop for a packet?',
   'The next hop is the directly connected router that moves the packet closer to its destination.', 1),
  ('90000000-0000-4000-8000-000000000514', '90000000-0000-4000-8000-000000000315',
   'Which route is the last resort when no other route matches?',
   'The default route 0.0.0.0/0 catches every destination that no specific route covers.', 2),
  ('90000000-0000-4000-8000-000000000515', '90000000-0000-4000-8000-000000000315',
   'What does a routing table contain?',
   'A routing table pairs destination networks with next hops and the interfaces that reach them.', 3),
  ('90000000-0000-4000-8000-000000000516', '90000000-0000-4000-8000-000000000318',
   'Which routing protocol uses hop count as its metric?',
   'RIP is a distance-vector protocol that counts hops, capped at 15 before a network is unreachable.', 1),
  ('90000000-0000-4000-8000-000000000517', '90000000-0000-4000-8000-000000000318',
   'What is a routing protocol?',
   'Routing protocols let routers exchange path information so they build their tables automatically.', 2),
  ('90000000-0000-4000-8000-000000000518', '90000000-0000-4000-8000-000000000318',
   'Which routing protocol builds a complete map of the network and runs SPF?',
   'OSPF is a link-state protocol in which every router computes shortest paths from the full topology.', 3),
  ('90000000-0000-4000-8000-000000000519', '90000000-0000-4000-8000-000000000321',
   'Which protocol do web browsers use to fetch pages?',
   'HTTP (and its secure form HTTPS) carries web traffic, usually over TCP.', 1),
  ('90000000-0000-4000-8000-000000000520', '90000000-0000-4000-8000-000000000321',
   'What is the purpose of NAT?',
   'NAT lets many private addresses share one public address by rewriting packets at the edge.', 2),
  ('90000000-0000-4000-8000-000000000521', '90000000-0000-4000-8000-000000000321',
   'What does a firewall do?',
   'A firewall filters traffic between networks by applying rules on ports, addresses, and protocols.', 3),
  ('90000000-0000-4000-8000-000000000522', '90000000-0000-4000-8000-000000000324',
   'Which command sends ICMP echo requests to test connectivity?',
   'ping sends ICMP echo requests and reports replies, loss, and round-trip times.', 1),
  ('90000000-0000-4000-8000-000000000523', '90000000-0000-4000-8000-000000000324',
   'Which tool shows the path packets travel to a destination?',
   'traceroute (tracert on Windows) reveals each router hop a packet crosses.', 2),
  ('90000000-0000-4000-8000-000000000524', '90000000-0000-4000-8000-000000000324',
   'Which command shows a host own IP configuration?',
   'ipconfig on Windows (ip addr on Linux and macOS) prints the local address, mask, and gateway.', 3),
  ('90000000-0000-4000-8000-000000000525', '90000000-0000-4000-8000-000000000328',
   'Which layer of the TCP/IP model handles IP addressing and routing?',
   'The Internet layer carries the IP addressing and routing that move packets across networks.', 1),
  ('90000000-0000-4000-8000-000000000526', '90000000-0000-4000-8000-000000000328',
   'A /24 subnet provides how many usable host addresses?',
   'Eight host bits give 256 addresses; after removing the network and broadcast addresses, 254 remain.', 2),
  ('90000000-0000-4000-8000-000000000527', '90000000-0000-4000-8000-000000000328',
   'Which command tests the local protocol stack?',
   'ping 127.0.0.1 sends an ICMP echo to the loopback address of the host itself.', 3),
  ('90000000-0000-4000-8000-000000000528', '90000000-0000-4000-8000-000000000328',
   'Which device separates the office LAN from the internet in the capstone design?',
   'The edge router acts as the default gateway, performs NAT, and hosts the firewall boundary to the ISP.', 4),
  ('90000000-0000-4000-8000-000000000529', '90000000-0000-4000-8000-000000000328',
   'Which action best verifies a web server is answering on port 443?',
   'Loading an https:// URL in a browser proves the full application stack answers on port 443.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the first listed (position of the correct
--    answer) varies. Correct answers are flagged with is_correct = TRUE.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096
--    Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): internet layer protocol
  ('90000000-0000-4000-8000-000000001001', '90000000-0000-4000-8000-000000000501', 'IP (Internet Protocol)', TRUE,  1),
  ('90000000-0000-4000-8000-000000001002', '90000000-0000-4000-8000-000000000501', 'HTTP', FALSE, 2),
  ('90000000-0000-4000-8000-000000001003', '90000000-0000-4000-8000-000000000501', 'DHCP', FALSE, 3),
  ('90000000-0000-4000-8000-000000001004', '90000000-0000-4000-8000-000000000501', 'SMTP', FALSE, 4),
  -- Q1 (501)q2: forwarding device
  ('90000000-0000-4000-8000-000000001005', '90000000-0000-4000-8000-000000000502', 'Router', TRUE,  1),
  ('90000000-0000-4000-8000-000000001006', '90000000-0000-4000-8000-000000000502', 'Switch', FALSE, 2),
  ('90000000-0000-4000-8000-000000001007', '90000000-0000-4000-8000-000000000502', 'Repeater', FALSE, 3),
  ('90000000-0000-4000-8000-000000001008', '90000000-0000-4000-8000-000000000502', 'Modern', FALSE, 4),
  -- Q1 (501)q3: MAC address
  ('90000000-0000-4000-8000-000000001009', '90000000-0000-4000-8000-000000000503', 'A network interface hardware address', TRUE,  1),
  ('90000000-0000-4000-8000-000000001010', '90000000-0000-4000-8000-000000000503', 'An IP address', FALSE, 2),
  ('90000000-0000-4000-8000-000000001011', '90000000-0000-4000-8000-000000000503', 'A website name', FALSE, 3),
  ('90000000-0000-4000-8000-000000001012', '90000000-0000-4000-8000-000000000503', 'A routing protocol', FALSE, 4),
  -- Q2 (504): IPv4 length
  ('90000000-0000-4000-8000-000000001013', '90000000-0000-4000-8000-000000000504', '32 bits', TRUE,  1),
  ('90000000-0000-4000-8000-000000001014', '90000000-0000-4000-8000-000000000504', '16 bits', FALSE, 2),
  ('90000000-0000-4000-8000-000000001015', '90000000-0000-4000-8000-000000000504', '64 bits', FALSE, 3),
  ('90000000-0000-4000-8000-000000001016', '90000000-0000-4000-8000-000000000504', '128 bits', FALSE, 4),
  -- Q2 (504)q2: /24 mask
  ('90000000-0000-4000-8000-000000001017', '90000000-0000-4000-8000-000000000505', '255.255.255.0', TRUE,  1),
  ('90000000-0000-4000-8000-000000001018', '90000000-0000-4000-8000-000000000505', '255.255.0.0', FALSE, 2),
  ('90000000-0000-4000-8000-000000001019', '90000000-0000-4000-8000-000000000505', '255.0.0.0', FALSE, 3),
  ('90000000-0000-4000-8000-000000001020', '90000000-0000-4000-8000-000000000505', '255.255.255.255', FALSE, 4),
  -- Q2 (504)q3: private range
  ('90000000-0000-4000-8000-000000001021', '90000000-0000-4000-8000-000000000506', '192.168.0.0/16', TRUE,  1),
  ('90000000-0000-4000-8000-000000001022', '90000000-0000-4000-8000-000000000506', '93.184.216.0/24', FALSE, 2),
  ('90000000-0000-4000-8000-000000001023', '90000000-0000-4000-8000-000000000506', '203.0.113.0/24', FALSE, 3),
  ('90000000-0000-4000-8000-000000001024', '90000000-0000-4000-8000-000000000506', '127.0.0.0/8', FALSE, 4),
  -- Q3 (507): ARP
  ('90000000-0000-4000-8000-000000001025', '90000000-0000-4000-8000-000000000507', 'ARP', TRUE,  1),
  ('90000000-0000-4000-8000-000000001026', '90000000-0000-4000-8000-000000000507', 'DHCP', FALSE, 2),
  ('90000000-0000-4000-8000-000000001027', '90000000-0000-4000-8000-000000000507', 'DNS', FALSE, 3),
  ('90000000-0000-4000-8000-000000001028', '90000000-0000-4000-8000-000000000507', 'OSPF', FALSE, 4),
  -- Q3 (507)q2: A record
  ('90000000-0000-4000-8000-000000001029', '90000000-0000-4000-8000-000000000508', 'A record', TRUE,  1),
  ('90000000-0000-4000-8000-000000001030', '90000000-0000-4000-8000-000000000508', 'CNAME', FALSE, 2),
  ('90000000-0000-4000-8000-000000001031', '90000000-0000-4000-8000-000000000508', 'MX record', FALSE, 3),
  ('90000000-0000-4000-8000-000000001032', '90000000-0000-4000-8000-000000000508', 'PTR record', FALSE, 4),
  -- Q3 (507)q3: DHCP
  ('90000000-0000-4000-8000-000000001033', '90000000-0000-4000-8000-000000000509', 'DHCP', TRUE,  1),
  ('90000000-0000-4000-8000-000000001034', '90000000-0000-4000-8000-000000000509', 'ARP', FALSE, 2),
  ('90000000-0000-4000-8000-000000001035', '90000000-0000-4000-8000-000000000509', 'ICMP', FALSE, 3),
  ('90000000-0000-4000-8000-000000001036', '90000000-0000-4000-8000-000000000509', 'RIP', FALSE, 4),
  -- Q4 (510): reliable transport
  ('90000000-0000-4000-8000-000000001037', '90000000-0000-4000-8000-000000000510', 'TCP', TRUE,  1),
  ('90000000-0000-4000-8000-000000001038', '90000000-0000-4000-8000-000000000510', 'UDP', FALSE, 2),
  ('90000000-0000-4000-8000-000000001039', '90000000-0000-4000-8000-000000000510', 'ICMP', FALSE, 3),
  ('90000000-0000-4000-8000-000000001040', '90000000-0000-4000-8000-000000000510', 'ARP', FALSE, 4),
  -- Q4 (510)q2: video call protocol
  ('90000000-0000-4000-8000-000000001041', '90000000-0000-4000-8000-000000000511', 'UDP', TRUE,  1),
  ('90000000-0000-4000-8000-000000001042', '90000000-0000-4000-8000-000000000511', 'TCP', FALSE, 2),
  ('90000000-0000-4000-8000-000000001043', '90000000-0000-4000-8000-000000000511', 'SMTP', FALSE, 3),
  ('90000000-0000-4000-8000-000000001044', '90000000-0000-4000-8000-000000000511', 'FTP', FALSE, 4),
  -- Q4 (510)q3: HTTPS port
  ('90000000-0000-4000-8000-000000001045', '90000000-0000-4000-8000-000000000512', '443', TRUE,  1),
  ('90000000-0000-4000-8000-000000001046', '90000000-0000-4000-8000-000000000512', '80', FALSE, 2),
  ('90000000-0000-4000-8000-000000001047', '90000000-0000-4000-8000-000000000512', '25', FALSE, 3),
  ('90000000-0000-4000-8000-000000001048', '90000000-0000-4000-8000-000000000512', '22', FALSE, 4),
  -- Q5 (513): next hop
  ('90000000-0000-4000-8000-000000001049', '90000000-0000-4000-8000-000000000513', 'The next router that moves the packet toward its destination', TRUE,  1),
  ('90000000-0000-4000-8000-000000001050', '90000000-0000-4000-8000-000000000513', 'The final destination host', FALSE, 2),
  ('90000000-0000-4000-8000-000000001051', '90000000-0000-4000-8000-000000000513', 'The default DNS server', FALSE, 3),
  ('90000000-0000-4000-8000-000000001052', '90000000-0000-4000-8000-000000000513', 'The source host again', FALSE, 4),
  -- Q5 (513)q2: default route
  ('90000000-0000-4000-8000-000000001053', '90000000-0000-4000-8000-000000000514', 'Default route (0.0.0.0/0)', TRUE,  1),
  ('90000000-0000-4000-8000-000000001054', '90000000-0000-4000-8000-000000000514', 'Connected route', FALSE, 2),
  ('90000000-0000-4000-8000-000000001055', '90000000-0000-4000-8000-000000000514', 'Loopback route', FALSE, 3),
  ('90000000-0000-4000-8000-000000001056', '90000000-0000-4000-8000-000000000514', 'Static host route', FALSE, 4),
  -- Q5 (513)q3: routing table contents
  ('90000000-0000-4000-8000-000000001057', '90000000-0000-4000-8000-000000000515', 'Destination networks paired with next hops and interfaces', TRUE,  1),
  ('90000000-0000-4000-8000-000000001058', '90000000-0000-4000-8000-000000000515', 'Only the connected MAC addresses', FALSE, 2),
  ('90000000-0000-4000-8000-000000001059', '90000000-0000-4000-8000-000000000515', 'The IP addresses of all internet hosts', FALSE, 3),
  ('90000000-0000-4000-8000-000000001060', '90000000-0000-4000-8000-000000000515', 'The list of DNS records', FALSE, 4),
  -- Q6 (516): hop count metric
  ('90000000-0000-4000-8000-000000001061', '90000000-0000-4000-8000-000000000516', 'RIP', TRUE,  1),
  ('90000000-0000-4000-8000-000000001062', '90000000-0000-4000-8000-000000000516', 'OSPF', FALSE, 2),
  ('90000000-0000-4000-8000-000000001063', '90000000-0000-4000-8000-000000000516', 'BGP', FALSE, 3),
  ('90000000-0000-4000-8000-000000001064', '90000000-0000-4000-8000-000000000516', 'IS-IS', FALSE, 4),
  -- Q6 (516)q2: routing protocol definition
  ('90000000-0000-4000-8000-000000001065', '90000000-0000-4000-8000-000000000517', 'Software that lets routers exchange path information', TRUE,  1),
  ('90000000-0000-4000-8000-000000001066', '90000000-0000-4000-8000-000000000517', 'A command that pings a remote host', FALSE, 2),
  ('90000000-0000-4000-8000-000000001067', '90000000-0000-4000-8000-000000000517', 'A type of network cable', FALSE, 3),
  ('90000000-0000-4000-8000-000000001068', '90000000-0000-4000-8000-000000000517', 'A DNS record type', FALSE, 4),
  -- Q6 (516)q3: OSPF
  ('90000000-0000-4000-8000-000000001069', '90000000-0000-4000-8000-000000000518', 'OSPF', TRUE,  1),
  ('90000000-0000-4000-8000-000000001070', '90000000-0000-4000-8000-000000000518', 'RIP', FALSE, 2),
  ('90000000-0000-4000-8000-000000001071', '90000000-0000-4000-8000-000000000518', 'DHCP', FALSE, 3),
  ('90000000-0000-4000-8000-000000001072', '90000000-0000-4000-8000-000000000518', 'ARP', FALSE, 4),
  -- Q7 (519): HTTP
  ('90000000-0000-4000-8000-000000001073', '90000000-0000-4000-8000-000000000519', 'HTTP', TRUE,  1),
  ('90000000-0000-4000-8000-000000001074', '90000000-0000-4000-8000-000000000519', 'DNS', FALSE, 2),
  ('90000000-0000-4000-8000-000000001075', '90000000-0000-4000-8000-000000000519', 'DHCP', FALSE, 3),
  ('90000000-0000-4000-8000-000000001076', '90000000-0000-4000-8000-000000000519', 'ICMP', FALSE, 4),
  -- Q7 (519)q2: NAT purpose
  ('90000000-0000-4000-8000-000000001077', '90000000-0000-4000-8000-000000000520', 'To share one public address among many private hosts', TRUE,  1),
  ('90000000-0000-4000-8000-000000001078', '90000000-0000-4000-8000-000000000520', 'To assign names to websites', FALSE, 2),
  ('90000000-0000-4000-8000-000000001079', '90000000-0000-4000-8000-000000000520', 'To encrypt web traffic', FALSE, 3),
  ('90000000-0000-4000-8000-000000001080', '90000000-0000-4000-8000-000000000520', 'To increase Wi-Fi range', FALSE, 4),
  -- Q7 (519)q3: firewall
  ('90000000-0000-4000-8000-000000001081', '90000000-0000-4000-8000-000000000521', 'It filters traffic based on configured rules', TRUE,  1),
  ('90000000-0000-4000-8000-000000001082', '90000000-0000-4000-8000-000000000521', 'It converts IP addresses only', FALSE, 2),
  ('90000000-0000-4000-8000-000000001083', '90000000-0000-4000-8000-000000000521', 'It caches website content', FALSE, 3),
  ('90000000-0000-4000-8000-000000001084', '90000000-0000-4000-8000-000000000521', 'It assigns DHCP leases', FALSE, 4),
  -- Q8 (522): ping
  ('90000000-0000-4000-8000-000000001085', '90000000-0000-4000-8000-000000000522', 'ping', TRUE,  1),
  ('90000000-0000-4000-8000-000000001086', '90000000-0000-4000-8000-000000000522', 'nslookup', FALSE, 2),
  ('90000000-0000-4000-8000-000000001087', '90000000-0000-4000-8000-000000000522', 'netstat', FALSE, 3),
  ('90000000-0000-4000-8000-000000001088', '90000000-0000-4000-8000-000000000522', 'ipconfig', FALSE, 4),
  -- Q8 (522)q2: traceroute
  ('90000000-0000-4000-8000-000000001089', '90000000-0000-4000-8000-000000000523', 'traceroute', TRUE,  1),
  ('90000000-0000-4000-8000-000000001090', '90000000-0000-4000-8000-000000000523', 'arp -a', FALSE, 2),
  ('90000000-0000-4000-8000-000000001091', '90000000-0000-4000-8000-000000000523', 'ipconfig /all', FALSE, 3),
  ('90000000-0000-4000-8000-000000001092', '90000000-0000-4000-8000-000000000523', 'route print', FALSE, 4),
  -- Q8 (522)q3: ipconfig
  ('90000000-0000-4000-8000-000000001093', '90000000-0000-4000-8000-000000000524', 'ipconfig', TRUE,  1),
  ('90000000-0000-4000-8000-000000001094', '90000000-0000-4000-8000-000000000524', 'ping 8.8.8.8', FALSE, 2),
  ('90000000-0000-4000-8000-000000001095', '90000000-0000-4000-8000-000000000524', 'tracert google.com', FALSE, 3),
  ('90000000-0000-4000-8000-000000001096', '90000000-0000-4000-8000-000000000524', 'curl -v example.com', FALSE, 4),
  -- Q9 (525): internet layer
  ('90000000-0000-4000-8000-000000001097', '90000000-0000-4000-8000-000000000525', 'Internet layer', TRUE,  1),
  ('90000000-0000-4000-8000-000000001098', '90000000-0000-4000-8000-000000000525', 'Application layer', FALSE, 2),
  ('90000000-0000-4000-8000-000000001099', '90000000-0000-4000-8000-000000000525', 'Transport layer', FALSE, 3),
  ('90000000-0000-4000-8000-000000001100', '90000000-0000-4000-8000-000000000525', 'Network Access layer', FALSE, 4),
  -- Q9 (525)q2: /24 usable
  ('90000000-0000-4000-8000-000000001101', '90000000-0000-4000-8000-000000000526', '254', TRUE,  1),
  ('90000000-0000-4000-8000-000000001102', '90000000-0000-4000-8000-000000000526', '256', FALSE, 2),
  ('90000000-0000-4000-8000-000000001103', '90000000-0000-4000-8000-000000000526', '128', FALSE, 3),
  ('90000000-0000-4000-8000-000000001104', '90000000-0000-4000-8000-000000000526', '24', FALSE, 4),
  -- Q9 (525)q3: loopback test
  ('90000000-0000-4000-8000-000000001105', '90000000-0000-4000-8000-000000000527', 'ping 127.0.0.1', TRUE,  1),
  ('90000000-0000-4000-8000-000000001106', '90000000-0000-4000-8000-000000000527', 'ping 192.168.1.1', FALSE, 2),
  ('90000000-0000-4000-8000-000000001107', '90000000-0000-4000-8000-000000000527', 'tracert 8.8.8.8', FALSE, 3),
  ('90000000-0000-4000-8000-000000001108', '90000000-0000-4000-8000-000000000527', 'ipconfig /renew', FALSE, 4),
  -- Q9 (525)q4: edge router
  ('90000000-0000-4000-8000-000000001109', '90000000-0000-4000-8000-000000000528', 'The edge router', TRUE,  1),
  ('90000000-0000-4000-8000-000000001110', '90000000-0000-4000-8000-000000000528', 'The office switch', FALSE, 2),
  ('90000000-0000-4000-8000-000000001111', '90000000-0000-4000-8000-000000000528', 'The file server', FALSE, 3),
  ('90000000-0000-4000-8000-000000001112', '90000000-0000-4000-8000-000000000528', 'The shared printer', FALSE, 4),
  -- Q9 (525)q5: verify 443
  ('90000000-0000-4000-8000-000000001113', '90000000-0000-4000-8000-000000000529', 'Load an https:// URL in a browser', TRUE,  1),
  ('90000000-0000-4000-8000-000000001114', '90000000-0000-4000-8000-000000000529', 'ping the server IP address', FALSE, 2),
  ('90000000-0000-4000-8000-000000001115', '90000000-0000-4000-8000-000000000529', 'arp -a on the workstation', FALSE, 3),
  ('90000000-0000-4000-8000-000000001116', '90000000-0000-4000-8000-000000000529', 'ipconfig /flushdns', FALSE, 4)
ON CONFLICT (id) DO NOTHING;