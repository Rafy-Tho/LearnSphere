-- ============================================================================
-- SEED 019: Complete course — "Network Protocols Deep Dive"
-- ----------------------------------------------------------------------------
-- Instructor : Sarah Chen        (10000000-0000-4000-8000-000000000001)
-- Category   : Networking        (20000000-0000-4000-8000-000000000006)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Networking Models & Architecture → C1 OSI & TCP/IP Models · C2 Ethernet & IP Fundamentals
--   M2 The Internet Layer         → C3 ARP & IPv6 · C4 ICMP & Routing
--   M3 Transport & Application    → C5 TCP & UDP · C6 DNS & DHCP
--   M4 The Web Protocol Stack     → C7 HTTP & HTTPS · C8 TLS & Modern Web Protocols
--   M5 Packet Analysis Capstone   → C9 Wireshark Essentials · C10 Capture Analysis Capstone
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across quizzes + `quizzes` and `quiz_options`.
-- Topic arc: OSI vs TCP/IP, Ethernet, IPv4/IPv6 and ARP, ICMP and routing,
-- TCP/UDP, DNS and DHCP, HTTP/HTTPS and TLS, HTTP/2 and HTTP/3, then a
-- Wireshark-driven capture analysis capstone.
--
-- Idempotency: every statement uses ON CONFLICT (id) DO NOTHING with fixed,
-- deterministic UUIDs (prefix 01300000), so this file can be re-run safely.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. COURSE + OBJECTIVES
-- ----------------------------------------------------------------------------

