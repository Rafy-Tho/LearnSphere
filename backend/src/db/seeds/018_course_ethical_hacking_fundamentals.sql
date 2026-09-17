-- ============================================================================
-- SEED 018: Complete course — "Ethical Hacking Fundamentals"
-- ----------------------------------------------------------------------------
-- Instructor : Elena Rodriguez  (10000000-0000-4000-8000-000000000005)
-- Category   : Cybersecurity     (20000000-0000-4000-8000-000000000005)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Foundations & Ethics    → C1 Security Mindset & Core Concepts · C2 Ethics, Law & Engagement Scope
--   M2 Reconnaissance          → C3 Passive Reconnaissance & OSINT · C4 Active Reconnaissance & Footprinting
--   M3 Scanning & Enumeration  → C5 Network Scanning & Service Discovery · C6 Enumeration & Vulnerability Analysis
--   M4 Exploitation & Web      → C7 Exploitation & Attack Basics · C8 Web Application Attacks & Mitigations
--   M5 Reporting & Capstone    → C9 Reporting & Remediation · C10 Capstone Assessment Lab
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across quizzes + `quizzes` and `quiz_options`.
-- The course teaches a security mindset, legal and authorization discipline,
-- recon, scanning, enumeration, vulnerability analysis, exploitation basics,
-- password and web attacks — all defensive-focused and lab-bound.
--
-- Idempotency: every statement uses ON CONFLICT (id) DO NOTHING with fixed,
-- deterministic UUIDs (prefix 01200000), so this file can be re-run safely.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. COURSE + OBJECTIVES
-- ----------------------------------------------------------------------------

