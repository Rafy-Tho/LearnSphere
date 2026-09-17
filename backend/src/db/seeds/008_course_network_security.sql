-- ============================================================================
-- SEED 008: Complete course — "Network Security Essentials"
-- ----------------------------------------------------------------------------
-- Instructor : Elena Rodriguez     (10000000-0000-4000-8000-000000000005)
-- Category   : Cybersecurity       (20000000-0000-4000-8000-000000000005)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Security Foundations        → C1 Security Mindset & the CIA Triad
--                                   · C2 Threats & Attack Types
--   M2 Defending the Network       → C3 Firewalls & Segmentation
--                                   · C4 VPNs, TLS & Encryption
--   M3 Monitoring & Response       → C5 Logging & SIEM
--                                   · C6 Intrusion Detection & Incident Response
--   M4 Hardening & Policy          → C7 System & Network Hardening
--                                   · C8 Security Policies & Compliance
--   M5 Capstone: Home Lab Defense  → C9 Project Setup & Planning
--                                   · C10 Building & Testing Defenses
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across `quizzes` and `quiz_options`.
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
  '80000000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000005',
  '20000000-0000-4000-8000-000000000005',
  'Network Security Essentials',
  'network-security-essentials',
  'Learn to defend networks like a security professional. Survey the common attacks targeting modern infrastructure — social engineering, credential theft, interception, and denial of service — then build layered defenses: firewalls, network segmentation, TLS, VPNs, monitoring, and hardened systems, through hands-on labs you can run at home.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  6
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('80000000-0000-4000-8000-000000000011', '80000000-0000-4000-8000-000000000001', 'Apply core security principles, including the CIA triad and a defender mindset, to real networks.', 1),
  ('80000000-0000-4000-8000-000000000012', '80000000-0000-4000-8000-000000000001', 'Identify common network attacks and the weaknesses each one exploits.',                               2),
  ('80000000-0000-4000-8000-000000000013', '80000000-0000-4000-8000-000000000001', 'Design layered defenses with firewalls, segmentation, encryption, and VPNs.',                         3),
  ('80000000-0000-4000-8000-000000000014', '80000000-0000-4000-8000-000000000001', 'Monitor networks with logging, SIEM, intrusion detection, and structured incident response.',         4),
  ('80000000-0000-4000-8000-000000000015', '80000000-0000-4000-8000-000000000001', 'Harden systems and apply security policies and compliance frameworks in a home lab.',                 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('80000000-0000-4000-8000-000000000101', '80000000-0000-4000-8000-000000000001', 1, 'Security Foundations',            'Adopt a defender mindset and learn the principles that guide every security decision.',        'PUBLISHED'),
  ('80000000-0000-4000-8000-000000000102', '80000000-0000-4000-8000-000000000001', 2, 'Defending the Network',           'Block attackers at the boundary and protect data in transit.',                                 'PUBLISHED'),
  ('80000000-0000-4000-8000-000000000103', '80000000-0000-4000-8000-000000000001', 3, 'Monitoring & Response',           'Gain visibility into your network and respond when alarms fire.',                             'PUBLISHED'),
  ('80000000-0000-4000-8000-000000000104', '80000000-0000-4000-8000-000000000001', 4, 'Hardening & Policy',              'Shrink the attack surface of every host and embed security in policy.',                       'PUBLISHED'),
  ('80000000-0000-4000-8000-000000000105', '80000000-0000-4000-8000-000000000001', 5, 'Capstone: Home Lab Defense',      'Build a small home lab and prove your defenses under test.',                                  'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('80000000-0000-4000-8000-000000000201', '80000000-0000-4000-8000-000000000101', 1, 'Security Mindset & the CIA Triad', 'Core principles including the CIA triad and a defender mindset.',   'PUBLISHED'),
  ('80000000-0000-4000-8000-000000000202', '80000000-0000-4000-8000-000000000101', 2, 'Threats & Attack Types',           'The actors, motives, and techniques behind network attacks.',       'PUBLISHED'),
  ('80000000-0000-4000-8000-000000000203', '80000000-0000-4000-8000-000000000102', 1, 'Firewalls & Segmentation',         'Filter traffic, track connections, and isolate your assets.',       'PUBLISHED'),
  ('80000000-0000-4000-8000-000000000204', '80000000-0000-4000-8000-000000000102', 2, 'VPNs, TLS & Encryption',           'Keep data confidential in transit and secure remote access.',       'PUBLISHED'),
  ('80000000-0000-4000-8000-000000000205', '80000000-0000-4000-8000-000000000103', 1, 'Logging & SIEM',                   'Collect, centralize, and analyze security-relevant logs.',          'PUBLISHED'),
  ('80000000-0000-4000-8000-000000000206', '80000000-0000-4000-8000-000000000103', 2, 'Intrusion Detection & Incident Response', 'Detect intrusions and work a structured response.',                 'PUBLISHED'),
  ('80000000-0000-4000-8000-000000000207', '80000000-0000-4000-8000-000000000104', 1, 'System & Network Hardening',       'Reduce the attack surface of servers, devices, and networks.',      'PUBLISHED'),
  ('80000000-0000-4000-8000-000000000208', '80000000-0000-4000-8000-000000000104', 2, 'Security Policies & Compliance',   'Codify expectations and meet regulatory requirements.',             'PUBLISHED'),
  ('80000000-0000-4000-8000-000000000209', '80000000-0000-4000-8000-000000000105', 1, 'Project Setup & Planning',         'Scope the capstone and design a topology worth defending.',         'PUBLISHED'),
  ('80000000-0000-4000-8000-000000000210', '80000000-0000-4000-8000-000000000105', 2, 'Building & Testing Defenses',      'Deploy the defenses and verify them with realistic tests.',         'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 80000000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('80000000-0000-4000-8000-000000000301', '80000000-0000-4000-8000-000000000201', 1, 'The Security Mindset',                    'Adopt a defender mindset: assume breach, default deny, and verify before trusting.', 'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('80000000-0000-4000-8000-000000000302', '80000000-0000-4000-8000-000000000201', 2, 'The CIA Triad',                            'Balance confidentiality, integrity, and availability in every decision.',            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('80000000-0000-4000-8000-000000000303', '80000000-0000-4000-8000-000000000201', 3, 'Security Foundations Quiz',                'Check your grasp of core security principles.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('80000000-0000-4000-8000-000000000304', '80000000-0000-4000-8000-000000000202', 1, 'Understanding the Threat Landscape',        'Meet the actors, motives, and methods behind attacks.',                              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('80000000-0000-4000-8000-000000000305', '80000000-0000-4000-8000-000000000202', 2, 'Common Network Attacks',                   'Reconnaissance, interception, denial, and credential attacks.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('80000000-0000-4000-8000-000000000306', '80000000-0000-4000-8000-000000000202', 3, 'Threats & Attacks Quiz',                    'Test your knowledge of attackers and their techniques.',                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('80000000-0000-4000-8000-000000000307', '80000000-0000-4000-8000-000000000203', 1, 'How Firewalls Work',                       'Inspect packets, sessions, and applications at the perimeter.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('80000000-0000-4000-8000-000000000308', '80000000-0000-4000-8000-000000000203', 2, 'Network Segmentation & Zoning',             'Isolate assets and design DMZs and VLAN boundaries.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('80000000-0000-4000-8000-000000000309', '80000000-0000-4000-8000-000000000203', 3, 'Firewalls & Segmentation Quiz',             'Answer questions about filtering and zone design.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('80000000-0000-4000-8000-000000000310', '80000000-0000-4000-8000-000000000204', 1, 'Understanding TLS & HTTPS',                 'Secure web traffic with certificates and handshakes.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('80000000-0000-4000-8000-000000000311', '80000000-0000-4000-8000-000000000204', 2, 'VPNs & Remote Access Security',             'Tunnel, authenticate, and encrypt remote connections.',                              'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('80000000-0000-4000-8000-000000000312', '80000000-0000-4000-8000-000000000204', 3, 'VPNs & Encryption Quiz',                    'Check your knowledge of encryption and secure access.',                              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('80000000-0000-4000-8000-000000000313', '80000000-0000-4000-8000-000000000205', 1, 'Logging Fundamentals',                      'Capture the events that tell the story of your network.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('80000000-0000-4000-8000-000000000314', '80000000-0000-4000-8000-000000000205', 2, 'SIEM: Collect, Correlate & Alert',          'Turn raw logs into centralized, searchable intelligence.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('80000000-0000-4000-8000-000000000315', '80000000-0000-4000-8000-000000000205', 3, 'Logging & SIEM Quiz',                       'Test your understanding of central log management.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('80000000-0000-4000-8000-000000000316', '80000000-0000-4000-8000-000000000206', 1, 'Intrusion Detection Systems',               'Detect malicious patterns with NIDS, HIDS, and signatures.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('80000000-0000-4000-8000-000000000317', '80000000-0000-4000-8000-000000000206', 2, 'The Incident Response Lifecycle',            'Prepare, detect, contain, eradicate, recover, and learn.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('80000000-0000-4000-8000-000000000318', '80000000-0000-4000-8000-000000000206', 3, 'Detection & Response Quiz',                 'Answer questions about detection tools and IR phases.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('80000000-0000-4000-8000-000000000319', '80000000-0000-4000-8000-000000000207', 1, 'System Hardening Essentials',               'Patch, configure, and lock down your operating systems.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('80000000-0000-4000-8000-000000000320', '80000000-0000-4000-8000-000000000207', 2, 'Network Hardening Practices',               'Harden routers, switches, services, and Wi-Fi.',                                      'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('80000000-0000-4000-8000-000000000321', '80000000-0000-4000-8000-000000000207', 3, 'Hardening Quiz',                            'Check your understanding of attack surface reduction.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('80000000-0000-4000-8000-000000000322', '80000000-0000-4000-8000-000000000208', 1, 'Writing Effective Security Policies',       'Turn security goals into enforceable, testable rules.',                                'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('80000000-0000-4000-8000-000000000323', '80000000-0000-4000-8000-000000000208', 2, 'Compliance: Standards & Frameworks',        'NIST CSF, ISO 27001, GDPR, and PCI DSS in practice.',                                  'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('80000000-0000-4000-8000-000000000324', '80000000-0000-4000-8000-000000000208', 3, 'Policy & Compliance Quiz',                  'Test your grasp of policies and regulatory frameworks.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('80000000-0000-4000-8000-000000000325', '80000000-0000-4000-8000-000000000209', 1, 'Capstone Planning & Lab Topology',          'Scope the lab and draw the network you will defend.',                                  'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('80000000-0000-4000-8000-000000000326', '80000000-0000-4000-8000-000000000209', 2, 'Building the Lab Environment',              'Provision virtual machines, networking, and hardened baselines.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 15),
  ('80000000-0000-4000-8000-000000000327', '80000000-0000-4000-8000-000000000210', 1, 'Testing Your Defenses',                     'Simulate scripted attacks and verify your layers hold.',                              'TEXT',  'PUBLISHED', 'FREE', 10, 15),
  ('80000000-0000-4000-8000-000000000328', '80000000-0000-4000-8000-000000000210', 2, 'Final Assessment',                          'Prove mastery across the entire course.',                                              'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 80000000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '80000000-0000-4000-8000-000000000401',
  '80000000-0000-4000-8000-000000000301',
  1,
  'The Security Mindset',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Security Mindset</title>
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
  <h1>The Security Mindset</h1>
  <p>Security is not a product you install and forget; it is a habit of mind. The security professional constantly asks what could go wrong, what an attacker would do next, and which data is worth protecting. This lesson lays the foundation for every technique in the course.</p>
  <h2>Think like an attacker</h2>
  <p>To defend a network you must be able to imagine how it could be broken. Adversaries are not random; they follow a repeatable process.</p>
  <pre class="code-block">1. Reconnaissance     map the target, find assets and services
2. Weaponization      craft or pick a malicious payload
3. Delivery           send it via email, web, or removable media
4. Exploitation       trigger the vulnerability
5. Installation       establish persistence
6. Command and control  reach back to the operator
7. Actions on objective  steal data, pivot, destroy</pre>
  <table>
    <thead>
      <tr><th>Principle</th><th>Meaning</th></tr>
    </thead>
    <tbody>
      <tr><td>Assume breach</td><td>Design as if the attacker is already inside.</td></tr>
      <tr><td>Least privilege</td><td>Grant the minimum access a user or process needs.</td></tr>
      <tr><td>Defense in depth</td><td>Layer independent controls so one failure is not fatal.</td></tr>
      <tr><td>Default deny</td><td>Block everything you have not explicitly allowed.</td></tr>
      <tr><td>Verify, then trust</td><td>Validate identity and integrity before relying on anything.</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Mindset shift</strong>
    <p>Stop asking "can it be hacked?" and start asking "what is the worst realistic way it can be hacked, and how do I make that expensive?" Security is economics: you make the attack cost more than the target is worth.</p>
  </div>
  <h2>Own your responsibilities</h2>
  <ul>
    <li>Understand what data you are protecting and who wants it.</li>
    <li>Document assumptions so decisions are auditable.</li>
    <li>Test your defenses; an untested control is a rumor.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Keep a personal threat model: your assets, the actors who want them, and the controls that matter. Revisit it whenever you plan anything new.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000402',
  '80000000-0000-4000-8000-000000000302',
  1,
  'The CIA Triad',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The CIA Triad</title>
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
  <h1>The CIA Triad</h1>
  <p>Every security control you will meet in this course exists to serve one or more of three goals: <strong>confidentiality</strong>, <strong>integrity</strong>, and <strong>availability</strong>. Together they form the CIA triad, the compass for security decisions.</p>
  <table>
    <thead>
      <tr><th>Property</th><th>Definition</th><th>Threatened by</th></tr>
    </thead>
    <tbody>
      <tr><td>Confidentiality</td><td>Only authorized parties can read the data.</td><td>Snooping, theft, weak access control</td></tr>
      <tr><td>Integrity</td><td>Data is accurate and unmodified without authorization.</td><td>Tampering, corruption, man-in-the-middle</td></tr>
      <tr><td>Availability</td><td>Authorized users can reach the system when needed.</td><td>DDoS, ransomware, hardware failure</td></tr>
    </tbody>
  </table>
  <h2>Protecting confidentiality</h2>
  <p>Encryption is the power tool. Encrypt data at rest on disks and in the database, and in transit with TLS. Pair it with authentication and the principle of least privilege so only the right people hold the keys.</p>
  <h2>Protecting integrity</h2>
  <p>Message digests let you detect change. A hash function maps data to a short fingerprint; if the data changes even slightly, the fingerprint changes completely.</p>
  <pre class="code-block">$ sha256sum backup.iso
9a8b7c6d5e4f3a2b1c0d9e8f7a6b5c4d3e2f1a0b9c8d7e6f5a4b3c2d1e0f1a  backup.iso</pre>
  <h2>Protecting availability</h2>
  <p>Redundancy keeps services up: redundant power, multiple paths, backups tested by restoration. An availability failure can be as damaging as a leak.</p>
  <div class="callout callout-info">
    <strong>Real trade-offs</strong>
    <p>The trio pulls against itself. Strong encryption slows backup, tight controls slow teamwork, and always-on availability costs money. Good security finds the right balance for the business.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Mental exercise</strong>
    <p>For any system you use, name the asset and which CIA property matters most. A patient record values confidentiality; a payment gateway values all three; a game server values availability.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000403',
  '80000000-0000-4000-8000-000000000304',
  1,
  'Understanding the Threat Landscape',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Understanding the Threat Landscape</title>
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
  <h1>Understanding the Threat Landscape</h1>
  <p>You cannot defend against an abstract "hacker". Real threats come from specific actors with goals, skills, and budgets. The threat landscape maps those actors onto the assets they might pursue.</p>
  <table>
    <thead>
      <tr><th>Actor</th><th>Motivation</th><th>Typical targets</th></tr>
    </thead>
    <tbody>
      <tr><td>Cybercriminal</td><td>Money</td><td>Credit cards, ransomware victims, resold data</td></tr>
      <tr><td>Nation state</td><td>Espionage, geopolitics</td><td>Research, infrastructure, government systems</td></tr>
      <tr><td>Hacktivist</td><td>Ideology</td><td>Public-facing sites, brand defacement</td></tr>
      <tr><td>Insider</td><td>Money, grievance, carelessness</td><td>Internal data, sabotage, accidental leaks</td></tr>
      <tr><td>Script kiddie</td><td>Reputation, thrills</td><td>Weak targets found by scanning</td></tr>
    </tbody>
  </table>
  <h2>Threat modeling</h2>
  <p>A simple threat model answers four questions in order.</p>
  <ol>
    <li>What am I protecting? (assets)</li>
    <li>Who wants it and what would they do with it? (adversaries)</li>
    <li>Which weaknesses could let them reach it? (attack vectors)</li>
    <li>What controls reduce the risk to an acceptable level? (mitigations)</li>
  </ol>
  <pre class="code-block">Asset:       customer database
Adversaries: cybercriminals reselling identity data; disgruntled insider
Vectors:     stolen admin credentials, unpatched web app, SQL injection
Mitigations: MFA on admin accounts, patch pipeline, parameterized
             queries, network isolation for the database tier</pre>
  <div class="callout callout-info">
    <strong>Risk is not fear</strong>
    <p>Risk equals likelihood times impact. Spend budget where both are high. Rare, minor risks might simply be accepted, documented, and revisited on a calendar.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Keep a living list of your assets and their owners. You cannot protect what you do not even know exists.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000404',
  '80000000-0000-4000-8000-000000000305',
  1,
  'Common Network Attacks',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Common Network Attacks</title>
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
  <h1>Common Network Attacks</h1>
  <p>Now that you know who attacks, look at how. These are the techniques you will most often meet on the wire, and the ones this course teaches you to defeat.</p>
  <h2>Reconnaissance</h2>
  <p>Attackers first discover what is open and reachable. A port scan asks each port whether a service is listening.</p>
  <pre class="code-block">$ nmap -sV 192.168.1.10
PORT     STATE SERVICE  VERSION
22/tcp   open  ssh      OpenSSH 8.9
443/tcp  open  https    nginx 1.22
3306/tcp open  mysql    MySQL 5.7   &lt;-- outdated, a target</pre>
  <h2>Interception and tampering</h2>
  <p>On a shared network, an attacker can read or rewrite traffic. ARP spoofing convinces hosts that the attacker is their gateway, putting every packet within reach — a man-in-the-middle position.</p>
  <h2>Credential attacks</h2>
  <ul>
    <li><strong>Phishing</strong> — a convincing message tricks the user into revealing credentials.</li>
    <li><strong>Brute force</strong> — try passwords until one works.</li>
    <li><strong>Credential stuffing</strong> — replay passwords leaked from one site against many others.</li>
  </ul>
  <h2>Denial of service</h2>
  <p>A distributed denial of service flood overwhelms a service so legitimate users cannot reach it — an attack aimed squarely at availability.</p>
  <div class="callout callout-info">
    <strong>Human factor</strong>
    <p>Most breaches begin with a click, not a zero-day. Security awareness, multi-factor authentication, and least privilege are your cheapest and most effective defenses.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Lab note</strong>
    <p>You will see these attacks again in the capstone lab, where you will launch scans and watch your firewalls and intrusion detection respond.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000405',
  '80000000-0000-4000-8000-000000000307',
  1,
  'How Firewalls Work',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>How Firewalls Work</title>
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
  <h1>How Firewalls Work</h1>
  <p>The firewall is the bouncer of your network. It sits at the boundary and decides, packet by packet, what comes in and what goes out.</p>
  <h2>Three generations</h2>
  <table>
    <thead>
      <tr><th>Type</th><th>Decides based on</th><th>Example</th></tr>
    </thead>
    <tbody>
      <tr><td>Stateless</td><td>Headers of each packet</td><td>Classic packet filter</td></tr>
      <tr><td>Stateful</td><td>Headers plus connection state</td><td>ufw, iptables</td></tr>
      <tr><td>Next-generation</td><td>Application, user, and payload</td><td>Managed UTM appliances</td></tr>
    </tbody>
  </table>
  <h2>Default deny wins</h2>
  <p>Sound rules start from a default-deny posture: block everything, then explicitly allow what the business needs. A default-allow firewall is a checklist, not a defense.</p>
  <pre class="code-block"># Ubuntu: enable Uncomplicated Firewall with a default deny
$ sudo ufw default deny incoming
$ sudo ufw default allow outgoing
$ sudo ufw allow 22/tcp      # SSH management
$ sudo ufw allow 443/tcp     # HTTPS web traffic
$ sudo ufw enable
$ sudo ufw status verbose</pre>
  <h2>Rules are a policy, not a patch</h2>
  <p>Review rules regularly, remove stale entries, and log everything you deny. A rule that nobody can explain is inventory for the next attacker.</p>
  <div class="callout callout-info">
    <strong>Be careful with allow any</strong>
    <p>"Allow from anywhere to anything" is how firewalls fail by default. Scope every allow to the smallest host group and port range that works.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Order matters. Most firewall engines apply the first matching rule. Put the most specific rules first and the catch-all deny last.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000406',
  '80000000-0000-4000-8000-000000000308',
  1,
  'Network Segmentation & Zoning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Network Segmentation &amp; Zoning</title>
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
  <h1>Network Segmentation &amp; Zoning</h1>
  <p>Segmentation is the art of walls. Instead of one flat network where everything can reach everything, you divide the network into zones with controlled paths between them. A breach in one zone then stops at the boundary.</p>
  <h2>VLANs and subnets</h2>
  <p>Virtual LANs split traffic at layer 2 even on the same switch; subnets split the IP space at layer 3. Together they let one physical fabric host many logical networks.</p>
  <pre class="code-block">VLAN 10  users          192.168.10.0/24
VLAN 20  servers        192.168.20.0/24
VLAN 30  dmz            192.168.30.0/24
VLAN 99  management     192.168.99.0/24</pre>
  <h2>The DMZ pattern</h2>
  <p>Public-facing services — web, mail, VPN — live in the demilitarized zone. The rule is simple: the internet may reach the DMZ, but never the internal network directly.</p>
  <h2>Zoning table to aim for</h2>
  <table>
    <thead>
      <tr><th>Zone</th><th>Contains</th><th>Reachable from</th></tr>
    </thead>
    <tbody>
      <tr><td>Internet</td><td>Everyone</td><td>DMZ only</td></tr>
      <tr><td>DMZ</td><td>Web, mail, VPN gateways</td><td>Internet (limited); internal (limited)</td></tr>
      <tr><td>Internal</td><td>Workstations, printers</td><td>Servers (limited); internet via proxy</td></tr>
      <tr><td>Servers</td><td>Databases, application tier</td><td>Internal only; never from internet</td></tr>
      <tr><td>Management</td><td>Admin consoles</td><td>Internal staff only, strong auth</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Lateral movement</strong>
    <p>Flat networks are why one stolen laptop becomes a full breach. Segmentation converts a disaster into a contained incident.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Rule of thumb: never mix users and servers on the same subnet, and never allow a service to reach the internet unless it must.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000407',
  '80000000-0000-4000-8000-000000000310',
  1,
  'Understanding TLS & HTTPS',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Understanding TLS &amp; HTTPS</title>
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
  <h1>Understanding TLS &amp; HTTPS</h1>
  <p>Data crossing the internet passes through equipment you do not own. TLS protects it: it encrypts traffic, authenticates the server, and detects tampering. HTTPS is simply HTTP running inside TLS.</p>
  <h2>A brief handshake</h2>
  <ol>
    <li>The client connects and sends the supported cipher suites.</li>
    <li>The server answers with a signed certificate proving identity.</li>
    <li>They agree on a session key using asymmetric cryptography.</li>
    <li>Bulk data now flows using fast symmetric encryption.</li>
  </ol>
  <h2>Certificates and trust</h2>
  <p>A certificate binds a public key to a name. A certificate authority (CA) vouches for that binding, and your browser ships with a list of trusted CAs. That chain of trust is what stops an impostor.</p>
  <h2>Check a certificate from the command line</h2>
  <pre class="code-block">$ openssl s_client -connect example.com:443 -servername example.com
Certificate chain
 0 s:CN = example.com
   i:C = US, O = Example Root CA
1 s:CN = Example Root CA
...
SSL-Session:
    Cipher    : TLS_AES_256_GCM_SHA384  (a modern TLS 1.3 suite)</pre>
  <h2>Weaknesses you should know</h2>
  <table>
    <thead>
      <tr><th>Attack</th><th>Defense</th></tr>
    </thead>
    <tbody>
      <tr><td>Expired or mismatched certificates</td><td>Automate renewal; never ignore the warning</td></tr>
      <tr><td>Downgrade to obsolete SSL</td><td>Disable SSLv3 and TLS 1.0/1.1</td></tr>
      <tr><td>Mixed content</td><td>Serve every resource over HTTPS</td></tr>
      <tr><td>Man-in-the-middle without HSTS</td><td>Send HTTP Strict Transport Security</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Encryption is not privacy proof</strong>
    <p>TLS hides content, but metadata still leaks: who talks to whom, when, and how much. Monitoring tools legitimately use that metadata, and so can attackers.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Use public grading services to check a site you operate. Aim for an A rating: modern TLS only, strong cipher suites, and HSTS enabled.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000408',
  '80000000-0000-4000-8000-000000000311',
  1,
  'VPNs & Remote Access Security',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VPNs &amp; Remote Access Security</title>
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
  <h1>VPNs &amp; Remote Access Security</h1>
  <p>A remote worker sitting in a cafe is on a network they do not control. A VPN creates a protected tunnel from their device to the office so the traffic crosses the hostile middle ground encrypted.</p>
  <h2>What a VPN does</h2>
  <ul>
    <li>Encrypts traffic between the client and the gateway.</li>
    <li>Authenticates both ends, often with certificates and tokens.</li>
    <li>Gives the client a valid address inside the corporate network.</li>
  </ul>
  <h2>Site-to-site vs remote access</h2>
  <table>
    <thead>
      <tr><th>Mode</th><th>Connects</th><th>Typical protocol</th></tr>
    </thead>
    <tbody>
      <tr><td>Site-to-site</td><td>Two networks</td><td>IPsec, WireGuard</td></tr>
      <tr><td>Remote access</td><td>One user device</td><td>WireGuard, OpenVPN, IPsec</td></tr>
    </tbody>
  </table>
  <h2>A minimal WireGuard client config</h2>
  <pre class="code-block">[Interface]                          # client
PrivateKey = &lt;client_private_key&gt;
Address    = 10.9.0.2/32

[Peer]
PublicKey  = &lt;server_public_key&gt;
Endpoint   = vpn.example.com:51820
AllowedIPs = 192.168.1.0/24          # push office traffic through the tunnel</pre>
  <div class="callout callout-info">
    <strong>A VPN is not a firewall</strong>
    <p>A VPN extends the trusted network to the device; it does not inspect what flows inside the tunnel. A compromised and connected laptop becomes a foothold — segment remote users and watch their traffic.</p>
  </div>
  <div class="callout callout-tip">
    <strong>MFA beats password</strong>
    <p>Require multi-factor authentication on every remote access path. Leaked VPN credentials are among the favorite first steps of real intrusions.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000409',
  '80000000-0000-4000-8000-000000000313',
  1,
  'Logging Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Logging Fundamentals</title>
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
  <h1>Logging Fundamentals</h1>
  <p>Logs are the memory of your network. Every authentication, connection, command, and crash can leave a record. When something goes wrong, logs are the difference between knowing and guessing.</p>
  <h2>Know your sources</h2>
  <table>
    <thead>
      <tr><th>Source</th><th>Example event</th></tr>
    </thead>
    <tbody>
      <tr><td>Operating system</td><td>Login success or failure, privilege change</td></tr>
      <tr><td>Network devices</td><td>Configuration change, interface up or down</td></tr>
      <tr><td>Services</td><td>Web errors, denied API calls</td></tr>
      <tr><td>Security tools</td><td>Firewall denies, IDS alerts</td></tr>
    </tbody>
  </table>
  <h2>Where logs live</h2>
  <pre class="code-block">$ ls /var/log
auth.log  kern.log  nginx/  rsyslog  syslog
$ journalctl -u sshd --since today     # read the SSH service log
$ sudo tail -n 20 /var/log/auth.log    # see recent login attempts</pre>
  <h2>Forward them centrally</h2>
  <p>Security events scattered on a hundred hosts are invisible. A simple syslog forwarding line sends network and server logs to one collector.</p>
  <pre class="code-block"># rsyslog: forward everything to the SIEM collector on TCP 514
*.* @@10.10.10.5:514</pre>
  <div class="callout callout-info">
    <strong>Time matters</strong>
    <p>Set every device to the same UTC time, ideally with NTP. Logs that cannot be correlated by timestamp are almost useless during an investigation.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Defend the logs</strong>
    <p>Logs are evidence. Make them append-only, restrict who can delete them, and keep a copy off-box. Attackers who clean up their tracks start with the log server.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000410',
  '80000000-0000-4000-8000-000000000314',
  1,
  'SIEM: Collect, Correlate & Alert',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SIEM: Collect, Correlate &amp; Alert</title>
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
  <h1>SIEM: Collect, Correlate &amp; Alert</h1>
  <p>A security information and event management system gathers logs from everywhere and turns them into answers: who failed to log in too often, which host is scanning the network, and where the anomaly is spreading.</p>
  <h2>The pipeline</h2>
  <ol>
    <li><strong>Collection</strong> — agents or syslog feed events to the platform.</li>
    <li><strong>Normalization</strong> — different formats become one schema.</li>
    <li><strong>Correlation</strong> — rules combine events into incidents.</li>
    <li><strong>Alerting</strong> — operators get a ticket, not a firehose.</li>
    <li><strong>Retention</strong> — storage keeps history for forensic queries.</li>
  </ol>
  <h2>What a correlation rule looks like</h2>
  <pre class="code-block">When 5+ failed logins for one account occur within 5 minutes
AND the account does NOT have a recent password change
THEN alert "brute_force_suspicion" to the SOC queue
AND block the source IP for 30 minutes</pre>
  <h2>Use dashboards, not noise</h2>
  <ul>
    <li>Top alert sources and the false positive rate.</li>
    <li>Authentication anomalies across the fleet.</li>
    <li>Outbound traffic to known-bad destinations.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Garbage in, guarantees out</strong>
    <p>A SIEM is only as good as its feed. If the firewall does not log, or logs are not forwarded, the platform cannot see that traffic. Instrument the important sources first.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Start with three rules that detect real incidents in your organization, tune them, and only then broaden. Alert fatigue is the silent killer of every SIEM program.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000411',
  '80000000-0000-4000-8000-000000000316',
  1,
  'Intrusion Detection Systems',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Intrusion Detection Systems</title>
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
  <h1>Intrusion Detection Systems</h1>
  <p>Firewalls prevent; detectors watch. An intrusion detection system (IDS) inspects traffic and host activity for signs of attack, while an intrusion prevention system (IPS) does the same and can drop the offending traffic.</p>
  <h2>Where they watch</h2>
  <table>
    <thead>
      <tr><th>Type</th><th>Vantage</th><th>Watches</th></tr>
    </thead>
    <tbody>
      <tr><td>NIDS</td><td>Span port or tap on the network</td><td>Passing traffic (promiscuous mode)</td></tr>
      <tr><td>HIDS</td><td>Agent on the host</td><td>Files, processes, logs, hash changes</td></tr>
    </tbody>
  </table>
  <h2>Signature vs anomaly</h2>
  <pre class="code-block"># A Suricata-style rule: content match on a known exploit string
alert tcp $HOME_NET any -&gt; $EXTERNAL_NET any (
  msg:"suspicious-cmd-exfil";
  content:"whoami"; nocase;
  sid:1000421; rev:1; )</pre>
  <ul>
    <li><strong>Signature-based</strong> — match patterns of known attacks; fast and reliable, but blind to the new or the mutated.</li>
    <li><strong>Anomaly-based</strong> — learn a baseline and flag what deviates; finds novelty but can cry wolf.</li>
  </ul>
  <h2>Placement matters</h2>
  <p>Put the sensor where it sees the traffic that matters: just inside the firewall for inbound inspection, inside the DMZ, and at critical internal segment boundaries.</p>
  <div class="callout callout-info">
    <strong>Detection is not response</strong>
    <p>An alert nobody answers is a scream in an empty room. Tune rules, set priorities, and connect the detector to the incident response process.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Modern traffic is often encrypted. Inspect where you can across the TLS session, and always record the metadata so at least endpoints and volumes remain visible.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000412',
  '80000000-0000-4000-8000-000000000317',
  1,
  'The Incident Response Lifecycle',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Incident Response Lifecycle</title>
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
  <h1>The Incident Response Lifecycle</h1>
  <p>When detection fires, panic is not a plan. A structured process keeps the response calm, fast, and evidence-safe. The NIST model is the standard reference.</p>
  <h2>The six phases</h2>
  <pre class="code-block">1. Preparation         roles, playbooks, tools, backups, training
2. Detection &amp; Analysis  confirm, scope, and classify the incident
3. Containment         stop the spread (short-term, then long-term)
4. Eradication         remove the attacker and fix the root cause
5. Recovery            restore systems safely and confirm clean
6. Post-incident       lessons learned, process improvements</pre>
  <h2>Containment options, in order of preference</h2>
  <table>
    <thead>
      <tr><th>Action</th><th>Trade-off</th></tr>
    </thead>
    <tbody>
      <tr><td>Block at the firewall</td><td>Fast and reversible if you have the wrong house</td></tr>
      <tr><td>Disable the compromised account</td><td>Quick action; may lock a legitimate user</td></tr>
      <tr><td>Isolate the host on a quarantine VLAN</td><td>Keeps evidence; shuts down service</td></tr>
      <tr><td>Pull the network cable</td><td>Nuclear; last resort</td></tr>
    </tbody>
  </table>
  <h2>Evidence first</h2>
  <p>Capture memory and logs before you "fix" anything. A clean-up that destroys evidence converts a criminal case into a rumor.</p>
  <div class="callout callout-info">
    <strong>Never destroy evidence</strong>
    <p>Document every action with timestamps and the people involved. Build the timeline before making changes. Rebuild, do not repair, a compromised host.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Before it happens</strong>
    <p>Agree on roles and a decision-maker now. The team that rehearses an incident responds in minutes; the team that improvises responds in days.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000413',
  '80000000-0000-4000-8000-000000000319',
  1,
  'System Hardening Essentials',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>System Hardening Essentials</title>
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
  <h1>System Hardening Essentials</h1>
  <p>Hardening shrinks the attack surface: fewer services, weaker defaults removed, known flaws patched, and accounts held to the least privilege. A hardened host gives an attacker far less to work with.</p>
  <h2>Patch, patch, patch</h2>
  <p>Most compromises land in unpatched, known vulnerabilities. Automate updates and maintain an exception list with owners and dates.</p>
  <pre class="code-block">$ sudo apt update
$ sudo apt upgrade
$ sudo systemctl --state=running      # audit what is actually running</pre>
  <h2>A hardening checklist</h2>
  <table>
    <thead>
      <tr><th>Control</th><th>Why</th></tr>
    </thead>
    <tbody>
      <tr><td>Disable unused services</td><td>Less reachable attack surface</td></tr>
      <tr><td>Remove unused software</td><td>No abandoned code left with bugs</td></tr>
      <tr><td>Least privilege accounts</td><td>Limit the blast radius of a compromise</td></tr>
      <tr><td>Outbound firewall deny</td><td>Stop command-and-control beacons</td></tr>
      <tr><td>Full-disk encryption</td><td>Protect data at rest from theft</td></tr>
    </tbody>
  </table>
  <h2>Harden SSH as a case study</h2>
  <pre class="code-block"># /etc/ssh/sshd_config
PermitRootLogin              no
PasswordAuthentication       no
PubkeyAuthentication         yes
MaxAuthTries                 3
AllowUsers                   deploy alice</pre>
  <div class="callout callout-info">
    <strong>One change, wide effect</strong>
    <p>Turn off password login and root login and you instantly kill the two most common brute-force paths. Combine with key-based auth and fail2ban for defense in depth.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pro tip</strong>
    <p>Write a baseline document per server type and verify hosts against it. If you cannot rebuild a server from a config file, you do not really own its settings.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000414',
  '80000000-0000-4000-8000-000000000320',
  1,
  'Network Hardening Practices',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Network Hardening Practices</title>
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
  <h1>Network Hardening Practices</h1>
  <p>Hosts matter, but so do the switches, routers, and access points they plug into. A network device running default credentials or open management ports undoes everything else you build.</p>
  <h2>Device hygiene</h2>
  <ul>
    <li>Change default credentials on first login.</li>
    <li>Disable unused management interfaces and vendor services.</li>
    <li>Serve management over authenticated, encrypted access only.</li>
    <li>Update firmware on a schedule, not a mishap.</li>
  </ul>
  <h2>Control the management plane</h2>
  <pre class="code-block">access-list 110 permit tcp host 10.0.0.5 any eq 22   # admin from jump host
access-list 110 deny ip any any log                  # deny everything else</pre>
  <h2>Secure the airwaves</h2>
  <table>
    <thead>
      <tr><th>Wi-Fi control</th><th>Setting</th></tr>
    </thead>
    <tbody>
      <tr><td>Encryption</td><td>WPA3 (or WPA2 at minimum)</td></tr>
      <tr><td>WPS</td><td>Disabled — it is a PIN guessing backdoor</td></tr>
      <tr><td>Guest network</td><td>Separate SSID, isolated from internal</td></tr>
      <tr><td>Firmware</td><td>Keep current; check for defaults</td></tr>
    </tbody>
  </table>
  <h2>Physical layer is a layer too</h2>
  <p>Lock server rooms, enable port security so an unknown laptop cannot simply plug in, and treat publicly visible ports as hostile.</p>
  <div class="callout callout-info">
    <strong>The forgotten default</strong>
    <p>Default passwords on network gear are a top cause of real-world router attacks. Sweep your estate for them with an asset audit before the attacker does.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Jump host pattern</strong>
    <p>Administer devices only from a dedicated jump host. It gives you one hardened place to authenticate and one audit trail to check.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000415',
  '80000000-0000-4000-8000-000000000322',
  1,
  'Writing Effective Security Policies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Writing Effective Security Policies</title>
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
  <h1>Writing Effective Security Policies</h1>
  <p>Technology fails wherever people are unclear about expectations. A security policy turns goals into rules that employees, vendors, and auditors can all read, apply, and enforce.</p>
  <h2>Common policy families</h2>
  <table>
    <thead>
      <tr><th>Policy</th><th>Governs</th></tr>
    </thead>
    <tbody>
      <tr><td>Acceptable Use (AUP)</td><td>How company systems and internet may be used</td></tr>
      <tr><td>Password and access</td><td>Length, rotation, MFA, least privilege</td></tr>
      <tr><td>Incident response</td><td>Who does what when something breaks in</td></tr>
      <tr><td>Data classification</td><td>How each class of data is handled and stored</td></tr>
      <tr><td>Change management</td><td>How production changes get reviewed</td></tr>
    </tbody>
  </table>
  <h2>The anatomy of a clause</h2>
  <pre class="code-block">Scope:       who must follow this policy
Rule:        what is required or prohibited (clear and testable)
Exemption:   who may deviate and how it is approved
Enforcement: what happens on violation
Review:      when it is revisited and by whom</pre>
  <h2>The password policy, in one clause</h2>
  <p>"Every account must enforce MFA where available and a unique passphrase of at least 12 characters; passwords are never shared, and reusing credentials between work and personal services is prohibited." That one sentence beats a 40-page manual.</p>
  <div class="callout callout-info">
    <strong>Policy is not a wish</strong>
    <p>An unenforced policy is decoration. Pair every rule with a technical control and a compliance check, and let the policy name the person who owns it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Keep it short</strong>
    <p>Write for a tired human at the end of the day. Plain language, numbered rules, and a version number beat dense legalese nobody reads.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000416',
  '80000000-0000-4000-8000-000000000323',
  1,
  'Compliance: Standards & Frameworks',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Compliance: Standards &amp; Frameworks</title>
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
  <h1>Compliance: Standards &amp; Frameworks</h1>
  <p>Compliance is the discipline of proving you meet requirements: legal, contractual, or industry-driven. Frameworks give you a structured way to get there and to demonstrate it to auditors and customers.</p>
  <h2>The most cited references</h2>
  <table>
    <thead>
      <tr><th>Framework</th><th>Emphasis</th></tr>
    </thead>
    <tbody>
      <tr><td>NIST Cybersecurity Framework</td><td>Identify, protect, detect, respond, recover</td></tr>
      <tr><td>ISO/IEC 27001</td><td>Information security management system (ISMS)</td></tr>
      <tr><td>GDPR</td><td>Privacy of EU personal data, breach notification</td></tr>
      <tr><td>PCI DSS</td><td>Security of cardholder data</td></tr>
      <tr><td>SOC 2</td><td>Trust services for vendors and customers</td></tr>
    </tbody>
  </table>
  <h2>Framework as a checklist</h2>
  <pre class="code-block">NIST CSF core (abridged):
Identify    asset inventory, roles, risk register
Protect     training, access control, backups, patching
Detect      monitoring, log review, anomaly alerts
Respond     playbooks, communication plan
Recover     tested restores, lessons learned</pre>
  <h2>Gap analysis</h2>
  <p>Ask where you stand against a requirement, record the delta, prioritize by risk, and track remediation. Compliance programs live in that gap list, reviewed on a calendar.</p>
  <div class="callout callout-info">
    <strong>Compliance is the floor, not the ceiling</strong>
    <p>Meeting a checklist does not guarantee security. Use frameworks as structure and keep the security mindset from the first module on top of it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Not legal advice</strong>
    <p>Regulatory obligations depend on your jurisdiction and data. For a real program, consult qualified legal counsel — treat this course as orientation, not advice.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000417',
  '80000000-0000-4000-8000-000000000325',
  1,
  'Capstone Planning & Lab Topology',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone Planning &amp; Lab Topology</title>
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
  <h1>Capstone Planning &amp; Lab Topology</h1>
  <p>Everything in this course now comes together. You will build a small home lab, harden it, monitor it, and attack it — legally and safely — to prove the layers hold.</p>
  <h2>Scope the project</h2>
  <p>A good lab starts with a written plan: what it demonstrates, what is out of scope, and how it will be dismantled.</p>
  <pre class="code-block">Goal:     a private network that resists a scripted attack scenario
Out of scope: other devices on your home network, internet-facing services
Tools:    VirtualBox or KVM, four VMs, one isolated virtual network
Timebox:  build in one pass, defend in the next, test in the last</pre>
  <h2>Draw the topology</h2>
  <pre class="code-block">           [ ATTACKER VM ]  (192.168.50.50)
                  |
            [ vFirewall ]  — default deny + zone rules
               |         |
         [ vWeb ]      [ vWorkstation ]
      (DMZ 10.9.1.10)  (internal 10.9.2.10)</pre>
  <h2>Asset inventory</h2>
  <table>
    <thead>
      <tr><th>Host</th><th>Role</th><th>Key hardening</th></tr>
    </thead>
    <tbody>
      <tr><td>vFirewall</td><td>Gateway, segmentation, logging</td><td>Default deny rules, admin over SSH only</td></tr>
      <tr><td>vWeb</td><td>Public web server in the DMZ</td><td>Patches, limited ports, full logging</td></tr>
      <tr><td>vWorkstation</td><td>Internal user host</td><td>Least privilege, disk encryption, no default creds</td></tr>
      <tr><td>vAttacker</td><td>Test rig</td><td>Isolated; used only for allowed tests</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Stay legal</strong>
    <p>Attack only the machines you own. Keep the lab on an isolated network and never scan devices you do not have permission to test.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Design review</strong>
    <p>Before you build, predict: where does the attacker get stopped? If the internet zone can reach the workstation, your zoning diagram needs fixing first.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000418',
  '80000000-0000-4000-8000-000000000326',
  1,
  'Building the Lab Environment',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building the Lab Environment</title>
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
  <h1>Building the Lab Environment</h1>
  <p>Time to stand up the lab. Use a hypervisor you already have — VirtualBox or KVM — and provision one virtual network that is fully isolated from your real home network.</p>
  <h2>1. Create the VMs</h2>
  <pre class="code-block">vFirewall       Linux minimal + firewall service   (1 vCPU, 1 GB)
vWeb            Linux minimal + nginx              (1 vCPU, 1 GB)
vWorkstation    Linux desktop                      (2 vCPU, 2 GB)
vAttacker       Linux + scanning tools             (1 vCPU, 1 GB)</pre>
  <h2>2. Network them</h2>
  <p>Put all four on an internal virtual network with no internet unless you explicitly add it. Give each VM a fixed address and document the map.</p>
  <pre class="code-block">vFirewall      10.9.0.1      (gateway, all zones)
vWeb           10.9.1.10     (DMZ subnet)
vWorkstation   10.9.2.10     (internal subnet)
vAttacker      192.168.50.50 (test subnet)</pre>
  <h2>3. Baseline and snapshot</h2>
  <ul>
    <li>Patch every VM on first boot.</li>
    <li>Apply the hardening checklist from Module 4 to each host.</li>
    <li>Change every default credential.</li>
  </ul>
  <pre class="code-block">$ sudo apt update &amp;&amp; sudo apt upgrade -y
$ sudo usermod -L root                # lock the root account
$ sudo snapshot "hardened baseline"
$ sudo snapshot "after milestone 1"   # snapshots are cheap rollbacks</pre>
  <div class="callout callout-info">
    <strong>Snapshots are the undo button</strong>
    <p>Before every test you run from the attacker VM, snapshot the victims. When the experiment breaks a host, revert and retry — no rebuild needed, and nothing bleeds over.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Keep it honest</strong>
    <p>Do not pre-punch holes in the firewall to make tests succeed. The point is to see your design resist the scripted scenario — so test what you actually intend to run.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '80000000-0000-4000-8000-000000000419',
  '80000000-0000-4000-8000-000000000327',
  1,
  'Testing Your Defenses',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Testing Your Defenses</title>
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
  <h1>Testing Your Defenses</h1>
  <p>The lab exists to be broken in a controlled way. Run a scripted scenario, watch your layers react, and improve the weak spots. This is the last lesson before the final assessment.</p>
  <h2>1. Recon and scan (attacker VM)</h2>
  <pre class="code-block">$ nmap -sV 10.9.0.0/24        # what do the layers expose?
$ nmap -sV -p- 10.9.1.10      # sweep every port of the web host</pre>
  <p>Review the scan against your firewall rules. Every open port the attacker sees should be one you intended — anything else is a finding.</p>
  <h2>2. Watch the sensors</h2>
  <pre class="code-block">$ sudo tcpdump -i any 'tcp port 22 or port 80'       # firewall, live
$ sudo tail -f /var/log/auth.log                      # web host logins
$ sudo tail -f /var/log/fail2ban.log                  # brute-force blocker</pre>
  <h2>3. Confirm the IDS saw it</h2>
  <p>Check that the detector logged the same events your firewall logged. If the scan was visible to one but not the other, your monitoring has a blind spot.</p>
  <h2>4. The verdict table</h2>
  <table>
    <thead>
      <tr><th>Test</th><th>Expected</th><th>Observed</th></tr>
    </thead>
    <tbody>
      <tr><td>Port scan</td><td>Only DMZ ports visible</td><td>________</td></tr>
      <tr><td>SSH brute force</td><td>Blocked after a few tries</td><td>________</td></tr>
      <tr><td>Workstation reach</td><td>Not reachable from test zone</td><td>________</td></tr>
      <tr><td>Log correlation</td><td>Same event in firewall + SIEM</td><td>________</td></tr>
    </tbody>
  </table>
  <div class="callout callout-info">
    <strong>Document the findings</strong>
    <p>Write down what passed and what failed. The notes become your personal baseline and a portfolio piece that proves you can run security work, not just talk about it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Next steps</strong>
    <p>When a test slips through the layers, patch that gap, snapshot, and re-run. Finished means the scripted attack is contained end to end. Then take the final assessment.</p>
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
  ('80000000-0000-4000-8000-000000000501', '80000000-0000-4000-8000-000000000303',
   'What does CIA stand for in the security triad?',
   'The CIA triad stands for Confidentiality, Integrity, and Availability.', 1),
  ('80000000-0000-4000-8000-000000000502', '80000000-0000-4000-8000-000000000303',
   'Which CIA property is violated when a file is modified without authorization?',
   'Unauthorized alteration breaks the integrity of the data.', 2),
  ('80000000-0000-4000-8000-000000000503', '80000000-0000-4000-8000-000000000303',
   'Which CIA property fails when a service keeps rejecting legitimate users?',
   'When legitimate users cannot reach a system, availability has failed.', 3),
  ('80000000-0000-4000-8000-000000000504', '80000000-0000-4000-8000-000000000306',
   'An attacker answers ARP requests to place themselves between two hosts. Which attack is this?',
   'ARP spoofing puts the attacker in a man-in-the-middle position.', 1),
  ('80000000-0000-4000-8000-000000000505', '80000000-0000-4000-8000-000000000306',
   'Which stage of an attack involves discovering open ports and running services?',
   'Reconnaissance maps the target before any exploitation begins.', 2),
  ('80000000-0000-4000-8000-000000000506', '80000000-0000-4000-8000-000000000306',
   'An employee hands over a password to a caller pretending to be IT support. Which attack succeeded?',
   'Pretexting is a social engineering technique that fabricates a believable scenario.', 3),
  ('80000000-0000-4000-8000-000000000507', '80000000-0000-4000-8000-000000000309',
   'Beyond source and destination, what does a stateful firewall track?',
   'A stateful firewall tracks the state of active connections.', 1),
  ('80000000-0000-4000-8000-000000000508', '80000000-0000-4000-8000-000000000309',
   'In a default-deny firewall posture, traffic is...',
   'Default deny blocks everything that is not explicitly allowed.', 2),
  ('80000000-0000-4000-8000-000000000509', '80000000-0000-4000-8000-000000000309',
   'What is a demilitarized zone (DMZ) used for?',
   'A DMZ hosts public-facing services while keeping them isolated from the internal network.', 3),
  ('80000000-0000-4000-8000-000000000510', '80000000-0000-4000-8000-000000000312',
   'Which protocol secures the majority of HTTPS traffic on the web?',
   'TLS protects HTTPS, and also encrypts many other protocols.', 1),
  ('80000000-0000-4000-8000-000000000511', '80000000-0000-4000-8000-000000000312',
   'What is the primary purpose of a VPN tunnel between a remote worker and the office?',
   'A VPN encrypts traffic so it can safely cross untrusted networks.', 2),
  ('80000000-0000-4000-8000-000000000512', '80000000-0000-4000-8000-000000000312',
   'In symmetric encryption, encryption and decryption use...',
   'Symmetric cryptography uses a single shared key for both directions.', 3),
  ('80000000-0000-4000-8000-000000000513', '80000000-0000-4000-8000-000000000315',
   'Which SIEM component is responsible for gathering log data from many sources?',
   'Log collectors and agents feed events from many hosts into the platform.', 1),
  ('80000000-0000-4000-8000-000000000514', '80000000-0000-4000-8000-000000000315',
   'What does a SIEM correlation rule typically do?',
   'Correlation rules combine events to detect suspicious patterns.', 2),
  ('80000000-0000-4000-8000-000000000515', '80000000-0000-4000-8000-000000000315',
   'Which protocol is commonly used to forward logs to a central server?',
   'Syslog is the standard protocol for forwarding logs across a network.', 3),
  ('80000000-0000-4000-8000-000000000516', '80000000-0000-4000-8000-000000000318',
   'A signature-based IDS detects...',
   'Signature-based systems match traffic against known attack patterns.', 1),
  ('80000000-0000-4000-8000-000000000517', '80000000-0000-4000-8000-000000000318',
   'In the NIST incident response lifecycle, which phase follows preparation?',
   'Detection and analysis confirms, scopes, and classifies the incident.', 2),
  ('80000000-0000-4000-8000-000000000518', '80000000-0000-4000-8000-000000000318',
   'Which inline device actively blocks malicious traffic as it passes?',
   'An intrusion prevention system sits in the path and can block traffic.', 3),
  ('80000000-0000-4000-8000-000000000519', '80000000-0000-4000-8000-000000000321',
   'The principle of least privilege means users receive...',
   'Least privilege grants only the access needed to do a job.', 1),
  ('80000000-0000-4000-8000-000000000520', '80000000-0000-4000-8000-000000000321',
   'Which practice directly reduces the attack surface of a server?',
   'Disabling unused services removes code an attacker could reach.', 2),
  ('80000000-0000-4000-8000-000000000521', '80000000-0000-4000-8000-000000000321',
   'Applying security patches addresses which class of weakness?',
   'Patches fix known vulnerabilities before attackers can exploit them.', 3),
  ('80000000-0000-4000-8000-000000000522', '80000000-0000-4000-8000-000000000324',
   'An Acceptable Use Policy (AUP) typically defines...',
   'An AUP sets how users may use company systems and networks.', 1),
  ('80000000-0000-4000-8000-000000000523', '80000000-0000-4000-8000-000000000324',
   'Which framework is an internationally recognized information security standard?',
   'ISO/IEC 27001 describes an information security management system.', 2),
  ('80000000-0000-4000-8000-000000000524', '80000000-0000-4000-8000-000000000324',
   'Defense in depth means...',
   'Defense in depth layers multiple independent security controls.', 3),
  ('80000000-0000-4000-8000-000000000525', '80000000-0000-4000-8000-000000000328',
   'A network with a firewall, an IDS, and a centralized SIEM is applying which strategy?',
   'Layering independent controls is the definition of defense in depth.', 1),
  ('80000000-0000-4000-8000-000000000526', '80000000-0000-4000-8000-000000000328',
   'Which control best protects data at rest on a stolen laptop?',
   'Full-disk encryption makes stored data unreadable without the key.', 2),
  ('80000000-0000-4000-8000-000000000527', '80000000-0000-4000-8000-000000000328',
   'A help desk account can read every employee inbox. Which principle is violated?',
   'Excess privileges violate the principle of least privilege.', 3),
  ('80000000-0000-4000-8000-000000000528', '80000000-0000-4000-8000-000000000328',
   'During an incident, which phase removes the threat from the environment?',
   'Eradication removes the root cause and the attacker artifacts.', 4),
  ('80000000-0000-4000-8000-000000000529', '80000000-0000-4000-8000-000000000328',
   'An attacker replays passwords leaked from one site against many accounts. What is this called?',
   'Credential stuffing uses leaked credentials across multiple services.', 5)
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
  -- Q1 (501): CIA meaning
  ('80000000-0000-4000-8000-000000001001', '80000000-0000-4000-8000-000000000501', 'Confidentiality, Integrity, Availability', TRUE,  1),
  ('80000000-0000-4000-8000-000000001002', '80000000-0000-4000-8000-000000000501', 'Control, Identity, Authorization', FALSE, 2),
  ('80000000-0000-4000-8000-000000001003', '80000000-0000-4000-8000-000000000501', 'Central, Internet, Access', FALSE, 3),
  ('80000000-0000-4000-8000-000000001004', '80000000-0000-4000-8000-000000000501', 'Cryptography, Intrusion, Authentication', FALSE, 4),
  -- Q1 (501)q2: integrity violation
  ('80000000-0000-4000-8000-000000001005', '80000000-0000-4000-8000-000000000502', 'Integrity', TRUE,  1),
  ('80000000-0000-4000-8000-000000001006', '80000000-0000-4000-8000-000000000502', 'Confidentiality', FALSE, 2),
  ('80000000-0000-4000-8000-000000001007', '80000000-0000-4000-8000-000000000502', 'Availability', FALSE, 3),
  ('80000000-0000-4000-8000-000000001008', '80000000-0000-4000-8000-000000000502', 'Authentication', FALSE, 4),
  -- Q1 (501)q3: availability failure
  ('80000000-0000-4000-8000-000000001009', '80000000-0000-4000-8000-000000000503', 'Availability', TRUE,  1),
  ('80000000-0000-4000-8000-000000001010', '80000000-0000-4000-8000-000000000503', 'Confidentiality', FALSE, 2),
  ('80000000-0000-4000-8000-000000001011', '80000000-0000-4000-8000-000000000503', 'Integrity', FALSE, 3),
  ('80000000-0000-4000-8000-000000001012', '80000000-0000-4000-8000-000000000503', 'Non-repudiation', FALSE, 4),
  -- Q2 (504): ARP spoofing
  ('80000000-0000-4000-8000-000000001013', '80000000-0000-4000-8000-000000000504', 'ARP spoofing / man-in-the-middle', TRUE,  1),
  ('80000000-0000-4000-8000-000000001014', '80000000-0000-4000-8000-000000000504', 'Phishing', FALSE, 2),
  ('80000000-0000-4000-8000-000000001015', '80000000-0000-4000-8000-000000000504', 'Distributed denial of service', FALSE, 3),
  ('80000000-0000-4000-8000-000000001016', '80000000-0000-4000-8000-000000000504', 'Port scanning', FALSE, 4),
  -- Q2 (504)q2: reconnaissance
  ('80000000-0000-4000-8000-000000001017', '80000000-0000-4000-8000-000000000505', 'Reconnaissance', TRUE,  1),
  ('80000000-0000-4000-8000-000000001018', '80000000-0000-4000-8000-000000000505', 'Exploitation', FALSE, 2),
  ('80000000-0000-4000-8000-000000001019', '80000000-0000-4000-8000-000000000505', 'Covering tracks', FALSE, 3),
  ('80000000-0000-4000-8000-000000001020', '80000000-0000-4000-8000-000000000505', 'Lateral movement', FALSE, 4),
  -- Q2 (504)q3: social engineering
  ('80000000-0000-4000-8000-000000001021', '80000000-0000-4000-8000-000000000506', 'Social engineering (pretexting)', TRUE,  1),
  ('80000000-0000-4000-8000-000000001022', '80000000-0000-4000-8000-000000000506', 'SQL injection', FALSE, 2),
  ('80000000-0000-4000-8000-000000001023', '80000000-0000-4000-8000-000000000506', 'Man-in-the-middle', FALSE, 3),
  ('80000000-0000-4000-8000-000000001024', '80000000-0000-4000-8000-000000000506', 'Zero-day exploit', FALSE, 4),
  -- Q3 (507): stateful tracking
  ('80000000-0000-4000-8000-000000001025', '80000000-0000-4000-8000-000000000507', 'Connection state', TRUE,  1),
  ('80000000-0000-4000-8000-000000001026', '80000000-0000-4000-8000-000000000507', 'Disk writes', FALSE, 2),
  ('80000000-0000-4000-8000-000000001027', '80000000-0000-4000-8000-000000000507', 'CPU usage', FALSE, 3),
  ('80000000-0000-4000-8000-000000001028', '80000000-0000-4000-8000-000000000507', 'Browser cookies', FALSE, 4),
  -- Q3 (507)q2: default deny
  ('80000000-0000-4000-8000-000000001029', '80000000-0000-4000-8000-000000000508', 'Blocked unless explicitly allowed', TRUE,  1),
  ('80000000-0000-4000-8000-000000001030', '80000000-0000-4000-8000-000000000508', 'Allowed unless explicitly blocked', FALSE, 2),
  ('80000000-0000-4000-8000-000000001031', '80000000-0000-4000-8000-000000000508', 'Logged but never blocked', FALSE, 3),
  ('80000000-0000-4000-8000-000000001032', '80000000-0000-4000-8000-000000000508', 'Encrypted automatically', FALSE, 4),
  -- Q3 (507)q3: DMZ purpose
  ('80000000-0000-4000-8000-000000001033', '80000000-0000-4000-8000-000000000509', 'Hosting public-facing services isolated from internal hosts', TRUE,  1),
  ('80000000-0000-4000-8000-000000001034', '80000000-0000-4000-8000-000000000509', 'Storing offline backup tapes', FALSE, 2),
  ('80000000-0000-4000-8000-000000001035', '80000000-0000-4000-8000-000000000509', 'Running scheduled antivirus scans', FALSE, 3),
  ('80000000-0000-4000-8000-000000001036', '80000000-0000-4000-8000-000000000509', 'Monitoring employee screens', FALSE, 4),
  -- Q4 (510): TLS protocol
  ('80000000-0000-4000-8000-000000001037', '80000000-0000-4000-8000-000000000510', 'TLS', TRUE,  1),
  ('80000000-0000-4000-8000-000000001038', '80000000-0000-4000-8000-000000000510', 'SNMP', FALSE, 2),
  ('80000000-0000-4000-8000-000000001039', '80000000-0000-4000-8000-000000000510', 'RDP', FALSE, 3),
  ('80000000-0000-4000-8000-000000001040', '80000000-0000-4000-8000-000000000510', 'SMTP', FALSE, 4),
  -- Q4 (510)q2: VPN purpose
  ('80000000-0000-4000-8000-000000001041', '80000000-0000-4000-8000-000000000511', 'Encrypting traffic over untrusted networks', TRUE,  1),
  ('80000000-0000-4000-8000-000000001042', '80000000-0000-4000-8000-000000000511', 'Increasing download speed', FALSE, 2),
  ('80000000-0000-4000-8000-000000001043', '80000000-0000-4000-8000-000000000511', 'Replacing antivirus software', FALSE, 3),
  ('80000000-0000-4000-8000-000000001044', '80000000-0000-4000-8000-000000000511', 'Providing free internet access', FALSE, 4),
  -- Q4 (510)q3: symmetric encryption
  ('80000000-0000-4000-8000-000000001045', '80000000-0000-4000-8000-000000000512', 'The same key', TRUE,  1),
  ('80000000-0000-4000-8000-000000001046', '80000000-0000-4000-8000-000000000512', 'Two different keys', FALSE, 2),
  ('80000000-0000-4000-8000-000000001047', '80000000-0000-4000-8000-000000000512', 'One-time passwords', FALSE, 3),
  ('80000000-0000-4000-8000-000000001048', '80000000-0000-4000-8000-000000000512', 'No key at all', FALSE, 4),
  -- Q5 (513): SIEM collection
  ('80000000-0000-4000-8000-000000001049', '80000000-0000-4000-8000-000000000513', 'Log collectors', TRUE,  1),
  ('80000000-0000-4000-8000-000000001050', '80000000-0000-4000-8000-000000000513', 'Correlation engine', FALSE, 2),
  ('80000000-0000-4000-8000-000000001051', '80000000-0000-4000-8000-000000000513', 'Alert dashboard', FALSE, 3),
  ('80000000-0000-4000-8000-000000001052', '80000000-0000-4000-8000-000000000513', 'Firewall appliance', FALSE, 4),
  -- Q5 (513)q2: correlation
  ('80000000-0000-4000-8000-000000001053', '80000000-0000-4000-8000-000000000514', 'Combines events to detect suspicious patterns', TRUE,  1),
  ('80000000-0000-4000-8000-000000001054', '80000000-0000-4000-8000-000000000514', 'Encrypts log files in transit', FALSE, 2),
  ('80000000-0000-4000-8000-000000001055', '80000000-0000-4000-8000-000000000514', 'Deletes old logs automatically', FALSE, 3),
  ('80000000-0000-4000-8000-000000001056', '80000000-0000-4000-8000-000000000514', 'Blocks offending IPs at the firewall', FALSE, 4),
  -- Q5 (513)q3: syslog protocol
  ('80000000-0000-4000-8000-000000001057', '80000000-0000-4000-8000-000000000515', 'Syslog', TRUE,  1),
  ('80000000-0000-4000-8000-000000001058', '80000000-0000-4000-8000-000000000515', 'HTTP', FALSE, 2),
  ('80000000-0000-4000-8000-000000001059', '80000000-0000-4000-8000-000000000515', 'DNS', FALSE, 3),
  ('80000000-0000-4000-8000-000000001060', '80000000-0000-4000-8000-000000000515', 'DHCP', FALSE, 4),
  -- Q6 (516): signature detection
  ('80000000-0000-4000-8000-000000001061', '80000000-0000-4000-8000-000000000516', 'Known attack patterns', TRUE,  1),
  ('80000000-0000-4000-8000-000000001062', '80000000-0000-4000-8000-000000000516', 'Any behavior that looks unusual', FALSE, 2),
  ('80000000-0000-4000-8000-000000001063', '80000000-0000-4000-8000-000000000516', 'Encrypted malware payloads', FALSE, 3),
  ('80000000-0000-4000-8000-000000001064', '80000000-0000-4000-8000-000000000516', 'Hardware fan failures', FALSE, 4),
  -- Q6 (516)q2: IR phases
  ('80000000-0000-4000-8000-000000001065', '80000000-0000-4000-8000-000000000517', 'Detection & Analysis', TRUE,  1),
  ('80000000-0000-4000-8000-000000001066', '80000000-0000-4000-8000-000000000517', 'Recovery', FALSE, 2),
  ('80000000-0000-4000-8000-000000001067', '80000000-0000-4000-8000-000000000517', 'Containment', FALSE, 3),
  ('80000000-0000-4000-8000-000000001068', '80000000-0000-4000-8000-000000000517', 'Post-incident activity', FALSE, 4),
  -- Q6 (516)q3: IPS vs IDS
  ('80000000-0000-4000-8000-000000001069', '80000000-0000-4000-8000-000000000518', 'Intrusion Prevention System (IPS)', TRUE,  1),
  ('80000000-0000-4000-8000-000000001070', '80000000-0000-4000-8000-000000000518', 'Intrusion Detection System (IDS)', FALSE, 2),
  ('80000000-0000-4000-8000-000000001071', '80000000-0000-4000-8000-000000000518', 'Network address translation (NAT)', FALSE, 3),
  ('80000000-0000-4000-8000-000000001072', '80000000-0000-4000-8000-000000000518', 'Network time protocol (NTP)', FALSE, 4),
  -- Q7 (519): least privilege
  ('80000000-0000-4000-8000-000000001073', '80000000-0000-4000-8000-000000000519', 'Only the access needed for their role', TRUE,  1),
  ('80000000-0000-4000-8000-000000001074', '80000000-0000-4000-8000-000000000519', 'Administrator rights by default', FALSE, 2),
  ('80000000-0000-4000-8000-000000001075', '80000000-0000-4000-8000-000000000519', 'All rights revoked permanently', FALSE, 3),
  ('80000000-0000-4000-8000-000000001076', '80000000-0000-4000-8000-000000000519', 'Access based on seniority alone', FALSE, 4),
  -- Q7 (519)q2: reduce attack surface
  ('80000000-0000-4000-8000-000000001077', '80000000-0000-4000-8000-000000000520', 'Disabling unused services', TRUE,  1),
  ('80000000-0000-4000-8000-000000001078', '80000000-0000-4000-8000-000000000520', 'Changing the desktop wallpaper', FALSE, 2),
  ('80000000-0000-4000-8000-000000001079', '80000000-0000-4000-8000-000000000520', 'Installing more browsers', FALSE, 3),
  ('80000000-0000-4000-8000-000000001080', '80000000-0000-4000-8000-000000000520', 'Increasing the screen resolution', FALSE, 4),
  -- Q7 (519)q3: patches
  ('80000000-0000-4000-8000-000000001081', '80000000-0000-4000-8000-000000000521', 'Known vulnerabilities', TRUE,  1),
  ('80000000-0000-4000-8000-000000001082', '80000000-0000-4000-8000-000000000521', 'Physical theft', FALSE, 2),
  ('80000000-0000-4000-8000-000000001083', '80000000-0000-4000-8000-000000000521', 'Power outages', FALSE, 3),
  ('80000000-0000-4000-8000-000000001084', '80000000-0000-4000-8000-000000000521', 'User training', FALSE, 4),
  -- Q8 (522): AUP
  ('80000000-0000-4000-8000-000000001085', '80000000-0000-4000-8000-000000000522', 'How users may use company resources', TRUE,  1),
  ('80000000-0000-4000-8000-000000001086', '80000000-0000-4000-8000-000000000522', 'The password hash format', FALSE, 2),
  ('80000000-0000-4000-8000-000000001087', '80000000-0000-4000-8000-000000000522', 'Firewall rule syntax', FALSE, 3),
  ('80000000-0000-4000-8000-000000001088', '80000000-0000-4000-8000-000000000522', 'DNS record types', FALSE, 4),
  -- Q8 (522)q2: ISO 27001
  ('80000000-0000-4000-8000-000000001089', '80000000-0000-4000-8000-000000000523', 'ISO/IEC 27001', TRUE,  1),
  ('80000000-0000-4000-8000-000000001090', '80000000-0000-4000-8000-000000000523', 'HTML5', FALSE, 2),
  ('80000000-0000-4000-8000-000000001091', '80000000-0000-4000-8000-000000000523', 'IEEE 802.11', FALSE, 3),
  ('80000000-0000-4000-8000-000000001092', '80000000-0000-4000-8000-000000000523', 'RFC 1918', FALSE, 4),
  -- Q8 (522)q3: defense in depth
  ('80000000-0000-4000-8000-000000001093', '80000000-0000-4000-8000-000000000524', 'Multiple layers of security controls', TRUE,  1),
  ('80000000-0000-4000-8000-000000001094', '80000000-0000-4000-8000-000000000524', 'A single perfectly secure firewall', FALSE, 2),
  ('80000000-0000-4000-8000-000000001095', '80000000-0000-4000-8000-000000000524', 'Hiding all systems behind NAT', FALSE, 3),
  ('80000000-0000-4000-8000-000000001096', '80000000-0000-4000-8000-000000000524', 'Only using strong passwords', FALSE, 4),
  -- Q9 (525): layered strategy
  ('80000000-0000-4000-8000-000000001097', '80000000-0000-4000-8000-000000000525', 'Defense in depth', TRUE,  1),
  ('80000000-0000-4000-8000-000000001098', '80000000-0000-4000-8000-000000000525', 'Default allow', FALSE, 2),
  ('80000000-0000-4000-8000-000000001099', '80000000-0000-4000-8000-000000000525', 'Single point of failure', FALSE, 3),
  ('80000000-0000-4000-8000-000000001100', '80000000-0000-4000-8000-000000000525', 'Security through obscurity', FALSE, 4),
  -- Q9 (525)q2: data at rest
  ('80000000-0000-4000-8000-000000001101', '80000000-0000-4000-8000-000000000526', 'Full-disk encryption', TRUE,  1),
  ('80000000-0000-4000-8000-000000001102', '80000000-0000-4000-8000-000000000526', 'A strong login wallpaper', FALSE, 2),
  ('80000000-0000-4000-8000-000000001103', '80000000-0000-4000-8000-000000000526', 'Disabling the keyboard backlight', FALSE, 3),
  ('80000000-0000-4000-8000-000000001104', '80000000-0000-4000-8000-000000000526', 'A hostname change', FALSE, 4),
  -- Q9 (525)q3: least privilege
  ('80000000-0000-4000-8000-000000001105', '80000000-0000-4000-8000-000000000527', 'Least privilege', TRUE,  1),
  ('80000000-0000-4000-8000-000000001106', '80000000-0000-4000-8000-000000000527', 'High availability', FALSE, 2),
  ('80000000-0000-4000-8000-000000001107', '80000000-0000-4000-8000-000000000527', 'Defense in depth', FALSE, 3),
  ('80000000-0000-4000-8000-000000001108', '80000000-0000-4000-8000-000000000527', 'Non-repudiation', FALSE, 4),
  -- Q9 (525)q4: eradication
  ('80000000-0000-4000-8000-000000001109', '80000000-0000-4000-8000-000000000528', 'Eradication', TRUE,  1),
  ('80000000-0000-4000-8000-000000001110', '80000000-0000-4000-8000-000000000528', 'Preparation', FALSE, 2),
  ('80000000-0000-4000-8000-000000001111', '80000000-0000-4000-8000-000000000528', 'Detection', FALSE, 3),
  ('80000000-0000-4000-8000-000000001112', '80000000-0000-4000-8000-000000000528', 'Lessons learned', FALSE, 4),
  -- Q9 (525)q5: credential stuffing
  ('80000000-0000-4000-8000-000000001113', '80000000-0000-4000-8000-000000000529', 'Credential stuffing', TRUE,  1),
  ('80000000-0000-4000-8000-000000001114', '80000000-0000-4000-8000-000000000529', 'Port knocking', FALSE, 2),
  ('80000000-0000-4000-8000-000000001115', '80000000-0000-4000-8000-000000000529', 'Session fixation', FALSE, 3),
  ('80000000-0000-4000-8000-000000001116', '80000000-0000-4000-8000-000000000529', 'DNS tunneling', FALSE, 4)
ON CONFLICT (id) DO NOTHING;