INSERT INTO courses (
  id, instructor_id, category_id, name, slug, description, status, level, access_type, position
) VALUES (
  '01300000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '20000000-0000-4000-8000-000000000006',
  'Network Protocols Deep Dive',
  'network-protocols-deep-dive',
  'See the network the way a protocol analyst does. Work through the OSI and TCP/IP models, Ethernet and IP addressing, ARP and ICMP, the TCP/UDP transport layer, DNS and DHCP, and the HTTP/HTTPS/TLS web stack — then apply Wireshark to analyze a full real-world conversation yourself.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  17
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01300000-0000-4000-8000-000000000011', '01300000-0000-4000-8000-000000000001', 'Explain the OSI and TCP/IP models and describe encapsulation across the layers.', 1),
  ('01300000-0000-4000-8000-000000000012', '01300000-0000-4000-8000-000000000001', 'Work with Ethernet, IPv4/IPv6 addressing, ARP, ICMP, and routing fundamentals.', 2),
  ('01300000-0000-4000-8000-000000000013', '01300000-0000-4000-8000-000000000001', 'Contrast TCP and UDP, then trace how DNS and DHCP deliver application services.',     3),
  ('01300000-0000-4000-8000-000000000014', '01300000-0000-4000-8000-000000000001', 'Analyze HTTP, HTTPS, and TLS, including certificates, HTTP/2, and HTTP/3.',            4),
  ('01300000-0000-4000-8000-000000000015', '01300000-0000-4000-8000-000000000001', 'Analyze packet captures with Wireshark and explain a complete HTTP conversation.',      5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01300000-0000-4000-8000-000000000101', '01300000-0000-4000-8000-000000000001', 1, 'Networking Models & Architecture', 'Learn the OSI and TCP/IP models, Ethernet, and IPv4 addressing.',                     'PUBLISHED'),
  ('01300000-0000-4000-8000-000000000102', '01300000-0000-4000-8000-000000000001', 2, 'The Internet Layer',                   'Master ARP, IPv6, ICMP diagnostics, and routing.',                                     'PUBLISHED'),
  ('01300000-0000-4000-8000-000000000103', '01300000-0000-4000-8000-000000000001', 3, 'Transport & Application Services',     'Contrast TCP and UDP, then trace DNS and DHCP workflows.',                             'PUBLISHED'),
  ('01300000-0000-4000-8000-000000000104', '01300000-0000-4000-8000-000000000001', 4, 'The Web Protocol Stack',               'Analyze HTTP, HTTPS, TLS certificates, and HTTP/2 and HTTP/3 transports.',             'PUBLISHED'),
  ('01300000-0000-4000-8000-000000000105', '01300000-0000-4000-8000-000000000001', 5, 'Packet Analysis Capstone',             'Use Wireshark to capture, filter, and explain real network traffic end to end.',        'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01300000-0000-4000-8000-000000000201', '01300000-0000-4000-8000-000000000101', 1, 'OSI & TCP/IP Models',          'Build the mental model every network discussion shares.',      'PUBLISHED'),
  ('01300000-0000-4000-8000-000000000202', '01300000-0000-4000-8000-000000000101', 2, 'Ethernet & IP Fundamentals',    'Frame traffic on the LAN and address it with IPv4.',           'PUBLISHED'),
  ('01300000-0000-4000-8000-000000000203', '01300000-0000-4000-8000-000000000102', 1, 'ARP & IPv6',                    'Resolve neighbors and plan for the modern address space.',     'PUBLISHED'),
  ('01300000-0000-4000-8000-000000000204', '01300000-0000-4000-8000-000000000102', 2, 'ICMP & Routing',               'Diagnose paths with ICMP and forward packets across networks.', 'PUBLISHED'),
  ('01300000-0000-4000-8000-000000000205', '01300000-0000-4000-8000-000000000103', 1, 'TCP & UDP',                     'Compare reliable streams with best-effort datagrams.',         'PUBLISHED'),
  ('01300000-0000-4000-8000-000000000206', '01300000-0000-4000-8000-000000000103', 2, 'DNS & DHCP',                    'Translate names to addresses and hand them out automatically.', 'PUBLISHED'),
  ('01300000-0000-4000-8000-000000000207', '01300000-0000-4000-8000-000000000104', 1, 'HTTP & HTTPS',                  'Read the language of the web and the handshake that secures it.','PUBLISHED'),
  ('01300000-0000-4000-8000-000000000208', '01300000-0000-4000-8000-000000000104', 2, 'TLS & Modern Web Protocols',    'Understand certificates, PKI, HTTP/2, and HTTP/3.',           'PUBLISHED'),
  ('01300000-0000-4000-8000-000000000209', '01300000-0000-4000-8000-000000000105', 1, 'Wireshark Essentials',          'Capture and navigate traffic with the analyst standard tool.',  'PUBLISHED'),
  ('01300000-0000-4000-8000-000000000210', '01300000-0000-4000-8000-000000000105', 2, 'Capture Analysis Capstone',     'Explain a complete HTTP conversation from raw packets.',       'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01300000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01300000-0000-4000-8000-000000000301', '01300000-0000-4000-8000-000000000201', 1, 'The OSI Reference Model',          'Map the problem of networking onto seven cooperating layers.',              'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01300000-0000-4000-8000-000000000302', '01300000-0000-4000-8000-000000000201', 2, 'The TCP/IP Protocol Suite',         'See the model the internet actually implements.',                           'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01300000-0000-4000-8000-000000000303', '01300000-0000-4000-8000-000000000201', 3, 'Networking Models Quiz',            'Check your grasp of the OSI and TCP/IP models.',                            'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01300000-0000-4000-8000-000000000304', '01300000-0000-4000-8000-000000000202', 1, 'Ethernet & LAN Switching',          'Understand frames, MAC addresses, and how switches build the LAN.',         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01300000-0000-4000-8000-000000000305', '01300000-0000-4000-8000-000000000202', 2, 'IPv4 Addressing & Subnetting',      'Read, mask, and subnet 32-bit IPv4 addresses with confidence.',             'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('01300000-0000-4000-8000-000000000306', '01300000-0000-4000-8000-000000000202', 3, 'Ethernet & IP Quiz',                'Verify your LAN framing and IPv4 addressing knowledge.',                    'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01300000-0000-4000-8000-000000000307', '01300000-0000-4000-8000-000000000203', 1, 'ARP: Bridging Layers 2 and 3',      'Resolve an IPv4 address to the MAC address the network needs.',             'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01300000-0000-4000-8000-000000000308', '01300000-0000-4000-8000-000000000203', 2, 'IPv6 Essentials',                   'Decode 128-bit addressing, its types, and stateless auto-configuration.',    'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01300000-0000-4000-8000-000000000309', '01300000-0000-4000-8000-000000000203', 3, 'ARP & IPv6 Quiz',                   'Test your neighbor resolution and IPv6 skills.',                            'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01300000-0000-4000-8000-000000000310', '01300000-0000-4000-8000-000000000204', 1, 'ICMP & Network Diagnostics',        'Probe reachability and diagnose paths with ICMP and traceroute.',           'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01300000-0000-4000-8000-000000000311', '01300000-0000-4000-8000-000000000204', 2, 'Routing Fundamentals',              'Forward packets between networks using tables, metrics, and next hops.',     'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01300000-0000-4000-8000-000000000312', '01300000-0000-4000-8000-000000000204', 3, 'Internet Layer Quiz',               'Check your ICMP and routing fundamentals.',                                 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01300000-0000-4000-8000-000000000313', '01300000-0000-4000-8000-000000000205', 1, 'TCP Deep Dive',                     'Handshake, sequencing, windows, and congestion — trace a reliable stream.',  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('01300000-0000-4000-8000-000000000314', '01300000-0000-4000-8000-000000000205', 2, 'UDP & Real-Time Traffic',           'Understand connectionless delivery and where UDP still wins.',              'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01300000-0000-4000-8000-000000000315', '01300000-0000-4000-8000-000000000205', 3, 'Transport Layer Quiz',              'Verify your TCP and UDP knowledge.',                                        'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01300000-0000-4000-8000-000000000316', '01300000-0000-4000-8000-000000000206', 1, 'DNS Resolution & Records',          'Walk a recursive resolution and read A, AAAA, CNAME, MX, and TXT records.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01300000-0000-4000-8000-000000000317', '01300000-0000-4000-8000-000000000206', 2, 'DHCP & Address Assignment',         'Follow the DORA exchange and manage leases, scopes, and reservations.',      'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01300000-0000-4000-8000-000000000318', '01300000-0000-4000-8000-000000000206', 3, 'Application Services Quiz',         'Check your DNS and DHCP understanding.',                                    'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01300000-0000-4000-8000-000000000319', '01300000-0000-4000-8000-000000000207', 1, 'HTTP in Depth',                     'Parse methods, status codes, headers, and the stateless request cycle.',     'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01300000-0000-4000-8000-000000000320', '01300000-0000-4000-8000-000000000207', 2, 'HTTPS & the TLS Handshake',         'See how public-key cryptography and a handshake protect HTTP.',              'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('01300000-0000-4000-8000-000000000321', '01300000-0000-4000-8000-000000000207', 3, 'Web Protocols Quiz',                'Test your HTTP and HTTPS knowledge.',                                        'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01300000-0000-4000-8000-000000000322', '01300000-0000-4000-8000-000000000208', 1, 'HTTP/2 & HTTP/3',                   'Multiplexing, header compression, and QUIC — how the web moves faster.',     'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01300000-0000-4000-8000-000000000323', '01300000-0000-4000-8000-000000000208', 2, 'Certificates & Public Key Infrastructure', 'Bind keys to identities with CAs, chains, trust stores, and revocation.', 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01300000-0000-4000-8000-000000000324', '01300000-0000-4000-8000-000000000208', 3, 'TLS & Web Security Quiz',           'Verify your TLS, certificate, and modern transport knowledge.',              'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01300000-0000-4000-8000-000000000325', '01300000-0000-4000-8000-000000000209', 1, 'Introduction to Wireshark',         'Capture, filter, and navigate packets in the analyst standard tool.',        'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01300000-0000-4000-8000-000000000326', '01300000-0000-4000-8000-000000000210', 1, 'Reading a Capture Like an Analyst', 'Build a layer-by-layer filter workflow and find the story in the packets.',  'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01300000-0000-4000-8000-000000000327', '01300000-0000-4000-8000-000000000210', 2, 'Capstone: A Full HTTP Conversation', 'Reconstruct DNS, handshake, and request/response from a real pcap file.',     'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('01300000-0000-4000-8000-000000000328', '01300000-0000-4000-8000-000000000210', 3, 'Final Assessment',                  'Prove what you learned across the whole course.',                             'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01300000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01300000-0000-4000-8000-000000000401',
  '01300000-0000-4000-8000-000000000301',
  1,
  'The OSI Reference Model',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The OSI Reference Model</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The OSI Reference Model</h1>
  <p>The <strong>Open Systems Interconnection (OSI) model</strong> — standardized by ISO in 1984 — is the conceptual framework at the heart of every networking discussion and every certification. It splits the job of moving data between two applications into <strong>seven layers</strong>, each with a single responsibility, a defined neighbour above and below, and a protocol that implements its service.</p>
  <h2>Why layer at all?</h2>
  <p>Layering lets engineers change one layer without rebuilding the others. A router swap at Layer 3 does not require new cabling at Layer 1, and an HTTP rewrite at Layer 7 does not matter to the switch fabric at Layer 2. Standards at each boundary make multi-vendor networks possible.</p>
  <table>
    <tr><th>Layer</th><th>Name</th><th>Job</th><th>Example</th></tr>
    <tr><td>7</td><td>Application</td><td>Provide network services to apps</td><td>HTTP, DNS, SMTP</td></tr>
    <tr><td>6</td><td>Presentation</td><td>Encoding, encryption, translation</td><td>TLS, JPEG, JSON</td></tr>
    <tr><td>5</td><td>Session</td><td>Manage a conversation</td><td>TLS session, RPC</td></tr>
    <tr><td>4</td><td>Transport</td><td>End-to-end delivery, ports</td><td>TCP, UDP</td></tr>
    <tr><td>3</td><td>Network</td><td>Routing + logical addressing</td><td>IP, ICMP</td></tr>
    <tr><td>2</td><td>Data Link</td><td>Hop-by-hop framing, MAC</td><td>Ethernet, ARP</td></tr>
    <tr><td>1</td><td>Physical</td><td>Raw bits on a medium</td><td>RJ45, 1000BASE-T</td></tr>
  </table>
  <h2>The PDU ladder</h2>
  <p>Each layer wraps the data from the layer above with its own header — a process called <strong>encapsulation</strong>. The wrapped unit has a distinct name at each layer:</p>
  <pre class="code-block">Layer 4      segment (TCP) / datagram (UDP)
Layer 3      packet
Layer 2      frame
Layer 1      bits</pre>
  <p>When the frame travels up the receiving stack, each layer strips its own header — <strong>decapsulation</strong> — until the application sees the original payload.</p>
  <div class="callout callout-tip">
    <strong>Mnemonic</strong>
    <p>To memorise upwards: &ldquo;Please Do Not Throw Sausage Pizza Away&rdquo; (Physical, Data Link, Network, Transport, Session, Presentation, Application).</p>
  </div>
  <div class="callout callout-info">
    <strong>Reality check</strong>
    <p>Real networks collapse layers 5-6 into applications and TLS. We still teach all seven because exams, diagrams, and job interviews use them.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000402',
  '01300000-0000-4000-8000-000000000302',
  1,
  'The TCP/IP Protocol Suite',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The TCP/IP Protocol Suite</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The TCP/IP Protocol Suite</h1>
  <p>Where OSI is a teaching model, the <strong>TCP/IP suite</strong> is the real thing: the actual protocol family powering the internet. It is often described as four layers, which map neatly onto OSI.</p>
  <table>
    <tr><th>TCP/IP layer</th><th>OSI layers</th><th>Protocols</th><th>Responsibility</th></tr>
    <tr><td>Application</td><td>7, 6, 5</td><td>HTTP, DNS, SMTP, TLS</td><td>End-user services</td></tr>
    <tr><td>Transport</td><td>4</td><td>TCP, UDP</td><td>End-to-end delivery + ports</td></tr>
    <tr><td>Internet</td><td>3</td><td>IP, ICMP, ARP</td><td>Logical addressing + routing</td></tr>
    <tr><td>Link</td><td>2, 1</td><td>Ethernet, Wi-Fi</td><td>Hop-by-hop framing</td></tr>
  </table>
  <h2>Encapsulation in a real packet</h2>
  <p>Browsing a website builds headers in order. Each header describes the layer above it:</p>
  <pre class="code-block">[HTTP: GET /index.html][TCP: src 49321 dst 443][IP: src 192.0.2.10 dst 203.0.113.5][Ethernet: src MAC dst MAC]</pre>
  <ul>
    <li>The <strong>Ethernet frame</strong> delivers across one switch segment.</li>
    <li>The <strong>IP header</strong> carries the logical source and destination across many hops.</li>
    <li>The <strong>TCP header</strong> identifies the application with ports and tracks delivery.</li>
    <li>The <strong>HTTP message</strong> is the payload the browser actually understands.</li>
  </ul>
  <h2>The hourglass model</h2>
  <p>Everything above and below IP varies, but a single <em>ubiquitous</em> IP layer glues them together. This &ldquo;narrow waist&rdquo; is why one internet can carry streaming video above and fibre optics below: IP is the point of interoperability.</p>
  <div class="callout callout-tip">
    <strong>Read the stack top-down</strong>
    <p>When you analyse a packet, always read the chain from application down to link. Wireshark shows exactly these headers stacked in tree form.</p>
  </div>
  <div class="callout callout-info">
    <strong>Terminology</strong>
    <p>&ldquo;TCP/IP&rdquo; names only two protocols but refers to the whole suite. You will hear &ldquo;internet protocol stack&rdquo; used interchangeably.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000404',
  '01300000-0000-4000-8000-000000000304',
  1,
  'Ethernet & LAN Switching',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ethernet & LAN Switching</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Ethernet &amp; LAN Switching</h1>
  <p>Ethernet is the language of the local area network. It lives at OSI Layer 2 and moves <strong>frames</strong> between devices on the same segment, addressed by 48-bit <strong>MAC addresses</strong>.</p>
  <h2>The MAC address</h2>
  <p>A MAC address is a burned-in identifier of the network interface, usually written as six hex octets such as <span class="ic">3C:22:FB:01:02:03</span>. The first three octets are the <strong>OUI</strong> — the vendor prefix — and the last three identify the specific interface.</p>
  <h2>The Ethernet frame</h2>
  <table>
    <tr><th>Field</th><th>Purpose</th></tr>
    <tr><td>Preamble</td><td>Synchronises receiver clocks</td></tr>
    <tr><td>Destination MAC</td><td>Who receives the frame</td></tr>
    <tr><td>Source MAC</td><td>Who sent the frame</td></tr>
    <tr><td>EtherType</td><td>Payload type, typically 0x0800 for IPv4</td></tr>
    <tr><td>Payload</td><td>The encapsulated IP packet</td></tr>
    <tr><td>FCS</td><td>Frame check sequence to detect corruption</td></tr>
  </table>
  <h2>What a switch actually does</h2>
  <ul>
    <li><strong>Learn</strong> — records the source MAC of every frame it receives, mapped to the ingress port.</li>
    <li><strong>Forward</strong> — sends a frame destined to a known MAC out the correct port only.</li>
    <li><strong>Flood</strong> — sends unknown or broadcast destination frames out every port except the source port.</li>
  </ul>
  <pre class="code-block">show mac address-table   (Cisco, typical output)

VLAN   Mac Address       Type        Port
----   -----------       --------    ----
   1   3c22.fb01.0203    DYNAMIC     Gi0/1
   1   5c5e.ab19.42ff    DYNAMIC     Gi0/2</pre>
  <div class="callout">
    <strong>Broadcasts</strong>
    <p>A destination MAC of <span class="ic">ff:ff:ff:ff:ff:ff</span> reaches every host on the LAN — ARP and DHCP rely on this.</p>
  </div>
  <div class="callout callout-info">
    <strong>Half vs full duplex</strong>
    <p>Legacy hubs forced devices to share media with collision detection (CSMA/CD). Switches give each port its own collision domain, so full-duplex links no longer collide at all.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000405',
  '01300000-0000-4000-8000-000000000305',
  1,
  'IPv4 Addressing & Subnetting',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IPv4 Addressing & Subnetting</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>IPv4 Addressing &amp; Subnetting</h1>
  <p>An IPv4 address is a 32-bit number written as four dotted decimals, like <span class="ic">192.168.1.34</span>. Every address has a <strong>network portion</strong> (which segment you are on) and a <strong>host portion</strong> (which device on that segment). The subnet mask draws that line.</p>
  <h2>Reading a mask</h2>
  <p>A <span class="ic">/24</span> mask means the first 24 bits are network, leaving 8 host bits: 256 addresses, of which 254 are usable (one is the network ID, one is the broadcast).</p>
  <pre class="code-block">192.168.1.0/24
network:   192.168.1.0
usable:    192.168.1.1 - 192.168.1.254
broadcast: 192.168.1.255</pre>
  <h2>Private (RFC 1918) ranges</h2>
  <table>
    <tr><th>Range</th><th>CIDR</th><th>Usable hosts</th></tr>
    <tr><td>10.0.0.0 - 10.255.255.255</td><td>/8</td><td>~16.7 million</td></tr>
    <tr><td>172.16.0.0 - 172.31.255.255</td><td>/16</td><td>~1 million per /16</td></tr>
    <tr><td>192.168.0.0 - 192.168.255.255</td><td>/24s</td><td>254 per /24</td></tr>
  </table>
  <p>Private addresses are not routable on the internet. <strong>NAT</strong> on the edge router maps many private addresses to one public one when they need to talk outside.</p>
  <h2>Special addresses</h2>
  <ul>
    <li><span class="ic">127.0.0.0/8</span> — loopback; <span class="ic">127.0.0.1</span> means &ldquo;this machine&rdquo;.</li>
    <li><span class="ic">169.254.0.0/16</span> — link-local, self-assigned when DHCP fails (Windows APIPA).</li>
    <li><span class="ic">0.0.0.0/0</span> — the default route.</li>
  </ul>
  <h2>A quick subnetting recipe</h2>
  <ol>
    <li>Find the block size: 2 to the power of the remaining host bits.</li>
    <li>The network ID is the start of the block.</li>
    <li>The broadcast is the network ID plus the block size minus 1.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Two addresses always go away</strong>
    <p>Every subnet reserves the first address (network ID) and the last (broadcast). For a fast mental count: usable hosts equal 2 to the power of host bits, minus 2.</p>
  </div>
  <div class="callout callout-info">
    <strong>Subnetting is allocation</strong>
    <p>&ldquo;Give that office a /26&rdquo; means 64 addresses. Engineers do the block math in their heads; tools like <span class="ic">ipcalc</span> just confirm it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000407',
  '01300000-0000-4000-8000-000000000307',
  1,
  'ARP: Bridging Layers 2 and 3',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ARP: Bridging Layers 2 and 3</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>ARP: Bridging Layers 2 and 3</h1>
  <p>An IP address says <em>who</em> to reach, but an Ethernet frame can only be delivered to a <strong>MAC address</strong>. The <strong>Address Resolution Protocol (ARP)</strong> fills the gap: it maps an IPv4 address to the MAC address of the device on your LAN.</p>
  <h2>The exchange</h2>
  <ul>
    <li><strong>ARP request</strong> — broadcast to the LAN: &ldquo;Who has 192.168.1.7? Tell me.&rdquo;</li>
    <li><strong>ARP reply</strong> — unicast back from the owner: &ldquo;I have it, here is my MAC.&rdquo;</li>
  </ul>
  <pre class="code-block">arp -a    (typical output)

Interface: 192.168.1.34
Internet Address      Physical Address      Type
192.168.1.1           aa-55-3c-b2-90-1f     dynamic
192.168.1.7           5c-5e-ab-19-42-ff     dynamic</pre>
  <h2>The cache and why it matters</h2>
  <p>Replies are cached for a few minutes so a live call does not re-broadcast for every frame. The first packet to a new host always includes an ARP round trip, and in Wireshark you see the request/reply pair appear right before the IP conversation.</p>
  <div class="callout">
    <strong>Gratuitous ARP</strong>
    <p>Some devices announce their own mapping on boot. Duplicate-IP detection relies on it: if a device sees a reply claiming its own address, a conflict exists.</p>
  </div>
  <div class="callout callout-info">
    <strong>Security note</strong>
    <p>ARP authenticates nothing. An attacker can send fake replies to claim another host IP (ARP spoofing). Dynamic ARP Inspection, DHCP snooping, and static entries are the common defenses.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000408',
  '01300000-0000-4000-8000-000000000308',
  1,
  'IPv6 Essentials',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IPv6 Essentials</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>IPv6 Essentials</h1>
  <p>IPv6 exists because 4.3 billion IPv4 addresses are not enough for the internet. An IPv6 address is <strong>128 bits</strong>, written as eight groups of four hex digits, and network configuration is largely automatic.</p>
  <h2>Reading and compressing</h2>
  <pre class="code-block">Full form:   2001:0db8:0000:0000:0000:ff00:0042:8329
Compressed:  2001:db8::ff00:42:8329</pre>
  <ul>
    <li>Leading zeros in each group are optional.</li>
    <li>One run of all-zero groups — and only one — collapses to <span class="ic">::</span>.</li>
    <li>Hex letters are case-insensitive.</li>
  </ul>
  <h2>Address types</h2>
  <table>
    <tr><th>Type</th><th>Purpose</th><th>Example</th></tr>
    <tr><td>Global unicast</td><td>Public and routable</td><td>2001:db8::1</td></tr>
    <tr><td>Link-local</td><td>Segment only, auto assigned</td><td>fe80::/10</td></tr>
    <tr><td>Multicast</td><td>One-to-many group delivery</td><td>ff02::1 (all nodes)</td></tr>
    <tr><td>Loopback</td><td>This machine</td><td>::1</td></tr>
  </table>
  <h2>Stateless Address Autoconfiguration</h2>
  <p>A host derives its link-local address from its own interface, then listens for a <strong>Router Advertisement</strong> to learn the subnet prefix. Combined, these produce a working global address with <strong>no DHCP server</strong> — that is SLAAC.</p>
  <div class="callout callout-tip">
    <strong>No ARP in IPv6</strong>
    <p>Neighbour Discovery (NDP) replaces ARP, and ICMPv6 carries the diagnostics. Remember: ARP is an IPv4-only protocol.</p>
  </div>
  <div class="callout callout-info">
    <strong>Transition reality</strong>
    <p>Most networks run dual-stack — IPv4 and IPv6 together — rather than a hard cutover.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000410',
  '01300000-0000-4000-8000-000000000310',
  1,
  'ICMP & Network Diagnostics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ICMP & Network Diagnostics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>ICMP &amp; Network Diagnostics</h1>
  <p>The <strong>Internet Control Message Protocol (ICMP)</strong> is the glue that lets IP report problems. It carries no application data — its messages report delivery failures, test reachability, and shape path discovery.</p>
  <h2>Messages you will meet</h2>
  <table>
    <tr><th>Type</th><th>Name</th><th>Meaning</th></tr>
    <tr><td>0 / 8</td><td>Echo Reply / Echo Request</td><td>Ping answers</td></tr>
    <tr><td>3</td><td>Destination Unreachable</td><td>No route, host, port, or admin-block</td></tr>
    <tr><td>5</td><td>Redirect</td><td>Send packets to a better gateway</td></tr>
    <tr><td>11</td><td>Time Exceeded</td><td>TTL hit zero — the heart of traceroute</td></tr>
  </table>
  <h2>ping</h2>
  <p>A ping sends an Echo Request and reports the round-trip time of each reply. Lost replies plus rising latency usually point to a specific hop:</p>
  <pre class="code-block">ping 8.8.8.8 -n 4    (Windows)     ping -c 4 8.8.8.8    (Linux/macOS)

Reply from 8.8.8.8: bytes=32 time=14ms TTL=117
Reply from 8.8.8.8: bytes=32 time=13ms TTL=117</pre>
  <h2>traceroute and the TTL trick</h2>
  <p>Traceroute sends packets whose TTL starts at 1 and increases each round. The first router to decrement a TTL to zero answers with an ICMP Time Exceeded — revealing itself, hop by hop.</p>
  <pre class="code-block">tracert example.com        (Windows)    traceroute example.com   (Linux/macOS)

 1   2 ms   2 ms   2 ms  192.168.1.1
 2  11 ms  12 ms  10 ms  68.86.90.105
 3  14 ms  14 ms  14 ms  68.86.90.130</pre>
  <div class="callout">
    <strong>Routing indicator</strong>
    <p>Compare the ping reply TTL with the starting TTL to estimate hop count. A reply arriving with TTL 117 started at 128 — about 11 hops away.</p>
  </div>
  <div class="callout callout-info">
    <strong>Filters and safety</strong>
    <p>Many firewalls block ICMP, so &ldquo;no ping reply&rdquo; does not mean the host is offline. And ICMP errors like Redirect can be abused — networks often rate-limit or drop them.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000411',
  '01300000-0000-4000-8000-000000000311',
  1,
  'Routing Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Routing Fundamentals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Routing Fundamentals</h1>
  <p>Switches move frames within one LAN; <strong>routers</strong> move packets between networks. Routing is the forwarding decision, made once per packet at every hop, using the <strong>routing table</strong>.</p>
  <h2>Forwarding, not delivering</h2>
  <p>A router strips the incoming frame, reads the destination IP, looks up the best route, rewraps the packet in a new frame for the next link, and sends it onward. The source address never changes; the frame addresses change at every hop.</p>
  <h2>Anatomy of a route</h2>
  <table>
    <tr><th>Field</th><th>Example</th><th>Meaning</th></tr>
    <tr><td>Destination network</td><td>10.10.10.0/24</td><td>What we can reach</td></tr>
    <tr><td>Next hop</td><td>10.0.0.2</td><td>Who we hand the packet to</td></tr>
    <tr><td>Interface</td><td>Gi0/1</td><td>Which link to use</td></tr>
    <tr><td>Metric</td><td>1</td><td>Preference among competing routes</td></tr>
  </table>
  <h2>Default gateways and the default route</h2>
  <p>A host sends anything outside its own subnet to its <strong>default gateway</strong>. A router&rsquo;s <span class="ic">0.0.0.0/0</span> default route catches everything no more specific route names:</p>
  <pre class="code-block">ip route show    (Linux, excerpt)

default via 192.168.1.1 dev eth0
10.10.0.0/24 via 192.168.1.100 dev eth0</pre>
  <h2>Static vs dynamic</h2>
  <ul>
    <li><strong>Static routes</strong> are configured by hand — predictable, silent, and perfect for small stable networks.</li>
    <li><strong>Dynamic protocols</strong> share reachability: RIP counts hops, OSPF floods costs, BGP carries internet-scale paths.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Longest prefix match</strong>
    <p>A router always chooses the route with the longest matching prefix. <span class="ic">10.10.0.0/24</span> beats <span class="ic">0.0.0.0/0</span> for a packet to 10.10.0.7.</p>
  </div>
  <div class="callout callout-info">
    <strong>One hop at a time</strong>
    <p>Each router decides independently. A traceroute is the only easy way to see the decisions every hop made.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000413',
  '01300000-0000-4000-8000-000000000313',
  1,
  'TCP Deep Dive',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TCP Deep Dive</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>TCP Deep Dive</h1>
  <p>The <strong>Transmission Control Protocol</strong> turns an unreliable IP service into a reliable <em>stream</em>: ordered, checked, and paced. Applications address it by <strong>ports</strong>, and TCP arranges the delivery.</p>
  <h2>The three-way handshake</h2>
  <p>Every connection starts with three segments whose flags matter more than their payload:</p>
  <pre class="code-block">host A → host B   SYN          seq=1000
host B → host A   SYN + ACK    seq=2000, ack=1001
host A → host B   ACK          seq=1001, ack=2001</pre>
  <ul>
    <li><strong>SYN</strong> — &ldquo;I want to open a connection, here is my starting sequence number.&rdquo;</li>
    <li><strong>ACK</strong> — &ldquo;I received your data, next byte I expect is…&rdquo;</li>
    <li><strong>FIN / RST</strong> — polite close or abrupt reset.</li>
  </ul>
  <h2>Sequencing and reliability</h2>
  <p>Every byte of the stream gets a sequence number. The receiver acknowledges the <em>next expected byte</em>; a missing gap triggers a retransmission. That is how TCP guarantees ordering over an unordered network.</p>
  <h2>Windows and congestion</h2>
  <p>Flow control advertises a <strong>receive window</strong> so a fast sender never floods a slow receiver. Congestion control then adapts the send rate to the network: <strong>slow start</strong> doubles the pace each round trip until a loss signals back off, and <strong>fast retransmit</strong> resends on triple duplicate ACKs without waiting for a timeout.</p>
  <div class="callout callout-tip">
    <strong>Spot it in Wireshark</strong>
    <p>Filter <span class="ic">tcp.flags.syn==1</span> to see every handshake. Duplicate ACKs and the retransmission marker are your first clue to a lossy path.</p>
  </div>
  <div class="callout callout-info">
    <strong>Connection state</strong>
    <p>Ports pair into a 4-tuple: source IP, source port, destination IP, destination port. That tuple defines the connection and its state: LISTEN, ESTABLISHED, FIN-WAIT, TIME-WAIT, and friends.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000414',
  '01300000-0000-4000-8000-000000000314',
  1,
  'UDP & Real-Time Traffic',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UDP & Real-Time Traffic</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>UDP &amp; Real-Time Traffic</h1>
  <p>The <strong>User Datagram Protocol</strong> is TCP without the guarantees: no handshake, no sequencing, no retransmission. You get ports and a checksum around an opaque <strong>datagram</strong> — and that minimalism is exactly what some traffic needs.</p>
  <h2>The four-field header</h2>
  <pre class="code-block">0-15               16-31
Source Port        Destination Port
Length             Checksum</pre>
  <p>Eight bytes total — a hundredth of what connection state would cost.</p>
  <h2>Where UDP wins</h2>
  <ul>
    <li><strong>DNS</strong> — one query, one reply, connectionless by design.</li>
    <li><strong>Voice and video</strong> — a late retransmission is worthless; a dropped video frame is not.</li>
    <li><strong>DHCP and TFTP</strong> — small boot-time exchanges with their own retry logic.</li>
    <li><strong>Games</strong> — current state matters more than perfect order.</li>
  </ul>
  <h2>TCP vs UDP at a glance</h2>
  <table>
    <tr><th>Property</th><th>TCP</th><th>UDP</th></tr>
    <tr><td>Connection</td><td>Handshake first</td><td>None</td></tr>
    <tr><td>Ordering</td><td>Guaranteed</td><td>Best effort</td></tr>
    <tr><td>Retransmission</td><td>Yes</td><td>No</td></tr>
    <tr><td>Overhead</td><td>Segment state</td><td>8-byte header</td></tr>
    <tr><td>Typical use</td><td>Web, mail, files</td><td>DNS, VoIP, streaming</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>The QUIC bridge</strong>
    <p>QUIC — which powers HTTP/3 — tunnels TCP-level reliability over UDP, adding encryption in the transport. Builders get the best of both worlds.</p>
  </div>
  <div class="callout callout-info">
    <strong>One sender, many receivers</strong>
    <p>UDP is the natural carrier for multicast and broadcast, which TCP cannot do at all because it needs a single acknowledged peer.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000416',
  '01300000-0000-4000-8000-000000000316',
  1,
  'DNS Resolution & Records',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DNS Resolution & Records</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>DNS Resolution &amp; Records</h1>
  <p>Before any web request leaves your machine, the name must become an address. The <strong>Domain Name System</strong> is that phone book: a distributed, hierarchical database of names to records.</p>
  <h2>The hierarchy</h2>
  <ul>
    <li><strong>Root servers</strong> know where the top-level domains live.</li>
    <li><strong>TLD servers</strong> (.com, .org, .net) point to authoritative servers.</li>
    <li><strong>Authoritative servers</strong> hold the actual records for a domain.</li>
  </ul>
  <p>Your <span class="ic">resolver</span> (often your ISP or a public service like 8.8.8.8) queries through this chain — recursively, on your behalf, caching every answer.</p>
  <h2>Records you will read</h2>
  <table>
    <tr><th>Record</th><th>Purpose</th><th>Example</th></tr>
    <tr><td>A</td><td>IPv4 address of a name</td><td>example.com → 192.0.2.1</td></tr>
    <tr><td>AAAA</td><td>IPv6 address</td><td>example.com → 2001:db8::1</td></tr>
    <tr><td>CNAME</td><td>Alias to another name</td><td>www → example.com</td></tr>
    <tr><td>MX</td><td>Mail exchanger</td><td>example.com → mail 10</td></tr>
    <tr><td>TXT</td><td>Arbitrary text, often SPF/DKIM</td><td>v=spf1 include:_spf…</td></tr>
    <tr><td>NS</td><td>Authoritative nameserver</td><td>example.com → ns1.host</td></tr>
  </table>
  <h2>Ask the database yourself</h2>
  <pre class="code-block">dig example.com A +short
192.0.2.1

nslookup -type=MX example.com    (Windows)</pre>
  <h2>TTL and freshness</h2>
  <p>Every record carries a <strong>TTL</strong> — seconds a resolver may cache it. A short TTL means changes propagate fast but resolvers query more; a long TTL is efficient but slow to update.</p>
  <div class="callout callout-tip">
    <strong>Correlate in Wireshark</strong>
    <p>The DNS query for a domain should appear moments before its first TCP handshake. Seeing the query proves the name resolution drove the connection.</p>
  </div>
  <div class="callout callout-info">
    <strong>Security</strong>
    <p>DNS has no built-in integrity, so a spoofed answer can reroute you. DNSSEC signs records; DoH/DoT encrypts the queries themselves.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000417',
  '01300000-0000-4000-8000-000000000317',
  1,
  'DHCP & Address Assignment',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DHCP & Address Assignment</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>DHCP &amp; Address Assignment</h1>
  <p>Manually typing addresses for a hundred laptops is a bad day. <strong>Dynamic Host Configuration Protocol (DHCP)</strong> hands out not just addresses but the whole network profile — subnet mask, gateway, and DNS servers — automatically.</p>
  <h2>The DORA exchange</h2>
  <ol>
    <li><strong>Discover</strong> — client broadcasts: &ldquo;Is there a DHCP server?&rdquo;</li>
    <li><strong>Offer</strong> — server replies: &ldquo;Use 192.168.1.50 for this lease.&rdquo;</li>
    <li><strong>Request</strong> — client selects that offer, still by broadcast.</li>
    <li><strong>Acknowledge</strong> — server confirms with lease length and options.</li>
  </ol>
  <p>Both early messages are broadcasts because the client has no address yet — the same reason DHCP appears alongside ARP in captures.</p>
  <h2>Leases, renewals, and options</h2>
  <p>A lease is not permanent. At half the lease time (T1) the client asks to renew; at T2 it re-broadcasts. <strong>Options</strong> carry the extras: <span class="ic">option 3</span> is the router (default gateway), <span class="ic">option 6</span> is the DNS server list.</p>
  <pre class="code-block">ipconfig /all    (Windows) — look for DHCP Enabled and the lease line</pre>
  <h2>Scopes and reservations</h2>
  <ul>
    <li><strong>Scope</strong> — the pool of addresses a server manages, with exclusions for printers and static hosts.</li>
    <li><strong>Reservation</strong> — a fixed address tied to a client MAC, so servers keep stable IPs.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Troubleshoot with filters</strong>
    <p>Filter <span class="ic">dhcp</span> or <span class="ic">bootp</span> in Wireshark. No Offer after Discover points at server reachability; repeated full DORA loops usually mean misconfigured options.</p>
  </div>
  <div class="callout callout-info">
    <strong>Security</strong>
    <p>Rogue DHCP servers can poison a network. DHCP snooping on the switch marks trusted ports and blocks bogus Offers — a first line of defense against MITM attacks.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000419',
  '01300000-0000-4000-8000-000000000319',
  1,
  'HTTP in Depth',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HTTP in Depth</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>HTTP in Depth</h1>
  <p>HTTP is a text-based <strong>request/response</strong> protocol: the client asks, the server answers, and every message is plain markup you can read in a capture.</p>
  <h2>A request and its reply</h2>
  <pre class="code-block">GET /index.html HTTP/1.1                ← request line
Host: www.example.com
User-Agent: curl/8.0
Accept-Encoding: gzip

HTTP/1.1 200 OK                          ← status line
Content-Type: text/html; charset=UTF-8
Content-Length: 1234

&lt;!DOCTYPE html&gt;&lt;html&gt;…&lt;/html&gt;            ← body</pre>
  <h2>Methods</h2>
  <table>
    <tr><th>Method</th><th>Use</th><th>Safe / Idempotent</th></tr>
    <tr><td>GET</td><td>Read a resource</td><td>Yes / Yes</td></tr>
    <tr><td>HEAD</td><td>Read headers only</td><td>Yes / Yes</td></tr>
    <tr><td>POST</td><td>Submit, create</td><td>No / No</td></tr>
    <tr><td>PUT</td><td>Replace a resource</td><td>No / Yes</td></tr>
    <tr><td>DELETE</td><td>Remove a resource</td><td>No / Yes</td></tr>
  </table>
  <h2>Status codes</h2>
  <ul>
    <li><span class="ic">2xx</span> — success: 200 OK, 204 No Content.</li>
    <li><span class="ic">3xx</span> — redirect: 301 moved permanently, 304 not modified.</li>
    <li><span class="ic">4xx</span> — client fault: 400 bad request, 401 unauthorized, 403 forbidden, 404 not found.</li>
    <li><span class="ic">5xx</span> — server fault: 500 internal error, 503 unavailable.</li>
  </ul>
  <h2>Statelessness and state</h2>
  <p>Every HTTP request stands alone — the server remembers nothing between them. <strong>Cookies</strong> carry a session token the client returns on later requests; that is how a stateless protocol still powers logins and carts.</p>
  <div class="callout callout-tip">
    <strong>Read it raw</strong>
    <p>Filter <span class="ic">http</span> in Wireshark, then Follow TCP Stream. The raw exchange you see is the exact text on the wire.</p>
  </div>
  <div class="callout callout-info">
    <strong>Why headers matter</strong>
    <p>Headers negotiate behavior: caching, compression, authentication, and content type. An analyst reads them to explain why a server did what it did.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000420',
  '01300000-0000-4000-8000-000000000320',
  1,
  'HTTPS & the TLS Handshake',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HTTPS & the TLS Handshake</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>HTTPS &amp; the TLS Handshake</h1>
  <p>HTTPS is HTTP running inside <strong>TLS</strong>. TLS gives three guarantees: the server is who it claims (authentication), the data cannot be read in transit (confidentiality), and it cannot be silently altered (integrity).</p>
  <h2>Two kinds of cryptography</h2>
  <ul>
    <li><strong>Symmetric</strong> — one shared secret keys both directions. Fast, but how do you share it safely?</li>
    <li><strong>Asymmetric</strong> — a public key encrypts, the matching private key decrypts. Slow, but it makes safe key exchange possible.</li>
  </ul>
  <p>TLS uses asymmetric crypto to exchange a one-time symmetric <strong>session key</strong>, then fast symmetric crypto for the actual data.</p>
  <h2>The handshake (TLS 1.3, simplified)</h2>
  <ol>
    <li><strong>ClientHello</strong> — version, cipher suites, and a random.</li>
    <li><strong>ServerHello</strong> — chosen cipher, its own random, plus the server certificate (with its public key).</li>
    <li><strong>Key exchange</strong> — the client verifies the certificate, derives the session key with the server, and both send <strong>Finished</strong> to confirm.</li>
  </ol>
  <p>TLS 1.3 completes in one round trip — handshake traffic is already encrypted between steps.</p>
  <h2>What the lock means</h2>
  <p>Every capture of HTTPS traffic shows only the encrypted tunnel. Framing, application data, and headers are ciphertext — which is why analysts decrypt testing environments rather than prod captures.</p>
  <div class="callout callout-tip">
    <strong>Spot it in Wireshark</strong>
    <p>Filter <span class="ic">tls.handshake.type==1</span> for ClientHellos, or <span class="ic">tls.handshake.type==11</span> for certificates. Server Name Indication reveals the destination host.</p>
  </div>
  <div class="callout callout-info">
    <strong>Cipher suites</strong>
    <p>A suite like TLS_AES_128_GCM_SHA256 names the key exchange, bulk cipher, mode, and KDF in one string. Weak suites are how downgrade attacks begin.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000422',
  '01300000-0000-4000-8000-000000000322',
  1,
  'HTTP/2 & HTTP/3',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HTTP/2 & HTTP/3</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>HTTP/2 &amp; HTTP/3</h1>
  <p>HTTP/1.1 waits: one request per connection at a time, so a busy page opens many connections and a slow response blocks the queue — <strong>head-of-line blocking</strong>. HTTP/2 and HTTP/3 were built to fix exactly that.</p>
  <h2>HTTP/2 fixes</h2>
  <ul>
    <li><strong>Multiplexing</strong> — many streams share one TCP connection; each GET or POST flows in parallel.</li>
    <li><strong>Binary framing</strong> — messages become binary frames, easier for machines than text lines.</li>
    <li><strong>HPACK compression</strong> — repeated headers are indexed and sent as small numbers.</li>
    <li><strong>Server push</strong> — the server may send the CSS before the page asks for it.</li>
  </ul>
  <h2>HTTP/3 moves to QUIC</h2>
  <p>HTTP/2 still rides on TCP, and a single lost segment stalls the whole TCP stream. <strong>HTTP/3</strong> runs over <strong>QUIC</strong>, which tunnels UDP:</p>
  <table>
    <tr><th>Feature</th><th>HTTP/2 (TCP)</th><th>HTTP/3 (QUIC)</th></tr>
    <tr><td>Transport</td><td>TCP</td><td>UDP</td></tr>
    <tr><td>Congestion control</td><td>One stream-wide</td><td>Per-stream</td></tr>
    <tr><td>Encryption</td><td>TLS on top</td><td>Built into QUIC</td></tr>
    <tr><td>Connection setup</td><td>TCP + TLS round trips</td><td>0-RTT on resumption</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Why 0-RTT matters</strong>
    <p>Resumed QUIC clients can send their first request inside the handshake packet — one round trip saved before any data flows, a measurable win on mobile networks.</p>
  </div>
  <div class="callout callout-info">
    <strong>Migration</strong>
    <p>QUIC connections survive IP changes. Walk from Wi-Fi to 5G and the connection id stays the same — TCP would have torn the connection down.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000423',
  '01300000-0000-4000-8000-000000000323',
  1,
  'Certificates & Public Key Infrastructure',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Certificates & Public Key Infrastructure</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Certificates &amp; Public Key Infrastructure</h1>
  <p>A certificate answers the question TLS leaves open: how do you know a public key really belongs to example.com? The answer is a <strong>trusted third party</strong> — a Certificate Authority (CA) — vouching in an <strong>X.509 certificate</strong>.</p>
  <h2>What a certificate contains</h2>
  <table>
    <tr><th>Field</th><th>Example</th></tr>
    <tr><td>Subject</td><td>CN=www.example.com</td></tr>
    <tr><td>Issuer</td><td>CN=Example Public CA</td></tr>
    <tr><td>Public key</td><td>RSA 2048 / ECDSA P-256</td></tr>
    <tr><td>Validity</td><td>Sep 2026 - Sep 2027</td></tr>
    <tr><td>Digital signature</td><td>Signed by the issuer</td></tr>
  </table>
  <h2>The chain of trust</h2>
  <p>Your operating system ships a <strong>trust store</strong> of root CA certificates. A website presents a leaf certificate signed by an intermediate CA, which is signed by a root in your store. Chaining those signatures up to a root you already trust produces &ldquo;identity confirmed.&rdquo;</p>
  <h2>Getting a certificate</h2>
  <ol>
    <li>Generate a key pair; keep the private key private.</li>
    <li>Send a <strong>CSR</strong> (Certificate Signing Request) — public key plus identity — to a CA.</li>
    <li>The CA validates the domain (DV), organization (OV), or identity (EV), then signs your cert.</li>
    <li>Install it on the server; clients verify it onward.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Free and automatable</strong>
    <p>Let&rsquo;s Encrypt issues DV certificates with ACME protocol automation, so renewals happen without humans.</p>
  </div>
  <div class="callout callout-info">
    <strong>Revocation</strong>
    <p>A stolen key needs a dead cert. <strong>CRLs</strong> list revoked serials; <strong>OCSP</strong> answers &ldquo;is this cert valid now?&rdquo; in real time. Browsers refuse revoked certificates.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000425',
  '01300000-0000-4000-8000-000000000325',
  1,
  'Wireshark Essentials',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wireshark Essentials</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Wireshark Essentials</h1>
  <p>Reading packets becomes possible once you understand the tool. <strong>Wireshark</strong> lists every packet, decodes every protocol, and colors traffic so patterns jump out.</p>
  <h2>The three panes</h2>
  <ul>
    <li><strong>Packet list</strong> — one row per packet: time, source, destination, protocol, and a summary.</li>
    <li><strong>Details</strong> — the decoded tree: frame, Ethernet, IP, TCP/UDP, then application payload.</li>
    <li><strong>Bytes</strong> — the raw hex and ASCII of the selected field.</li>
  </ul>
  <h2>The packet tree is your breadcrumb</h2>
  <p>The details pane walks the encapsulation chain you learned in Module 1:</p>
  <pre class="code-block">Frame 42: 74 bytes on wire
  Ethernet II, Src: aa:bb:cc:dd:ee:ff, Dst: 11:22:33:44:55:66
  Internet Protocol Version 4, Src: 192.168.1.10, Dst: 93.184.216.34
  Transmission Control Protocol, Src Port: 54321, Dst Port: 443
  [TCP segment of a reassembled PDU]</pre>
  <h2>Capture vs display</h2>
  <p>Capture filters decide what the card records (use them at capture time); display filters select what you see from an existing capture (use them anytime). The display filter bar is the one you will live in.</p>
  <pre class="code-block">ip.addr == 192.168.1.10
tcp.port == 80
http && tcp.stream == 0
dns or dhcp</pre>
  <div class="callout callout-tip">
    <strong>Follow your filters</strong>
    <p>Wireshark autocompletes field names and highlights valid syntax in green. Type <span class="ic">tcp.stream</span> and pick the conversation index to isolate one session.</p>
  </div>
  <div class="callout callout-info">
    <strong>Colors help</strong>
    <p>Trasient retransmissions appear black-and-white then purple; TCP errors get a red tint. Colors are a fast scan, never a full diagnosis.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000426',
  '01300000-0000-4000-8000-000000000326',
  1,
  'Reading a Capture',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reading a Capture</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Reading a Capture</h1>
  <p>You can now identify every packet you will meet. This lesson walks the reading checklist: start broad, isolate one conversation, then follow it top to bottom.</p>
  <h2>Read from the name resolution out</h2>
  <p>Enable name resolution so hostnames and service names replace raw numbers, then build the story of an exchange:</p>
  <ol>
    <li><strong>DNS</strong> — the first record: who asked for which name?</li>
    <li><strong>ARP</strong> — the local partner who answered?</li>
    <li><strong>TCP handshake</strong> — which source port connects to which destination port?</li>
    <li><strong>Request and data</strong> — what was actually asked for, and how many bytes came back?</li>
  </ol>
  <h2>Filter to one conversation</h2>
  <pre class="code-block">tcp.stream eq 0          — isolate the first TCP session
ip.addr eq 192.168.1.10  — everything from one host
_frame.time starts with  — bucket by time window</pre>
  <h2>Spot the anomalies</h2>
  <table>
    <tr><th>Signal</th><th>Likely meaning</th></tr>
    <tr><td>Repeated duplicate ACKs</td><td>Packet loss on the path</td></tr>
    <tr><td>TCP retransmission markers</td><td>Dropped or reordered segments</td></tr>
    <tr><td>Zero window</td><td>Receiver buffer is full</td></tr>
    <tr><td>RST and FIN sprees</td><td>Abrupt application or firewall closure</td></tr>
    <tr><td>Long gaps between packets</td><td>Application latency, not network</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Statistics is your friend</strong>
    <p>Statistics &gt; Conversations ranked by bytes quickly names the loudest traffic; Statistics &gt; IO Graph shows the latency spikes no single packet reveals.</p>
  </div>
  <div class="callout callout-info">
    <strong>When IP is encrypted</strong>
    <p>For HTTPS, analyze framing, timing, and endpoint behavior; the payload stays confidential — which is the point of a good design.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01300000-0000-4000-8000-000000000427',
  '01300000-0000-4000-8000-000000000327',
  1,
  'Capstone: Analyze an HTTP Conversation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Analyze an HTTP Conversation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #6366f1; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #4338ca; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #eef2ff; color: #4338ca; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #e0e7ff; border-left: 4px solid #6366f1; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #eef2ff; color: #4338ca; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #818cf8; }
.dark .lesson-page h2 { color: #a5b4fc; }
.dark .lesson-page .ic { background: #312e81; color: #a5b4fc; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #a5b4fc; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Analyze an HTTP Conversation</h1>
  <p>Everything you learned collapses into one exercise: capture or load a single HTTP request, then narrate the conversation from the first DNS lookup to the final HTTP reply.</p>
  <h2>The expected sequence</h2>
  <pre class="code-block">1. DNS query: example.com
2. DNS answer: A 93.184.216.34
3. TCP: SYN / SYN-ACK / ACK  (ports 49152 - 80)
4. HTTP: GET /index.html  HTTP/1.1
5. HTTP: 200 OK  (html)
6. TCP: FIN / ACK</pre>
  <h2>Checklist for the write-up</h2>
  <ol>
    <li>Which handshake took how many round trips?</li>
    <li>What is the port quadruple of the session?</li>
    <li>How many bytes did each response carry?</li>
    <li>Were there retransmissions, and where did they fall?</li>
    <li>How long did the whole exchange take?</li>
  </ol>
  <h2>Troubleshooting with the capture</h2>
  <p>If the page never loads, the capture tells you exactly why: no DNS answer means resolution failed, no SYN-ACK means the server refused, an empty reply after a 200 means the body is a redirect you followed, and retransmissions mean the path is dropping frames.</p>
  <div class="callout callout-tip">
    <strong>Your own lab</strong>
    <p>Open a browser, capture on your loopback, and load any local or public page. Then Follow TCP Stream and read the raw text exchange end to end.</p>
  </div>
  <div class="callout callout-info">
    <strong>Structuring the answer</strong>
    <p>A good analysis names every phase — DNS, ARP, handshake, request, response — and ties each back to the layer that owns it. Format your notes as the layers come, not in capture order.</p>
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
  ('01300000-0000-4000-8000-000000000501', '01300000-0000-4000-8000-000000000303',
   'At which OSI layer do routers make forwarding decisions?',
   'Routers operate at Layer 3 (Network), forwarding packets between networks using IP addresses.', 1),
  ('01300000-0000-4000-8000-000000000502', '01300000-0000-4000-8000-000000000303',
   'In the TCP/IP model, what is the transport-layer protocol data unit called?',
   'TCP data is carried in segments; the equivalent in UDP is called a datagram.', 2),
  ('01300000-0000-4000-8000-000000000503', '01300000-0000-4000-8000-000000000303',
   'Which device forwards Ethernet frames based on destination MAC addresses?',
   'Switches learn the MAC-to-port mapping in a MAC address table and forward frames at Layer 2.', 3),
  ('01300000-0000-4000-8000-000000000504', '01300000-0000-4000-8000-000000000306',
   'What does the Address Resolution Protocol (ARP) map?',
   'ARP resolves a next-hop IP address to the MAC address needed to build the outgoing Ethernet frame.', 1),
  ('01300000-0000-4000-8000-000000000505', '01300000-0000-4000-8000-000000000306',
   'Which IPv4 address is the loopback address?',
   '127.0.0.1 is the loopback (localhost) address; traffic to it never leaves the host.', 2),
  ('01300000-0000-4000-8000-000000000506', '01300000-0000-4000-8000-000000000306',
   'Which of the following ranges is private per RFC 1918?',
   '172.16.0.0/12 covers 172.16.0.0 through 172.31.255.255 and is a private range, not routable on the public internet.', 3),
  ('01300000-0000-4000-8000-000000000507', '01300000-0000-4000-8000-000000000309',
   'What is the destination MAC address of an ARP request?',
   'An ARP request is broadcast to FF:FF:FF:FF:FF:FF because the sender does not yet know the target MAC.', 1),
  ('01300000-0000-4000-8000-000000000508', '01300000-0000-4000-8000-000000000309',
   'How many bits long is an IPv6 address?',
   'An IPv6 address is 128 bits, written as eight groups of four hexadecimal digits.', 2),
  ('01300000-0000-4000-8000-000000000509', '01300000-0000-4000-8000-000000000309',
   'What does SLAAC provide?',
   'SLAAC (Stateless Address Autoconfiguration) lets a host build its own global IPv6 address without a DHCP server.', 3),
  ('01300000-0000-4000-8000-000000000510', '01300000-0000-4000-8000-000000000312',
   'Which ICMP message does traceroute rely on to expose each hop?',
   'A router that decrements TTL to zero replies with ICMP Time Exceeded, revealing itself hop by hop.', 1),
  ('01300000-0000-4000-8000-000000000511', '01300000-0000-4000-8000-000000000312',
   'Which IP header field does traceroute increment to reach the next hop?',
   'Traceroute starts the Time To Live at 1 and increases it each round to learn the next router.', 2),
  ('01300000-0000-4000-8000-000000000512', '01300000-0000-4000-8000-000000000312',
   'To reach a host outside its subnet, IPv4 sends the packet to which address?',
   'The default gateway receives anything the host cannot reach on its own subnet and routes it onward.', 3),
  ('01300000-0000-4000-8000-000000000513', '01300000-0000-4000-8000-000000000315',
   'Which segment opens a TCP connection?',
   'The client sends a SYN segment with an initial sequence number; the server replies SYN-ACK, then the client ACKs.', 1),
  ('01300000-0000-4000-8000-000000000514', '01300000-0000-4000-8000-000000000315',
   'What does a TCP acknowledgement confirm?',
   'The ACK number names the next expected byte, confirming that every earlier byte arrived.', 2),
  ('01300000-0000-4000-8000-000000000515', '01300000-0000-4000-8000-000000000315',
   'Which TCP congestion control mechanism doubles its send rate each round trip?',
   'Slow start grows the congestion window exponentially until loss or the slow start threshold appears.', 3),
  ('01300000-0000-4000-8000-000000000516', '01300000-0000-4000-8000-000000000318',
   'Which type of traffic is best served by UDP rather than TCP?',
   'Live video prefers UDP because a retransmitted frame arrives too late to be useful.', 1),
  ('01300000-0000-4000-8000-000000000517', '01300000-0000-4000-8000-000000000318',
   'How does UDP guarantee delivery?',
   'It does not; UDP is a best-effort protocol with no retransmission, ordering, or handshake.', 2),
  ('01300000-0000-4000-8000-000000000518', '01300000-0000-4000-8000-000000000318',
   'QUIC, the transport behind HTTP/3, runs over which protocol?',
   'QUIC runs over UDP and adds reliability and encryption at the transport layer.', 3),
  ('01300000-0000-4000-8000-000000000519', '01300000-0000-4000-8000-000000000321',
   'Which HTTP method is idempotent?',
   'GET is safe and idempotent: repeating it produces the same result and changes no server state.', 1),
  ('01300000-0000-4000-8000-000000000520', '01300000-0000-4000-8000-000000000321',
   'What does HTTP status code 404 indicate?',
   '404 Not Found means the server could not locate a resource for the requested URL.', 2),
  ('01300000-0000-4000-8000-000000000521', '01300000-0000-4000-8000-000000000321',
   'How does a stateless protocol like HTTP keep a user logged in?',
   'Cookies carry a session token the client returns on later requests, recreating state across stateless calls.', 3),
  ('01300000-0000-4000-8000-000000000522', '01300000-0000-4000-8000-000000000324',
   'Which HTTP/2 feature allows many requests to share one connection?',
   'Multiplexing interleaves many streams over a single TCP connection, ending per-request connection waste.', 1),
  ('01300000-0000-4000-8000-000000000523', '01300000-0000-4000-8000-000000000324',
   'Which transport does HTTP/3 use?',
   'HTTP/3 runs over QUIC, which rides on UDP and brings per-stream congestion control.', 2),
  ('01300000-0000-4000-8000-000000000524', '01300000-0000-4000-8000-000000000324',
   'What does an X.509 certificate bind together?',
   'It binds a public key to an identity and is signed by a trusted certificate authority.', 3),
  ('01300000-0000-4000-8000-000000000525', '01300000-0000-4000-8000-000000000328',
   'Which order correctly shows data as it is encapsulated for the wire?',
   'Application data is wrapped in a segment (L4), then a packet (L3), then a frame (L2).', 1),
  ('01300000-0000-4000-8000-000000000526', '01300000-0000-4000-8000-000000000328',
   'Which protocol is the best choice for a live video conference?',
   'UDP minimizes latency, accepting lost frames rather than delaying the stream with retransmissions.', 2),
  ('01300000-0000-4000-8000-000000000527', '01300000-0000-4000-8000-000000000328',
   'What is the first step before virtually any web request?',
   'A DNS lookup resolves the hostname to an address so the client knows where to connect.', 3),
  ('01300000-0000-4000-8000-000000000528', '01300000-0000-4000-8000-000000000328',
   'A capture shows duplicate ACKs followed by TCP retransmissions. What does that show?',
   'The retransmissions indicate packet loss on the path; TCP is recovering what UDP would have dropped.', 4),
  ('01300000-0000-4000-8000-000000000529', '01300000-0000-4000-8000-000000000328',
   'What is a best practice when sharing a packet capture?',
   'Redact or replace personal and sensitive data before publishing any capture.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): routing layer
  ('01300000-0000-4000-8000-000000001001', '01300000-0000-4000-8000-000000000501', 'Network Layer', TRUE,  1),
  ('01300000-0000-4000-8000-000000001002', '01300000-0000-4000-8000-000000000501', 'Data Link Layer', FALSE, 2),
  ('01300000-0000-4000-8000-000000001003', '01300000-0000-4000-8000-000000000501', 'Transport Layer', FALSE, 3),
  ('01300000-0000-4000-8000-000000001004', '01300000-0000-4000-8000-000000000501', 'Application Layer', FALSE, 4),
  -- Q1 (501)q2: transport PDU
  ('01300000-0000-4000-8000-000000001005', '01300000-0000-4000-8000-000000000502', 'Packet', FALSE, 1),
  ('01300000-0000-4000-8000-000000001006', '01300000-0000-4000-8000-000000000502', 'Segment', TRUE,  2),
  ('01300000-0000-4000-8000-000000001007', '01300000-0000-4000-8000-000000000502', 'Frame', FALSE, 3),
  ('01300000-0000-4000-8000-000000001008', '01300000-0000-4000-8000-000000000502', 'Datagram', FALSE, 4),
  -- Q1 (501)q3: ethernet device
  ('01300000-0000-4000-8000-000000001009', '01300000-0000-4000-8000-000000000503', 'Router', FALSE, 1),
  ('01300000-0000-4000-8000-000000001010', '01300000-0000-4000-8000-000000000503', 'Hub', FALSE, 2),
  ('01300000-0000-4000-8000-000000001011', '01300000-0000-4000-8000-000000000503', 'Switch', TRUE,  3),
  ('01300000-0000-4000-8000-000000001012', '01300000-0000-4000-8000-000000000503', 'Firewall', FALSE, 4),
  -- Q2 (504): ARP mapping
  ('01300000-0000-4000-8000-000000001013', '01300000-0000-4000-8000-000000000504', 'A hostname to an IP address', FALSE, 1),
  ('01300000-0000-4000-8000-000000001014', '01300000-0000-4000-8000-000000000504', 'A port to a service name', FALSE, 2),
  ('01300000-0000-4000-8000-000000001015', '01300000-0000-4000-8000-000000000504', 'A MAC address to an IP address', FALSE, 3),
  ('01300000-0000-4000-8000-000000001016', '01300000-0000-4000-8000-000000000504', 'An IP address to a MAC address', TRUE,  4),
  -- Q2 (504)q2: loopback
  ('01300000-0000-4000-8000-000000001017', '01300000-0000-4000-8000-000000000505', '127.0.0.1', TRUE,  1),
  ('01300000-0000-4000-8000-000000001018', '01300000-0000-4000-8000-000000000505', '0.0.0.0', FALSE, 2),
  ('01300000-0000-4000-8000-000000001019', '01300000-0000-4000-8000-000000000505', '192.168.1.1', FALSE, 3),
  ('01300000-0000-4000-8000-000000001020', '01300000-0000-4000-8000-000000000505', '255.255.255.255', FALSE, 4),
  -- Q2 (504)q3: RFC1918 range
  ('01300000-0000-4000-8000-000000001021', '01300000-0000-4000-8000-000000000506', '10.0.0.0/8', FALSE, 1),
  ('01300000-0000-4000-8000-000000001022', '01300000-0000-4000-8000-000000000506', '172.16.0.0/12', TRUE,  2),
  ('01300000-0000-4000-8000-000000001023', '01300000-0000-4000-8000-000000000506', '172.32.0.0/12', FALSE, 3),
  ('01300000-0000-4000-8000-000000001024', '01300000-0000-4000-8000-000000000506', '169.254.0.0/16', FALSE, 4),
  -- Q3 (507): ARP broadcast
  ('01300000-0000-4000-8000-000000001025', '01300000-0000-4000-8000-000000000507', '00:00:00:00:00:00', FALSE, 1),
  ('01300000-0000-4000-8000-000000001026', '01300000-0000-4000-8000-000000000507', 'The destination host MAC address', FALSE, 2),
  ('01300000-0000-4000-8000-000000001027', '01300000-0000-4000-8000-000000000507', 'FF:FF:FF:FF:FF:FF', TRUE,  3),
  ('01300000-0000-4000-8000-000000001028', '01300000-0000-4000-8000-000000000507', 'The router MAC address', FALSE, 4),
  -- Q3 (507)q2: IPv6 length
  ('01300000-0000-4000-8000-000000001029', '01300000-0000-4000-8000-000000000508', '32 bits', FALSE, 1),
  ('01300000-0000-4000-8000-000000001030', '01300000-0000-4000-8000-000000000508', '64 bits', FALSE, 2),
  ('01300000-0000-4000-8000-000000001031', '01300000-0000-4000-8000-000000000508', '128 bits', TRUE,  3),
  ('01300000-0000-4000-8000-000000001032', '01300000-0000-4000-8000-000000000508', '256 bits', FALSE, 4),
  -- Q3 (507)q3: SLAAC
  ('01300000-0000-4000-8000-000000001033', '01300000-0000-4000-8000-000000000509', 'Automatically configuring an IPv6 address without a DHCP server', TRUE,  1),
  ('01300000-0000-4000-8000-000000001034', '01300000-0000-4000-8000-000000000509', 'Encrypting all network traffic', FALSE, 2),
  ('01300000-0000-4000-8000-000000001035', '01300000-0000-4000-8000-000000000509', 'Assigning IPv4 private addresses', FALSE, 3),
  ('01300000-0000-4000-8000-000000001036', '01300000-0000-4000-8000-000000000509', 'Providing a TCP reliability layer', FALSE, 4),
  -- Q4 (510): ICMP traceroute
  ('01300000-0000-4000-8000-000000001037', '01300000-0000-4000-8000-000000000510', 'Echo Reply', FALSE, 1),
  ('01300000-0000-4000-8000-000000001038', '01300000-0000-4000-8000-000000000510', 'Time Exceeded', TRUE,  2),
  ('01300000-0000-4000-8000-000000001039', '01300000-0000-4000-8000-000000000510', 'Redirect', FALSE, 3),
  ('01300000-0000-4000-8000-000000001040', '01300000-0000-4000-8000-000000000510', 'Destination Unreachable', FALSE, 4),
  -- Q4 (510)q2: TTL trick
  ('01300000-0000-4000-8000-000000001041', '01300000-0000-4000-8000-000000000511', 'Source port', FALSE, 1),
  ('01300000-0000-4000-8000-000000001042', '01300000-0000-4000-8000-000000000511', 'Checksum', FALSE, 2),
  ('01300000-0000-4000-8000-000000001043', '01300000-0000-4000-8000-000000000511', 'Time To Live', TRUE,  3),
  ('01300000-0000-4000-8000-000000001044', '01300000-0000-4000-8000-000000000511', 'Sequence Number', FALSE, 4),
  -- Q4 (510)q3: default gateway
  ('01300000-0000-4000-8000-000000001045', '01300000-0000-4000-8000-000000000512', 'The loopback address', FALSE, 1),
  ('01300000-0000-4000-8000-000000001046', '01300000-0000-4000-8000-000000000512', 'A broadcast to the whole internet', FALSE, 2),
  ('01300000-0000-4000-8000-000000001047', '01300000-0000-4000-8000-000000000512', 'The DHCP server', FALSE, 3),
  ('01300000-0000-4000-8000-000000001048', '01300000-0000-4000-8000-000000000512', 'The default gateway', TRUE,  4),
  -- Q5 (513): SYN open
  ('01300000-0000-4000-8000-000000001049', '01300000-0000-4000-8000-000000000513', 'SYN', TRUE,  1),
  ('01300000-0000-4000-8000-000000001050', '01300000-0000-4000-8000-000000000513', 'FIN', FALSE, 2),
  ('01300000-0000-4000-8000-000000001051', '01300000-0000-4000-8000-000000000513', 'ACK', FALSE, 3),
  ('01300000-0000-4000-8000-000000001052', '01300000-0000-4000-8000-000000000513', 'RST', FALSE, 4),
  -- Q5 (513)q2: ack meaning
  ('01300000-0000-4000-8000-000000001053', '01300000-0000-4000-8000-000000000514', 'That the connection is closing', FALSE, 1),
  ('01300000-0000-4000-8000-000000001054', '01300000-0000-4000-8000-000000000514', 'The next expected byte, confirming earlier data', TRUE,  2),
  ('01300000-0000-4000-8000-000000001055', '01300000-0000-4000-8000-000000000514', 'An error in the checksum', FALSE, 3),
  ('01300000-0000-4000-8000-000000001056', '01300000-0000-4000-8000-000000000514', 'A reset of the stream', FALSE, 4),
  -- Q5 (513)q3: slow start
  ('01300000-0000-4000-8000-000000001057', '01300000-0000-4000-8000-000000000515', 'The three-way handshake', FALSE, 1),
  ('01300000-0000-4000-8000-000000001058', '01300000-0000-4000-8000-000000000515', 'Window scaling', FALSE, 2),
  ('01300000-0000-4000-8000-000000001059', '01300000-0000-4000-8000-000000000515', 'Slow start', TRUE,  3),
  ('01300000-0000-4000-8000-000000001060', '01300000-0000-4000-8000-000000000515', 'Maximum segment size', FALSE, 4),
  -- Q6 (516): UDP traffic
  ('01300000-0000-4000-8000-000000001061', '01300000-0000-4000-8000-000000000516', 'Email delivery', FALSE, 1),
  ('01300000-0000-4000-8000-000000001062', '01300000-0000-4000-8000-000000000516', 'Banking transactions', FALSE, 2),
  ('01300000-0000-4000-8000-000000001063', '01300000-0000-4000-8000-000000000516', 'Large file downloads', FALSE, 3),
  ('01300000-0000-4000-8000-000000001064', '01300000-0000-4000-8000-000000000516', 'Live video streaming', TRUE,  4),
  -- Q6 (516)q2: best effort
  ('01300000-0000-4000-8000-000000001065', '01300000-0000-4000-8000-000000000517', 'Best-effort delivery with no retransmission', TRUE,  1),
  ('01300000-0000-4000-8000-000000001066', '01300000-0000-4000-8000-000000000517', 'Guaranteed ordering of datagrams', FALSE, 2),
  ('01300000-0000-4000-8000-000000001067', '01300000-0000-4000-8000-000000000517', 'Automatic retransmission of lost packets', FALSE, 3),
  ('01300000-0000-4000-8000-000000001068', '01300000-0000-4000-8000-000000000517', 'A three-way handshake', FALSE, 4),
  -- Q6 (516)q3: QUIC over UDP
  ('01300000-0000-4000-8000-000000001069', '01300000-0000-4000-8000-000000000518', 'TCP', FALSE, 1),
  ('01300000-0000-4000-8000-000000001070', '01300000-0000-4000-8000-000000000518', 'UDP', TRUE,  2),
  ('01300000-0000-4000-8000-000000001071', '01300000-0000-4000-8000-000000000518', 'ICMP', FALSE, 3),
  ('01300000-0000-4000-8000-000000001072', '01300000-0000-4000-8000-000000000518', 'ARP', FALSE, 4),
  -- Q7 (519): idempotent method
  ('01300000-0000-4000-8000-000000001073', '01300000-0000-4000-8000-000000000519', 'POST', FALSE, 1),
  ('01300000-0000-4000-8000-000000001074', '01300000-0000-4000-8000-000000000519', 'PUT', FALSE, 2),
  ('01300000-0000-4000-8000-000000001075', '01300000-0000-4000-8000-000000000519', 'GET', TRUE,  3),
  ('01300000-0000-4000-8000-000000001076', '01300000-0000-4000-8000-000000000519', 'DELETE', FALSE, 4),
  -- Q7 (519)q2: 404
  ('01300000-0000-4000-8000-000000001077', '01300000-0000-4000-8000-000000000520', 'Internal Server Error', FALSE, 1),
  ('01300000-0000-4000-8000-000000001078', '01300000-0000-4000-8000-000000000520', 'Forbidden', FALSE, 2),
  ('01300000-0000-4000-8000-000000001079', '01300000-0000-4000-8000-000000000520', 'Moved Permanently', FALSE, 3),
  ('01300000-0000-4000-8000-000000001080', '01300000-0000-4000-8000-000000000520', 'Not Found', TRUE,  4),
  -- Q7 (519)q3: statelessness
  ('01300000-0000-4000-8000-000000001081', '01300000-0000-4000-8000-000000000521', 'Cookies that carry a session token', TRUE,  1),
  ('01300000-0000-4000-8000-000000001082', '01300000-0000-4000-8000-000000000521', 'The server remembering every request', FALSE, 2),
  ('01300000-0000-4000-8000-000000001083', '01300000-0000-4000-8000-000000000521', 'Persistent IP addresses', FALSE, 3),
  ('01300000-0000-4000-8000-000000001084', '01300000-0000-4000-8000-000000000521', 'WebSocket upgrades', FALSE, 4),
  -- Q8 (522): multiplexing
  ('01300000-0000-4000-8000-000000001085', '01300000-0000-4000-8000-000000000522', 'One request per connection', FALSE, 1),
  ('01300000-0000-4000-8000-000000001086', '01300000-0000-4000-8000-000000000522', 'Multiplexing many streams over one connection', TRUE,  2),
  ('01300000-0000-4000-8000-000000001087', '01300000-0000-4000-8000-000000000522', 'Uncompressed plain-text headers', FALSE, 3),
  ('01300000-0000-4000-8000-000000001088', '01300000-0000-4000-8000-000000000522', 'Server-pushed TCP resets', FALSE, 4),
  -- Q8 (522)q2: HTTP/3 transport
  ('01300000-0000-4000-8000-000000001089', '01300000-0000-4000-8000-000000000523', 'Plain TCP', FALSE, 1),
  ('01300000-0000-4000-8000-000000001090', '01300000-0000-4000-8000-000000000523', 'TCP with TLS', FALSE, 2),
  ('01300000-0000-4000-8000-000000001091', '01300000-0000-4000-8000-000000000523', 'QUIC over UDP', TRUE,  3),
  ('01300000-0000-4000-8000-000000001092', '01300000-0000-4000-8000-000000000523', 'ICMP tunnels', FALSE, 4),
  -- Q8 (522)q3: X.509 binding
  ('01300000-0000-4000-8000-000000001093', '01300000-0000-4000-8000-000000000524', 'A username and a password', FALSE, 1),
  ('01300000-0000-4000-8000-000000001094', '01300000-0000-4000-8000-000000000524', 'An IP address and a port', FALSE, 2),
  ('01300000-0000-4000-8000-000000001095', '01300000-0000-4000-8000-000000000524', 'A domain name and a TTL value', FALSE, 3),
  ('01300000-0000-4000-8000-000000001096', '01300000-0000-4000-8000-000000000524', 'A public key and an identity, signed by a CA', TRUE,  4),
  -- Q9 (525): encapsulation order
  ('01300000-0000-4000-8000-000000001097', '01300000-0000-4000-8000-000000000525', 'Data, segment, packet, frame', TRUE,  1),
  ('01300000-0000-4000-8000-000000001098', '01300000-0000-4000-8000-000000000525', 'Frame, packet, segment, data', FALSE, 2),
  ('01300000-0000-4000-8000-000000001099', '01300000-0000-4000-8000-000000000525', 'Segment, data, frame, packet', FALSE, 3),
  ('01300000-0000-4000-8000-000000001100', '01300000-0000-4000-8000-000000000525', 'Packet, frame, data, segment', FALSE, 4),
  -- Q9 (525)q2: live video
  ('01300000-0000-4000-8000-000000001101', '01300000-0000-4000-8000-000000000526', 'TCP', FALSE, 1),
  ('01300000-0000-4000-8000-000000001102', '01300000-0000-4000-8000-000000000526', 'UDP', TRUE,  2),
  ('01300000-0000-4000-8000-000000001103', '01300000-0000-4000-8000-000000000526', 'SMTP', FALSE, 3),
  ('01300000-0000-4000-8000-000000001104', '01300000-0000-4000-8000-000000000526', 'FTP', FALSE, 4),
  -- Q9 (525)q3: first step
  ('01300000-0000-4000-8000-000000001105', '01300000-0000-4000-8000-000000000527', 'A TCP handshake to the IP directly', FALSE, 1),
  ('01300000-0000-4000-8000-000000001106', '01300000-0000-4000-8000-000000000527', 'An ARP request for the server', FALSE, 2),
  ('01300000-0000-4000-8000-000000001107', '01300000-0000-4000-8000-000000000527', 'A DNS lookup to resolve the hostname', TRUE,  3),
  ('01300000-0000-4000-8000-000000001108', '01300000-0000-4000-8000-000000000527', 'A TLS handshake before any lookup', FALSE, 4),
  -- Q9 (525)q4: retransmission signal
  ('01300000-0000-4000-8000-000000001109', '01300000-0000-4000-8000-000000000528', 'The connection is encrypted', FALSE, 1),
  ('01300000-0000-4000-8000-000000001110', '01300000-0000-4000-8000-000000000528', 'The server refused the connection', FALSE, 2),
  ('01300000-0000-4000-8000-000000001111', '01300000-0000-4000-8000-000000000528', 'The client closed the connection', FALSE, 3),
  ('01300000-0000-4000-8000-000000001112', '01300000-0000-4000-8000-000000000528', 'Packets are being lost on the path', TRUE,  4),
  -- Q9 (525)q5: capture best practice
  ('01300000-0000-4000-8000-000000001113', '01300000-0000-4000-8000-000000000529', 'Redact or replace personal data before sharing', TRUE,  1),
  ('01300000-0000-4000-8000-000000001114', '01300000-0000-4000-8000-000000000529', 'Post the raw capture to a public forum', FALSE, 2),
  ('01300000-0000-4000-8000-000000001115', '01300000-0000-4000-8000-000000000529', 'Share the private key alongside the capture', FALSE, 3),
  ('01300000-0000-4000-8000-000000001116', '01300000-0000-4000-8000-000000000529', 'Remove the timestamps only', FALSE, 4)
ON CONFLICT (id) DO NOTHING;