INSERT INTO courses (
  id, instructor_id, category_id, name, slug, description, status, level, access_type, position
) VALUES (
  '01200000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000005',
  '20000000-0000-4000-8000-000000000005',
  'Ethical Hacking Fundamentals',
  'ethical-hacking-fundamentals',
  'Learn to see systems the way an attacker does — and defend them. Explore the ethical and legal boundaries of authorized testing, master reconnaissance, scanning, and enumeration, analyze vulnerabilities, understand exploitation and web application attacks, and finish with a guided, defensive-focused capstone lab that produces a professional report.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  16
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01200000-0000-4000-8000-000000000011', '01200000-0000-4000-8000-000000000001', 'Explain the ethical and legal boundaries of authorized testing and apply the security mindset.', 1),
  ('01200000-0000-4000-8000-000000000012', '01200000-0000-4000-8000-000000000001', 'Perform passive and active reconnaissance to map an authorized target.',                         2),
  ('01200000-0000-4000-8000-000000000013', '01200000-0000-4000-8000-000000000001', 'Scan networks, identify services, and enumerate systems for weaknesses.',                      3),
  ('01200000-0000-4000-8000-000000000014', '01200000-0000-4000-8000-000000000001', 'Assess web application weaknesses and understand core exploitation and defense concepts.',      4),
  ('01200000-0000-4000-8000-000000000015', '01200000-0000-4000-8000-000000000001', 'Produce a professional findings report and run a guided capstone engagement in an isolated lab.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01200000-0000-4000-8000-000000000101', '01200000-0000-4000-8000-000000000001', 1, 'Foundations & Ethics',    'Adopt the security mindset, core concepts, ethics, law, and engagement scope.',             'PUBLISHED'),
  ('01200000-0000-4000-8000-000000000102', '01200000-0000-4000-8000-000000000001', 2, 'Reconnaissance',          'Gather intelligence with passive OSINT and active footprinting.',                          'PUBLISHED'),
  ('01200000-0000-4000-8000-000000000103', '01200000-0000-4000-8000-000000000001', 3, 'Scanning & Enumeration',  'Discover hosts and services, then enumerate systems for weaknesses.',                      'PUBLISHED'),
  ('01200000-0000-4000-8000-000000000104', '01200000-0000-4000-8000-000000000001', 4, 'Exploitation & Web',      'Understand exploitation basics, password attacks, and web application security.',          'PUBLISHED'),
  ('01200000-0000-4000-8000-000000000105', '01200000-0000-4000-8000-000000000001', 5, 'Reporting & Capstone',    'Report findings, plan remediation, and run a guided lab assessment.',                     'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01200000-0000-4000-8000-000000000201', '01200000-0000-4000-8000-000000000101', 1, 'Security Mindset & Core Concepts',     'Think like an adversary and know your foundations.',      'PUBLISHED'),
  ('01200000-0000-4000-8000-000000000202', '01200000-0000-4000-8000-000000000101', 2, 'Ethics, Law & Engagement Scope',       'Stay legal and in scope while testing.',                  'PUBLISHED'),
  ('01200000-0000-4000-8000-000000000203', '01200000-0000-4000-8000-000000000102', 1, 'Passive Reconnaissance & OSINT',      'Collect public intel without touching the target.',       'PUBLISHED'),
  ('01200000-0000-4000-8000-000000000204', '01200000-0000-4000-8000-000000000102', 2, 'Active Reconnaissance & Footprinting','Engage the target to establish a footprint.',            'PUBLISHED'),
  ('01200000-0000-4000-8000-000000000205', '01200000-0000-4000-8000-000000000103', 1, 'Network Scanning & Service Discovery','Find live hosts, ports, and running services.',          'PUBLISHED'),
  ('01200000-0000-4000-8000-000000000206', '01200000-0000-4000-8000-000000000103', 2, 'Enumeration & Vulnerability Analysis','Extract details and triage weaknesses.',                 'PUBLISHED'),
  ('01200000-0000-4000-8000-000000000207', '01200000-0000-4000-8000-000000000104', 1, 'Exploitation & Attack Basics',        'Learn how attacks work so you can defend them.',          'PUBLISHED'),
  ('01200000-0000-4000-8000-000000000208', '01200000-0000-4000-8000-000000000104', 2, 'Web Application Attacks & Mitigations','Assess and defend web applications.',                    'PUBLISHED'),
  ('01200000-0000-4000-8000-000000000209', '01200000-0000-4000-8000-000000000105', 1, 'Reporting & Remediation',             'Turn findings into actionable security fixes.',           'PUBLISHED'),
  ('01200000-0000-4000-8000-000000000210', '01200000-0000-4000-8000-000000000105', 2, 'Capstone Assessment Lab',             'Run a complete guided engagement in an isolated lab.',    'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01200000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01200000-0000-4000-8000-000000000301', '01200000-0000-4000-8000-000000000201', 1, 'The Ethical Hacking Mindset',          'Build the problem-solving mindset security professionals use every day.',       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01200000-0000-4000-8000-000000000302', '01200000-0000-4000-8000-000000000201', 2, 'Core Security Concepts',                'Understand the CIA triad, attack surfaces, and the kill chain.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000303', '01200000-0000-4000-8000-000000000201', 3, 'Foundations Quiz',                      'Check your grasp of security fundamentals.',                                     'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01200000-0000-4000-8000-000000000304', '01200000-0000-4000-8000-000000000202', 1, 'Ethics, Laws & Frameworks',             'Learn the legal boundaries and frameworks that govern authorized testing.',      'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000305', '01200000-0000-4000-8000-000000000202', 2, 'Engagement Scope & Rules of Engagement','Define scope, rules of engagement, and the authorization chain.',               'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10,  8),
  ('01200000-0000-4000-8000-000000000306', '01200000-0000-4000-8000-000000000202', 3, 'Legal & Scope Quiz',                    'Verify you understand what is and is not authorized.',                           'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01200000-0000-4000-8000-000000000307', '01200000-0000-4000-8000-000000000203', 1, 'Passive Reconnaissance & OSINT',        'Collect public information without touching the target.',                        'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000308', '01200000-0000-4000-8000-000000000203', 2, 'OSINT Tools & Techniques',              'Use search, certificate logs, and archives to map an organization.',             'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000309', '01200000-0000-4000-8000-000000000203', 3, 'Passive Recon Quiz',                    'Test your OSINT and passive reconnaissance knowledge.',                          'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01200000-0000-4000-8000-000000000310', '01200000-0000-4000-8000-000000000204', 1, 'Active Reconnaissance & Footprinting',  'Engage the target directly to build a footprint.',                               'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000311', '01200000-0000-4000-8000-000000000204', 2, 'DNS, WHOIS & Web Footprinting',         'Extract infrastructure details from DNS and registration records.',              'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000312', '01200000-0000-4000-8000-000000000204', 3, 'Active Recon Quiz',                     'Check your footprinting skills.',                                                'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01200000-0000-4000-8000-000000000313', '01200000-0000-4000-8000-000000000205', 1, 'Network Scanning Fundamentals',         'Discover live hosts and open ports responsibly.',                                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000314', '01200000-0000-4000-8000-000000000205', 2, 'Service Discovery & Version Detection', 'Identify running services and their versions with nmap.',                        'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000315', '01200000-0000-4000-8000-000000000205', 3, 'Scanning Quiz',                         'Verify your scanning approach.',                                                 'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01200000-0000-4000-8000-000000000316', '01200000-0000-4000-8000-000000000206', 1, 'Enumeration: SMB, HTTP & More',         'Pull user accounts, shares, and web details from open services.',                'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000317', '01200000-0000-4000-8000-000000000206', 2, 'Vulnerability Analysis',                'Triage findings, map them to CVE and CWE, and score risk.',                      'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000318', '01200000-0000-4000-8000-000000000206', 3, 'Enumeration & Vulnerabilities Quiz',    'Check your enumeration and vulnerability analysis skills.',                      'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01200000-0000-4000-8000-000000000319', '01200000-0000-4000-8000-000000000207', 1, 'Exploitation Basics & Mitigations',     'Understand how attacks chain and how defenses stop them.',                       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000320', '01200000-0000-4000-8000-000000000207', 2, 'Password Attacks & Credential Hygiene', 'Assess password strength and defend against credential attacks.',                 'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000321', '01200000-0000-4000-8000-000000000207', 3, 'Exploitation Quiz',                     'Test your exploitation and credential security knowledge.',                       'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01200000-0000-4000-8000-000000000322', '01200000-0000-4000-8000-000000000208', 1, 'Web Application Attacks',               'Explore XSS, injection, and broken access control in a lab.',                     'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('01200000-0000-4000-8000-000000000323', '01200000-0000-4000-8000-000000000208', 2, 'Web App Defense in Depth',              'Apply input validation, CSP, and least privilege.',                              'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000324', '01200000-0000-4000-8000-000000000208', 3, 'Web Attacks Quiz',                      'Verify your web security knowledge.',                                            'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 15,  5),
  ('01200000-0000-4000-8000-000000000325', '01200000-0000-4000-8000-000000000209', 1, 'Reporting & Remediation',               'Write clear findings, score severity, and guide fixes.',                         'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000326', '01200000-0000-4000-8000-000000000210', 1, 'Capstone Lab Setup',                    'Stand up an isolated lab and document its authorization.',                       'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 10),
  ('01200000-0000-4000-8000-000000000327', '01200000-0000-4000-8000-000000000210', 2, 'Running the Capstone Assessment',       'Plan, execute, document, and remediate a full engagement.',                      'TEXT',  'PUBLISHED', 'SUBSCRIPTION', 10, 12),
  ('01200000-0000-4000-8000-000000000328', '01200000-0000-4000-8000-000000000210', 3, 'Final Assessment',                      'Prove what you learned across the whole course.',                                'QUIZ',  'PUBLISHED', 'SUBSCRIPTION', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01200000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01200000-0000-4000-8000-000000000401',
  '01200000-0000-4000-8000-000000000301',
  1,
  'The Ethical Hacking Mindset',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The Ethical Hacking Mindset</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The Ethical Hacking Mindset</h1>
  <p>Ethical hackers break into systems for a living — with permission and a defensive goal. The craft is less about exotic tools and more about a <strong>methodical, curious, and skeptical mindset</strong> paired with discipline.</p>
  <h2>What makes hacking ethical?</h2>
  <ul>
    <li><strong>Authorization</strong> — written permission from the asset owner.</li>
    <li><strong>Scope</strong> — an agreed, bounded set of targets.</li>
    <li><strong>Defensive purpose</strong> — findings harden the system instead of harming it.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Golden rule</strong>
    <p>Only ever test systems you own or that you are explicitly authorized to test. Outside that boundary the same skills are simply illegal access.</p>
  </div>
  <h2>The security testing playbook</h2>
  <p>Professional engagements follow a repeatable methodology:</p>
  <table>
    <tr><th>Phase</th><th>Goal</th></tr>
    <tr><td>Pre-engagement</td><td>Scope, rules of engagement, and authorization</td></tr>
    <tr><td>Reconnaissance</td><td>Gather intelligence about the target</td></tr>
    <tr><td>Scanning and enumeration</td><td>Discover hosts, ports, services, and details</td></tr>
    <tr><td>Vulnerability analysis</td><td>Confirm and triage weaknesses</td></tr>
    <tr><td>Exploitation</td><td>Prove impact in an approved lab context</td></tr>
    <tr><td>Reporting</td><td>Deliver findings, evidence, and remediation</td></tr>
  </table>
  <h2>Thinking like an adversary</h2>
  <ul>
    <li>Treat <span class="ic">every input as untrusted</span> — forms, files, and headers.</li>
    <li>Assume compromise and verify: trust the logs, not the claim.</li>
    <li>Ask <span class="ic">what happens if I change this value?</span> before every click.</li>
  </ul>
  <p>Set an engagement flag before you touch anything:</p>
  <pre class="code-block"># Confirm the engagement flag before starting
echo "[+] Engagement : webvuln-lab"
echo "[+] Scope      : 10.10.50.0/24"
TARGET="10.10.50.20"
echo "[+] Focused target: $TARGET"</pre>
  <div class="callout callout-info">
    <strong>Course stance</strong>
    <p>This course is <strong>defensive-focused</strong>. Every technique is taught so you can find, fix, and articulate risk — never to harm a live system.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000402',
  '01200000-0000-4000-8000-000000000302',
  1,
  'Core Security Concepts',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Core Security Concepts</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Core Security Concepts</h1>
  <p>Every control you will ever assess exists to serve three goals, together called the <strong>CIA triad</strong>.</p>
  <table>
    <tr><th>Goal</th><th>Meaning</th><th>Example control</th></tr>
    <tr><td>Confidentiality</td><td>Only authorized parties can read it</td><td>Encryption, access control</td></tr>
    <tr><td>Integrity</td><td>Data is accurate and unaltered</td><td>Hashing, audit logs</td></tr>
    <tr><td>Availability</td><td>Systems are reachable when needed</td><td>Backups, load balancing</td></tr>
  </table>
  <h2>Authentication, authorization, accounting</h2>
  <p><span class="ic">AAA</span> is the backbone of accountability: prove identity (authentication), grant the right permissions (authorization), and record the action (accounting). Without the last one, incidents cannot be reconstructed.</p>
  <h2>Attack surface and attack vectors</h2>
  <p>The <strong>attack surface</strong> is everything an attacker can reach — open ports, web forms, APIs, email. A <strong>vector</strong> is a specific path across that surface. Reducing the surface is the cheapest security you will buy.</p>
  <h2>The kill chain and ATT&amp;CK</h2>
  <p>The Lockheed Martin <span class="ic">Cyber Kill Chain</span> models intrusion as stages, while <span class="ic">MITRE ATT&amp;CK</span> catalogs the real techniques adversaries use. Both help defenders ask which stage they can see and stop.</p>
  <table>
    <tr><th>Stage</th><th>Defensive question</th></tr>
    <tr><td>Reconnaissance</td><td>What public data leaks about us?</td></tr>
    <tr><td>Delivery / exploitation</td><td>Are patches current and inputs validated?</td></tr>
    <tr><td>Installation</td><td>Can we detect persistence?</td></tr>
    <tr><td>Command and control</td><td>Do we log suspicious egress?</td></tr>
    <tr><td>Actions on objectives</td><td>Is data access limited and audited?</td></tr>
  </table>
  <h2>Risk, simply</h2>
  <p>Risk = <span class="ic">likelihood x impact</span>. The CVSS score gives a standardized severity; a finding only matters when it is real, reachable, and relevant to the business.</p>
  <pre class="code-block"># Integrity check: a file that changed yields a new hash
$ sha256sum report-template.pdf
b1946ac92492d2347c6235b4d2611184  report-template.pdf</pre>
  <div class="callout">
    <strong>Controls</strong>
    <p>Preventive controls stop an event (firewall, patch). Detective controls notice it (IDS, monitoring). Corrective controls restore operations (backup restore). Mature defenses use all three.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000404',
  '01200000-0000-4000-8000-000000000304',
  1,
  'Ethics, Laws & Frameworks',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ethics, Laws &amp; Frameworks</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Ethics, Laws &amp; Frameworks</h1>
  <p>Permission is the single line that separates a professional assessment from a crime. Laws and frameworks exist to keep that line bright.</p>
  <h2>Legal context</h2>
  <p>Cybersecurity law is national and evolving. Know the reference points and always defer to your organization's counsel:</p>
  <table>
    <tr><th>Instrument</th><th>Scope</th></tr>
    <tr><td>CFAA (US)</td><td>Unauthorized access to protected computers</td></tr>
    <tr><td>GDPR / data protection law</td><td>Handling of personal and special-category data</td></tr>
    <tr><td>Contract and IP law</td><td>Terms of service and intellectual property</td></tr>
  </table>
  <div class="callout">
    <strong>Nothing beats written authorization</strong>
    <p>A signed statement of work plus rules of engagement is your legal shield. Verbal approval is not approval.</p>
  </div>
  <h2>Standards you should know</h2>
  <table>
    <tr><th>Framework</th><th>Use</th></tr>
    <tr><td>NIST SP 800-115</td><td>The technical guide to security assessments</td></tr>
    <tr><td>PTES</td><td>Standard penetration testing execution phases</td></tr>
    <tr><td>OWASP WSTG</td><td>Web application testing methodology</td></tr>
    <tr><td>MITRE ATT&amp;CK</td><td>Adversary behavior catalog for detection</td></tr>
  </table>
  <h2>Handling what you learn</h2>
  <ul>
    <li>Keep evidence <strong>inside the engagement</strong> — no downloads beyond scope.</li>
    <li>Encrypt findings at rest and transfer them over authorized channels.</li>
    <li>Permanently destroy captured data when the agreement says so.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>When in doubt</strong>
    <p>If you are not sure an action is authorized, treat it as forbidden and ask the point of contact first.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000405',
  '01200000-0000-4000-8000-000000000305',
  1,
  'Engagement Scope & Rules of Engagement',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Engagement Scope &amp; Rules of Engagement</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Engagement Scope &amp; Rules of Engagement</h1>
  <p>The rules of engagement (<span class="ic">ROE</span>) turn a vague goal into a precise contract of what, when, how, and who covers a test.</p>
  <h2>Define the scope</h2>
  <table>
    <tr><th>Element</th><th>Example</th></tr>
    <tr><td>In-scope networks</td><td>10.10.50.0/24</td></tr>
    <tr><td>In-scope applications</td><td>app.example.com</td></tr>
    <tr><td>Out of scope</td><td>database.example.com, partner systems</td></tr>
    <tr><td>Excluded user data</td><td>Production customer records</td></tr>
  </table>
  <p>Write it down. Ambiguity is where engagements fail.</p>
  <h2>Schedule and coordination</h2>
  <ul>
    <li>Allow windows for working hours, maintenance, and quiet scan times.</li>
    <li>Name a point of contact and an escalation path for emergencies.</li>
    <li>Agree how critical findings are communicated (call or ticket).</li>
  </ul>
  <h2>Stop conditions</h2>
  <p>Predefine when testing stops: any customer-data exposure, service outage, or system discovered outside scope. <span class="ic">Stopping is a success criterion</span>, not a failure.</p>
  <pre class="code-block">--- Rules of Engagement ---
Scope            : 10.10.50.0/24, app.example.com
Authorized tester: Elena (elena@example.org)
Window           : 2026-10-01 to 2026-10-31, 09:00-18:00
Allowed activity : HTTP(S), SSH, SMB, standard scanning
Out of scope     : database.example.com, customer data
Stop on          : data exposure, system outage, hosts outside scope</pre>
  <div class="callout callout-info">
    <strong>Scope is the floor</strong>
    <p>If you can pivot past a boundary, report it — do not traverse it. Expanding scope is the client's decision, made in writing.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000407',
  '01200000-0000-4000-8000-000000000307',
  1,
  'Passive Reconnaissance & OSINT',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Passive Reconnaissance &amp; OSINT</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Passive Reconnaissance &amp; OSINT</h1>
  <p><strong>Passive reconnaissance</strong> gathers intelligence without sending a single packet to the target. That keeps it low-risk and legal, and it is the most productive hour of any engagement.</p>
  <h2>What open-source intelligence reveals</h2>
  <ul>
    <li>Organization structure, roles, and job titles.</li>
    <li>Technology stack from job postings and product pages.</li>
    <li>Domains and subdomains from certificate and DNS records.</li>
    <li>Breached credential exposure from public databases.</li>
  </ul>
  <h2>High-value public sources</h2>
  <table>
    <tr><th>Source</th><th>Typical finding</th></tr>
    <tr><td>Search engines</td><td>Indexed pages, files, exposed docs</td></tr>
    <tr><td>Certificate transparency</td><td>Subdomains for every issued certificate</td></tr>
    <tr><td>Public archives</td><td>Historic site snapshots and leaks</td></tr>
    <tr><td>Job boards</td><td>Software and stack inventory</td></tr>
    <tr><td>GitHub</td><td>Accidentally committed code and keys</td></tr>
  </table>
  <h2>Confirm without touching</h2>
  <p>Use public DNS to sanity-check a target before active steps:</p>
  <pre class="code-block">dig +short A example.com
dig +short MX example.com
dig +short TXT example.com</pre>
  <div class="callout">
    <strong>Passive is not permission-free</strong>
    <p>Correlating data about people must respect privacy law. Keep notes minimal and store raw personal data only when the engagement requires it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Feed the report</strong>
    <p>Every scrap of public information later becomes context in your report: scope validation, tech inventory, and exposure findings.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000408',
  '01200000-0000-4000-8000-000000000308',
  1,
  'OSINT Tools & Techniques',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OSINT Tools &amp; Techniques</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>OSINT Tools &amp; Techniques</h1>
  <p>You can run most OSINT from a browser. Knowing which search operator returns what is the real tool.</p>
  <h2>Search operator patterns</h2>
  <table>
    <tr><th>Query</th><th>Use</th></tr>
    <tr><td>site:example.com</td><td>Indexed pages on that domain</td></tr>
    <tr><td>filetype:pdf site:example.com</td><td>Public documents and reports</td></tr>
    <tr><td>inurl:admin</td><td>Admin paths anywhere</td></tr>
    <tr><td>"exact phrase"</td><td>Forum posts and staff comments</td></tr>
  </table>
  <h2>Certificate transparency</h2>
  <p>Every public TLS certificate is logged. Query the logs and you can find subdomains that were never linked anywhere:</p>
  <pre class="code-block"># Query certificate transparency logs (crt.sh)
theHarvester -d example.com -b crtsh -l 200</pre>
  <p>Cross-check with other collections and an internet-of-things search engine to map exposed infrastructure and default portals.</p>
  <h2>Think about the endpoint</h2>
  <ul>
    <li>Collect only what is public and relevant.</li>
    <li>Triple-check that discovered hosts fall inside scope.</li>
    <li>Record source, timestamp, and URL for the evidence trail.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Freshness matters</strong>
    <p>OSINT ages. A certificate from last year may describe infrastructure that is gone; always confirm with current sources at the start of active testing.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Deduplicate</strong>
    <p>Merge findings from multiple sources into one asset list. Duplicates hide real gaps and bloat the final report.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000410',
  '01200000-0000-4000-8000-000000000310',
  1,
  'Active Reconnaissance & Footprinting',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Active Reconnaissance &amp; Footprinting</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Active Reconnaissance &amp; Footprinting</h1>
  <p><strong>Active reconnaissance</strong> sends traffic to the target, so it requires authorization and respect for the ROE window.</p>
  <h2>Footprinting activities</h2>
  <table>
    <tr><th>Activity</th><th>What it yields</th></tr>
    <tr><td>Ping sweep</td><td>Which in-scope hosts respond</td></tr>
    <tr><td>TCP connects</td><td>Open ports and service behavior</td></tr>
    <tr><td>HTTP requests</td><td>Headers, technologies, web framework</td></tr>
    <tr><td>Trace route</td><td>Network path and hops</td></tr>
  </table>
  <pre class="code-block"># Only against in-scope hosts, inside the approved window
ping -c 3 10.10.50.20
traceroute 10.10.50.20
curl -I https://app.example.com</pre>
  <h2>Record everything</h2>
  <ul>
    <li>Host, IP, port, and the banner returned.</li>
    <li>HTTP headers and response codes for web assets.</li>
    <li>Timestamp and the exact command used.</li>
  </ul>
  <div class="callout">
    <strong>You are being logged</strong>
    <p>Defenders and cloud providers log your probes. Work within the window, at agreed rates, and you stay transparent and professional.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Evidence-first mindset</strong>
    <p>The notes you take now become the appendix of your report. A finding without reproducible evidence is a rumor.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000411',
  '01200000-0000-4000-8000-000000000311',
  1,
  'DNS, WHOIS & Web Footprinting',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>DNS, WHOIS &amp; Web Footprinting</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>DNS, WHOIS &amp; Web Footprinting</h1>
  <p>DNS is a map of the target's infrastructure. Reading it well reveals subnets, mail, and services.</p>
  <h2>Records worth reading</h2>
  <table>
    <tr><th>Record</th><th>Reveals</th></tr>
    <tr><td>A / AAAA</td><td>Host IP addresses (v4 / v6)</td></tr>
    <tr><td>MX</td><td>Mail servers</td></tr>
    <tr><td>NS</td><td>Authoritative name servers</td></tr>
    <tr><td>CNAME</td><td>Aliases and hosting providers</td></tr>
    <tr><td>TXT</td><td>SPF, DKIM, domain verification</td></tr>
  </table>
  <pre class="code-block">dig A example.com +short
dig MX example.com +short
dig TXT example.com +short</pre>
  <h2>Registration data</h2>
  <p>WHOIS exposes registrar and expiry data, sometimes historic contacts. Treat contact details as personal data — note what you need, never pilfer lists.</p>
  <h2>Web fingerprinting</h2>
  <ul>
    <li><span class="ic">robots.txt</span> hints at paths the site prefers hidden.</li>
    <li>Response headers name servers, caching, and security middleware.</li>
    <li>Technology analyzers and page source reveal frameworks and versions.</li>
  </ul>
  <div class="callout callout-info">
    <strong>robots.txt is not security</strong>
    <p>It is etiquette for crawlers. If content is sensitive, it should not exist at that URL at all.</p>
  </div>
  <div class="callout">
    <strong>Scope your reads</strong>
    <p>Documentation, admin paths, or data you discover while footprinting must still stay inside the agreed scope before anything is opened.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000413',
  '01200000-0000-4000-8000-000000000313',
  1,
  'Network Scanning Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Network Scanning Fundamentals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Network Scanning Fundamentals</h1>
  <p>Scanning turns a footprint into an inventory of <strong>live hosts and open ports</strong>. Every probe touches the network, so scanning belongs on the authorization form.</p>
  <h2>Port states</h2>
  <table>
    <tr><th>State</th><th>Meaning</th></tr>
    <tr><td>open</td><td>A service is accepting connections</td></tr>
    <tr><td>closed</td><td>The host is reachable but nothing listens</td></tr>
    <tr><td>filtered</td><td>A firewall is blocking or dropping the probe</td></tr>
  </table>
  <h2>Host discovery first</h2>
  <pre class="code-block">nmap -sn 10.10.50.0/24</pre>
  <h2>Common scan types</h2>
  <table>
    <tr><th>Scan</th><th>Notes</th></tr>
    <tr><td>TCP connect (-sT)</td><td>Completes the handshake; needs no privilege</td></tr>
    <tr><td>SYN scan (-sS)</td><td>Half-open probe; can trip detection</td></tr>
    <tr><td>UDP scan (-sU)</td><td>Slow, noisy, often filtered</td></tr>
    <tr><td>ICMP (ping)</td><td>Host discovery only</td></tr>
  </table>
  <div class="callout">
    <strong>Scan type is a business decision</strong>
    <p>Some ROE documents restrict half-open scans. Agree on the technique set and the rate before you run anything.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Be a good neighbor</strong>
    <p>Use a target list, a modest timing template, and stop when the job is proven. Discovery beats brute volume.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000414',
  '01200000-0000-4000-8000-000000000314',
  1,
  'Service Discovery & Version Detection',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Service Discovery &amp; Version Detection</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Service Discovery &amp; Version Detection</h1>
  <p>An open port is only a number until you know the service and version behind it.</p>
  <h2>Version detection</h2>
  <pre class="code-block">nmap -sV -p 80,443,22 10.10.50.20</pre>
  <p>Version detection probes the service banner and matches responses against a fingerprint database. Add script breadth with <span class="ic">-A</span> when the ROE allows.</p>
  <h2>Why versions matter</h2>
  <p>Versions map to known weaknesses. An outdated server is often the difference between a curiosity and a lever:</p>
  <table>
    <tr><th>Service</th><th>Typical risk signal</th></tr>
    <tr><td>Apache / NGINX</td><td>End-of-life versions with public exploits</td></tr>
    <tr><td>OpenSSH</td><td>Old ciphers and known CVEs</td></tr>
    <tr><td>Database ports</td><td>Exposed admin and default accounts</td></tr>
    <tr><td>Custom web apps</td><td>Versioned JS bundles and debug paths</td></tr>
  </table>
  <h2>Banner grabbing</h2>
  <pre class="code-block">nc -vn 10.10.50.20 80
# returns the HTTP-server banner for analysis</pre>
  <div class="callout callout-tip">
    <strong>Save your work</strong>
    <p>Write every scan to a file (<span class="ic">-oA</span> in nmap) so the report can reproduce the exact evidence.</p>
  </div>
  <div class="callout callout-info">
    <strong>Not everything is a finding</strong>
    <p>A version alone is not a vulnerability. Pair it with reachability, use, and an actual public weakness before it earns report space.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000416',
  '01200000-0000-4000-8000-000000000316',
  1,
  'Enumeration: SMB, HTTP & More',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Enumeration: SMB, HTTP &amp; More</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Enumeration: SMB, HTTP &amp; More</h1>
  <p>Enumeration is where a scan becomes an attack surface: you extract <strong>names, shares, accounts, and paths</strong> a scanner never shows.</p>
  <h2>File sharing (SMB)</h2>
  <pre class="code-block">smbclient -L //10.10.50.20 -N</pre>
  <p>Anonymous share listings can reveal writable folders and usernames. Respect what the ROE allows and log what you view.</p>
  <h2>Web enumeration</h2>
  <pre class="code-block">gobuster dir -u http://10.10.50.20 -w /usr/share/wordlists/dirb/common.txt</pre>
  <h2>What you are really hunting</h2>
  <table>
    <tr><th>Service</th><th>Technique</th><th>Information gained</th></tr>
    <tr><td>SMB</td><td>Share and user enumeration</td><td>Writable shares, accounts</td></tr>
    <tr><td>HTTP</td><td>Directory and file brute force</td><td>Admin paths, backups, debug endpoints</td></tr>
    <tr><td>SNMP</td><td>Community-string walk</td><td>System info, interfaces, routes</td></tr>
    <tr><td>Databases</td><td>Metadata queries</td><td>Schema hints, credentials in comments</td></tr>
  </table>
  <div class="callout">
    <strong>Stay inside the map</strong>
    <p>Brute-forcing folders or credentials is loud and scope-sensitive. Confirm the technique is allowed and rate-limit aggressively.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000417',
  '01200000-0000-4000-8000-000000000317',
  1,
  'Vulnerability Analysis',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Vulnerability Analysis</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Vulnerability Analysis</h1>
  <p>Scan output is data; vulnerability analysis is the part that thinks. A finding is a <strong>confirmed, reachable weakness</strong> with context.</p>
  <h2>From raw to triaged</h2>
  <ul>
    <li><strong>Confirm</strong> — reproduce it, do not trust a scanner name.</li>
    <li><strong>Contextualize</strong> — is it exposed? is it patched elsewhere?</li>
    <li><strong>Deduplicate</strong> — collapse the same issue into one finding.</li>
  </ul>
  <h2>Know the identifiers</h2>
  <p><span class="ic">CVE</span> is the public identifier for a known vulnerability. <span class="ic">CWE</span> is the class of weakness the bug belongs to. Cite both in the report.</p>
  <h2>Severity scoring</h2>
  <p>The <span class="ic">CVSS</span> framework scores from 0 to 10 using exploitability and impact, then adjusts for context. A plain score is not the same as business risk.</p>
  <pre class="code-block"># Lab only — map a service version to public weaknesses
searchsploit apache 2.4.49</pre>
  <h2>Priority table</h2>
  <table>
    <tr><th>Finding</th><th>Priority</th></tr>
    <tr><td>Internet-reachable RCE</td><td>Critical</td></tr>
    <tr><td>Authenticated IDOR</td><td>High</td></tr>
    <tr><td>Missing security headers</td><td>Low / informative</td></tr>
  </table>
  <div class="callout">
    <strong>False positives are normal</strong>
    <p>Scanners misfire. A good analyst can say no with evidence as often as yes.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Reproduce first</strong>
    <p>A weakness you cannot reproduce is a suspicion. Reproduce it in the lab or a sandboxed copy before it goes into the report.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000419',
  '01200000-0000-4000-8000-000000000319',
  1,
  'Exploitation Basics & Mitigations',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Exploitation Basics &amp; Mitigations</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Exploitation Basics &amp; Mitigations</h1>
  <p>Exploitation proves that a weakness has <strong>actual impact</strong>. In this course it happens only in your lab, against deliberately vulnerable targets.</p>
  <h2>The shape of an attack</h2>
  <ul>
    <li><strong>Trigger</strong> — the input that reaches the flaw.</li>
    <li><strong>Payload</strong> — the effect the attacker wants.</li>
    <li><strong>Channel</strong> — how the effect is delivered back.</li>
  </ul>
  <h2>Modern mitigations</h2>
  <table>
    <tr><th>Mitigation</th><th>What it blocks</th></tr>
    <tr><td>ASLR</td><td>Predictable memory addresses</td></tr>
    <tr><td>NX / DEP</td><td>Execution from data memory</td></tr>
    <tr><td>Stack canaries</td><td>Silent buffer overwrites</td></tr>
    <tr><td>Code signing</td><td>Untrusted binaries and libraries</td></tr>
  </table>
  <h2>Weakness classes you will meet</h2>
  <table>
    <tr><th>Class</th><th>Defense</th></tr>
    <tr><td>Injection</td><td>Parameterized queries, allow-lists</td></tr>
    <tr><td>XSS</td><td>Output encoding, CSP</td></tr>
    <tr><td>Command injection</td><td>No shell for user input</td></tr>
    <tr><td>Misconfiguration</td><td>Baselines, hardening guides</td></tr>
  </table>
  <pre class="code-block"># Lab-only note: this course demonstrates concepts so you can defend them.
# Exploitation belongs in isolated, intentionally vulnerable labs.</pre>
  <div class="callout">
    <strong>Skill does not grant scope</strong>
    <p>Proving you could is only allowed against systems you own or that were explicitly authorized. It is the report that makes the step worthwhile.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Defense first</strong>
    <p>Every attack you study should end with the control that defeats it: patch, least privilege, segmentation, and detection.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000420',
  '01200000-0000-4000-8000-000000000320',
  1,
  'Password Attacks & Credential Hygiene',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Password Attacks &amp; Credential Hygiene</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Password Attacks &amp; Credential Hygiene</h1>
  <p>Credentials are the most-attacked control in the industry. Understanding how they fail teaches you how to harden them.</p>
  <h2>How credentials are attacked</h2>
  <table>
    <tr><th>Attack</th><th>Mechanism</th></tr>
    <tr><td>Brute force</td><td>Try every candidate until one fits</td></tr>
    <tr><td>Dictionary</td><td>Common words and list variants</td></tr>
    <tr><td>Credential stuffing</td><td>Reuse of stolen pairs from other sites</td></tr>
    <tr><td>Phishing</td><td>Social engineering that harvests the secret</td></tr>
  </table>
  <h2>Assess only authorized targets</h2>
  <pre class="code-block"># Lab-only demonstration against an account you control
hydra -l admin -P rockyou.txt ssh://10.10.50.20</pre>
  <div class="callout">
    <strong>Never use real breach data against real people</strong>
    <p>Credential testing on accounts you do not control is illegal and harmful. Keep password attacks in the lab.</p>
  </div>
  <h2>Defenses that actually work</h2>
  <ul>
    <li><strong>Multi-factor authentication</strong> — a stolen password is useless alone.</li>
    <li><strong>Password managers</strong> — encourage unique, long entries per site.</li>
    <li><strong>Lockout and rate limiting</strong> — slow brute force to a crawl.</li>
    <li><strong>Monitoring</strong> — flag unusual logins, roles, and directories.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Length beats complexity</strong>
    <p>A long passphrase is easier to remember than a chaotic snippet and far harder to guess. Cap reuse, not creativity.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000422',
  '01200000-0000-4000-8000-000000000322',
  1,
  'Web Application Attacks',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Web Application Attacks</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Web Application Attacks</h1>
  <p>Web applications are the largest attack surface most organizations expose. The <span class="ic">OWASP Top 10</span> is the starting map.</p>
  <h2>The current top categories</h2>
  <table>
    <tr><th>Position</th><th>Category</th></tr>
    <tr><td>A01</td><td>Broken access control</td></tr>
    <tr><td>A02</td><td>Cryptographic failures</td></tr>
    <tr><td>A03</td><td>Injection</td></tr>
    <tr><td>A07</td><td>Identification and authentication failures</td></tr>
    <tr><td>A10</td><td>Server-side request forgery</td></tr>
  </table>
  <h2>Cross-site scripting (XSS)</h2>
  <p>When user input is returned as markup, a crafted payload runs in other users' browsers:</p>
  <pre class="code-block">&lt;script&gt;alert(1)&lt;/script&gt;   &lt;!-- lab payload; apps must output-encode all user data --&gt;</pre>
  <h2>SQL injection</h2>
  <p>When user input becomes part of a query, the query itself can change:</p>
  <pre class="code-block">-- Fragile: input is spliced into the statement (lab example only)
SELECT * FROM accounts WHERE username = '' OR '1'='1';

-- Safer pattern: parameters keep data separate from code
-- the database never treats input as SQL</pre>
  <h2>CSRF and SSRF</h2>
  <ul>
    <li><span class="ic">CSRF</span> tricks an authenticated session into an unintended action.</li>
    <li><span class="ic">SSRF</span> makes the server fetch attacker-chosen URLs.</li>
  </ul>
  <div class="callout">
    <strong>Lab-only by default</strong>
    <p>Attack only the deliberately vulnerable application in your lab. Production web testing belongs to a scoped engagement with written approval.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000423',
  '01200000-0000-4000-8000-000000000323',
  1,
  'Web App Defense in Depth',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Web App Defense in Depth</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Web App Defense in Depth</h1>
  <p>Defense in depth layers independent controls so no single failure is fatal.</p>
  <h2>Layer 1: validation and encoding</h2>
  <ul>
    <li><strong>Input validation</strong> — reject or normalize at the boundary.</li>
    <li><strong>Output encoding</strong> — render user data as text, never markup.</li>
  </ul>
  <h2>Layer 2: response hardening</h2>
  <pre class="code-block">Content-Security-Policy: default-src 'self'
Set-Cookie: session=...; HttpOnly; Secure; SameSite=Lax</pre>
  <ul>
    <li><span class="ic">HttpOnly</span> keeps the session away from script.</li>
    <li><span class="ic">SameSite</span> and CSRF tokens blunt cross-site requests.</li>
  </ul>
  <h2>Layer 3: access and audit</h2>
  <ul>
    <li>Least privilege for every account and API token.</li>
    <li>Logs that record who, what, when, and from where.</li>
  </ul>
  <h2>Measure your posture</h2>
  <table>
    <tr><th>Class</th><th>Goal</th></tr>
    <tr><td>SAST</td><td>Static code analysis running in CI</td></tr>
    <tr><td>DAST</td><td>Scan the running application</td></tr>
    <tr><td>Dependency checks</td><td>Flag known CVEs in libraries</td></tr>
    <tr><td>ASVS controls</td><td>Verify against a requirements list</td></tr>
  </table>
  <div class="callout">
    <strong>Layers must be independent</strong>
    <p>If every layer is the same framework, they fail together. Redundancy only counts when the controls differ.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000425',
  '01200000-0000-4000-8000-000000000325',
  1,
  'Reporting & Remediation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reporting &amp; Remediation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Reporting &amp; Remediation</h1>
  <p>The report is the product. Testing without a clear report is an audit without a conclusion.</p>
  <h2>Anatomy of a finding</h2>
  <table>
    <tr><th>Section</th><th>Content</th></tr>
    <tr><td>Title</td><td>One accurate, specific line</td></tr>
    <tr><td>Severity</td><td>CVSS plus business context</td></tr>
    <tr><td>Description</td><td>Why it matters, in plain language</td></tr>
    <tr><td>Reproduction</td><td>Exact steps and tool output</td></tr>
    <tr><td>Impact</td><td>What an attacker gains</td></tr>
    <tr><td>Remediation</td><td>Concrete steps, in priority order</td></tr>
  </table>
  <h2>Sample finding</h2>
  <pre class="code-block">[High] SQL injection in the search endpoint (CWE-89, CVSS 8.1)
Reproduction:
  1. GET /search?q=test — note the echoed filter
  2. Submit a single quote in q and observe the error
Impact:
  Database read access, accounts table at risk
Remediation:
  1. Replace string-built queries with prepared statements
  2. Add a WAF rule as defense in depth, not the fix
  3. Rotate any secrets the data path touches</pre>
  <h2>Structure of a good report</h2>
  <ol>
    <li>Executive summary with the one-page business story.</li>
    <li>Methodology and scope recap.</li>
    <li>Prioritized findings with evidence.</li>
    <li>Appendix: raw outputs, tools, and glossary.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Two audiences</strong>
    <p>An executive needs risk in business terms; the engineer needs steps. Write for both, never at one.</p>
  </div>
  <div class="callout callout-info">
    <strong>Redact responsibly</strong>
    <p>Mask credentials, personal data, and anything beyond the need-to-know before the report leaves the secure channel.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000426',
  '01200000-0000-4000-8000-000000000326',
  1,
  'Capstone Lab Setup',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone Lab Setup</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone Lab Setup</h1>
  <p>You will now run the whole methodology against a target you own, in an <strong>isolated network</strong>.</p>
  <h2>Reference architecture</h2>
  <pre class="code-block">Lab network : 10.10.50.0/24, virtual NAT, no lab-to-internet routes
Attacker    : 10.10.50.1  Kali or similar (your workstation guest)
Target      : 10.10.50.10 deliberately vulnerable web app</pre>
  <h2>Checklist before you start</h2>
  <ul>
    <li>Target VM snapshotted before every test pass.</li>
    <li>Network verified isolated — <span class="ic">no corporate route</span>.</li>
    <li>One-page authorization note for the lab, dated and signed.</li>
  </ul>
  <pre class="code-block">ping -c 2 10.10.50.10
curl -I http://10.10.50.10</pre>
  <div class="callout">
    <strong>Isolation is non-negotiable</strong>
    <p>A lab exposed to your corporate network is itself a breach waiting to happen. Use a dedicated virtual network and keep snapshots separate.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Snapshot before and after</strong>
    <p>Cheap insurance: you can restore pristine state and rerun any experiment cleanly.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01200000-0000-4000-8000-000000000427',
  '01200000-0000-4000-8000-000000000327',
  1,
  'Running the Capstone Assessment',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Running the Capstone Assessment</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #10b981; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #047857; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #ecfdf5; color: #047857; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #d1fae5; border-left: 4px solid #10b981; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #dbeafe; border-left-color: #3b82f6; }
.lesson-page .callout-tip { background: #fef3c7; border-left-color: #f59e0b; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #ecfdf5; color: #047857; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #34d399; }
.dark .lesson-page h2 { color: #6ee7b7; }
.dark .lesson-page .ic { background: #022c22; color: #6ee7b7; }
.dark .lesson-page .callout { background: #022c22; border-left-color: #34d399; }
.dark .lesson-page .callout-info { background: #172554; border-left-color: #60a5fa; }
.dark .lesson-page .callout-tip { background: #451a03; border-left-color: #fbbf24; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #022c22; color: #6ee7b7; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Running the Capstone Assessment</h1>
  <p>Execute the engagement exactly as a professional would, at lab scale.</p>
  <h2>Plan the run</h2>
  <ol>
    <li>Write the scope note and pick your window.</li>
    <li>List tools and expected outputs per phase.</li>
    <li>Timebox each phase before you start.</li>
  </ol>
  <h2>Phase checklist</h2>
  <ul>
    <li><strong>Recon</strong> — passive notes, then footprint in scope.</li>
    <li><strong>Scan</strong> — hosts, ports, and versions; save with <span class="ic">-oA</span>.</li>
    <li><strong>Enumerate</strong> — shares, dirs, headers, and applications.</li>
    <li><strong>Analyze</strong> — map versions to CVE and CWE.</li>
    <li><strong>Exploit</strong> — only the lab app, inside your snapshots.</li>
    <li><strong>Report</strong> — findings, evidence, and remediation.</li>
  </ul>
  <pre class="code-block">nmap -sV -oA capstone_scan 10.10.50.10
# outputs: capstone_scan.nmap / .gnmap / .xml for the report</pre>
  <h2>Stay safe</h2>
  <ul>
    <li>Stop at any unexpected behavior and note it.</li>
    <li>Never upload lab data to public services.</li>
    <li>Destroy findings when the exercise is done.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Timebox everything</strong>
    <p>Great testers are planners. If a phase runs long, document why and move on — then cover the gap next pass.</p>
  </div>
  <div class="callout">
    <strong>Unexpected means stop</strong>
    <p>An anomaly in your own lab is a learning moment; log it calmly and continue by plan.</p>
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
  ('01200000-0000-4000-8000-000000000501', '01200000-0000-4000-8000-000000000303',
   'What separates ethical hacking from a cyberattack?',
   'Authorized testing with clear scope separates a professional engagement from a crime.', 1),
  ('01200000-0000-4000-8000-000000000502', '01200000-0000-4000-8000-000000000303',
   'Which component of the CIA triad protects data from unauthorized modification?',
   'Integrity ensures data is accurate and has not been tampered with.', 2),
  ('01200000-0000-4000-8000-000000000503', '01200000-0000-4000-8000-000000000303',
   'In the standard security testing methodology, what happens before reconnaissance?',
   'Pre-engagement activities such as scoping, rules of engagement, and authorization come first.', 3),
  ('01200000-0000-4000-8000-000000000504', '01200000-0000-4000-8000-000000000306',
   'What must exist before you test any system?',
   'A signed authorization, such as a rules of engagement document, is mandatory.', 1),
  ('01200000-0000-4000-8000-000000000505', '01200000-0000-4000-8000-000000000306',
   'During an engagement you find a new host that is not in the rules of engagement. What should you do?',
   'Stop testing that host, document the finding, and escalate it to the point of contact.', 2),
  ('01200000-0000-4000-8000-000000000506', '01200000-0000-4000-8000-000000000306',
   'Which resource documents the web application security testing methodology?',
   'The OWASP Web Security Testing Guide is the de facto methodology for web app testing.', 3),
  ('01200000-0000-4000-8000-000000000507', '01200000-0000-4000-8000-000000000309',
   'Which activity is strictly passive reconnaissance?',
   'Searching public certificate transparency logs reveals subdomains without contacting the target server.', 1),
  ('01200000-0000-4000-8000-000000000508', '01200000-0000-4000-8000-000000000309',
   'What does the search operator site:example.com return?',
   'It restricts results to pages indexed on that domain.', 2),
  ('01200000-0000-4000-8000-000000000509', '01200000-0000-4000-8000-000000000309',
   'Which public source commonly reveals subdomains from TLS certificates?',
   'Certificate transparency logs, queried via services like crt.sh, list every certificate issued for a domain.', 3),
  ('01200000-0000-4000-8000-000000000510', '01200000-0000-4000-8000-000000000312',
   'Which DNS record identifies the mail servers for a domain?',
   'The MX record points to the mail exchange hosts.', 1),
  ('01200000-0000-4000-8000-000000000511', '01200000-0000-4000-8000-000000000312',
   'What is an ICMP ping sweep used for in an engagement?',
   'It quickly reveals which hosts on an in-scope network are alive.', 2),
  ('01200000-0000-4000-8000-000000000512', '01200000-0000-4000-8000-000000000312',
   'Which of these is active reconnaissance?',
   'Sending an HTTP request to the target is direct interaction, which requires authorization.', 3),
  ('01200000-0000-4000-8000-000000000513', '01200000-0000-4000-8000-000000000315',
   'In nmap, what does an open port mean?',
   'The port is open when a remote system responds to a connection attempt, indicating an active service.', 1),
  ('01200000-0000-4000-8000-000000000514', '01200000-0000-4000-8000-000000000315',
   'Which nmap scan type completes the full TCP three-way handshake?',
   'The TCP connect scan (-sT) completes the handshake and works without special privileges.', 2),
  ('01200000-0000-4000-8000-000000000515', '01200000-0000-4000-8000-000000000315',
   'Why set a slower timing template on a production network?',
   'Lower scan rates reduce noise, load on target systems, and the chance of tripping detection.', 3),
  ('01200000-0000-4000-8000-000000000516', '01200000-0000-4000-8000-000000000318',
   'What can SMB enumeration reveal about a host?',
   'SMB enumeration can expose network shares and usernames, useful for later assessment.', 1),
  ('01200000-0000-4000-8000-000000000517', '01200000-0000-4000-8000-000000000318',
   'What is a CVE identifier?',
   'CVE is a public catalog of known vulnerabilities, each assigned a unique identifier.', 2),
  ('01200000-0000-4000-8000-000000000518', '01200000-0000-4000-8000-000000000318',
   'What is the CVSS score used for?',
   'CVSS rates the severity of a vulnerability on a standardized scale from 0 to 10.', 3),
  ('01200000-0000-4000-8000-000000000519', '01200000-0000-4000-8000-000000000321',
   'Which mitigation makes it harder to redirect execution to attacker-controlled memory addresses?',
   'ASLR randomizes memory addresses so predictable jump targets do not exist.', 1),
  ('01200000-0000-4000-8000-000000000520', '01200000-0000-4000-8000-000000000321',
   'Which attack reuses credentials stolen from one site against other sites?',
   'Credential stuffing feeds breached username and password pairs into many services.', 2),
  ('01200000-0000-4000-8000-000000000521', '01200000-0000-4000-8000-000000000321',
   'The most effective control against credential stuffing is:',
   'MFA makes stolen passwords useless on their own, defeating stuffing and phishing.', 3),
  ('01200000-0000-4000-8000-000000000522', '01200000-0000-4000-8000-000000000324',
   'Which attack stores attacker-supplied script that runs when other users view the page?',
   'Stored XSS persists the payload, impacting every visitor who renders the page.', 1),
  ('01200000-0000-4000-8000-000000000523', '01200000-0000-4000-8000-000000000324',
   'Which defense prevents SQL injection at the code level?',
   'Parameterized queries keep data separate from SQL instructions, so input cannot alter the query.', 2),
  ('01200000-0000-4000-8000-000000000524', '01200000-0000-4000-8000-000000000324',
   'What is a cross-site request forgery (CSRF) attack?',
   'CSRF tricks an authenticated user into sending an unintended request the attacker crafted.', 3),
  ('01200000-0000-4000-8000-000000000525', '01200000-0000-4000-8000-000000000328',
   'You are authorized for 10.10.50.0/24 and app.example.com. During scanning, mail.example.com starts responding to probes. What is the best action?',
   'Anything outside scope is off limits; stop, record the observation, and escalate to the point of contact.', 1),
  ('01200000-0000-4000-8000-000000000526', '01200000-0000-4000-8000-000000000328',
   'After enumeration you have hosts, open ports, and service versions. What is the logical next step?',
   'With findings in hand, vulnerability analysis maps versions and behavior to known weaknesses and scores them.', 2),
  ('01200000-0000-4000-8000-000000000527', '01200000-0000-4000-8000-000000000328',
   'A good findings report is best understood by:',
   'Separate executive summaries and technical detail with clear remediation so both audiences act.', 3),
  ('01200000-0000-4000-8000-000000000528', '01200000-0000-4000-8000-000000000328',
   'Which is the primary code-level defense against SQL injection?',
   'Prepared statements or parameterized queries neutralize user input as instructions.', 4),
  ('01200000-0000-4000-8000-000000000529', '01200000-0000-4000-8000-000000000328',
   'What is the primary deliverable of an authorized engagement?',
   'A prioritized remediation report with evidence, impact, and steps to fix commits the engagement value.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): authorization
  ('01200000-0000-4000-8000-000000001001', '01200000-0000-4000-8000-000000000501', 'Written authorization from the system owner', TRUE,  1),
  ('01200000-0000-4000-8000-000000001002', '01200000-0000-4000-8000-000000000501', 'Using the latest tools', FALSE, 2),
  ('01200000-0000-4000-8000-000000001003', '01200000-0000-4000-8000-000000000501', 'Working at night to avoid detection', FALSE, 3),
  ('01200000-0000-4000-8000-000000001004', '01200000-0000-4000-8000-000000000501', 'The skill of the person running the tests', FALSE, 4),
  -- Q1 (501)q2: integrity
  ('01200000-0000-4000-8000-000000001005', '01200000-0000-4000-8000-000000000502', 'Confidentiality', FALSE, 1),
  ('01200000-0000-4000-8000-000000001006', '01200000-0000-4000-8000-000000000502', 'Integrity', TRUE,  2),
  ('01200000-0000-4000-8000-000000001007', '01200000-0000-4000-8000-000000000502', 'Availability', FALSE, 3),
  ('01200000-0000-4000-8000-000000001008', '01200000-0000-4000-8000-000000000502', 'Authenticity', FALSE, 4),
  -- Q1 (501)q3: pre-engagement
  ('01200000-0000-4000-8000-000000001009', '01200000-0000-4000-8000-000000000503', 'Exploitation', FALSE, 1),
  ('01200000-0000-4000-8000-000000001010', '01200000-0000-4000-8000-000000000503', 'Reporting', FALSE, 2),
  ('01200000-0000-4000-8000-000000001011', '01200000-0000-4000-8000-000000000503', 'Pre-engagement, including scope and authorization', TRUE,  3),
  ('01200000-0000-4000-8000-000000001012', '01200000-0000-4000-8000-000000000503', 'Post-exploitation', FALSE, 4),
  -- Q2 (504): authorization document
  ('01200000-0000-4000-8000-000000001013', '01200000-0000-4000-8000-000000000504', 'A written authorization from the asset owner', TRUE,  1),
  ('01200000-0000-4000-8000-000000001014', '01200000-0000-4000-8000-000000000504', 'A VPN connection', FALSE, 2),
  ('01200000-0000-4000-8000-000000001015', '01200000-0000-4000-8000-000000000504', 'An Nmap license key', FALSE, 3),
  ('01200000-0000-4000-8000-000000001016', '01200000-0000-4000-8000-000000000504', 'A business card', FALSE, 4),
  -- Q2 (504)q2: out-of-scope host
  ('01200000-0000-4000-8000-000000001017', '01200000-0000-4000-8000-000000000505', 'Stop and report it to the point of contact', TRUE,  1),
  ('01200000-0000-4000-8000-000000001018', '01200000-0000-4000-8000-000000000505', 'Scan it quickly for curiosity', FALSE, 2),
  ('01200000-0000-4000-8000-000000001019', '01200000-0000-4000-8000-000000000505', 'Keep the host secret', FALSE, 3),
  ('01200000-0000-4000-8000-000000001020', '01200000-0000-4000-8000-000000000505', 'Add it to the report silently', FALSE, 4),
  -- Q2 (504)q3: WSTG
  ('01200000-0000-4000-8000-000000001021', '01200000-0000-4000-8000-000000000506', 'RFC 1918', FALSE, 1),
  ('01200000-0000-4000-8000-000000001022', '01200000-0000-4000-8000-000000000506', 'The OWASP Web Security Testing Guide', TRUE,  2),
  ('01200000-0000-4000-8000-000000001023', '01200000-0000-4000-8000-000000000506', 'The TCP specification', FALSE, 3),
  ('01200000-0000-4000-8000-000000001024', '01200000-0000-4000-8000-000000000506', 'The Apache configuration manual', FALSE, 4),
  -- Q3 (507): passive recon
  ('01200000-0000-4000-8000-000000001025', '01200000-0000-4000-8000-000000000507', 'Sending a ping to the target', FALSE, 1),
  ('01200000-0000-4000-8000-000000001026', '01200000-0000-4000-8000-000000000507', 'Browsing public certificate transparency logs', TRUE,  2),
  ('01200000-0000-4000-8000-000000001027', '01200000-0000-4000-8000-000000000507', 'Connecting to port 443 with a browser', FALSE, 3),
  ('01200000-0000-4000-8000-000000001028', '01200000-0000-4000-8000-000000000507', 'Running a port scan', FALSE, 4),
  -- Q3 (507)q2: site: operator
  ('01200000-0000-4000-8000-000000001029', '01200000-0000-4000-8000-000000000508', 'Pages hosted on that domain only', TRUE,  1),
  ('01200000-0000-4000-8000-000000001030', '01200000-0000-4000-8000-000000000508', 'Every page on the internet', FALSE, 2),
  ('01200000-0000-4000-8000-000000001031', '01200000-0000-4000-8000-000000000508', 'Only pages mentioning example.com in text', FALSE, 3),
  ('01200000-0000-4000-8000-000000001032', '01200000-0000-4000-8000-000000000508', 'Email addresses on the domain', FALSE, 4),
  -- Q3 (507)q3: certificate transparency
  ('01200000-0000-4000-8000-000000001033', '01200000-0000-4000-8000-000000000509', 'WHOIS records', FALSE, 1),
  ('01200000-0000-4000-8000-000000001034', '01200000-0000-4000-8000-000000000509', 'Certificate transparency logs', TRUE,  2),
  ('01200000-0000-4000-8000-000000001035', '01200000-0000-4000-8000-000000000509', 'NetFlow data', FALSE, 3),
  ('01200000-0000-4000-8000-000000001036', '01200000-0000-4000-8000-000000000509', 'Firewall rules', FALSE, 4),
  -- Q4 (510): MX record
  ('01200000-0000-4000-8000-000000001037', '01200000-0000-4000-8000-000000000510', 'MX', TRUE,  1),
  ('01200000-0000-4000-8000-000000001038', '01200000-0000-4000-8000-000000000510', 'A', FALSE, 2),
  ('01200000-0000-4000-8000-000000001039', '01200000-0000-4000-8000-000000000510', 'AAAA', FALSE, 3),
  ('01200000-0000-4000-8000-000000001040', '01200000-0000-4000-8000-000000000510', 'PTR', FALSE, 4),
  -- Q4 (510)q2: ping sweep
  ('01200000-0000-4000-8000-000000001041', '01200000-0000-4000-8000-000000000511', 'Enumerating open ports', FALSE, 1),
  ('01200000-0000-4000-8000-000000001042', '01200000-0000-4000-8000-000000000511', 'Finding which hosts respond', TRUE,  2),
  ('01200000-0000-4000-8000-000000001043', '01200000-0000-4000-8000-000000000511', 'Reading web server headers', FALSE, 3),
  ('01200000-0000-4000-8000-000000001044', '01200000-0000-4000-8000-000000000511', 'Decrypting traffic', FALSE, 4),
  -- Q4 (510)q3: active recon
  ('01200000-0000-4000-8000-000000001045', '01200000-0000-4000-8000-000000000512', 'Reading a public certificate transparency log', FALSE, 1),
  ('01200000-0000-4000-8000-000000001046', '01200000-0000-4000-8000-000000000512', 'Sending an HTTP HEAD request to the target', TRUE,  2),
  ('01200000-0000-4000-8000-000000001047', '01200000-0000-4000-8000-000000000512', 'Reviewing job postings', FALSE, 3),
  ('01200000-0000-4000-8000-000000001048', '01200000-0000-4000-8000-000000000512', 'Searching archived web snapshots', FALSE, 4),
  -- Q5 (513): open port
  ('01200000-0000-4000-8000-000000001049', '01200000-0000-4000-8000-000000000513', 'A service is actively accepting connections', TRUE,  1),
  ('01200000-0000-4000-8000-000000001050', '01200000-0000-4000-8000-000000000513', 'The host is powered off', FALSE, 2),
  ('01200000-0000-4000-8000-000000001051', '01200000-0000-4000-8000-000000000513', 'A firewall dropped the packets', FALSE, 3),
  ('01200000-0000-4000-8000-000000001052', '01200000-0000-4000-8000-000000000513', 'The port is listed in the kernel source', FALSE, 4),
  -- Q5 (513)q2: TCP connect
  ('01200000-0000-4000-8000-000000001053', '01200000-0000-4000-8000-000000000514', 'TCP connect scan', TRUE,  1),
  ('01200000-0000-4000-8000-000000001054', '01200000-0000-4000-8000-000000000514', 'UDP scan', FALSE, 2),
  ('01200000-0000-4000-8000-000000001055', '01200000-0000-4000-8000-000000000514', 'Ping sweep', FALSE, 3),
  ('01200000-0000-4000-8000-000000001056', '01200000-0000-4000-8000-000000000514', 'ARP scan', FALSE, 4),
  -- Q5 (513)q3: timing template
  ('01200000-0000-4000-8000-000000001057', '01200000-0000-4000-8000-000000000515', 'To reduce noise and respect the network', TRUE,  1),
  ('01200000-0000-4000-8000-000000001058', '01200000-0000-4000-8000-000000000515', 'To make nmap run faster', FALSE, 2),
  ('01200000-0000-4000-8000-000000001059', '01200000-0000-4000-8000-000000000515', 'To guarantee stealth from physical security', FALSE, 3),
  ('01200000-0000-4000-8000-000000001060', '01200000-0000-4000-8000-000000000515', 'To skip port 443', FALSE, 4),
  -- Q6 (516): SMB enumeration
  ('01200000-0000-4000-8000-000000001061', '01200000-0000-4000-8000-000000000516', 'Shared folders and usernames', TRUE,  1),
  ('01200000-0000-4000-8000-000000001062', '01200000-0000-4000-8000-000000000516', 'The host geo-location', FALSE, 2),
  ('01200000-0000-4000-8000-000000001063', '01200000-0000-4000-8000-000000000516', 'The power supply wattage', FALSE, 3),
  ('01200000-0000-4000-8000-000000001064', '01200000-0000-4000-8000-000000000516', 'DNS backups', FALSE, 4),
  -- Q6 (516)q2: CVE
  ('01200000-0000-4000-8000-000000001065', '01200000-0000-4000-8000-000000000517', 'A public identifier for a known vulnerability', TRUE,  1),
  ('01200000-0000-4000-8000-000000001066', '01200000-0000-4000-8000-000000000517', 'A type of firewall rule', FALSE, 2),
  ('01200000-0000-4000-8000-000000001067', '01200000-0000-4000-8000-000000000517', 'A password hash format', FALSE, 3),
  ('01200000-0000-4000-8000-000000001068', '01200000-0000-4000-8000-000000000517', 'A network protocol', FALSE, 4),
  -- Q6 (516)q3: CVSS
  ('01200000-0000-4000-8000-000000001069', '01200000-0000-4000-8000-000000000518', 'Measuring internet speed', FALSE, 1),
  ('01200000-0000-4000-8000-000000001070', '01200000-0000-4000-8000-000000000518', 'Rating vulnerability severity', TRUE,  2),
  ('01200000-0000-4000-8000-000000001071', '01200000-0000-4000-8000-000000000518', 'Ranking web frameworks', FALSE, 3),
  ('01200000-0000-4000-8000-000000001072', '01200000-0000-4000-8000-000000000518', 'Scoring employees', FALSE, 4),
  -- Q7 (519): ASLR
  ('01200000-0000-4000-8000-000000001073', '01200000-0000-4000-8000-000000000519', 'ASLR', TRUE,  1),
  ('01200000-0000-4000-8000-000000001074', '01200000-0000-4000-8000-000000000519', 'SMB signing', FALSE, 2),
  ('01200000-0000-4000-8000-000000001075', '01200000-0000-4000-8000-000000000519', 'TCP window scaling', FALSE, 3),
  ('01200000-0000-4000-8000-000000001076', '01200000-0000-4000-8000-000000000519', 'Load balancing', FALSE, 4),
  -- Q7 (519)q2: credential stuffing
  ('01200000-0000-4000-8000-000000001077', '01200000-0000-4000-8000-000000000520', 'Credential stuffing', TRUE,  1),
  ('01200000-0000-4000-8000-000000001078', '01200000-0000-4000-8000-000000000520', 'ARP spoofing', FALSE, 2),
  ('01200000-0000-4000-8000-000000001079', '01200000-0000-4000-8000-000000000520', 'DNS rebinding', FALSE, 3),
  ('01200000-0000-4000-8000-000000001080', '01200000-0000-4000-8000-000000000520', 'Server-side request forgery', FALSE, 4),
  -- Q7 (519)q3: MFA
  ('01200000-0000-4000-8000-000000001081', '01200000-0000-4000-8000-000000000521', 'Longer passwords', FALSE, 1),
  ('01200000-0000-4000-8000-000000001082', '01200000-0000-4000-8000-000000000521', 'Multi-factor authentication', TRUE,  2),
  ('01200000-0000-4000-8000-000000001083', '01200000-0000-4000-8000-000000000521', 'Patching the web server', FALSE, 3),
  ('01200000-0000-4000-8000-000000001084', '01200000-0000-4000-8000-000000000521', 'Disabling TLS', FALSE, 4),
  -- Q8 (522): stored XSS
  ('01200000-0000-4000-8000-000000001085', '01200000-0000-4000-8000-000000000522', 'Stored XSS', TRUE,  1),
  ('01200000-0000-4000-8000-000000001086', '01200000-0000-4000-8000-000000000522', 'Session fixation', FALSE, 2),
  ('01200000-0000-4000-8000-000000001087', '01200000-0000-4000-8000-000000000522', 'ARP spoofing', FALSE, 3),
  ('01200000-0000-4000-8000-000000001088', '01200000-0000-4000-8000-000000000522', 'Reflected SQL injection that echoes back', FALSE, 4),
  -- Q8 (522)q2: parameterized queries
  ('01200000-0000-4000-8000-000000001089', '01200000-0000-4000-8000-000000000523', 'Parameterized queries', TRUE,  1),
  ('01200000-0000-4000-8000-000000001090', '01200000-0000-4000-8000-000000000523', 'Hiding the login form', FALSE, 2),
  ('01200000-0000-4000-8000-000000001091', '01200000-0000-4000-8000-000000000523', 'Disabling cookies', FALSE, 3),
  ('01200000-0000-4000-8000-000000001092', '01200000-0000-4000-8000-000000000523', 'Switching to FTP', FALSE, 4),
  -- Q8 (522)q3: CSRF
  ('01200000-0000-4000-8000-000000001093', '01200000-0000-4000-8000-000000000524', 'Tricking an authenticated user into an unintended request', TRUE,  1),
  ('01200000-0000-4000-8000-000000001094', '01200000-0000-4000-8000-000000000524', 'Reading files from the server disk', FALSE, 2),
  ('01200000-0000-4000-8000-000000001095', '01200000-0000-4000-8000-000000000524', 'Brute-forcing the admin password', FALSE, 3),
  ('01200000-0000-4000-8000-000000001096', '01200000-0000-4000-8000-000000000524', 'Forcing a TLS downgrade', FALSE, 4),
  -- Q9 (525): out-of-scope host
  ('01200000-0000-4000-8000-000000001097', '01200000-0000-4000-8000-000000000525', 'Stop probing it and escalate to the point of contact', TRUE,  1),
  ('01200000-0000-4000-8000-000000001098', '01200000-0000-4000-8000-000000000525', 'Exploit it to prove the risk exists', FALSE, 2),
  ('01200000-0000-4000-8000-000000001099', '01200000-0000-4000-8000-000000000525', 'Silently add it to the scan and keep going', FALSE, 3),
  ('01200000-0000-4000-8000-000000001100', '01200000-0000-4000-8000-000000000525', 'Forward its traffic to a colleague', FALSE, 4),
  -- Q9 (525)q2: next step
  ('01200000-0000-4000-8000-000000001101', '01200000-0000-4000-8000-000000000526', 'Vulnerability analysis', TRUE,  1),
  ('01200000-0000-4000-8000-000000001102', '01200000-0000-4000-8000-000000000526', 'Writing the executive summary', FALSE, 2),
  ('01200000-0000-4000-8000-000000001103', '01200000-0000-4000-8000-000000000526', 'Deleting all scan logs', FALSE, 3),
  ('01200000-0000-4000-8000-000000001104', '01200000-0000-4000-8000-000000000526', 'Rebuilding the target', FALSE, 4),
  -- Q9 (525)q3: report audience
  ('01200000-0000-4000-8000-000000001105', '01200000-0000-4000-8000-000000000527', 'Both executives and developers', TRUE,  1),
  ('01200000-0000-4000-8000-000000001106', '01200000-0000-4000-8000-000000000527', 'Only other penetration testers', FALSE, 2),
  ('01200000-0000-4000-8000-000000001107', '01200000-0000-4000-8000-000000000527', 'Only the marketing team', FALSE, 3),
  ('01200000-0000-4000-8000-000000001108', '01200000-0000-4000-8000-000000000527', 'Only the help desk', FALSE, 4),
  -- Q9 (525)q4: SQL injection defense
  ('01200000-0000-4000-8000-000000001109', '01200000-0000-4000-8000-000000000528', 'A WAF deployed alone', FALSE, 1),
  ('01200000-0000-4000-8000-000000001110', '01200000-0000-4000-8000-000000000528', 'Prepared statements', TRUE,  2),
  ('01200000-0000-4000-8000-000000001111', '01200000-0000-4000-8000-000000000528', 'Base64 encoding the input', FALSE, 3),
  ('01200000-0000-4000-8000-000000001112', '01200000-0000-4000-8000-000000000528', 'Removing the database', FALSE, 4),
  -- Q9 (525)q5: deliverable
  ('01200000-0000-4000-8000-000000001113', '01200000-0000-4000-8000-000000000529', 'A prioritized report with findings and remediation', TRUE,  1),
  ('01200000-0000-4000-8000-000000001114', '01200000-0000-4000-8000-000000000529', 'A new password for the target', FALSE, 2),
  ('01200000-0000-4000-8000-000000001115', '01200000-0000-4000-8000-000000000529', 'A dump of all captured data', FALSE, 3),
  ('01200000-0000-4000-8000-000000001116', '01200000-0000-4000-8000-000000000529', 'A list of employee salaries', FALSE, 4)
ON CONFLICT (id) DO NOTHING;