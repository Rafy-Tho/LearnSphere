-- ============================================================================
-- SEED 049: Complete course — "Switching & VLANs"
-- ----------------------------------------------------------------------------
-- Instructor : Sarah Chen        (10000000-0000-4000-8000-000000000001)
-- Category   : Networking        (20000000-0000-4000-8000-000000000006)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Switch Foundations        → C1 Switch Forwarding & MAC Tables · C2 Switching vs Routing
--   M2 VLAN Fundamentals         → C3 VLAN Basics · C4 802.1Q Trunking
--   M3 Designing with VLANs      → C5 VLAN Design & Segmentation · C6 Inter-VLAN Routing
--   M4 Resilience & Security     → C7 Spanning Tree Protocol · C8 Link Aggregation & Port Security
--   M5 Maintenance & Capstone    → C9 Troubleshooting Switching · C10 Capstone Lab
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
  '03100000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '20000000-0000-4000-8000-000000000006',
  'Switching & VLANs',
  'switching-and-vlans',
  'Master the switches that carry your traffic. Learn Layer 2 forwarding, MAC address tables, VLAN design, 802.1Q trunks, inter-VLAN routing, Spanning Tree, and the hardening and troubleshooting skills real network engineers use every day.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  47
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('03100000-0000-4000-8000-000000000011', '03100000-0000-4000-8000-000000000001', 'Explain how Ethernet switches learn, forward, and filter frames.',           1),
  ('03100000-0000-4000-8000-000000000012', '03100000-0000-4000-8000-000000000001', 'Segment networks with VLANs and trunk them using 802.1Q.',                 2),
  ('03100000-0000-4000-8000-000000000013', '03100000-0000-4000-8000-000000000001', 'Route between VLANs with routers, subinterfaces, and Layer 3 switches.',    3),
  ('03100000-0000-4000-8000-000000000014', '03100000-0000-4000-8000-000000000001', 'Prevent loops and failures with Spanning Tree and link aggregation.',       4),
  ('03100000-0000-4000-8000-000000000015', '03100000-0000-4000-8000-000000000001', 'Secure, troubleshoot, and validate switched networks end to end.',          5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('03100000-0000-4000-8000-000000000101', '03100000-0000-4000-8000-000000000001', 1, 'Switch Foundations',       'Master frame forwarding, MAC learning, and the Layer 2 edge.',     'PUBLISHED'),
  ('03100000-0000-4000-8000-000000000102', '03100000-0000-4000-8000-000000000001', 2, 'VLAN Fundamentals',        'Segment broadcast domains and trunk between switches.',            'PUBLISHED'),
  ('03100000-0000-4000-8000-000000000103', '03100000-0000-4000-8000-000000000001', 3, 'Designing with VLANs',     'Design segmentation schemes and route between VLANs.',             'PUBLISHED'),
  ('03100000-0000-4000-8000-000000000104', '03100000-0000-4000-8000-000000000001', 4, 'Resilience & Security',    'Loop prevention, link bundling, and access port hardening.',       'PUBLISHED'),
  ('03100000-0000-4000-8000-000000000105', '03100000-0000-4000-8000-000000000001', 5, 'Maintenance & Capstone',   'Troubleshoot Layer 2 and build a final multi-VLAN lab.',           'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('03100000-0000-4000-8000-000000000201', '03100000-0000-4000-8000-000000000101', 1, 'Switch Forwarding & MAC Tables', 'How frames find their way and how switches learn.',    'PUBLISHED'),
  ('03100000-0000-4000-8000-000000000202', '03100000-0000-4000-8000-000000000101', 2, 'Switching vs Routing',           'Where Layer 2 ends and Layer 3 begins.',                'PUBLISHED'),
  ('03100000-0000-4000-8000-000000000203', '03100000-0000-4000-8000-000000000102', 1, 'VLAN Basics',                    'Logical broadcast domains on a physical switch.',       'PUBLISHED'),
  ('03100000-0000-4000-8000-000000000204', '03100000-0000-4000-8000-000000000102', 2, '802.1Q Trunking',                'Carry many VLANs over a single link.',                  'PUBLISHED'),
  ('03100000-0000-4000-8000-000000000205', '03100000-0000-4000-8000-000000000103', 1, 'VLAN Design & Segmentation',     'Plan schemes, subnets, and isolation.',                 'PUBLISHED'),
  ('03100000-0000-4000-8000-000000000206', '03100000-0000-4000-8000-000000000103', 2, 'Inter-VLAN Routing',             'Route traffic between broadcast domains.',              'PUBLISHED'),
  ('03100000-0000-4000-8000-000000000207', '03100000-0000-4000-8000-000000000104', 1, 'Spanning Tree Protocol',         'Prevent loops on redundant switches.',                  'PUBLISHED'),
  ('03100000-0000-4000-8000-000000000208', '03100000-0000-4000-8000-000000000104', 2, 'Link Aggregation & Port Security','Bundles, port security, and switch hardening.',         'PUBLISHED'),
  ('03100000-0000-4000-8000-000000000209', '03100000-0000-4000-8000-000000000105', 1, 'Troubleshooting Switching',      'Methods and fixes for faulty Layer 2.',                 'PUBLISHED'),
  ('03100000-0000-4000-8000-000000000210', '03100000-0000-4000-8000-000000000105', 2, 'Capstone Lab',                   'Build and verify a multi-VLAN campus.',                 'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 03100000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('03100000-0000-4000-8000-000000000301', '03100000-0000-4000-8000-000000000201', 1, 'How Switches Forward Frames',         'Understand how switches learn and forward frames using Layer 2 addresses.',          'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03100000-0000-4000-8000-000000000302', '03100000-0000-4000-8000-000000000201', 2, 'MAC Address Tables & Learning',        'Learn how MAC address tables are built, aged, and used for forwarding.',             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000303', '03100000-0000-4000-8000-000000000201', 3, 'Switch Forwarding Quiz',               'Check your understanding of forwarding and the MAC address table.',                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03100000-0000-4000-8000-000000000304', '03100000-0000-4000-8000-000000000202', 1, 'Switching vs Routing',                 'Compare switching and routing and clarify their roles.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000305', '03100000-0000-4000-8000-000000000202', 2, 'Switching Modes & Latency',            'Explore the switching modes and the latency they trade for error checking.',         'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('03100000-0000-4000-8000-000000000306', '03100000-0000-4000-8000-000000000202', 3, 'Switching vs Routing Quiz',            'Check your grasp of switching versus routing concepts.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03100000-0000-4000-8000-000000000307', '03100000-0000-4000-8000-000000000203', 1, 'What Are VLANs?',                      'Understand VLANs as logical Layer 2 broadcast domains.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000308', '03100000-0000-4000-8000-000000000203', 2, 'Access Ports & VLAN Assignment',       'Assign ports to VLANs and manage untagged access frames.',                           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000309', '03100000-0000-4000-8000-000000000203', 3, 'VLAN Fundamentals Quiz',               'Check your VLAN fundamentals.',                                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03100000-0000-4000-8000-000000000310', '03100000-0000-4000-8000-000000000204', 1, '802.1Q Trunking',                      'Discover how the 802.1Q tag carries VLAN membership over trunk links.',              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000311', '03100000-0000-4000-8000-000000000204', 2, 'Trunk Configuration & Native VLAN',    'Configure trunks, the native VLAN, and the allowed VLAN list.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000312', '03100000-0000-4000-8000-000000000204', 3, '802.1Q Trunking Quiz',                 'Check your 802.1Q trunking knowledge.',                                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03100000-0000-4000-8000-000000000313', '03100000-0000-4000-8000-000000000205', 1, 'VLAN Design Principles & Segmentation','Design VLAN schemes that contain broadcasts and simplify operations.',               'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03100000-0000-4000-8000-000000000314', '03100000-0000-4000-8000-000000000205', 2, 'VLANs for Security & QoS',             'Use VLANs to isolate users and carry voice and quality classes.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000315', '03100000-0000-4000-8000-000000000205', 3, 'VLAN Design Quiz',                     'Check your VLAN design skills.',                                                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03100000-0000-4000-8000-000000000316', '03100000-0000-4000-8000-000000000206', 1, 'Inter-VLAN Routing',                   'Route between VLANs with routers, subinterfaces, and SVIs.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000317', '03100000-0000-4000-8000-000000000206', 2, 'Router-on-a-Stick & Layer 3 Switches', 'Compare router-on-a-stick with Layer 3 switching in detail.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000318', '03100000-0000-4000-8000-000000000206', 3, 'Inter-VLAN Routing Quiz',              'Check your inter-VLAN routing knowledge.',                                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03100000-0000-4000-8000-000000000319', '03100000-0000-4000-8000-000000000207', 1, 'Why STP Exists & How It Works',         'Understand bridging loops and how Spanning Tree prevents them.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000320', '03100000-0000-4000-8000-000000000207', 2, 'STP Variants & Tuning',                'Tune STP with RSTP, PVST+, and edge-port protection features.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000321', '03100000-0000-4000-8000-000000000207', 3, 'Spanning Tree Quiz',                   'Check your Spanning Tree Protocol knowledge.',                                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03100000-0000-4000-8000-000000000322', '03100000-0000-4000-8000-000000000208', 1, 'Link Aggregation & Link Bundling',     'Bundle links with EtherChannel and LACP for speed and redundancy.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000323', '03100000-0000-4000-8000-000000000208', 2, 'Port Security & Switch Hardening',     'Harden access ports and protect the management plane.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000324', '03100000-0000-4000-8000-000000000208', 3, 'Resilience & Security Quiz',           'Check your link aggregation and port security knowledge.',                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('03100000-0000-4000-8000-000000000325', '03100000-0000-4000-8000-000000000209', 1, 'Switch Troubleshooting Methodology',   'Apply a disciplined method when switches misbehave.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('03100000-0000-4000-8000-000000000326', '03100000-0000-4000-8000-000000000209', 2, 'Common Switching Faults & Fixes',      'Recognize and fix the most common switching faults.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03100000-0000-4000-8000-000000000327', '03100000-0000-4000-8000-000000000210', 1, 'Capstone: A Multi-VLAN Campus',        'Build and verify a complete multi-VLAN campus lab.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('03100000-0000-4000-8000-000000000328', '03100000-0000-4000-8000-000000000210', 2, 'Final Assessment',                     'Prove what you learned across the whole course.',                                   'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 03100000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '03100000-0000-4000-8000-000000000401',
  '03100000-0000-4000-8000-000000000301',
  1,
  'How Switches Forward Frames',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>How Switches Forward Frames</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>How Switches Forward Frames</h1>
  <p>An Ethernet switch is the workhorse of the network edge. It makes fast, local decisions about where to send every frame — using only the <strong>destination MAC address</strong> carried in that frame. This is a Layer 2 decision: no IP lookup, no route table, no TTL.</p>
  <h2>A switch makes three decisions</h2>
  <p>For every frame that arrives on an interface, the switch performs the same three steps:</p>
  <ol>
    <li><em>Learn</em> — read the <span class="ic">source MAC</span> and record which port and VLAN it arrived on (the next lesson covers this in depth).</li>
    <li><em>Look up</em> — read the <span class="ic">destination MAC</span> and search the MAC address table for a match.</li>
    <li><em>Forward or filter</em> — send the frame out the matching port, flood it, or drop it, based on the lookup result.</li>
  </ol>
  <h2>The forwarding decision</h2>
  <p>There are only a handful of outcomes, shown below.</p>
  <table>
    <tr><th>Destination MAC</th><th>Action</th></tr>
    <tr><td>Known in the MAC table</td><td>Forward out only the matching port</td></tr>
    <tr><td>Unknown (not in the table)</td><td>Flood out every port except the ingress port</td></tr>
    <tr><td>Same port it arrived on</td><td>Filter — do not forward it back out</td></tr>
    <tr><td>Broadcast or multicast</td><td>Flood within the VLAN (multicast may be pruned)</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Flooding is normal</strong>
    <p>An unknown unicast is flooded because the switch simply does not know where the destination lives yet. Flooding only becomes a problem when it happens constantly — a sign of a full or failing MAC table.</p>
  </div>
  <h2>Follow one frame</h2>
  <p>Concretely, imagine host A on port 1 sends a frame to host B for the very first time:</p>
  <ol>
    <li>The switch reads A as the source, learning <span class="ic">A → port 1, VLAN 10</span>.</li>
    <li>The switch looks up B — no entry yet — so it floods the frame to every other port in VLAN 10.</li>
    <li>B replies. The switch learns <span class="ic">B → its port</span>, and the reply is sent directly to A, because A is now known.</li>
    <li>From that moment on, frames between A and B are forwarded point-to-point and never flood again.</li>
  </ol>
  <h2>Switches are transparent</h2>
  <p>Unlike routers, a switch never modifies the frame it forwards. No addresses are rewritten and no upper-layer headers are touched. The frame that leaves is byte-for-byte the frame that arrived, aside from the optional 802.1Q tag you will meet later.</p>
  <ul>
    <li>No IP addresses are changed as a frame passes through a switch.</li>
    <li>No TTL is decremented between switches.</li>
    <li>Timing is the only practical limit: a cable or port running slower than the frame data rate.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Check the CRC</strong>
    <p>Store-and-forward switches verify the frame CRC and discard corrupted frames. If CRC errors climb on an interface, suspect a cable, a bad port, or a duplex mismatch — you will diagnose these later in the course.</p>
  </div>
  <p>Because every port on a modern switch is its own collision domain, two devices on different ports can transmit at the same time. This collision-free, full-duplex behavior is a large part of why switching replaced shared-hub Ethernet decades ago.</p>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000402',
  '03100000-0000-4000-8000-000000000302',
  1,
  'MAC Address Tables & Learning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAC Address Tables & Learning</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>MAC Address Tables &amp; Learning</h1>
  <p>The MAC (or CAM) address table is the switch memory that maps <strong>MAC address → VLAN → egress port</strong>. Every forwarding decision the switch makes is a lookup against this table, so understanding how it is built and maintained is the key to understanding switching.</p>
  <h2>How the switch learns</h2>
  <p>The switch reads the <span class="ic">source MAC address</span> of every valid frame it receives and records three facts: the address, the ingress port, and the VLAN that port belongs to. This is entirely reactive — the switch never guesses; it only learns from real traffic.</p>
  <ul>
    <li>A frame is only <em>heard</em> once, but every observation refreshes the matching entry.</li>
    <li>If the same MAC shows up on a different port, the table entry is moved — a sure sign of a loop or a misconfigured port.</li>
    <li>Broadcast source addresses (all-ones) are never learned, and learning is skipped for frames that fail the FCS check.</li>
  </ul>
  <h2>Table aging</h2>
  <p>Dynamic entries are not permanent. Each entry has an age timer (the common default is 300 seconds). If a device stops sending frames, its entry expires and is removed, and the switch falls back to flooding frames destined for that device until it speaks again.</p>
  <pre class="code-block">Switch# show mac address-table
Mac Address Table
----------------------------------------------
Vlan    Mac Address       Type        Ports
----    -----------       --------    -----
  10    0050.7966.6800    DYNAMIC     Gi0/1
  10    0050.7966.6da9    DYNAMIC     Gi0/2
  20    0011.2233.4455    STATIC      Gi0/24

Total Mac Addresses for this criterion: 3</pre>
  <p>Each column answers one question about an entry:</p>
  <table>
    <tr><th>Column</th><th>Tells you</th></tr>
    <tr><td>Vlan</td><td>Which broadcast domain the address belongs to</td></tr>
    <tr><td>Mac Address</td><td>The learned next-hop address</td></tr>
    <tr><td>Type</td><td>DYNAMIC (ages out) or STATIC (pinned)</td></tr>
    <tr><td>Ports</td><td>The single egress port for that address</td></tr>
  </table>
  <h2>Static entries and security</h2>
  <p>You can pin an address to a port with a static entry so the switch always knows where it lives. Static entries never age out, and a device that tries to appear on the wrong port simply cannot be learned there.</p>
  <div class="callout callout-tip">
    <strong>Inspect on demand</strong>
    <p>When a host cannot reach the rest of its VLAN, <span class="ic">show mac address-table address &lt;mac&gt;</span> tells you which port the switch believes it is on — the fastest way to spot a device connected to the wrong port.</p>
  </div>
  <h2>What a full table is worth to an attacker</h2>
  <p>Flooding unknown unicast frames is how a snooper on a switched LAN sees other traffic. If an attacker floods so many bogus source MACs that the table fills, the switch cannot learn new addresses and starts flooding every unknown frame — effectively converting your switch into a hub. You will learn the defense (port security) later in this course.</p>
  <div class="callout callout-info">
    <strong>One table per VLAN</strong>
    <p>The table is really maintained per VLAN. The same MAC address can legitimately appear in two different VLANs, because each entry is keyed by both the MAC and the VLAN ID.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000404',
  '03100000-0000-4000-8000-000000000304',
  1,
  'Switching vs Routing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Switching vs Routing</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Switching vs Routing</h1>
  <p>Both switches and routers move data from one device to another, but they work at different layers and solve different problems. Mixing up who does what is the start of most network confusion.</p>
  <h2>The Layer 2 vs Layer 3 split</h2>
  <table>
    <tr><th>Characteristic</th><th>Switch (Layer 2)</th><th>Router (Layer 3)</th></tr>
    <tr><td>Decision input</td><td>Destination MAC address</td><td>Destination IP address</td></tr>
    <tr><td>Table consulted</td><td>MAC (CAM) table</td><td>Routing table</td></tr>
    <tr><td>Unit moved</td><td>Frame</td><td>Packet</td></tr>
    <tr><td>Broadcast domain</td><td>Does not terminate</td><td>Terminates</td></tr>
    <tr><td>Collision domain per port</td><td>One per port (full duplex)</td><td>One per interface</td></tr>
  </table>
  <h2>Internet Protocol processing</h2>
  <p>A router decrements the TTL, recomputes the IP header checksum, rewrites the Layer 2 addresses for the next hop, and consults the routing table to pick an outgoing interface. That is real Layer 3 forwarding. A switch does none of that — frames pass through the fabric untouched.</p>
  <h2>Broadcast and collision domains</h2>
  <ul>
    <li>A <strong>collision domain</strong> is a medium where two simultaneous transmissions collide. Every switch port is its own collision domain (full duplex).</li>
    <li>A <strong>broadcast domain</strong> is the set of devices that receive each other&rsquo;s broadcast frames. Switches extend it, VLANs shrink it, and routers end it.</li>
  </ul>
  <p>When you call a router your gateway, you really mean: it is the device standing at the edge of your broadcast domain, ready to carry traffic onward into another one.</p>
  <div class="callout callout-tip">
    <strong>Know which decision is which</strong>
    <p>How many broadcast domains does your network have? Count the router interfaces plus the VLANs on your switches. If the answer makes you uncomfortable, the VLAN lessons coming next are for you.</p>
  </div>
  <div class="callout callout-info">
    <strong>Why not route everything?</strong>
    <p>Switching is faster and cheaper at scale — Layer 2 fabrics cut frames in hardware while IP routing adds lookup and address overhead. Real networks use switching where possible and routing where policy, scale, or broadcast containment demands it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000405',
  '03100000-0000-4000-8000-000000000305',
  1,
  'Switching Modes & Latency',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Switching Modes & Latency</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Switching Modes &amp; Latency</h1>
  <p>A switch port can pass a frame in one of three internal modes. The mode decides <em>when</em> forwarding starts and <em>how much</em> of the frame is inspected before it begins.</p>
  <h2>Store-and-forward</h2>
  <p>The entire frame is buffered first, its CRC (FCS) is verified, and only valid frames are forwarded. Corrupted, runt, and oversized frames are dropped at the switch. This is the safest mode and the one required when platforms inspect quality-of-service markings or ACLs, but latency grows with frame size.</p>
  <h2>Cut-through</h2>
  <p>The switch reads just enough of the header to know the destination MAC and starts forwarding immediately — latency here is a few microseconds and does not grow with frame size. The price is that corrupt frames are forwarded before the error is even detected.</p>
  <h2>Fragment-free (a middle ground)</h2>
  <p>A hybrid that reads the first 64 bytes before forwarding. Collision fragments are always shorter than 64 bytes, so this mode still avoids forwarding collision debris while keeping latency low.</p>
  <table>
    <tr><th>Mode</th><th>Inspects</th><th>Latency</th><th>Drops bad frames?</th></tr>
    <tr><td>Store-and-forward</td><td>Entire frame + FCS</td><td>Grows with frame size</td><td>Yes</td></tr>
    <tr><td>Fragment-free</td><td>First 64 bytes</td><td>Low and fixed</td><td>Most collisions</td></tr>
    <tr><td>Cut-through (fast-forward)</td><td>Only the destination MAC</td><td>Lowest</td><td>No</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Why the trade-off matters</strong>
    <p>For general access switching, store-and-forward is the hands-down safe choice — error checking costs only a handful of microseconds, and it is the dominant mode in real deployments.</p>
  </div>
  <div class="callout callout-info">
    <strong>Buffering</strong>
    <p>A store-and-forward port also absorbs micro-bursts: a temporary overload is queued instead of dropped. Cut-through ports are the first victims of head-of-line blocking when one long frame forces the next frame to wait.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000407',
  '03100000-0000-4000-8000-000000000307',
  1,
  'What Are VLANs?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What Are VLANs?</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>What Are VLANs?</h1>
  <p>A <strong>Virtual LAN (VLAN)</strong> is a logical subdivision of a physical switch. Devices in the same VLAN behave as if they were on the same switch, even when spread across a building — and devices in different VLANs behave as if they are on completely separate networks, even when they share one physical switch.</p>
  <h2>Containing broadcasts</h2>
  <p>By default all ports live in one broadcast domain (VLAN 1). Every ARP, every DHCP request, every chatty broadcast reaches every port. Splitting a floor into three VLANs shrinks the broadcast domain three times: each segment only hears the broadcasts meant for it.</p>
  <ul>
    <li><strong>Smaller broadcast domains</strong> — less noise, faster ARP and DHCP resolution.</li>
    <li><strong>Security isolation</strong> — the accounting team simply cannot sniff the engineering segment.</li>
    <li><strong>Logical grouping</strong> — a department can be spread across racks but stay one logical network.</li>
    <li><strong>Simpler policy</strong> — ACLs and firewall rules attach to a VLAN, not to a physical port.</li>
  </ul>
  <h2>VLAN identifiers</h2>
  <p>VLANs are numbered 1 to 4094. VLAN 1 is special: it is the default VLAN, and it cannot be removed on most switches.</p>
  <table>
    <tr><th>Range</th><th>Use</th></tr>
    <tr><td>1</td><td>Default VLAN; carries all ports until reassigned</td></tr>
    <tr><td>2 – 1001</td><td>Standard 802.1Q user VLAN range</td></tr>
    <tr><td>1006 – 4094</td><td>Extended VLANs (require matching software and features)</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Map each VLAN to a subnet</strong>
    <p>Rule of thumb: one VLAN, one IP subnet, one DHCP scope. VLAN 10 pairs with 10.0.10.0/24, VLAN 20 with 10.0.20.0/24, and so on. You will thank yourself when you troubleshoot later.</p>
  </div>
  <div class="callout callout-info">
    <strong>VLANs are Layer 2</strong>
    <p>A VLAN does not route anything — it only changes which frames a device receives. Two hosts in different VLANs still need a Layer 3 gateway (covered in inter-VLAN routing) to communicate.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000408',
  '03100000-0000-4000-8000-000000000308',
  1,
  'Access Ports & VLAN Assignment',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Access Ports & VLAN Assignment</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Access Ports &amp; VLAN Assignment</h1>
  <p>A switch port is either an <strong>access port</strong> or a <strong>trunk port</strong>. For now, meet the access port: it belongs to exactly one VLAN and assumes every device connected to it belongs to that same VLAN.</p>
  <h2>Untagged everywhere</h2>
  <p>End devices almost never know or care about VLANs. A PC sends ordinary untagged frames, and the switch assigns them to the access port&rsquo;s VLAN as they enter. Because those frames are untagged, the egress access port also sends them out untagged — the VLAN stays entirely inside the switch.</p>
  <h2>PVID</h2>
  <p>The <strong>Port VLAN Identifier (PVID)</strong> is the VLAN an access port stamps onto untagged ingress frames, and it is also the VLAN used when frames leave that port untagged. On an access port, PVID and access VLAN are always the same number.</p>
  <pre class="code-block">Switch(config)# vlan 20
Switch(config-vlan)# name HR
Switch(config)# interface gi0/1
Switch(config-if)# switchport mode access
Switch(config-if)# switchport access vlan 20

Switch# show interfaces gi0/1 switchport
Name: Gi0/1
Administrative Mode: static access
Operational Mode: static access
Access Mode VLAN: 20 (HR)</pre>
  <ul>
    <li>Ingress — untagged frames are stamped with the access VLAN (PVID).</li>
    <li>Egress — frames leave the access port untagged, ready for the PC.</li>
    <li>A frame tagged for a different VLAN arriving on an access port is dropped.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Why a PC never sees tags</strong>
    <p>Consumer devices do not understand 802.1Q, so a frame that still carries a tag would be misread. The switch adds the tag at ingress and strips it at egress, keeping tags invisible to the desktop.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Document the port plan</strong>
    <p>Write down which port belongs to which VLAN — in the interface description at minimum. The most common access-port failure is a miswritten <span class="ic">switchport access vlan</span> line that nobody can spot by look alone.</p>
  </div>
  <div class="callout">
    <strong>Do not use VLAN 1 for user data</strong>
    <p>VLAN 1 is the default and often the native VLAN on the trunk. Move users to numbered VLANs and keep VLAN 1 for infrastructure. You will see why in the 802.1Q trunk lesson.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000410',
  '03100000-0000-4000-8000-000000000310',
  1,
  '802.1Q Trunking',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>802.1Q Trunking</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>802.1Q Trunking</h1>
  <p>An access port can only carry one VLAN — fine for a PC, useless for the link between two switches, which must carry many VLANs at once. The answer is the <strong>trunk</strong>, and the standard that makes multi-VLAN links possible is <strong>IEEE 802.1Q</strong>.</p>
  <h2>The tag</h2>
  <p>802.1Q inserts a four-byte tag between the source MAC and the length/EtherType fields of a frame. The tag has two halves:</p>
  <table>
    <tr><th>Field</th><th>Bits</th><th>Meaning</th></tr>
    <tr><td>TPID</td><td>16</td><td>Tag protocol identifier; 0x8100 marks an 802.1Q frame</td></tr>
    <tr><td>PCP</td><td>3</td><td>Priority code point; the 802.1p quality class</td></tr>
    <tr><td>DEI</td><td>1</td><td>Drop eligible indicator</td></tr>
    <tr><td>VID</td><td>12</td><td>VLAN identifier, usable range 1 to 4094</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Frames grow by 4 bytes</strong>
    <p>The tag makes a 1500-byte payload frame 4 bytes longer on the trunk. Trunk links therefore expect frames up to 1522 bytes instead of 1518 — that is why trunks often carry an increased MTU.</p>
  </div>
  <pre class="code-block">Before trunking:
+-----------+-----------+---------------+---------+-------+
| Dest MAC  | Src MAC   | EtherType     | Payload | FCS   |
+-----------+-----------+---------------+---------+-------+

After 802.1Q:
+-----------+-----------+------+---------------+---------+-------+
| Dest MAC  | Src MAC   | TAG  | EtherType     | Payload | FCS   |
+-----------+-----------+------+---------------+---------+-------+
                        ^
              TPID + PCP + DEI + VID  (4-byte tag)
              FCS is recomputed over the tagged frame</pre>
  <p>The receiving switch reads the VID, forwards the frame only into the ports of that VLAN, then strips the tag before handing the frame to an access port.</p>
  <h2>Many segments, one cable</h2>
  <p>A trunk lets one physical link carry VLAN 10, VLAN 20, and VLAN 30 simultaneously. The link carries more frames, but each VLAN remains a separate broadcast domain — a broadcast in VLAN 10 never reaches the VLAN 20 ports, even on the same cable.</p>
  <div class="callout callout-info">
    <strong>FCS is recomputed</strong>
    <p>Adding the 4-byte tag invalidates the old CRC, so the trunking switch recomputes the FCS. That is part of why a switch must strip the tag before forwarding a frame onto an access port — never hand a PC a tagged frame.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000411',
  '03100000-0000-4000-8000-000000000311',
  1,
  'Trunk Configuration & Native VLAN',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Trunk Configuration & Native VLAN</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Trunk Configuration &amp; Native VLAN</h1>
  <p>Configuring a trunk is one of the most common switch tasks — and one of the most common sources of subtle outages when done carelessly. The three settings that matter are the <strong>mode</strong>, the <strong>native VLAN</strong>, and the <strong>allowed VLAN list</strong>.</p>
  <pre class="code-block">Switch(config)# interface gi0/24
Switch(config-if)# switchport mode trunk
Switch(config-if)# switchport trunk native vlan 99
Switch(config-if)# switchport trunk allowed vlan 10,20,30
Switch(config-if)# switchport nonegotiate

Switch# show interfaces trunk
Port    Mode   Encapsulation  Status     Native vlan
Gi0/24  on     802.1q         trunking   99
Vlans allowed on trunk: 10,20,30
Vlans allowed and active in management domain: 10,20,30</pre>
  <h2>The native VLAN</h2>
  <p>One VLAN per trunk travels <em>untagged</em> — this is the native VLAN. It exists so a trunk still works with devices that cannot tag frames, and so network devices that do not understand 802.1Q can still share the cable. Both ends of a trunk must agree on the native VLAN.</p>
  <ul>
    <li>Frames in the native VLAN cross the trunk untagged.</li>
    <li>All other allowed VLANs are carried with 802.1Q tags.</li>
    <li>If the native VLAN differs on the two ends, unprotected frames land in the wrong VLAN and STP stops protecting the link.</li>
  </ul>
  <div class="callout">
    <strong>Native VLAN mismatch</strong>
    <p>This is the classic silent killer. Both ports still carry frames, so the link looks up, but hosts in the mismatched VLAN lose connectivity. Align native VLANs on both ends — and better, move native and management traffic off VLAN 1 onto a dedicated VLAN 99.</p>
  </div>
  <h2>The allowed list</h2>
  <p>Restricting a trunk to the VLANs you actually carry keeps unwanted VLANs from leaking between switches and saves trunk bandwidth.</p>
  <div class="callout callout-tip">
    <strong>Disable dynamic trunking</strong>
    <p>Trunk negotiation (DTP) can let a stranger&rsquo;s switch talk your port into trunking mode and reach every VLAN you carry. On access ports use <span class="ic">switchport mode access</span>; on trunks use <span class="ic">switchport nonegotiate</span> so the port only accepts administratively configured trunking.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000413',
  '03100000-0000-4000-8000-000000000313',
  1,
  'VLAN Design Principles & Segmentation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VLAN Design Principles & Segmentation</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>VLAN Design Principles &amp; Segmentation</h1>
  <p>Almost any VLAN configuration will forward frames. Elegant VLAN design is what keeps a network operable for years. The rules below are the distilled practice of many campuses.</p>
  <h2>Segment by role, not by rack</h2>
  <p>Group ports by function and by security boundary first: management, staff, guests, IoT devices, voice phones. A design that mirrors the organization chart is easy to remember, easy to audit, and easy to secure with ACLs and firewall rules.</p>
  <table>
    <tr><th>VLAN</th><th>Name</th><th>Subnet</th><th>Purpose</th></tr>
    <tr><td>10</td><td>STAFF</td><td>10.0.10.0/24</td><td>General staff workstations</td></tr>
    <tr><td>20</td><td>MGMT</td><td>10.0.20.0/24</td><td>Switch and server management</td></tr>
    <tr><td>30</td><td>GUEST</td><td>10.0.30.0/24</td><td>Isolated visitor access</td></tr>
    <tr><td>40</td><td>VOICE</td><td>10.0.40.0/24</td><td>IP phones with QoS priority</td></tr>
    <tr><td>90</td><td>IOT</td><td>10.0.90.0/24</td><td>Cameras and sensors, firewalled</td></tr>
    <tr><td>99</td><td>NATIVE</td><td>10.0.99.0/24</td><td>Native and management on trunks</td></tr>
  </table>
  <h2>Keep it consistent</h2>
  <ul>
    <li>Use the same VLAN number for the same role on <em>every</em> switch — VLAN 10 is always STAFF.</li>
    <li>One VLAN = one subnet = one DHCP scope.</li>
    <li>Put the gateway (SVI address) on the first usable host, e.g. .1, on every subnet.</li>
    <li>Do not split or aggregate VLANs until the broadcast behavior actually demands it.</li>
  </ul>
  <pre class="code-block">Switch(config)# vlan 10
Switch(config-vlan)# name STAFF
Switch(config)# vlan 20
Switch(config-vlan)# name MGMT
Switch(config)# vlan 30
Switch(config-vlan)# name GUEST

Switch# show vlan brief
VLAN Name       Status  Ports
10   STAFF      active  Gi0/1-12
20   MGMT       active  Gi0/24
30   GUEST      active  Gi0/13-16</pre>
  <h2>Smaller VLANs, happier network</h2>
  <p>Every VLAN shrinks the broadcast domain: ARP and DHCP churn drops, hosts resolve faster, and one chatty application stops degrading an entire floor. The other side of the coin is that inter-VLAN traffic now has to be routed — so size VLANs to keep most traffic local while still containing broadcast noise.</p>
  <div class="callout callout-tip">
    <strong>Document as you go</strong>
    <p>A one-page VLAN map (number, name, subnet, gateway, purpose) is the most valuable artifact your network team owns. Keep it next to the configs and update it on every single change.</p>
  </div>
  <div class="callout callout-info">
    <strong>Numbering discipline</strong>
    <p>Reserve the low numbers and the 1000s for infrastructure, use tens for general work, and keep a gap to grow into before renumbering — a VLAN renumbering project is one you want to prevent now.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000414',
  '03100000-0000-4000-8000-000000000314',
  1,
  'VLANs for Security & QoS',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VLANs for Security & QoS</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>VLANs for Security &amp; Quality of Service</h1>
  <p>Beyond broadcast containment, VLANs are the primary tool for shaping <em>who may see whom</em> and <em>who deserves fast, uncongested service</em>.</p>
  <h2>Security zones</h2>
  <p>Put every trust level on its own VLAN, then enforce the boundaries at the gateway with ACLs or a firewall. Untrusted guests on their own VLAN cannot even ARP for your servers, because their frames never leave the guest segment.</p>
  <table>
    <tr><th>Zone</th><th>VLAN</th><th>Access model</th></tr>
    <tr><td>Trusted staff</td><td>10</td><td>Full internal access</td></tr>
    <tr><td>Management</td><td>20</td><td>Network devices only, from admins</td></tr>
    <tr><td>Guests</td><td>30</td><td>Internet-bound, filtered, rate-limited</td></tr>
    <tr><td>IoT / cameras</td><td>90</td><td>Reachable by the NVR only, firewalled</td></tr>
  </table>
  <h2>Voice VLANs and QoS</h2>
  <p>An IP phone and a PC often share one port. The phone runs on a dedicated <strong>voice VLAN</strong>, usually tagged, while the PC keeps its untagged access VLAN on the same cable. The phone also marks its packets with an 802.1p priority (PCP) so voice traffic gets expedited treatment across the LAN.</p>
  <div class="callout callout-info">
    <strong>The 802.1p priority class</strong>
    <p>The 3-bit PCP inside the 802.1Q tag is your Layer 2 quality marker. Voice is typically marked at priority 5 and video at 4, while data rides at the default 0. When congestion hits, the lowest-priority traffic is dropped first.</p>
  </div>
  <h2>Private VLANs for separation</h2>
  <p>Sometimes you need isolation within one broadcast domain, not a new subnet: think camera feeds that should never talk to one another. A <strong>private VLAN</strong> marks ports as <em>isolated</em> (they can only talk to the promiscuous gateway port) or <em>community</em> (they talk to peers and the gateway).</p>
  <ul>
    <li>Isolated port — reaches only the promiscuous (uplink) ports.</li>
    <li>Community port — reaches its community and the promiscuous ports.</li>
    <li>Inter-client traffic between isolated peers is blocked in hardware.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Pair VLANs with ACLs, not karma</strong>
    <p>A VLAN is isolation, not policy. Always attach an ACL or firewall rule at the inter-VLAN gateway so that the boundary is enforced rather than presumed.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000416',
  '03100000-0000-4000-8000-000000000316',
  1,
  'Inter-VLAN Routing',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Inter-VLAN Routing</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Inter-VLAN Routing</h1>
  <p>VLANs are isolated by design. The moment two business units need to exchange mail, or a guest client needs to reach a DHCP server, something must route the traffic across the Layer 2 boundary. That something is a Layer 3 device.</p>
  <h2>Why routing is required</h2>
  <p>An ARP request for a device outside your VLAN never reaches it — the request dies inside the broadcast domain. So the host sends the frame to its default gateway instead, and the router performs the lookup and forwards the packet into the destination VLAN.</p>
  <h2>Three classic approaches</h2>
  <table>
    <tr><th>Approach</th><th>How it works</th><th>Best for</th></tr>
    <tr><td>Router with many interfaces</td><td>One physical interface per VLAN</td><td>A handful of VLANs</td></tr>
    <tr><td>Router-on-a-stick</td><td>One trunk; tagged subinterfaces</td><td>Many VLANs over one link</td></tr>
    <tr><td>Layer 3 switch (SVI)</td><td>Virtual interface per VLAN in the switch</td><td>High throughput, campus core</td></tr>
  </table>
  <h2>Router-on-a-stick in pieces</h2>
  <p>The router uses one physical port in trunk mode with the switch. Each VLAN gets a subinterface, and the subinterface matches incoming tagged frames by examining the 802.1Q VID:</p>
  <pre class="code-block">interface gi0/0.10
  encapsulation dot1Q 10
  ip address 10.0.10.1 255.255.255.0

interface gi0/0.20
  encapsulation dot1Q 20
  ip address 10.0.20.1 255.255.255.0</pre>
  <p>The router strips the tag, routes the packet, and re-encapsulates with the destination VLAN tag — all on a single copper or fiber link.</p>
  <h2>One trip, four steps</h2>
  <ol>
    <li>Host in VLAN 10 sees the destination is not local, so it sends the frame to its gateway 10.0.10.1 with an 802.1Q tag for VLAN 10.</li>
    <li>The router decapsulates the frame, reads the IPv4 packet, and routes it toward the VLAN 20 network.</li>
    <li>The router re-encapsulates with a tag for VLAN 20 and sends it out the same physical port.</li>
    <li>The switch sees the VLAN 20 tag and delivers the frame only to hosts in VLAN 20.</li>
  </ol>
  <div class="callout callout-info">
    <strong>One trunk, one bottleneck</strong>
    <p>Router-on-a-stick is elegant and cheap, but every inter-VLAN packet crosses the same physical link and the router CPU. It scales until that link saturates — the common ceiling for this design.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000417',
  '03100000-0000-4000-8000-000000000317',
  1,
  'Router-on-a-Stick & Layer 3 Switches',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Router-on-a-Stick & Layer 3 Switches</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Router-on-a-Stick &amp; Layer 3 Switches</h1>
  <p>Two of the three inter-VLAN approaches deserve a closer look, because they are the ones you will configure in the field every week: the router-on-a-stick and the Layer 3 switch.</p>
  <h2>Router-on-a-stick, end to end</h2>
  <p>The switch side carries a trunk; the router side carries matching subinterfaces with 802.1Q encapsulation. Each subinterface becomes the gateway for its VLAN:</p>
  <pre class="code-block">Router(config)# interface gi0/0
Router(config-if)# no shutdown

Router(config)# interface gi0/0.10
Router(config-subif)# encapsulation dot1Q 10
Router(config-subif)# ip address 10.0.10.1 255.255.255.0

Router(config)# interface gi0/0.20
Router(config-subif)# encapsulation dot1Q 20
Router(config-subif)# ip address 10.0.20.1 255.255.255.0</pre>
  <p>Verify with the ping test across VLANs and with <span class="ic">show ip route</span> and <span class="ic">show vlans</span> on the router.</p>
  <h2>Layer 3 switching</h2>
  <p>An L3 switch routes in silicon. You create a <strong>Switch Virtual Interface (SVI)</strong> per VLAN, give it the gateway address, and turn on routing:</p>
  <pre class="code-block">Switch(config)# ip routing

Switch(config)# interface vlan 10
Switch(config-if)# ip address 10.0.10.1 255.255.255.0
Switch(config-if)# no shutdown

Switch(config)# interface vlan 20
Switch(config-if)# ip address 10.0.20.1 255.255.255.0
Switch(config-if)# no shutdown</pre>
  <p>Traffic between VLAN 10 and VLAN 20 is now routed at wire speed by the switch fabric, with no external router involved.</p>
  <div class="callout callout-tip">
    <strong>Know which to choose</strong>
    <p>L3 switch: high throughput, campus core, many VLANs. Router-on-a-stick: few VLANs, an existing router, external firewall and ACL features. A mixed design is common — top speed in the core, an edge router for policy at the boundary.</p>
  </div>
  <div class="callout">
    <strong>SVIs are interfaces too</strong>
    <p>SVIs accept ACLs, unicast reverse-path filtering, and rate-limiting just like physical ports. Do not skip filtering at the core simply because the switch is fast.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000419',
  '03100000-0000-4000-8000-000000000319',
  1,
  'Why STP Exists & How It Works',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Why STP Exists & How It Works</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Why STP Exists &amp; How It Works</h1>
  <p>Redundancy is how networks survive a cut cable — so you build loops: two switches linked twice, or a triangle of three. But Ethernet has no TTL to stop a frame from circling a loop forever. That is where <strong>Spanning Tree Protocol</strong> (STP) comes in.</p>
  <h2>The loop disaster</h2>
  <ul>
    <li><strong>Broadcast storm</strong> — a broadcast frame enters a loop and amplifies itself; each hop forwards a copy back, and traffic multiplies until switch CPUs collapse.</li>
    <li><strong>MAC table instability</strong> — the switch keeps seeing the same source MAC on alternating ports and flips the entry on every frame.</li>
    <li><strong>Duplicate frames</strong> — unicast frames reach the destination twice, confusing upper-layer protocols.</li>
  </ul>
  <h2>The Spanning Tree answer</h2>
  <p>STP computes a loop-free logical tree across your redundant physical topology. Switches exchange <strong>BPDUs</strong> and elect which ports stay in the tree and which get blocked:</p>
  <ol>
    <li><strong>Root bridge</strong> — the switch with the lowest bridge ID (priority, then MAC).</li>
    <li><strong>Root port</strong> — on every other switch, the port with the best path to the root.</li>
    <li><strong>Designated port</strong> — on each segment, the one port that forwards toward the root.</li>
    <li><strong>Blocked (alternate) port</strong> — the remaining loop-causing port; it stays blocking.</li>
  </ol>
  <table>
    <tr><th>Port state</th><th>Behavior</th></tr>
    <tr><td>Blocking</td><td>No frames, no learning; listens to BPDUs only</td></tr>
    <tr><td>Listening</td><td>Transitional; participates in tree building</td></tr>
    <tr><td>Learning</td><td>Learns MACs but does not forward yet</td></tr>
    <tr><td>Forwarding</td><td>Normal frame forwarding</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Classic convergence takes ~30–50 seconds</strong>
    <p>802.1D is slow on purpose: 15s listening plus 15s learning on every new path. RSTP (the next lesson) collapses this to a second or two.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Blocking is a state, not a removal</strong>
    <p>A blocked port still participates in STP, watches for failures, and is ready to forward if its redundant path becomes primary. It is blocked only from the data plane, never from the protocol.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000420',
  '03100000-0000-4000-8000-000000000320',
  1,
  'STP Variants & Tuning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>STP Variants & Tuning</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>STP Variants &amp; Tuning</h1>
  <p>Classic 802.1D works, but its 30–50 second convergence makes modern servers and phones cough on every topology change. The industry answered with faster variants and a set of tuning knobs for your edge ports.</p>
  <h2>The family tree</h2>
  <table>
    <tr><th>Protocol</th><th>Standard</th><th>Key property</th></tr>
    <tr><td>STP</td><td>802.1D</td><td>One tree for all VLANs; slow convergence</td></tr>
    <tr><td>RSTP</td><td>802.1w</td><td>Fast convergence; alternate and backup roles</td></tr>
    <tr><td>PVST+</td><td>Cisco</td><td>A separate tree per VLAN; load sharing</td></tr>
    <tr><td>MSTP</td><td>802.1s</td><td>Groups VLANs into a few instances</td></tr>
  </table>
  <h2>RSTP: the modern default</h2>
  <p>RSTP keeps the root election but re-classifies the blocked ports: an <em>alternate</em> port points at another switch and starts forwarding the moment its own root fails; a <em>backup</em> port backs up a designated port. Negotiation uses a rapid BPDU handshake rather than timers, so convergence drops to about a second.</p>
  <h2>Edge tuning for host ports</h2>
  <pre class="code-block">Switch(config-if)# spanning-tree portfast
Switch(config-if)# spanning-tree bpduguard enable</pre>
  <pre class="code-block">! Make the core switch the root for every VLAN
Switch(config)# spanning-tree vlan 1-4094 root primary

! Protect a specific access switch port
Switch(config-if)# spanning-tree guard root</pre>
  <ul>
    <li><strong>PortFast</strong> — access ports to end hosts skip listening and learning and go straight to forwarding, so a PC does not wait 30 seconds for a link.</li>
    <li><strong>BPDU guard</strong> — if a BPDU ever arrives on a PortFast port, the port error-disables. Instant protection against a rogue loop.</li>
    <li><strong>Root guard</strong> — rejects any attempt from that port to become root.</li>
    <li><strong>Loop guard</strong> — protects against silent BPDU loss leaving a port incorrectly forwarding.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Place your root bridge</strong>
    <p>Set the root bridge deliberately — for example <span class="ic">spanning-tree vlan 1 root primary</span> on the core switch — and keep STP tuning off user ports. A network where STP just happens to work is a network no one designed.</p>
  </div>
  <div class="callout callout-info">
    <strong>Timers are global, not local</strong>
    <p>Hello, forward-delay, and max-age are configured on the root bridge and distributed in BPDUs. Changing them anywhere but the root is pointless and often harmful.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000422',
  '03100000-0000-4000-8000-000000000322',
  1,
  'Link Aggregation & Link Bundling',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Link Aggregation & Link Bundling</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Link Aggregation &amp; Link Bundling</h1>
  <p>Sometimes one link is not enough. Rather than installing a faster port, Ethernet links can be <strong>bundled</strong> into a single logical link — Cisco calls this <strong>EtherChannel</strong>; the IEEE standard calls it <strong>Link Aggregation (LAG, 802.3ad / 802.1AX)</strong>.</p>
  <h2>What a bundle buys you</h2>
  <ul>
    <li><strong>More bandwidth</strong> — up to eight 1 Gbps links behave as one logical multi-gigabit trunk.</li>
    <li><strong>Redundancy</strong> — if one member fails, the bundle keeps carrying all traffic on the survivors.</li>
    <li><strong>Simpler STP</strong> — STP sees one logical port, so a bundle never forms a loop and never blocks.</li>
    <li><strong>No reconfiguration</strong> — the network sees the bundle as one port regardless of member count.</li>
  </ul>
  <h2>Negotiation protocols</h2>
  <table>
    <tr><th>Protocol</th><th>Origin</th><th>Modes</th></tr>
    <tr><td>LACP</td><td>IEEE 802.3ad / 802.1AX</td><td>active, passive</td></tr>
    <tr><td>PAgP</td><td>Cisco proprietary</td><td>desirable, auto</td></tr>
  </table>
  <p>For a bundle to form, at least one side must actively solicit — active plus active, or active plus passive, both work; two passive sides never form. LACP is the standard you should prefer.</p>
  <pre class="code-block">Switch(config)# interface range gi0/1-2
Switch(config-if-range)# channel-group 1 mode active
Switch(config-if-range)# exit
Switch(config)# interface port-channel 1
Switch(config-if)# switchport mode trunk
Switch(config-if)# switchport trunk allowed vlan 10,20,30</pre>
  <p>Verify the bundle with <span class="ic">show etherchannel summary</span>; the members should report <span class="ic">SU</span> (in use, up) under the port-channel, which should be trunking.</p>
  <h2>Load balancing</h2>
  <p>Frames are not split frame-by-frame across members. Each is hashed (by source and destination MAC, IP, or port) onto exactly one member link. That keeps every flow in order while spreading load — which is why a two-link bundle delivers up to about 2x, not exactly 2x, on realistic traffic.</p>
  <div class="callout callout-tip">
    <strong>Hash selection matters</strong>
    <p>If most load lands on a single member, change the hash (for example src-dst-ip instead of src-dst-mac). A few large flows can pin one member while others sit idle.</p>
  </div>
  <h2>Worked hash example</h2>
  <p>With a two-member bundle and src-dst-mac hashing, frames between two very active servers hash by their MAC pair and consistently land on member 2, while the rest of the campus spreads over both links. That is why you re-check the hash when one member saturates and the other sits at 10%.</p>
  <div class="callout callout-info">
    <strong>Flows stay ordered</strong>
    <p>Because a flow is pinned to one member by its hash, its packets keep their order — critical for TCP and VoIP — while the aggregate spreads across the whole bundle.</p>
  </div>
  <div class="callout">
    <strong>Identical member configs</strong>
    <p>Every member must have identical speed, duplex, and VLAN settings or the bundle will not form — LACP only bundles physically consistent interfaces.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000423',
  '03100000-0000-4000-8000-000000000323',
  1,
  'Port Security & Switch Hardening',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Port Security & Switch Hardening</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Port Security &amp; Switch Hardening</h1>
  <p>A switch is your access point to the network — and your access point of risk. A single unsecured port can hand an attacker a seat inside your LAN. Securing that edge is Layer 2 security.</p>
  <h2>Port security</h2>
  <p>Port security limits which MAC addresses may use a port. Only allowed addresses pass; everything else triggers a violation.</p>
  <pre class="code-block">Switch(config-if)# switchport port-security
Switch(config-if)# switchport port-security maximum 2
Switch(config-if)# switchport port-security mac-address sticky
Switch(config-if)# switchport port-security violation restrict</pre>
  <table>
    <tr><th>Violation mode</th><th>Action on a foreign MAC</th></tr>
    <tr><td>protect</td><td>Drops silently; no alert</td></tr>
    <tr><td>restrict</td><td>Drops, counts, and logs / SNMP trap</td></tr>
    <tr><td>shutdown</td><td>Error-disables the port; must be re-enabled</td></tr>
  </table>
  <p>Set a realistic maximum — 2 lets a phone and a PC share a desk port; 1 is often too strict for dual-device desks. In <span class="ic">sticky</span> mode the switch records the first learned addresses into the running configuration, so the port survives a reboot with the same bound addresses.</p>
  <h2>Stopping MAC flooding</h2>
  <p>Limiting the MAC count per port directly blocks the MAC flooding attack of the earlier lesson: an attacker can no longer fill the table, because the port rejects extra source addresses outright.</p>
  <h2>DHCP snooping and ARP inspection</h2>
  <ul>
    <li><strong>DHCP snooping</strong> — marks trusted switch-side ports (only your DHCP servers) and builds a binding table of MAC → IP → port → VLAN from every lease.</li>
    <li><strong>Dynamic ARP Inspection (DAI)</strong> — validates every ARP reply against that binding table and drops spoofed replies at the port.</li>
  </ul>
  <h2>Management-plane hardening</h2>
  <ul>
    <li>Shut down every unused port and place it in a dead VLAN.</li>
    <li>Use SSH, never Telnet, with strong credentials and a local username.</li>
    <li>Restrict management access to a dedicated VLAN plus an ACL.</li>
    <li>Disable CDP/LLDP where not needed; both leak hostname and platform details.</li>
    <li>Enable <span class="ic">storm-control broadcast</span> to cap flood traffic on user ports.</li>
    <li>Keep firmware patched and configuration backups protected off-box.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Start small</strong>
    <p>Roll out port security with <span class="ic">restrict</span> first, watch the logs for two weeks, then tighten to <span class="ic">shutdown</span> on the ports that never violate.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000425',
  '03100000-0000-4000-8000-000000000325',
  1,
  'Switch Troubleshooting Methodology',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Switch Troubleshooting Methodology</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Switch Troubleshooting Methodology</h1>
  <p>When a floor goes quiet, the temptation is to start poking ports until something blinks back. Professionals instead run a repeatable method that isolates the layer and the device before touching anything.</p>
  <h2>The six-step loop</h2>
  <ol>
    <li>Define the symptom — exactly what fails, who is affected, and when it started.</li>
    <li>Check the obvious — cables, PoE, link LEDs, and recent change control.</li>
    <li>Isolate to a layer — physical, data link, or network. One ping tells you a lot.</li>
    <li>Gather evidence with the show commands in the table below.</li>
    <li>Form one hypothesis and test it in isolation.</li>
    <li>Fix, verify, and document — then re-check that nothing else moved.</li>
  </ol>
  <h2>The essential command set</h2>
  <table>
    <tr><th>Command</th><th>Answers</th></tr>
    <tr><td>show interfaces status</td><td>Which ports are up, their VLAN, and speed</td></tr>
    <tr><td>show interfaces gi0/1</td><td>Errors, duplex, input/output drops, CRC</td></tr>
    <tr><td>show mac address-table</td><td>Which port or VLAN a MAC is learned on</td></tr>
    <tr><td>show vlan brief</td><td>Which VLANs exist and their ports</td></tr>
    <tr><td>show interfaces trunk</td><td>Trunking status, native VLAN, allowed list</td></tr>
    <tr><td>show spanning-tree</td><td>Root, port roles, and blocking state</td></tr>
    <tr><td>show etherchannel summary</td><td>Bundle status and member health</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Start at the host and walk back</strong>
    <p>Ping the gateway, then the switch neighbor, then the far host, watching each hop. The first failed hop localizes the fault to one segment — and the switch port statistics on that segment usually finish the diagnosis.</p>
  </div>
  <div class="callout callout-info">
    <strong>Change control first</strong>
    <p>If the network broke at 11:47 and someone renumbered a trunk at 11:45, you already have your hypothesis. Always ask what changed before you re-diagnose from zero.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000426',
  '03100000-0000-4000-8000-000000000326',
  1,
  'Common Switching Faults & Fixes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Common Switching Faults & Fixes</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Common Switching Faults &amp; Fixes</h1>
  <p>Most switching outages are not exotic — they repeat across every network on earth. Here are the classics, with the symptom-to-cause-to-fix chain for each.</p>
  <table>
    <tr><th>Symptom</th><th>Likely cause</th><th>Fix</th></tr>
    <tr><td>Slow link with CRC errors</td><td>Duplex mismatch</td><td>Match duplex (or auto both ends); replace bad cable</td></tr>
    <tr><td>Some VLANs reachable, others lost</td><td>Trunk allowed or native VLAN mismatch</td><td>Align allowed list; match native VLAN</td></tr>
    <tr><td>Host cannot reach its gateway</td><td>Access VLAN differs from the gateway VLAN</td><td>Verify switchport access vlan and the SVI</td></tr>
    <tr><td>Link up but no traffic</td><td>Port error-disabled (security or STP)</td><td>shut / no shut, then find the cause</td></tr>
    <tr><td>Whole floor slows or CPU spikes</td><td>Layer 2 loop or broadcast storm</td><td>Enable STP; find and break the loop</td></tr>
    <tr><td>Devices flicker between ports</td><td>MAC table flapping</td><td>Look for a loop or a rogue bridge</td></tr>
    <tr><td>Heavy unicast flooding on a switch</td><td>MAC table overflow (attack)</td><td>Port security maximum on user ports</td></tr>
  </table>
  <h2>The duplex mismatch story</h2>
  <p>One side negotiates to 1G full duplex; the other side was hard-set to full duplex, or slid to half duplex. The half side sees collisions and its retransmissions corrupt the full side&rsquo;s receive window. The symptom is brutal: link up, tiny effective throughput, late collisions and CRC errors climbing. Fix by letting both sides auto-negotiate — forcing speed without duplex is the classic trigger.</p>
  <h2>The trunk mismatch story</h2>
  <p>Switch A carries VLANs 10 and 20 on its trunk; Switch B only allows VLAN 10. A tag from VLAN 20 arrives and B drops it: intermittent loss for exactly one segment, with no log entry. Compare <span class="ic">show interfaces trunk</span> on both ends and align the allowed lists exactly.</p>
  <h2>The silent native story</h2>
  <p>Both trunks are up, VLAN 20 works, VLAN 1 does not. That is the native VLAN mismatch again: untagged frames from each side are stamped with a different native VLAN on arrival and land in the wrong broadcast domain. Match the native VLANs (or move management off VLAN 1) and verify with <span class="ic">show interfaces trunk</span>.</p>
  <div class="callout callout-tip">
    <strong>Log every fix</strong>
    <p>The same failure will return. One line per fix — date, symptom, cause, command — turns the third occurrence into a five-minute job.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '03100000-0000-4000-8000-000000000427',
  '03100000-0000-4000-8000-000000000327',
  1,
  'Capstone: A Multi-VLAN Campus',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: A Multi-VLAN Campus</title>
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
.lesson-page table th { background: #f0fdfa; color: #0f766e; }
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
  <h1>Capstone: Building a Multi-VLAN Campus</h1>
  <p>Time to join everything: you will design and verify a three-floor campus with three VLANs, two switches, a trunk with LACP, inter-VLAN routing, STP tuning, and port security — exactly the topology you may meet in the field.</p>
  <h2>The design</h2>
  <table>
    <tr><th>VLAN</th><th>Name</th><th>Subnet</th><th>Gateway</th></tr>
    <tr><td>10</td><td>IT</td><td>10.0.10.0/24</td><td>10.0.10.1</td></tr>
    <tr><td>20</td><td>HR</td><td>10.0.20.0/24</td><td>10.0.20.1</td></tr>
    <tr><td>30</td><td>GUEST</td><td>10.0.30.0/24</td><td>10.0.30.1</td></tr>
  </table>
  <ul>
    <li>SW1 (distribution) carries the SVIs and routes between VLANs with Layer 3 switching.</li>
    <li>SW2 (access) serves the floor ports and connects to SW1 with a two-link LACP bundle.</li>
    <li>The SW1–SW2 link is an 802.1Q trunk carrying VLANs 10, 20, 30 with the native VLAN moved to 99.</li>
  </ul>
  <table>
    <tr><th>Device</th><th>Role</th></tr>
    <tr><td>SW1</td><td>Distribution core, L3 routing, root bridge, SVI gateways</td></tr>
    <tr><td>SW2</td><td>Access switch, end-user ports, PortFast + port security, LACP member</td></tr>
    <tr><td>Router or firewall</td><td>Optional border, inter-VLAN filtering (ACLs on the SVIs)</td></tr>
  </table>
  <h2>Implementation outline</h2>
  <pre class="code-block">! SW1 - routing core
ip routing
interface vlan 10
  ip address 10.0.10.1 255.255.255.0
interface vlan 20
  ip address 10.0.20.1 255.255.255.0
interface vlan 30
  ip address 10.0.30.1 255.255.255.0
spanning-tree vlan 10,20,30 root primary

! SW1 + SW2 - trunk bundle
interface range gi0/1-2
  switchport mode trunk
  switchport trunk native vlan 99
  channel-group 1 mode active
interface port-channel 1
  switchport trunk allowed vlan 10,20,30

! SW2 - access + security
interface gi0/10
  switchport mode access
  switchport access vlan 10
  spanning-tree portfast
  spanning-tree bpduguard enable
  switchport port-security
  switchport port-security maximum 2
  switchport port-security violation restrict</pre>
  <h2>Verification checklist</h2>
  <ol>
    <li>Ping 10.0.10.1 from a VLAN 10 host, then 10.0.20.1 from that same VLAN 10 host — inter-VLAN routing proven.</li>
    <li>Ping a host inside VLAN 20 from the VLAN 10 host — end to end.</li>
    <li><span class="ic">show vlan brief</span> — every VLAN present with the right ports.</li>
    <li><span class="ic">show interfaces trunk</span> — native VLAN 99 and allowed 10,20,30 on both ends.</li>
    <li><span class="ic">show etherchannel summary</span> — both members SU under port-channel 1.</li>
    <li><span class="ic">show spanning-tree root</span> — SW1 is root and access ports are edge/forwarding.</li>
    <li><span class="ic">show mac address-table</span> — hosts learned on their correct access ports.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Break it safely</strong>
    <p>Pull one member of the bundle and confirm traffic keeps flowing; disconnect a redundant uplink and confirm STP converges in a few seconds. A design you have broken and recovered is a design you understand.</p>
  </div>
  <h2>What carries over</h2>
  <ul>
    <li>Switches forward by MAC learning, not by IP or route — a frame is delivered to exactly one egress port, or flooded inside its VLAN.</li>
    <li>VLANs shrink broadcast domains; 802.1Q tagging is what lets one physical trunk carry many VLANs.</li>
    <li>Design for a security spine: default-deny SVIs, ACLs at the gateways, port security on the edge.</li>
    <li>Redundancy without STP is a loop; redundancy without LACP is fragile. Pair them, then verify with the seven checks above.</li>
  </ul>
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
  ('03100000-0000-4000-8000-000000000501', '03100000-0000-4000-8000-000000000303',
   'When a switch receives a frame whose destination MAC address is not in its MAC address table, what does it do?',
   'An unknown destination triggers flooding to every port except the one the frame arrived on.', 1),
  ('03100000-0000-4000-8000-000000000502', '03100000-0000-4000-8000-000000000303',
   'Which addresses does a switch learn on its own so it can build the MAC address table?',
   'Learning reads the source MAC address of every valid frame and records it with the ingress port and VLAN.', 2),
  ('03100000-0000-4000-8000-000000000503', '03100000-0000-4000-8000-000000000303',
   'What does a store-and-forward switch validate before it forwards a frame?',
   'Store-and-forward buffers the entire frame and validates the CRC, dropping corrupt frames.', 3),
  ('03100000-0000-4000-8000-000000000504', '03100000-0000-4000-8000-000000000306',
   'Which address does a switch use to decide where to forward a frame?',
   'Switches are Layer 2 devices and forward based on the destination MAC address.', 1),
  ('03100000-0000-4000-8000-000000000505', '03100000-0000-4000-8000-000000000306',
   'Which device terminates a broadcast domain?',
   'Routers do not forward broadcasts, so each router interface boundary ends a broadcast domain.', 2),
  ('03100000-0000-4000-8000-000000000506', '03100000-0000-4000-8000-000000000306',
   'What is the main advantage of cut-through switching over store-and-forward?',
   'Cut-through forwards as soon as the destination MAC is read, which minimizes latency.', 3),
  ('03100000-0000-4000-8000-000000000507', '03100000-0000-4000-8000-000000000309',
   'What is a VLAN?',
   'A VLAN divides a physical switch into logical Layer 2 broadcast domains.', 1),
  ('03100000-0000-4000-8000-000000000508', '03100000-0000-4000-8000-000000000309',
   'Which type of port belongs to exactly one VLAN and carries untagged frames?',
   'Access ports are assigned a single VLAN and send their frames untagged.', 2),
  ('03100000-0000-4000-8000-000000000509', '03100000-0000-4000-8000-000000000309',
   'What is the default VLAN on a typical switch?',
   'All ports belong to VLAN 1 by default, and it is also the default native VLAN.', 3),
  ('03100000-0000-4000-8000-000000000510', '03100000-0000-4000-8000-000000000312',
   'How does 802.1Q mark a frame with its VLAN on a trunk link?',
   'The 802.1Q tag carries the 12-bit VLAN ID, plus priority and drop eligibility.', 1),
  ('03100000-0000-4000-8000-000000000511', '03100000-0000-4000-8000-000000000312',
   'Which VLAN frames are sent untagged across an 802.1Q trunk?',
   'The native VLAN crosses the trunk untagged; all other allowed VLANs are tagged.', 2),
  ('03100000-0000-4000-8000-000000000512', '03100000-0000-4000-8000-000000000312',
   'Which port type carries frames for multiple VLANs between switches?',
   'A trunk multiplexes many VLANs over one link using 802.1Q tags.', 3),
  ('03100000-0000-4000-8000-000000000513', '03100000-0000-4000-8000-000000000315',
   'Why segment the network into smaller VLANs?',
   'Smaller VLANs contain broadcast traffic and separate broadcast domains.', 1),
  ('03100000-0000-4000-8000-000000000514', '03100000-0000-4000-8000-000000000315',
   'What must exist before hosts in two different VLANs can communicate?',
   'VLANs are separate broadcast domains, so inter-VLAN traffic must be routed.', 2),
  ('03100000-0000-4000-8000-000000000515', '03100000-0000-4000-8000-000000000315',
   'Which VLAN is most appropriate for unmanaged guest devices?',
   'Guest traffic should sit on its own VLAN and be filtered at the gateway.', 3),
  ('03100000-0000-4000-8000-000000000516', '03100000-0000-4000-8000-000000000318',
   'What is a router-on-a-stick configuration?',
   'One physical interface is split into 802.1Q-tagged subinterfaces, one per VLAN.', 1),
  ('03100000-0000-4000-8000-000000000517', '03100000-0000-4000-8000-000000000318',
   'Which device provides the fastest inter-VLAN routing?',
   'Layer 3 switches route in hardware, avoiding the single-trunk bottleneck.', 2),
  ('03100000-0000-4000-8000-000000000518', '03100000-0000-4000-8000-000000000318',
   'Which command binds a subinterface to a VLAN in the router-on-a-stick design?',
   'The encapsulation dot1Q command tags all frames on the subinterface with the VLAN ID.', 3),
  ('03100000-0000-4000-8000-000000000519', '03100000-0000-4000-8000-000000000321',
   'What is the primary purpose of Spanning Tree Protocol?',
   'STP blocks redundant paths so frames cannot loop and amplify forever.', 1),
  ('03100000-0000-4000-8000-000000000520', '03100000-0000-4000-8000-000000000321',
   'Which switch becomes the root bridge in an STP election?',
   'Root election compares bridge IDs: lowest priority wins, ties break on lowest MAC.', 2),
  ('03100000-0000-4000-8000-000000000521', '03100000-0000-4000-8000-000000000321',
   'Why put PortFast on access ports connected to end hosts?',
   'PortFast moves access ports directly to forwarding so hosts reach the network faster.', 3),
  ('03100000-0000-4000-8000-000000000522', '03100000-0000-4000-8000-000000000324',
   'What does link aggregation give you?',
   'Bundling links increases combined bandwidth and survives a member-link failure.', 1),
  ('03100000-0000-4000-8000-000000000523', '03100000-0000-4000-8000-000000000324',
   'Which protocol dynamically negotiates an EtherChannel between switches?',
   'LACP is the IEEE standard negotiation protocol; PAgP is the Cisco proprietary one.', 2),
  ('03100000-0000-4000-8000-000000000524', '03100000-0000-4000-8000-000000000324',
   'Which port security violation mode shuts the port down and requires manual re-enabling?',
   'In shutdown mode the port enters error-disable and needs an explicit re-enable.', 3),
  ('03100000-0000-4000-8000-000000000525', '03100000-0000-4000-8000-000000000328',
   'In the 802.1Q tag, which 12-bit field identifies the VLAN?',
   'The VLAN ID (VID) is the 12-bit field that names the originating VLAN.', 1),
  ('03100000-0000-4000-8000-000000000526', '03100000-0000-4000-8000-000000000328',
   'How does a switch treat a broadcast frame it receives on an access port?',
   'Broadcasts are flooded within the VLAN, and routers stop them at the VLAN edge.', 2),
  ('03100000-0000-4000-8000-000000000527', '03100000-0000-4000-8000-000000000328',
   'Which statement about a Layer 2 switch is correct?',
   'Layer 2 switches forward by MAC address and keep broadcast domains intact.', 3),
  ('03100000-0000-4000-8000-000000000528', '03100000-0000-4000-8000-000000000328',
   'What is the typical result of a duplex mismatch on an Ethernet link?',
   'A half-duplex side sees collisions and produces CRC and late-collision errors.', 4),
  ('03100000-0000-4000-8000-000000000529', '03100000-0000-4000-8000-000000000328',
   'Which step proves inter-VLAN routing works end to end?',
   'A successful ping across VLAN boundaries confirms the Layer 3 path works.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): unknown dest flooding
  ('03100000-0000-4000-8000-000000001001', '03100000-0000-4000-8000-000000000501', 'Flood the frame out all ports except the ingress port', TRUE,  1),
  ('03100000-0000-4000-8000-000000001002', '03100000-0000-4000-8000-000000000501', 'Drop the frame silently', FALSE, 2),
  ('03100000-0000-4000-8000-000000001003', '03100000-0000-4000-8000-000000000501', 'Send the frame to the router', FALSE, 3),
  ('03100000-0000-4000-8000-000000001004', '03100000-0000-4000-8000-000000000501', 'Broadcast it back out the ingress port', FALSE, 4),
  -- Q1 (502): source MAC learning
  ('03100000-0000-4000-8000-000000001005', '03100000-0000-4000-8000-000000000502', 'Source MAC addresses of received frames', TRUE,  1),
  ('03100000-0000-4000-8000-000000001006', '03100000-0000-4000-8000-000000000502', 'Destination MAC addresses of received frames', FALSE, 2),
  ('03100000-0000-4000-8000-000000001007', '03100000-0000-4000-8000-000000000502', 'Source IP addresses of received packets', FALSE, 3),
  ('03100000-0000-4000-8000-000000001008', '03100000-0000-4000-8000-000000000502', 'Destination IP addresses of broadcast traffic', FALSE, 4),
  -- Q1 (503): store-and-forward CRC
  ('03100000-0000-4000-8000-000000001009', '03100000-0000-4000-8000-000000000503', 'The frame CRC (FCS)', TRUE,  1),
  ('03100000-0000-4000-8000-000000001010', '03100000-0000-4000-8000-000000000503', 'Only the destination MAC address', FALSE, 2),
  ('03100000-0000-4000-8000-000000001011', '03100000-0000-4000-8000-000000000503', 'The TTL of the carried IP packet', FALSE, 3),
  ('03100000-0000-4000-8000-000000001012', '03100000-0000-4000-8000-000000000503', 'The ARP cache validity', FALSE, 4),
  -- Q2 (504): destination MAC
  ('03100000-0000-4000-8000-000000001013', '03100000-0000-4000-8000-000000000504', 'Destination MAC address', TRUE,  1),
  ('03100000-0000-4000-8000-000000001014', '03100000-0000-4000-8000-000000000504', 'Destination IP address', FALSE, 2),
  ('03100000-0000-4000-8000-000000001015', '03100000-0000-4000-8000-000000000504', 'Source IP address', FALSE, 3),
  ('03100000-0000-4000-8000-000000001016', '03100000-0000-4000-8000-000000000504', 'TCP port number', FALSE, 4),
  -- Q2 (505): router terminates broadcast
  ('03100000-0000-4000-8000-000000001017', '03100000-0000-4000-8000-000000000505', 'A router', TRUE,  1),
  ('03100000-0000-4000-8000-000000001018', '03100000-0000-4000-8000-000000000505', 'A switch', FALSE, 2),
  ('03100000-0000-4000-8000-000000001019', '03100000-0000-4000-8000-000000000505', 'A hub', FALSE, 3),
  ('03100000-0000-4000-8000-000000001020', '03100000-0000-4000-8000-000000000505', 'A repeater', FALSE, 4),
  -- Q2 (506): cut-through latency
  ('03100000-0000-4000-8000-000000001021', '03100000-0000-4000-8000-000000000506', 'Lower latency', TRUE,  1),
  ('03100000-0000-4000-8000-000000001022', '03100000-0000-4000-8000-000000000506', 'Better error detection', FALSE, 2),
  ('03100000-0000-4000-8000-000000001023', '03100000-0000-4000-8000-000000000506', 'Support for larger frames', FALSE, 3),
  ('03100000-0000-4000-8000-000000001024', '03100000-0000-4000-8000-000000000506', 'Guaranteed zero retransmissions', FALSE, 4),
  -- Q3 (507): VLAN definition
  ('03100000-0000-4000-8000-000000001025', '03100000-0000-4000-8000-000000000507', 'A logical Layer 2 broadcast domain', TRUE,  1),
  ('03100000-0000-4000-8000-000000001026', '03100000-0000-4000-8000-000000000507', 'A physical network cable', FALSE, 2),
  ('03100000-0000-4000-8000-000000001027', '03100000-0000-4000-8000-000000000507', 'A routing protocol', FALSE, 3),
  ('03100000-0000-4000-8000-000000001028', '03100000-0000-4000-8000-000000000507', 'A wireless access point', FALSE, 4),
  -- Q3 (508): access port
  ('03100000-0000-4000-8000-000000001029', '03100000-0000-4000-8000-000000000508', 'Access port', TRUE,  1),
  ('03100000-0000-4000-8000-000000001030', '03100000-0000-4000-8000-000000000508', 'Trunk port', FALSE, 2),
  ('03100000-0000-4000-8000-000000001031', '03100000-0000-4000-8000-000000000508', 'Console port', FALSE, 3),
  ('03100000-0000-4000-8000-000000001032', '03100000-0000-4000-8000-000000000508', 'Loopback port', FALSE, 4),
  -- Q3 (509): default VLAN 1
  ('03100000-0000-4000-8000-000000001033', '03100000-0000-4000-8000-000000000509', 'VLAN 1', TRUE,  1),
  ('03100000-0000-4000-8000-000000001034', '03100000-0000-4000-8000-000000000509', 'VLAN 100', FALSE, 2),
  ('03100000-0000-4000-8000-000000001035', '03100000-0000-4000-8000-000000000509', 'VLAN 4094', FALSE, 3),
  ('03100000-0000-4000-8000-000000001036', '03100000-0000-4000-8000-000000000509', 'VLAN 0', FALSE, 4),
  -- Q4 (510): 802.1Q tag
  ('03100000-0000-4000-8000-000000001037', '03100000-0000-4000-8000-000000000510', 'Insert a 4-byte tag holding a 12-bit VLAN ID', TRUE,  1),
  ('03100000-0000-4000-8000-000000001038', '03100000-0000-4000-8000-000000000510', 'Rewrite the destination MAC address', FALSE, 2),
  ('03100000-0000-4000-8000-000000001039', '03100000-0000-4000-8000-000000000510', 'Change the IP source address', FALSE, 3),
  ('03100000-0000-4000-8000-000000001040', '03100000-0000-4000-8000-000000000510', 'Add a second Ethernet header', FALSE, 4),
  -- Q4 (511): native untagged
  ('03100000-0000-4000-8000-000000001041', '03100000-0000-4000-8000-000000000511', 'The native VLAN', TRUE,  1),
  ('03100000-0000-4000-8000-000000001042', '03100000-0000-4000-8000-000000000511', 'The management VLAN', FALSE, 2),
  ('03100000-0000-4000-8000-000000001043', '03100000-0000-4000-8000-000000000511', 'The voice VLAN', FALSE, 3),
  ('03100000-0000-4000-8000-000000001044', '03100000-0000-4000-8000-000000000511', 'The lowest-numbered VLAN', FALSE, 4),
  -- Q4 (512): trunk port
  ('03100000-0000-4000-8000-000000001045', '03100000-0000-4000-8000-000000000512', 'Trunk port', TRUE,  1),
  ('03100000-0000-4000-8000-000000001046', '03100000-0000-4000-8000-000000000512', 'Access port', FALSE, 2),
  ('03100000-0000-4000-8000-000000001047', '03100000-0000-4000-8000-000000000512', 'Monitoring port', FALSE, 3),
  ('03100000-0000-4000-8000-000000001048', '03100000-0000-4000-8000-000000000512', 'Console port', FALSE, 4),
  -- Q5 (513): smaller broadcast domains
  ('03100000-0000-4000-8000-000000001049', '03100000-0000-4000-8000-000000000513', 'To shrink broadcast domains and increase isolation', TRUE,  1),
  ('03100000-0000-4000-8000-000000001050', '03100000-0000-4000-8000-000000000513', 'To increase the number of MAC addresses', FALSE, 2),
  ('03100000-0000-4000-8000-000000001051', '03100000-0000-4000-8000-000000000513', 'To speed up a single hub', FALSE, 3),
  ('03100000-0000-4000-8000-000000001052', '03100000-0000-4000-8000-000000000513', 'To extend the UDP port range', FALSE, 4),
  -- Q5 (514): L3 path between VLANs
  ('03100000-0000-4000-8000-000000001053', '03100000-0000-4000-8000-000000000514', 'A Layer 3 path (router, subinterfaces, or SVI)', TRUE,  1),
  ('03100000-0000-4000-8000-000000001054', '03100000-0000-4000-8000-000000000514', 'A longer Ethernet cable', FALSE, 2),
  ('03100000-0000-4000-8000-000000001055', '03100000-0000-4000-8000-000000000514', 'A second ARP table', FALSE, 3),
  ('03100000-0000-4000-8000-000000001056', '03100000-0000-4000-8000-000000000514', 'A higher MTU on both ends', FALSE, 4),
  -- Q5 (515): guest VLAN
  ('03100000-0000-4000-8000-000000001057', '03100000-0000-4000-8000-000000000515', 'A separate guest VLAN with restricted access', TRUE,  1),
  ('03100000-0000-4000-8000-000000001058', '03100000-0000-4000-8000-000000000515', 'The default VLAN 1 with management', FALSE, 2),
  ('03100000-0000-4000-8000-000000001059', '03100000-0000-4000-8000-000000000515', 'The native VLAN on the trunk', FALSE, 3),
  ('03100000-0000-4000-8000-000000001060', '03100000-0000-4000-8000-000000000515', 'Any VLAN shared with the servers', FALSE, 4),
  -- Q6 (516): router-on-a-stick
  ('03100000-0000-4000-8000-000000001061', '03100000-0000-4000-8000-000000000516', 'One physical interface split into tagged subinterfaces', TRUE,  1),
  ('03100000-0000-4000-8000-000000001062', '03100000-0000-4000-8000-000000000516', 'Two routers connected back to back', FALSE, 2),
  ('03100000-0000-4000-8000-000000001063', '03100000-0000-4000-8000-000000000516', 'A switch with no VLANs', FALSE, 3),
  ('03100000-0000-4000-8000-000000001064', '03100000-0000-4000-8000-000000000516', 'A wireless bridge between buildings', FALSE, 4),
  -- Q6 (517): L3 switch fastest
  ('03100000-0000-4000-8000-000000001065', '03100000-0000-4000-8000-000000000517', 'A Layer 3 switch with SVIs', TRUE,  1),
  ('03100000-0000-4000-8000-000000001066', '03100000-0000-4000-8000-000000000517', 'A router-on-a-stick', FALSE, 2),
  ('03100000-0000-4000-8000-000000001067', '03100000-0000-4000-8000-000000000517', 'A hub rebroadcasting frames', FALSE, 3),
  ('03100000-0000-4000-8000-000000001068', '03100000-0000-4000-8000-000000000517', 'A DHCP server', FALSE, 4),
  -- Q6 (518): encapsulation dot1Q
  ('03100000-0000-4000-8000-000000001069', '03100000-0000-4000-8000-000000000518', 'encapsulation dot1Q 10', TRUE,  1),
  ('03100000-0000-4000-8000-000000001070', '03100000-0000-4000-8000-000000000518', 'switchport mode trunk', FALSE, 2),
  ('03100000-0000-4000-8000-000000001071', '03100000-0000-4000-8000-000000000518', 'vlan database', FALSE, 3),
  ('03100000-0000-4000-8000-000000001072', '03100000-0000-4000-8000-000000000518', 'spanning-tree portfast', FALSE, 4),
  -- Q7 (519): STP purpose
  ('03100000-0000-4000-8000-000000001073', '03100000-0000-4000-8000-000000000519', 'Prevent Layer 2 loops and broadcast storms', TRUE,  1),
  ('03100000-0000-4000-8000-000000001074', '03100000-0000-4000-8000-000000000519', 'Choose the fastest default gateway', FALSE, 2),
  ('03100000-0000-4000-8000-000000001075', '03100000-0000-4000-8000-000000000519', 'Encrypt traffic between switches', FALSE, 3),
  ('03100000-0000-4000-8000-000000001076', '03100000-0000-4000-8000-000000000519', 'Balance load across VLANs', FALSE, 4),
  -- Q7 (520): root bridge election
  ('03100000-0000-4000-8000-000000001077', '03100000-0000-4000-8000-000000000520', 'Lowest bridge priority, then lowest MAC', TRUE,  1),
  ('03100000-0000-4000-8000-000000001078', '03100000-0000-4000-8000-000000000520', 'Most ports in the topology', FALSE, 2),
  ('03100000-0000-4000-8000-000000001079', '03100000-0000-4000-8000-000000000520', 'The first switch to send a BPDU', FALSE, 3),
  ('03100000-0000-4000-8000-000000001080', '03100000-0000-4000-8000-000000000520', 'The switch with the highest throughput', FALSE, 4),
  -- Q7 (521): PortFast
  ('03100000-0000-4000-8000-000000001081', '03100000-0000-4000-8000-000000000521', 'So the port skips directly to forwarding', TRUE,  1),
  ('03100000-0000-4000-8000-000000001082', '03100000-0000-4000-8000-000000000521', 'To increase the forwarding delay', FALSE, 2),
  ('03100000-0000-4000-8000-000000001083', '03100000-0000-4000-8000-000000000521', 'To require a login on the port', FALSE, 3),
  ('03100000-0000-4000-8000-000000001084', '03100000-0000-4000-8000-000000000521', 'To disable MAC learning on that port', FALSE, 4),
  -- Q8 (522): link aggregation
  ('03100000-0000-4000-8000-000000001085', '03100000-0000-4000-8000-000000000522', 'Combined bandwidth and redundancy', TRUE,  1),
  ('03100000-0000-4000-8000-000000001086', '03100000-0000-4000-8000-000000000522', 'A single link that can never fail', FALSE, 2),
  ('03100000-0000-4000-8000-000000001087', '03100000-0000-4000-8000-000000000522', 'Guaranteed zero latency', FALSE, 3),
  ('03100000-0000-4000-8000-000000001088', '03100000-0000-4000-8000-000000000522', 'Automatic VLAN creation', FALSE, 4),
  -- Q8 (523): LACP
  ('03100000-0000-4000-8000-000000001089', '03100000-0000-4000-8000-000000000523', 'LACP (or PAgP on Cisco)', TRUE,  1),
  ('03100000-0000-4000-8000-000000001090', '03100000-0000-4000-8000-000000000523', 'STP', FALSE, 2),
  ('03100000-0000-4000-8000-000000001091', '03100000-0000-4000-8000-000000000523', 'DHCP', FALSE, 3),
  ('03100000-0000-4000-8000-000000001092', '03100000-0000-4000-8000-000000000523', 'DNS', FALSE, 4),
  -- Q8 (524): shutdown violation
  ('03100000-0000-4000-8000-000000001093', '03100000-0000-4000-8000-000000000524', 'shutdown', TRUE,  1),
  ('03100000-0000-4000-8000-000000001094', '03100000-0000-4000-8000-000000000524', 'protect', FALSE, 2),
  ('03100000-0000-4000-8000-000000001095', '03100000-0000-4000-8000-000000000524', 'restrict', FALSE, 3),
  ('03100000-0000-4000-8000-000000001096', '03100000-0000-4000-8000-000000000524', 'learn', FALSE, 4),
  -- Q9 (525): VLAN ID field
  ('03100000-0000-4000-8000-000000001097', '03100000-0000-4000-8000-000000000525', 'VLAN ID (VID)', TRUE,  1),
  ('03100000-0000-4000-8000-000000001098', '03100000-0000-4000-8000-000000000525', 'Priority Code Point (PCP)', FALSE, 2),
  ('03100000-0000-4000-8000-000000001099', '03100000-0000-4000-8000-000000000525', 'TPID field', FALSE, 3),
  ('03100000-0000-4000-8000-000000001100', '03100000-0000-4000-8000-000000000525', 'EtherType field', FALSE, 4),
  -- Q9 (526): broadcast flooded in VLAN
  ('03100000-0000-4000-8000-000000001101', '03100000-0000-4000-8000-000000000526', 'Flood it to every port in the same VLAN', TRUE,  1),
  ('03100000-0000-4000-8000-000000001102', '03100000-0000-4000-8000-000000000526', 'Drop the frame', FALSE, 2),
  ('03100000-0000-4000-8000-000000001103', '03100000-0000-4000-8000-000000000526', 'Forward it only to the router', FALSE, 3),
  ('03100000-0000-4000-8000-000000001104', '03100000-0000-4000-8000-000000000526', 'Convert it to a unicast frame', FALSE, 4),
  -- Q9 (527): Layer 2 switch statement
  ('03100000-0000-4000-8000-000000001105', '03100000-0000-4000-8000-000000000527', 'It forwards by destination MAC within a VLAN', TRUE,  1),
  ('03100000-0000-4000-8000-000000001106', '03100000-0000-4000-8000-000000000527', 'It selects routes by IP prefix', FALSE, 2),
  ('03100000-0000-4000-8000-000000001107', '03100000-0000-4000-8000-000000000527', 'It terminates broadcast domains', FALSE, 3),
  ('03100000-0000-4000-8000-000000001108', '03100000-0000-4000-8000-000000000527', 'It rewrites MAC addresses on every hop', FALSE, 4),
  -- Q9 (528): duplex mismatch result
  ('03100000-0000-4000-8000-000000001109', '03100000-0000-4000-8000-000000000528', 'CRC errors, late collisions, and poor performance', TRUE,  1),
  ('03100000-0000-4000-8000-000000001110', '03100000-0000-4000-8000-000000000528', 'The interface reports a higher speed', FALSE, 2),
  ('03100000-0000-4000-8000-000000001111', '03100000-0000-4000-8000-000000000528', 'VLANs automatically merge', FALSE, 3),
  ('03100000-0000-4000-8000-000000001112', '03100000-0000-4000-8000-000000000528', 'The switch forwards at full wire speed', FALSE, 4),
  -- Q9 (529): proof of inter-VLAN routing
  ('03100000-0000-4000-8000-000000001113', '03100000-0000-4000-8000-000000000529', 'Pinging a host in another VLAN successfully', TRUE,  1),
  ('03100000-0000-4000-8000-000000001114', '03100000-0000-4000-8000-000000000529', 'Checking the port cable type', FALSE, 2),
  ('03100000-0000-4000-8000-000000001115', '03100000-0000-4000-8000-000000000529', 'Clearing the MAC address table', FALSE, 3),
  ('03100000-0000-4000-8000-000000001116', '03100000-0000-4000-8000-000000000529', 'Rebooting the switch', FALSE, 4)
ON CONFLICT (id) DO NOTHING;