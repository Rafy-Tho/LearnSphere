-- ============================================================================
-- SEED 029: Complete course — "Wireless Networking & Wi-Fi"
-- ----------------------------------------------------------------------------
-- Instructor : Sarah Chen        (10000000-0000-4000-8000-000000000001)
-- Category   : Networking        (20000000-0000-4000-8000-000000000006)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 RF Fundamentals & Spectrum      → C1 Radio Waves & Spectrum · C2 Antennas & RF Math
--   M2 802.11 Standards & Media Access → C3 The Standards Family · C4 Media Access on the Air
--   M3 Wi-Fi Security & Authentication → C5 Security Protocols · C6 Enterprise Authentication
--   M4 APs, Controllers & Roaming      → C7 APs & Controllers · C8 Roaming & Surveys
--   M5 Troubleshooting & Capstone      → C9 Troubleshooting & Analysis · C10 Capstone
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
  '01D00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000001',
  '20000000-0000-4000-8000-000000000006',
  'Wireless Networking & Wi-Fi',
  'wireless-networking-and-wifi',
  'Master the RF physics behind Wi-Fi, the 802.11 standards family, WPA2/WPA3 security, and the infrastructure that keeps clients connected — then survey, troubleshoot, and design a complete wireless network.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  27
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01D00000-0000-4000-8000-000000000011', '01D00000-0000-4000-8000-000000000001', 'Explain RF fundamentals, including frequency, wavelength, propagation, and multipath.', 1),
  ('01D00000-0000-4000-8000-000000000012', '01D00000-0000-4000-8000-000000000001', 'Compare 802.11 amendments and plan channels across the 2.4, 5, and 6 GHz bands.',        2),
  ('01D00000-0000-4000-8000-000000000013', '01D00000-0000-4000-8000-000000000001', 'Evaluate Wi-Fi security, from WPA2 and WPA3 encryption to enterprise 802.1X authentication.', 3),
  ('01D00000-0000-4000-8000-000000000014', '01D00000-0000-4000-8000-000000000001', 'Deploy access points, controllers, and roaming configurations for reliable coverage.',       4),
  ('01D00000-0000-4000-8000-000000000015', '01D00000-0000-4000-8000-000000000001', 'Survey, troubleshoot, and analyze wireless networks, including the WPA2 4-way handshake.',   5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01D00000-0000-4000-8000-000000000101', '01D00000-0000-4000-8000-000000000001', 1, 'RF Fundamentals & Spectrum',       'Radio waves, propagation, antennas, and link budget math.',  'PUBLISHED'),
  ('01D00000-0000-4000-8000-000000000102', '01D00000-0000-4000-8000-000000000001', 2, '802.11 Standards & Media Access',  'The 802.11 family, channels, and the rules of the air.',     'PUBLISHED'),
  ('01D00000-0000-4000-8000-000000000103', '01D00000-0000-4000-8000-000000000001', 3, 'Wi-Fi Security & Authentication',  'Encryption and identity from WPA2 to WPA3 and 802.1X.',      'PUBLISHED'),
  ('01D00000-0000-4000-8000-000000000104', '01D00000-0000-4000-8000-000000000001', 4, 'APs, Controllers & Roaming',       'Deploy infrastructure clients can roam across seamlessly.',  'PUBLISHED'),
  ('01D00000-0000-4000-8000-000000000105', '01D00000-0000-4000-8000-000000000001', 5, 'Troubleshooting & Capstone',       'Analyze, fix, and design real wireless networks.',           'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01D00000-0000-4000-8000-000000000201', '01D00000-0000-4000-8000-000000000101', 1, 'Radio Waves & Spectrum',        'How electromagnetic waves carry data over the air.',            'PUBLISHED'),
  ('01D00000-0000-4000-8000-000000000202', '01D00000-0000-4000-8000-000000000101', 2, 'Antennas & RF Math',            'Direct the signal and plan link budgets.',                       'PUBLISHED'),
  ('01D00000-0000-4000-8000-000000000203', '01D00000-0000-4000-8000-000000000102', 1, 'The Standards Family',           'The 802.11 amendments that define Wi-Fi.',                       'PUBLISHED'),
  ('01D00000-0000-4000-8000-000000000204', '01D00000-0000-4000-8000-000000000102', 2, 'Media Access on the Air',        'How stations share the medium and move frames.',                 'PUBLISHED'),
  ('01D00000-0000-4000-8000-000000000205', '01D00000-0000-4000-8000-000000000103', 1, 'Security Protocols',             'WPA2, WPA3, and the ciphers that protect your data.',            'PUBLISHED'),
  ('01D00000-0000-4000-8000-000000000206', '01D00000-0000-4000-8000-000000000103', 2, 'Enterprise Authentication',      '802.1X, RADIUS, and secure segmentation.',                        'PUBLISHED'),
  ('01D00000-0000-4000-8000-000000000207', '01D00000-0000-4000-8000-000000000104', 1, 'APs & Controllers',              'Access points, controllers, and centralized management.',        'PUBLISHED'),
  ('01D00000-0000-4000-8000-000000000208', '01D00000-0000-4000-8000-000000000104', 2, 'Roaming & Surveys',              'Seamless mobility and careful planning.',                         'PUBLISHED'),
  ('01D00000-0000-4000-8000-000000000209', '01D00000-0000-4000-8000-000000000105', 1, 'Troubleshooting & Analysis',     'Diagnose issues and examine the security handshake.',            'PUBLISHED'),
  ('01D00000-0000-4000-8000-000000000210', '01D00000-0000-4000-8000-000000000105', 2, 'Capstone',                       'Design a complete wireless network.',                             'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01D00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01D00000-0000-4000-8000-000000000301', '01D00000-0000-4000-8000-000000000201', 1, 'Radio Waves & Frequencies',             'Understand how frequency, wavelength, and spectrum bands carry Wi-Fi.',  'TEXT',  'PUBLISHED', 'FREE', 10,  7),
  ('01D00000-0000-4000-8000-000000000302', '01D00000-0000-4000-8000-000000000201', 2, 'Signal Propagation & Path Loss',        'Model how distance, obstacles, and multipath weaken signals.',           'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01D00000-0000-4000-8000-000000000303', '01D00000-0000-4000-8000-000000000201', 3, 'RF Fundamentals Quiz',                  'Check your grasp of radio frequency basics.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01D00000-0000-4000-8000-000000000304', '01D00000-0000-4000-8000-000000000202', 1, 'Antennas, Gain & Polarization',         'Direct radio energy and read antenna specifications.',                   'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01D00000-0000-4000-8000-000000000305', '01D00000-0000-4000-8000-000000000202', 2, 'RF Math & Link Budgets',                'Work in dB, dBm, and dBi to predict link performance.',                  'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01D00000-0000-4000-8000-000000000306', '01D00000-0000-4000-8000-000000000202', 3, 'Antennas & RF Math Quiz',               'Verify your antenna and link budget skills.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01D00000-0000-4000-8000-000000000307', '01D00000-0000-4000-8000-000000000203', 1, 'The 802.11 Standards Family',           'Trace Wi-Fi from 1997 through 802.11ax and Wi-Fi 7.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01D00000-0000-4000-8000-000000000308', '01D00000-0000-4000-8000-000000000203', 2, 'Bands, Channels & Bandwidth',           'Plan channels and widths across the 2.4, 5, and 6 GHz bands.',           'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01D00000-0000-4000-8000-000000000309', '01D00000-0000-4000-8000-000000000203', 3, '802.11 Standards Quiz',                 'Test your 802.11 standards and channel planning knowledge.',              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01D00000-0000-4000-8000-000000000310', '01D00000-0000-4000-8000-000000000204', 1, 'The MAC Layer & Frames',                 'Read 802.11 frames and understand association.',                         'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01D00000-0000-4000-8000-000000000311', '01D00000-0000-4000-8000-000000000204', 2, 'CSMA/CA & the Hidden Node Problem',     'See how stations share the air and survive collisions.',                 'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01D00000-0000-4000-8000-000000000312', '01D00000-0000-4000-8000-000000000204', 3, 'MAC Operation Quiz',                     'Check your media access and CSMA/CA skills.',                            'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01D00000-0000-4000-8000-000000000313', '01D00000-0000-4000-8000-000000000205', 1, 'WPA2 & WPA3 in Depth',                   'Compare ciphers, PSK, and the leap to SAE.',                             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01D00000-0000-4000-8000-000000000314', '01D00000-0000-4000-8000-000000000205', 2, 'Authentication & EAP Methods',           'Learn the EAP methods behind enterprise Wi-Fi.',                         'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01D00000-0000-4000-8000-000000000315', '01D00000-0000-4000-8000-000000000205', 3, 'Wi-Fi Security Quiz',                    'Test your WPA2, WPA3, and EAP knowledge.',                               'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01D00000-0000-4000-8000-000000000316', '01D00000-0000-4000-8000-000000000206', 1, '802.1X & Enterprise Authentication',     'Wire RADIUS, supplicants, and dynamic VLANs into the network.',          'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01D00000-0000-4000-8000-000000000317', '01D00000-0000-4000-8000-000000000206', 2, 'Guest Networks & Secure Segmentation',  'Isolate guests, IoT devices, and staff safely.',                         'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01D00000-0000-4000-8000-000000000318', '01D00000-0000-4000-8000-000000000206', 3, 'Enterprise Security Quiz',               'Prove you can secure an enterprise wireless network.',                   'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01D00000-0000-4000-8000-000000000319', '01D00000-0000-4000-8000-000000000207', 1, 'Access Points & Operation Modes',        'Choose autonomous, lightweight, mesh, and monitor APs.',                 'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01D00000-0000-4000-8000-000000000320', '01D00000-0000-4000-8000-000000000207', 2, 'Controllers, CAPWAP & Management',       'Centralize configuration and radio frequency optimization.',             'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01D00000-0000-4000-8000-000000000321', '01D00000-0000-4000-8000-000000000207', 3, 'AP & Controller Quiz',                   'Test your access point and controller knowledge.',                       'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01D00000-0000-4000-8000-000000000322', '01D00000-0000-4000-8000-000000000208', 1, 'Roaming Fundamentals',                   'Keep clients moving between APs without breaking sessions.',             'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01D00000-0000-4000-8000-000000000323', '01D00000-0000-4000-8000-000000000208', 2, 'Wireless Site Survey',                   'Plan coverage and capacity with real measurements.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01D00000-0000-4000-8000-000000000324', '01D00000-0000-4000-8000-000000000208', 3, 'Roaming & Survey Quiz',                  'Check your roaming and survey planning skills.',                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01D00000-0000-4000-8000-000000000325', '01D00000-0000-4000-8000-000000000209', 1, 'Wireless Troubleshooting',               'Diagnose common Wi-Fi failures with a repeatable method.',               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01D00000-0000-4000-8000-000000000326', '01D00000-0000-4000-8000-000000000209', 2, 'Analyzing the WPA2 Handshake',           'Capture and analyze the 4-way handshake safely and legally.',            'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01D00000-0000-4000-8000-000000000327', '01D00000-0000-4000-8000-000000000210', 1, 'Capstone: Designing a Wireless Network', 'Design a production-ready Wi-Fi deployment end to end.',                 'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01D00000-0000-4000-8000-000000000328', '01D00000-0000-4000-8000-000000000210', 2, 'Final Assessment',                       'Prove mastery across the entire wireless networking course.',            'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01D00000-…-0401 .. 0427)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01D00000-0000-4000-8000-000000000401',
  '01D00000-0000-4000-8000-000000000301',
  1,
  'Radio Waves & Frequencies',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Radio Waves & Frequencies</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Radio Waves &amp; Frequencies</h1>
  <p>Every Wi-Fi connection starts with a <strong>radio wave</strong>. Your smartphone, laptop, and access point are all tiny transceivers, converting electrical signals into electromagnetic waves that travel through the open air. This lesson builds the mental model you will need for everything else in the course.</p>
  <h2>The electromagnetic spectrum</h2>
  <p>Radio waves are a slice of the electromagnetic spectrum, the full range of energy that includes light, heat, and X-rays. What separates one slice from another is <span class="ic">frequency</span>, how many times a wave cycles per second. Wi-Fi lives in the microwave region, between roughly 2.4 and 7 GHz.</p>
  <table>
    <tr><th>Band</th><th>Frequency range</th><th>Typical use</th></tr>
    <tr><td>FM radio</td><td>88–108 MHz</td><td>Broadcast radio</td></tr>
    <tr><td>UHF TV</td><td>470–700 MHz</td><td>Digital television</td></tr>
    <tr><td>Bluetooth</td><td>2.4 GHz</td><td>Short-range device links</td></tr>
    <tr><td>Wi-Fi 2.4 GHz</td><td>2.4–2.4835 GHz</td><td>Legacy + range-focused Wi-Fi</td></tr>
    <tr><td>Wi-Fi 5 GHz</td><td>5.15–5.85 GHz</td><td>High-throughput Wi-Fi</td></tr>
    <tr><td>Wi-Fi 6 GHz</td><td>5.925–7.125 GHz</td><td>Wi-Fi 6E / Wi-Fi 7</td></tr>
  </table>
  <h2>Frequency and wavelength</h2>
  <p>A wave has two related properties: <span class="ic">frequency</span> (cycles per second, in hertz) and <span class="ic">wavelength</span> (the physical distance of one cycle). They are tied by the speed of light: <span class="ic">c = f &times; &lambda;</span>. Higher frequency means a shorter wavelength.</p>
  <pre class="code-block">c = f x wavelength
wavelength = c / f

2.4 GHz: 300,000,000 / 2,400,000,000 = 0.125 m (12.5 cm)
5   GHz: 300,000,000 / 5,000,000,000 = 0.06  m (6 cm)

Shorter wavelengths carry more data but bounce off — and
get absorbed by — smaller obstacles.</pre>
  <h2>Why the three bands behave differently</h2>
  <ul>
    <li><strong>2.4 GHz</strong> — best range and wall penetration, but crowded: Bluetooth, microwaves, baby monitors, and every legacy device share it. Only three non-overlapping 20&nbsp;MHz channels fit.</li>
    <li><strong>5 GHz</strong> — faster with many more channels, but signals travel shorter distances and absorb more easily into walls and moisture.</li>
    <li><strong>6 GHz</strong> — the newest spectrum for Wi-Fi 6E and Wi-Fi 7. It is wide and clean today, but range is the shortest of the three.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Why this matters</strong>
    <p>You do not "turn up" Wi-Fi. You allocate spectrum. Because the bands are unlicensed and physically shared, your design goal is to use frequency thoughtfully — not to blast it as hard as possible.</p>
  </div>
  <div class="callout callout-info">
    <strong>Regulatory note</strong>
    <p>Governments still regulate transmit power and concerning frequencies. Always respect local limits; you will use the math to plan compliant links in the RF Math lesson.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000402',
  '01D00000-0000-4000-8000-000000000302',
  1,
  'Signal Propagation & Path Loss',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Signal Propagation & Path Loss</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Signal Propagation &amp; Path Loss</h1>
  <p>A radio wave is never a clean straight line. Between your access point and client, the signal reflects off walls, bends around doorways, and loses energy to every material it touches. Understanding <strong>propagation</strong> — how waves move through the environment — explains why your Wi-Fi is great in one room and useless in the next.</p>
  <h2>Free-space path loss</h2>
  <p>Even in open air, energy spreads out as it travels, so the received power drops with distance. This is <span class="ic">free-space path loss (FSPL)</span>, and it is why doubling distance does not halve the signal — it reduces power by roughly six times per doubling.</p>
  <pre class="code-block">FSPL(dB) = 20 log10(d) + 20 log10(f) + 32.44
   where d = distance in km, f = frequency in MHz

100 m at 2.4 GHz:
  20 log10(0.1) + 20 log10(2400) + 32.44
  = -20 + 67.6 + 32.4 = 80 dB of loss</pre>
  <p>Compare that with 100 m at 5 GHz: about <span class="ic">86 dB</span>. Higher frequency means more loss in free space — one reason 5 GHz and 6 GHz cells are naturally smaller.</p>
  <h2>The four propagation behaviors</h2>
  <ul>
    <li><strong>Reflection</strong> — waves bounce off large, flat surfaces (glass, metal, water). Reflections create useful signal copies, but usually weaker ones.</li>
    <li><strong>Refraction</strong> — the wave bends when passing through a different medium, like a glass window or a change in air density. It changes direction slightly.</li>
    <li><strong>Diffraction</strong> — the wave bends around edges of obstacles, letting signal bleed into corridors and stairwells.</li>
    <li><strong>Scattering / absorption</strong> — rough materials and objects scatter energy in many directions; water, concrete, and metal convert it into heat, killing the signal.</li>
  </ul>
  <h2>Multipath</h2>
  <p>Because waves travel many routes, a receiver gets <strong>copies</strong> of the same data at slightly different times — this is <span class="ic">multipath</span>. Copies that arrive out of phase cancel each other (fading); in-phase copies boost the signal. Modern 802.11n and newer use multiple antennas to <em>harness</em> multipath instead of fighting it.</p>
  <h2>The Fresnel zone</h2>
  <p>For outdoors links, an invisible football-shaped region surrounds the line between the two antennas: the <span class="ic">Fresnel zone</span>. If trees, roofs, or the ground intrude into it, you absorb energy before it ever reaches the far antenna. The rule of thumb: keep at least <span class="ic">60&ndash;80%</span> of the first zone clear.</p>
  <h2>Materials and loss</h2>
  <table>
    <tr><th>Material</th><th>Typical loss (2.4 GHz)</th></tr>
    <tr><td>Open air, 10 m</td><td>&asymp; 12 dB</td></tr>
    <tr><td>Drywall interior wall</td><td>3 &ndash; 5 dB</td></tr>
    <tr><td>Brick or concrete wall</td><td>10 &ndash; 15 dB</td></tr>
    <tr><td>Wooden door</td><td>3 &ndash; 5 dB</td></tr>
    <tr><td>Metal rack or elevator</td><td>15 &ndash; 30+ dB</td></tr>
    <tr><td>Body of water / water pipe</td><td>high absorption</td></tr>
  </table>
  <p>Notice that a single concrete wall can eat more signal than ten meters of open air. This is why <span class="ic">site surveys</span> walk the building: the floor plan, not your radio, decides coverage.</p>
  <div class="callout callout-tip">
    <strong>Design habit</strong>
    <p>Plan for the hardest-to-reach client, not the one standing under the AP. If the corner office needs <span class="ic">-67 dBm</span>, everything else on that floor is likely fine.</p>
  </div>
  <div class="callout callout-info">
    <strong>dB vs dBm</strong>
    <p>This lesson uses <span class="ic">dB</span> for ratios (losses and gains) and <span class="ic">dBm</span> for absolute power. The next lesson makes both precise — worth reading twice.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000405',
  '01D00000-0000-4000-8000-000000000305',
  1,
  'RF Math & Link Budgets',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RF Math & Link Budgets</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>RF Math &amp; Link Budgets</h1>
  <p>Wireless engineers work in a compact math language: <span class="ic">dB</span> and <span class="ic">dBm</span>. Instead of multiplying and dividing enormous power ratios, you <em>add and subtract</em> small numbers. Once it clicks, reading a radio datasheet or a packet-capture amplitude becomes easy.</p>
  <h2>The decibel</h2>
  <p>A decibel is a <em>ratio</em> of two powers on a logarithmic scale. The two rules you use daily:</p>
  <ul>
    <li><span class="ic">+3 dB</span> = double the power</li>
    <li><span class="ic">-3 dB</span> = half the power</li>
    <li><span class="ic">+10 dB</span> = ten times the power</li>
    <li><span class="ic">-10 dB</span> = one tenth of the power</li>
  </ul>
  <p>Everything else chains: <span class="ic">+6 dB</span> is doubling twice, <span class="ic">-7 dB</span> is a tenth times a half, and so on.</p>
  <h2>dBm: absolute power</h2>
  <p>Attach a reference of <span class="ic">1 milliwatt</span> and the ratio becomes an absolute measurement: <span class="ic">dBm</span>. A radio transmitting at <span class="ic">100 mW</span> is <span class="ic">+20 dBm</span>; a client receiving a Wi-Fi signal at <span class="ic">0.000000316 mW</span> is at about <span class="ic">-65 dBm</span>.</p>
  <table>
    <tr><th>Absolute power</th><th>dBm</th></tr>
    <tr><td>1 W</td><td>+30 dBm</td></tr>
    <tr><td>100 mW</td><td>+20 dBm</td></tr>
    <tr><td>10 mW</td><td>+10 dBm</td></tr>
    <tr><td>1 mW</td><td>0 dBm</td></tr>
    <tr><td>-65 dBm</td><td>typical good signal</td></tr>
    <tr><td>-90 dBm</td><td>at/near noise floor</td></tr>
  </table>
  <h2>Antenna gain and the link budget</h2>
  <p>Antennas add gain by focusing energy — they do not create power. To compute the effective power radiated toward a client, you build a <span class="ic">link budget</span>:</p>
  <pre class="code-block">EIRP = TX power + antenna gain - cable / connector loss

Example:
  Radio:      +20 dBm (100 mW)
  Antenna:    +6 dBi (directional)
  Cable loss: -2 dB
  EIRP = 20 + 6 - 2 = +24 dBm

Client link budget:
  EIRP (+24 dBm)
  - path loss over distance
  - building entry / wall loss (-12 dB)
  - received SNR  = received power - noise floor
Aim for received power of -67 dBm or better.</pre>
  <h2>Reading the numbers</h2>
  <p>Two more terms appear in every survey:
    <span class="ic">RSSI</span> (received signal strength) and
    <span class="ic">SNR</span> (signal-to-noise ratio). SNR is the more useful number — it tells you how much of the received power is your signal versus the background noise. Signal to noise, not raw signal, sets the actual data rate. A noisy <span class="ic">-55 dBm</span> can perform worse than a clean <span class="ic">-72 dBm</span>.</p>
  <div class="callout callout-tip">
    <strong>Sanity anchor</strong>
    <p>Memorize the three-step ladder: <span class="ic">+3 dB = &times;2</span>, <span class="ic">+10 dB = &times;10</span>, <span class="ic">0 dBm = 1 mW</span>. Nearly every real-world Wi-Fi rate and range problem reduces to those facts.</p>
  </div>
  <div class="callout callout-info">
    <strong>Rule of thumb</strong>
    <p>Target received power between <span class="ic">-65 dBm</span> (voice) and <span class="ic">-67 dBm</span> (high-rate data). Below <span class="ic">-75 dBm</span>, expect visible drops in throughput; below <span class="ic">-85 dBm</span>, the client will struggle to stay connected at all.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000407',
  '01D00000-0000-4000-8000-000000000307',
  1,
  'The 802.11 Standards Family',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The 802.11 Standards Family</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The 802.11 Standards Family</h1>
  <p>Wi-Fi is a brand; the standard behind it is <span class="ic">IEEE 802.11</span>. Released in 1997, 802.11 has grown through amendment letters — 802.11a, b, g, n, ac, ax, and now be — each defining faster, denser, and more robust wireless.</p>
  <h2>A decade-by-decade family tree</h2>
  <table>
    <tr><th>Amendment</th><th>Band</th><th>Max PHY rate</th><th>Key idea</th></tr>
    <tr><td>802.11 (1997)</td><td>2.4 GHz</td><td>2 Mbps</td><td>The original standard</td></tr>
    <tr><td>802.11a (1999)</td><td>5 GHz</td><td>54 Mbps</td><td>OFDM, first 5 GHz</td></tr>
    <tr><td>802.11b (1999)</td><td>2.4 GHz</td><td>11 Mbps</td><td>CCK, affordable mass Wi-Fi</td></tr>
    <tr><td>802.11g (2003)</td><td>2.4 GHz</td><td>54 Mbps</td><td>OFDM in the 2.4 GHz band</td></tr>
    <tr><td>802.11n (2009) Wi-Fi 4</td><td>2.4 + 5</td><td>600 Mbps</td><td>MIMO, 40 MHz channels</td></tr>
    <tr><td>802.11ac (2013) Wi-Fi 5</td><td>5 GHz</td><td>~6.9 Gbps</td><td>MU-MIMO, 80/160 MHz</td></tr>
    <tr><td>802.11ax (2019) Wi-Fi 6 / 6E</td><td>2.4 + 5 + 6</td><td>~9.6 Gbps</td><td>OFDMA, uplink MU-MIMO</td></tr>
    <tr><td>802.11be (2024) Wi-Fi 7</td><td>2.4 + 5 + 6</td><td>~46 Gbps</td><td>320 MHz, MLO</td></tr>
  </table>
  <h2>From OFDM to OFDMA</h2>
  <p>Through 802.11n and ac, the key ingredient was <span class="ic">OFDM</span>: split a fat channel into many narrow sub-carriers that survive reflections. <span class="ic">802.11ax</span> upgrades this to <span class="ic">OFDMA</span>, letting the AP schedule <em>different clients on different groups of sub-carriers at the same time</em>. That is what makes Wi-Fi 6 vastly better in a crowded classroom or office.</p>
  <h2>MIMO and spatial streams</h2>
  <ul>
    <li><span class="ic">MIMO</span> — multiple transmit and receive antennas working as one virtual pipe.</li>
    <li><span class="ic">Spatial streams</span> — independent data channels per antenna pair; more streams, more throughput.</li>
    <li><span class="ic">MU-MIMO</span> — since 802.11ac, an AP can serve multiple clients on different streams at once.</li>
  </ul>
  <h2>Modulation and rates</h2>
  <p>Each radio encodes bits in a wave using amplitude and phase — <span class="ic">QAM</span>. Fewer bits per symbol (like 16-QAM) travel farther reliably; more bits (1024-QAM in Wi-Fi 6) go fast but need good signal. This is why a far-away client automatically falls back to a lower, more robust rate. You will see rate-shift tables inside every AP dashboard under <span class="ic">MCS (modulation and coding scheme)</span>.</p>
  <h2>Backward compatibility</h2>
  <p>An 802.11ax AP will happily serve an old 802.11g phone, but every older technique costs airtime: protection frames, preamble gymnastics, and slow data rates. In dense deployments, legacy clients can quietly halve performance. Design for the majority, and phase out ancient firmware where you can.</p>
  <div class="callout callout-tip">
    <strong>Sizing intuition</strong>
    <p>Nominal PHY rates mix clients and bands — a 3&times;3 802.11ac AP sharing 80 MHz rarely exceeds 800 Mbps in real file transfers. Always plan for 40&ndash;60% of the round number to be the honest ceiling.</p>
  </div>
  <div class="callout callout-info">
    <strong>Read the label</strong>
    <p>The Wi-Fi Alliance rebrands the amendments for consumers: Wi-Fi 4 = 802.11n, Wi-Fi 5 = 802.11ac, Wi-Fi 6 = 802.11ax, Wi-Fi 7 = 802.11be. 6E means 802.11ax capable of 6 GHz.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000404',
  '01D00000-0000-4000-8000-000000000304',
  1,
  'Antennas, Gain & Polarization',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Antennas, Gain & Polarization</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Antennas, Gain &amp; Polarization</h1>
  <p>An antenna converts electric current into radio waves — and back again at the receiver. It is the one component you can physically change in a deployment, and it shapes the entire coverage cell. This lesson explains how to read antenna specifications and choose the right type for the job.</p>
  <h2>Transducers, not amplifiers</h2>
  <p>Antennas are <strong>passive</strong>. They do not add power; they <em>redirect</em> it. A "high-gain" antenna simply squeezes the radiated energy into a narrower, more focused pattern. Energy that would have gone sideways gets sent further in the direction you chose. That compacting of the pattern is what we label <span class="ic">gain</span>.</p>
  <h2>Isotropic radiator and dBi</h2>
  <p>The reference for gain is the <span class="ic">isotropic radiator</span> — a hypothetical antenna that radiates equally in all directions, like a glowing point. Gain is reported in <span class="ic">dBi</span>, decibels relative to that ideal point source. A real omni-directional antenna might be 2&ndash;3 dBi; a small patch antenna 6&ndash;8 dBi; a large grid or parabolic dish 20+ dBi.</p>
  <h2>Directional vs omnidirectional</h2>
  <table>
    <tr><th>Type</th><th>Pattern</th><th>Typical use</th></tr>
    <tr><td>Omni</td><td>360&deg; horizontal donut</td><td>Indoor APs covering a room or floor</td></tr>
    <tr><td>Patch / panel</td><td>60&ndash;90&deg; wedge</td><td>Wall-mounted APs, hallways, suites</td></tr>
    <tr><td>Yagi / grid</td><td>Narrow beam 15&ndash;45&deg;</td><td>Point-to-point links across fields or campuses</td></tr>
    <tr><td>Sector</td><td>120&deg; slices</td><td>Outdoor APs and rooftop arrays</td></tr>
  </table>
  <h2>Polarization</h2>
  <p>Radio waves oscillate in a plane, called <span class="ic">polarization</span>. Most Wi-Fi uses <em>linear</em> polarization, and the vast majority of indoor antennas are vertical. If the transmit antenna is vertical and the receive antenna is rotated 90&deg;, signal loss jumps by roughly 20 dB — turning a great link into a terrible one. When you mount an AP: keep its antennas in the <em>same orientation</em> as the clients.</p>
  <h2>Antenna diversity and MIMO</h2>
  <p>Modern 802.11n+ radios use multiple antennas connected to multiple radios — <span class="ic">MIMO</span>. Two or three antennas create <span class="ic">spatial streams</span> and also enable <span class="ic">beamforming</span>, where the radio delays signals per antenna to point energy toward each client. Interior designs often place diversity antennas at a 45&deg; offset; external APs rely on the radio doing beamforming in software.</p>
  <h2>Reading a datasheet</h2>
  <p>On an antenna spec sheet you will see:</p>
  <ul>
    <li><span class="ic">Gain</span> in dBi — how focused the pattern is</li>
    <li><span class="ic">Beamwidth</span> — the angle where the signal is still within 3 dB of maximum</li>
    <li><span class="ic">Sector / pattern chart</span> — the actual shaped plot, best viewed as an image</li>
    <li><span class="ic">Polarization</span> — linear (vertical/horizontal) or circular</li>
    <li><span class="ic">Connector / frequency range</span> — must match your radio and band</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Rule of thumb</strong>
    <p>Increase range by focusing the antenna, not by cranking power. Each 3 dBi of gain doubles the effective power in the main beam — add zero regulatory trouble and zero extra interference to the sides.</p>
  </div>
  <div class="callout callout-info">
    <strong>Caution for coexistence</strong>
    <p>A directional antenna also means your AP only hears one direction. In an office full of clients on all sides, an aggressive 24 dBi dish will hurt more than it helps.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000408',
  '01D00000-0000-4000-8000-000000000308',
  1,
  'Bands, Channels & Bandwidth',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bands, Channels & Bandwidth</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Bands, Channels &amp; Bandwidth</h1>
  <p>Every Wi-Fi standard operates inside a <strong>band</strong> — a regulatory slice of spectrum. Each band is then chopped into <strong>channels</strong>, and a channel can be widened to carry more data. Choosing channels well is arguably the highest-leverage skill in wireless engineering.</p>
  <h2>The 2.4 GHz band: three real channels</h2>
  <p>2.4 GHz spans from channel 1 to channel 13 (channel 14 exists in Japan only). At the traditional 20 MHz width, most channels overlap their neighbors. The trick of proper planning is that only <span class="ic">1, 6, 11</span> are far enough apart to be truly non-overlapping:</p>
  <pre class="code-block">Channel  Frequency      Range
  1       2412 MHz       2401 - 2423 MHz
  6       2437 MHz       2426 - 2448 MHz
  11      2462 MHz       2451 - 2473 MHz

Using channels 1, 6, 11 avoids adjacent-channel
interference in 20 MHz mode.</pre>
  <h2>The 5 GHz band: room to breathe</h2>
  <p>5 GHz has far more space: U-NII-1 (36&ndash;48), U-NII-2 (52&ndash;64, plus DFS channels 100&ndash;144 that must avoid radar), and U-NII-3 (149&ndash;165). Properly planned, you can build a coverage map where neighboring APs never overlap — the key to high throughput.</p>
  <h2>Channel width: 20, 40, 80, or 160 MHz</h2>
  <table>
    <tr><th>Width</th><th>2.4 GHz fit</th><th>5 GHz fit</th><th>Trade-off</th></tr>
    <tr><td>20 MHz</td><td>3 non-overlap</td><td>many</td><td>Most robust, narrow</td></tr>
    <tr><td>40 MHz</td><td>1</td><td>a handful</td><td>Double speed, near-doubled interference reach</td></tr>
    <tr><td>80 MHz</td><td>none</td><td>2&ndash;3</td><td>High speed for few clients</td></tr>
    <tr><td>160 MHz</td><td>none</td><td>rarely</td><td>Max speed, DFS complexity</td></tr>
  </table>
  <p>A wider channel roughly doubles throughput per client, but it also doubles the amount of spectrum your AP occupies. In dense environments, a 20 MHz channel that avoids neighbors beats an 80 MHz channel that collides with them.</p>
  <h2>The 6 GHz band</h2>
  <p>Wi-Fi 6E opened 5.925&ndash;7.125 GHz: an entire band with no legacy clients, no DFS, and no microwave ovens. It is today's cleanest spectrum for 160 MHz channels. Its weakness is range — 6 GHz signals decay even faster than 5 GHz, so cells are small.</p>
  <h2>Planning channels in practice</h2>
  <ul>
    <li>Reuse the same channel on APs far enough apart that their cells never overlap.</li>
    <li>Prefer 5 or 6 GHz for clients that can use them; reserve 2.4 GHz for range and legacy.</li>
    <li>Start from 20 MHz, then widen only where neighbors are absent.</li>
    <li>Let your controller's automated channel planning make the first pass, then verify with a survey.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>The golden rule</strong>
    <p>Neighbors are fine on the <em>same</em> channel if their range doesn't intersect; what kills you is two APs on <em>adjacent</em> overlapping channels, which neither CSMA nor the other station can hear.</p>
  </div>
  <div class="callout callout-info">
    <strong>DFS reality check</strong>
    <p>DFS channels (52&ndash;144) can suddenly drop because of radar detection. Don't base your whole design on them; treat them as bonus capacity, not a floor.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000410',
  '01D00000-0000-4000-8000-000000000310',
  1,
  'The MAC Layer & Frames',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>The MAC Layer & Frames</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The MAC Layer &amp; Frames</h1>
  <p>Data does not simply "happen" over Wi-Fi. Every transmission is a <strong>frame</strong> — a packet at the data-link layer — carrying addresses, control info, and (optionally) your payload. Understanding frames is how you read Wireshark, debug roaming, and finally make sense of association errors.</p>
  <h2>The BSS and its anatomy</h2>
  <p>The building block is the <span class="ic">BSS (basic service set)</span>: one AP and the clients attached to it. The AP's radio is identified by its MAC address — the <span class="ic">BSSID</span> — while the human-readable name is the <span class="ic">SSID</span>. A group of APs sharing an SSID forms an <span class="ic">ESS</span>, which lets clients roam between cells.</p>
  <h2>The three frame types</h2>
  <table>
    <tr><th>Type</th><th>Purpose</th><th>Examples</th></tr>
    <tr><td>Management</td><td>Discover and join</td><td>Beacon, probe, auth, association</td></tr>
    <tr><td>Control</td><td>Coordinate the air</td><td>RTS, CTS, ACK, PS-Poll</td></tr>
    <tr><td>Data</td><td>Carry payload</td><td>QoS data (802.11e), null</td></tr>
  </table>
  <h2>Management frames you must know</h2>
  <ul>
    <li><span class="ic">Beacon</span> — the AP's broadcast heartbeat, sent ~10 times per second, announcing SSID, rates, and security.</li>
    <li><span class="ic">Probe request / response</span> — a client asks "is anyone on SSID X?"; APs answer.</li>
    <li><span class="ic">Authentication</span> — technically a handshake gateway; with modern security the real auth happens later.</li>
    <li><span class="ic">Association request / response</span> — the client formally joins the BSS.</li>
  </ul>
  <h2>Inside a frame header</h2>
  <pre class="code-block">802.11 Header
  Frame Control  (type, subtype, retry, more fragments)
  Duration/ID    (used for virtual carrier sense)
  Address 1      (receiver)
  Address 2      (transmitter)
  Address 3      (BSSID / source / destination)
  Sequence Control
  QoS Control    (for QoS data)
  Frame Body     (your data, encrypted after auth)
  FCS            (checksum)</pre>
  <p>Note that unlike Ethernet, the 802.11 header carries <em>up to four</em> address fields. That flexibility is how frames pass through wireless bridges, tunnels, and repeating nodes while still knowing where they came from and where they are going.</p>
  <h2>What a normal join looks like</h2>
  <ol>
    <li>Client scans: listens for beacons and sends probe requests.</li>
    <li>Client authenticates with a management <span class="ic">authentication</span> frame.</li>
    <li>Client sends <span class="ic">association request</span>; AP replies <span class="ic">association response</span> with its capability bitmap.</li>
    <li>Now the security pass: 802.1X/RADIUS, WPA2/WPA3 4-way handshake (by default WPA2 uses a 4-way handshake; WPA3 uses SAE).</li>
    <li>Client requests an IP address; data flows.</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Debugging anchor</strong>
    <p>If a client can't join, filter Wireshark to the client's MAC and look at which step failed: beacon/probe (radio), association (capabilities), then the security exchange.</p>
  </div>
  <div class="callout callout-info">
    <strong>Management is unencrypted</strong>
    <p>Beacons and probes are never encrypted. That is normal — but it also means a rogue can spoof them. Management Frame Protection (802.11w) hardens the most dangerous types.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000411',
  '01D00000-0000-4000-8000-000000000311',
  1,
  'CSMA/CA & the Hidden Node Problem',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CSMA/CA & the Hidden Node Problem</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>CSMA/CA &amp; the Hidden Node Problem</h1>
  <p>Wi-Fi is a shared medium: everyone on a channel talks over the same radio frequencies, and only one conversation happens at a time. Ethernet solved that with collision detection; Wi-Fi cannot listen while it transmits, so it uses <span class="ic">collision avoidance</span> instead.</p>
  <h2>CSMA/CA in one loop</h2>
  <ol>
    <li><strong>Carrier sense</strong> — before transmitting, listen. If the channel is busy, wait.</li>
    <li><strong>IFS + random backoff</strong> — after the air goes quiet, wait a fixed inter-frame space, plus a random number of slots.</li>
    <li><strong>Transmit</strong> — send the frame.</li>
    <li><strong>ACK</strong> — the receiver replies with a short ack frame. No ack means collision; retry with a wider backoff.</li>
  </ol>
  <p>Random backoff is the magic: if two stations collide, they pick different random wait times, so they usually do not hit each other again.</p>
  <h2>Why random backoff matters</h2>
  <pre class="code-block">Slot times (example, 2.4 GHz):
  Slot = 9 us (802.11n and later)
  Backoff window grows after each failed attempt

  Station A: backoff 3 slots -&gt; TX at t
  Station B: backoff 7 slots -&gt; senses busy, backs off again
  Result: A wins, B retries later. No permanent deadlock.</pre>
  <h2>The hidden node</h2>
  <p>Now take two clients, A and C, sitting at the far edges of an AP's coverage, out of each other's hearing range. Both "hear" the AP as free, and both transmit at once. From the AP's chair they collide — but from each other's chair, nothing happened. They are <span class="ic">hidden nodes</span>.</p>
  <h2>RTS/CTS to the rescue</h2>
  <p>When a station suspects hidden nodes (or the AP enables RTS/CTS), it first sends a tiny <span class="ic">RTS (request to send)</span>. The receiver answers <span class="ic">CTS (clear to send)</span>, containing a duration field. Every other station that hears the CTS silences itself for that long:</p>
  <pre class="code-block">A --RTS--&gt; AP
AP --CTS--&gt; (A hears it, C hears it too and stays quiet)
A --Data--&gt; AP            (C remains silent during data)
AP --ACK--&gt; A</pre>
  <p>The CTS reserves the medium for the whole exchange. The cost: two extra short frames per transmission. Configure RTS/CTS only where hidden nodes actually exist — usually at the cell edge or in high-interference lobbies.</p>
  <h2>Dynamic rates and thrash</h2>
  <p>If the data rate drops too low, a single frame takes much longer on the air, starving everyone. This is how one weak client can drag a whole network to a crawl — the so-called <span class="ic">performance cliff</span> of CSMA/CA.</p>
  <div class="callout callout-tip">
    <strong>Field habit</strong>
    <p>Watch the retry counters on your AP: sustained retries above ~10% usually point to hidden nodes, co-channel interference, or a client at the edge. Fix the geometry before raising power — more power often just creates a bigger collision domain.</p>
  </div>
  <div class="callout callout-info">
    <strong>It is half-duplex</strong>
    <p>Unlike wired Ethernet, a client and its AP cannot transmit at the same time. That is fundamental to 802.11 through today's Wi-Fi 6 and 7.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000413',
  '01D00000-0000-4000-8000-000000000313',
  1,
  'WPA2 & WPA3 in Depth',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WPA2 & WPA3 in Depth</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>WPA2 &amp; WPA3 in Depth</h1>
  <p>Encryption and authentication turned Wi-Fi from a party line into a private network. Today the two real choices for a personal (home/small office) SSID are <span class="ic">WPA2-Personal</span> and <span class="ic">WPA3-Personal</span>. This lesson walks through what each actually does on the air.</p>
  <h2>WPA2: AES-CCMP</h2>
  <p>Since 2004, WPA2 uses <span class="ic">AES-CCMP</span> for data: a strong block cipher in counter mode plus a message authenticity check. The weakest link is not the cipher — it is how the keys are derived.</p>
  <p>In WPA2-Personal, both client and AP derive a common <span class="ic">Pairwise Master Key (PMK)</span> from the passphrase via <span class="ic">PBKDF2</span>:</p>
  <pre class="code-block">PMK = PBKDF2(passphrase, SSID, 4096 iterations, 256 bits)</pre>
  <p>Because 4096 iterations is cheap on modern GPUs, a short passphrase is crackable offline. If someone captures your 4-way handshake, they can run dictionary attacks at home — this is what tools like aircrack-ng exploit.</p>
  <h2>The WPA2 4-way handshake</h2>
  <ol>
    <li>AP &rarr; client: <span class="ic">ANonce</span> (its random number)</li>
    <li>Client &rarr; AP: <span class="ic">SNonce</span> + MIC — proves it knows the PMK</li>
    <li>AP &rarr; client: <span class="ic">GTK</span> (group key) + MIC payloads</li>
    <li>Client &rarr; AP: final confirm MIC; data flows</li>
  </ol>
  <p>Each side derives the <span class="ic">Pairwise Transient Key (PTK)</span> from the two nonces plus the PMK. Capture those two messages and everything else is offline work.</p>
  <h2>WPA3-Personal: SAE</h2>
  <p>WPA3 replaces the shared handshake with <span class="ic">SAE (Simultaneous Authentication of Equals)</span>, based on a zero-knowledge <em>dragonfly</em> exchange:</p>
  <ul>
    <li>The passphrase never crosses the air; only a cryptographic commit does.</li>
    <li>No captured handshake to brute-force offline — each guess requires an online interactive round.</li>
    <li>Forward secrecy: even a long-term passphrase leak does not decrypt previously captured traffic.</li>
  </ul>
  <h2>WPA3-Enterprise goes further</h2>
  <p>In enterprise mode, WPA3 mandates <span class="ic">802.11w (Management Frame Protection)</span> and 192-bit AES-SHA384 suites when configured with equal security — killing floods and deauth-based attacks on management frames.</p>
  <h2>Migration reality</h2>
  <table>
    <tr><th>Mode</th><th>Key exchange</th><th>Data cipher</th><th>Offline attack risk</th></tr>
    <tr><td>WPA2-Personal</td><td>PBKDF2 + 4-way</td><td>CCMP</td><td>Yes</td></tr>
    <tr><td>WPA3-Personal</td><td>SAE</td><td>CCMP</td><td>Effectively no</td></tr>
    <tr><td>WPA2-Enterprise</td><td>802.1X + 4-way</td><td>CCMP</td><td>Depends on EAP</td></tr>
    <tr><td>WPA3-Enterprise</td><td>802.1X + SAE-style</td><td>GCMP / CCMP</td><td>No</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Config guidance</strong>
    <p>Use WPA3-Personal (or "WPA2/WPA3 transition") wherever a client is recent. Keep the passphrase long. With WPA2 you must assume any captured handshake can be guessed offline.</p>
  </div>
  <div class="callout callout-info">
    <strong>Weakness reminder</strong>
    <p>An open guest SSID is still unencrypted — anyone can sniff. Any security below the association level only matters if you also protect layers above (HTTPS, VPN).</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000414',
  '01D00000-0000-4000-8000-000000000314',
  1,
  'Authentication & EAP Methods',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Authentication & EAP Methods</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Authentication &amp; EAP Methods</h1>
  <p>Enterprise Wi-Fi does not share a passphrase. It routes each user's login through a protocol designed for exactly this — <span class="ic">802.1X</span> — which wraps an authentication provider called <span class="ic">EAP</span> into your Wi-Fi session. Picking an EAP method is one of the most consequential design decisions you will make.</p>
  <h2>Three roles</h2>
  <ul>
    <li><span class="ic">Supplicant</span> — the client software that proves who you are.</li>
    <li><span class="ic">Authenticator</span> — the wireless controller or AP that mediates.</li>
    <li><span class="ic">Authentication server</span> — typically a RADIUS server that actually checks credentials.</li>
  </ul>
  <h2>The tunnel and the method</h2>
  <p>802.1X acts as a frame: it transports EAP between supplicant and server, over the air it is called <span class="ic">EAP over LAN / over Wireless (EAPoL/EAPoW)</span>. Once the server says "success," both sides still run the WPA2/WPA3 4-way handshake or SAE exchange to build data keys. Authentication chooses <em>who</em> you are; the handshake secures <em>what</em> you send.</p>
  <h2>The main EAP methods</h2>
  <table>
    <tr><th>Method</th><th>Credentials</th><th>Mutual auth</th><th>Use case</th></tr>
    <tr><td>EAP-PEAP</td><td>Password in TLS tunnel</td><td>Yes (server cert + inner)</td><td>Most common, AD/mail passwords</td></tr>
    <tr><td>EAP-TTLS</td><td>Password in tunnel, MS-CHAPv2 inner</td><td>Yes</td><td>Legacy-supporting orgs</td></tr>
    <tr><td>EAP-TLS</td><td>Client certificates</td><td>Yes — full mutual</td><td>Zero-password estates, highest security</td></tr>
    <tr><td>EAP-PWD</td><td>Password in a PAKE</td><td>Yes</td><td>Supplicant without cert trusts</td></tr>
  </table>
  <h2>Why PEAP matters in real life</h2>
  <p>PEAP sets up a TLS tunnel between client and server first (server authenticates via its certificate), then runs a password method inside that encrypted tunnel — commonly MSCHAPv2 or GTC. If the client does not verify the server certificate, an attacker with the right name can impersonate the network and harvest that inner password. Certificate validation is non-negotiable.</p>
  <h2>EAP-TLS: the certificate path</h2>
  <p>The most robust option. Every user gets a certificate from an internal CA and there are no shared secrets to sniff. With EAP-TLS, a stolen laptop without its key is just a brick on your network. It is also the method behind passkey-style Wi-Fi on modern platforms.</p>
  <h2>Common EAP failures</h2>
  <ul>
    <li><span class="ic">Wrong inner method</span> — server expects MSCHAPv2, client offers GTC.</li>
    <li><span class="ic">Untrusted CA chain</span> — the supplicant refuses the server cert.</li>
    <li><span class="ic">Realm mismatch</span> — the username in <span class="ic">user@domain</span> does not route in RADIUS proxy chains.</li>
    <li><span class="ic">Device clock skew</span> — expired certs fail TLS, cryptically.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Field habit</strong>
    <p>Capture the EAP negotiation when joining fails. The RADIUS replies usually carry readable "Access-Reject Reason" strings that name the exact mismatch.</p>
  </div>
  <div class="callout callout-info">
    <strong>One warning that is rarely heeded</strong>
    <p>Do not reuse the corporate password as a Wi-Fi password under EAP-PEAP unless the server presents a certificate the client is forced to validate. Otherwise the Wi-Fi SSID becomes a phishing vector.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000416',
  '01D00000-0000-4000-8000-000000000316',
  1,
  '802.1X & Enterprise Authentication',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>802.1X & Enterprise Authentication</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>802.1X &amp; Enterprise Authentication</h1>
  <p>When credentials instead of passphrases run the network, three moving parts must interoperate smoothly: the client's supplicant, the controller or AP as authenticator, and a RADIUS-backed authentication server. This lesson ties the earlier EAP pieces into the full enterprise flow — the one your government, hospital, school, or office actually runs.</p>
  <h2>The full login path</h2>
  <pre class="code-block">Phone         AP/Controller         RADIUS (FreeRADIUS, NPS, etc.)
  |  EAPoL start   |
  |------------------------------&gt;|
  |   EAP identity (user@corp)    |
  |------------------------------&gt;|
  |             RADIUS Access-Request (user, NAS, session)
  |                              |----------------------&gt;|
  |                              |  Access-Challenge xN (=EAP)
  |&lt;-----------------------------&lt;-- EAP method tunnels -&lt;|
  |  EAP-Success (after handshake)                        |
  |------------------------------&gt;|
  |              RADIUS Access-Accept (+ session timeout)
  |                              |----------------------&gt;|
  |  Now: 4-way handshake / SAE, keys derived, data flows |</pre>
  <p>Proxy chaining is common: your AP talks to an edge RADIUS that forwards to a central identity source (Active Directory, LDAP, cloud IdP) and passes back group attributes later used for VLAN assignment.</p>
  <h2>RADIUS attributes do the policy work</h2>
  <p>The reply to an Access-Accept is not just "yes" — it is a bundle of policy. Typical attributes you will tune:</p>
  <ul>
    <li><span class="ic">Tunnel-Type / Medium-Type / Private-Group-Id</span> — which VLAN the client lands on.</li>
    <li><span class="ic">Session-Timeout / Idle-Timeout</span> — force periodic re-auth.</li>
    <li><span class="ic">Acct-Interim-Interval</span> — how often usage is reported for billing/audit.</li>
    <li><span class="ic">WLAN-ESSID / Called-Station-Id</span> — tell the server which SSID the user joined.</li>
  </ul>
  <h2>Certificates on every side</h2>
  <p>A production 802.1X estate needs three certificate pieces to run cleanly:</p>
  <ol>
    <li><span class="ic">Server cert</span> on RADIUS — trusted by the root CA that clients carry.</li>
    <li><span class="ic">CA bundle</span> on every device (or your MDM pushes it).</li>
    <li><span class="ic">Client certs</span> on devices where you run EAP-TLS.</li>
  </ol>
  <p>Signed by an internal CA, these authorize machines against tamper-free identities. Cloud-managed Wi-Fi hides most certificate plumbing behind SCEP/ACME flows.</p>
  <h2>Supervision and device onboarding</h2>
  <p>Two tiers of client matter: managed devices (MDM-managed, cert-trusting) and BYOD. A robust design gives BYOD a captive-portal SSID with short leases, while managed devices get a certificate-based SSID. This separation bounds how much damage any single unmanaged phone can do.</p>
  <h2>Troubleshooting the whole stack</h2>
  <table>
    <tr><th>Symptom</th><th>Usual root cause</th></tr>
    <tr><td>Rejects before EAP method starts</td><td>Identity/phase-1 cert trust</td></tr>
    <tr><td>Rejects after tunnel opens</td><td>Inner password or inner method mismatch</td></tr>
    <tr><td>Slow joins on roam</td><td>Full re-auth instead of key caching (PMKSA/OKC)</td></tr>
    <tr><td>Users land on wrong VLAN</td><td>RADIUS group attributes vs SSID mapping</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Operational habit</strong>
    <p>Enable <span class="ic">Fast Transition (802.11r)</span> and <span class="ic">opportunistic key caching</span> so roaming clients skip the slow RADIUS round-trip. Test it early; some supplicants misbehave with 11r + EAP.</p>
  </div>
  <div class="callout callout-info">
    <strong>Audit sanity</strong>
    <p>Passwords should never arrive at the AP in cleartext. If your capture shows readable credentials on a PEAP inner channel, the supplicant skipped server validation — fix trust, not encryption.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000417',
  '01D00000-0000-4000-8000-000000000317',
  1,
  'Guest Networks & Secure Segmentation',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Guest Networks & Secure Segmentation</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Guest Networks &amp; Secure Segmentation</h1>
  <p>Your coffee shop, clinic, and office all ask the same question: how do I give visitors the Internet without giving them <em>my</em> network? The answer is segmentation — same radios, separate worlds.</p>
  <h2>The segmentation principle</h2>
  <p>Segmentation is about VLANs (or private VLANs / tunnels), not about Wi-Fi itself. The SSID a client joins is mapped to a particular Layer 2 domain; the controller then decides who can talk across that boundary. An SSID "Guest-WiFi" should live in its own isolated VLAN with its own DHCP scope and no route to the corporate LAN.</p>
  <h2>Securing the guest island</h2>
  <ul>
    <li><span class="ic">No east-west traffic</span> — visitors cannot reach each other (client isolation) or printers/servers (ACLs at the gateway).</li>
    <li><span class="ic">Internet-only egress</span> — a firewall blocks rf-anything except 80/443 to the WAN, usually behind a web filter.</li>
    <li><span class="ic">Rate limiting</span> — cap throughput so streaming guests cannot exhaust the link.</li>
    <li><span class="ic">Captive portal</span> — terms of service, identity capture (email), and possible bandwidth tier.</li>
    <li><span class="ic">Encryption choice</span> — WPA2/WPA3-Personal with a rotating code printed on a board is common, or an open SSID with a captive portal. Open matters because captive-portal browsers are the blocker: WPA guests must enter the password before the portal appears.</li>
  </ul>
  <h2>Portal vs PSK trade-offs</h2>
  <table>
    <tr><th>Approach</th><th>Pros</th><th>Cons</th></tr>
    <tr><td>WPA2-PSK + printed code</td><td>Encrypted, simple</td><td>Code shared by everyone; weak personal key</td></tr>
    <tr><td>Open SSID + captive portal</td><td>Terms + contact capture, no WPA setup</td><td>No encryption on the air, passive snooping risk</td></tr>
    <tr><td>WPA3 + per-session codes</td><td>Encrypted, unique sessions</td><td>Portal + credential flows get fiddly</td></tr>
  </table>
  <h2>Device quarantine enhancement</h2>
  <p>Modern controllers add <span class="ic">onboarding</span>: a guest hits a quarantine VLAN, completes a portal form, and the controller rotates them to the live guest VLAN — even granting hours-long or day-long passes. Some stacks add posture checks (AV present, OS updates) before admitting managed devices to the corporate SSID.</p>
  <h2>Watch out for the seams</h2>
  <p>Segmentation fails at the seams, not the concept:</p>
  <ul>
    <li>A printer in the same L2 domain as guests because someone forgot a VLAN tag.</li>
    <li>Guest DHCP contaminating the corporate scope because both SSIDs map to one subnet.</li>
    <li>A <span class="ic">ClientBridge</span> style AP accidentally forwarding both SSIDs on one trunk.</li>
    <li>RADIUS tunnel attributes that place BYOD onto privileged VLANs.</li>
  </ul>
  <h2>Audit checklist</h2>
  <ol>
    <li>Can a guest ping a corporate workstation? Must be blocked.</li>
    <li>Can a guest reach the printer? Must be blocked.</li>
    <li>Can two guests see each other? Must be blocked on visitor SSIDs.</li>
    <li>Is guest traffic rate-limited at the WAN?</li>
    <li>Is there a written retention policy for portal-logged emails?</li>
  </ol>
  <div class="callout callout-tip">
    <strong>Belt and braces</strong>
    <p>Treat the guest VLAN as hostile by default — as if it were the public Internet. Whatever you cannot afford to lose simply must not be reachable from it.</p>
  </div>
  <div class="callout callout-info">
    <strong>Encryption isn't authorization</strong>
    <p>A visitor who decrypts their own (guest) SSID still has zero right to your server VLAN. Encryption protects guest data; ACLs and VLAN placement protect you.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000419',
  '01D00000-0000-4000-8000-000000000319',
  1,
  'Access Points & Operation Modes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Access Points & Operation Modes</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Access Points &amp; Operation Modes</h1>
  <p>An access point is a bridge: it converts wired Ethernet into a 802.11 cell. But "access point" is a broad family — indoor, outdoor, controller-managed, and standalone — and each deployment mode changes how it behaves on your network.</p>
  <h2>Fat vs thin</h2>
  <ul>
    <li><span class="ic">Standalone (fat) AP</span> — carries its own config, firewall, DHCP, and routing locally. Great for home and single-store sites.</li>
    <li><span class="ic">Controller-managed (thin) AP</span> — radio only; the controller owns config, keys, roaming, and policy. The enterprise default.</li>
    <li><span class="ic">Cloud-managed</span> — thin, but the controller lives in the vendor cloud; management plane is off-premise.</li>
  </ul>
  <h2>Data plane options</h2>
  <pre class="code-block">Local forwarding:
  client ---&gt; AP ---&gt; wired switch/VLAN ---&gt; gateway

Central forwarding (tunnel):
  client ---&gt; AP ---&gt; CAPWAP/LWAPP tunnel ---&gt; controller ---&gt; network
  (controller sees all traffic: filtering, capture, WIPS enforcement)</pre>
  <p>Local forwarding scales better and forwards at line rate; central forwarding centralizes policy and makes roaming seamless, at the price of a controller bottleneck. Split-tunnel WLANs send trusted SSIDs locally and guest SSIDs to the controller — a common hybrid.</p>
  <h2>Physical deployment types</h2>
  <table>
    <tr><th>Form</th><th>Environment</th><th>Watch-outs</th></tr>
    <tr><td>Indoor ceiling</td><td>Offices, schools</td><td>RF obstructions, PoE budget</td></tr>
    <tr><td>Indoor wall-plate</td><td>Hotels, dorms, clinics</td><td>Coverage behind wallpaper/metal studs</td></tr>
    <tr><td>Outdoor hardened</td><td>Campus, warehouses, yards</td><td>Weather, lightning, mounting freedom</td></tr>
    <tr><td>Mesh (wireless uplink)</td><td>Historic buildings, parking</td><td>Half of the backhaul airtime is eaten</td></tr>
  </table>
  <h2>Power: PoE comes first</h2>
  <p>Nearly every modern AP is Ethernet-powered via <span class="ic">PoE</span> (802.3af/at/bt). The port's power class dictates how many radios and radios+USB you can run. An AP with all radios on plus a USB probe can drain a basic PoE budget — check the APS (access point switch) class before multiplying APs on one switch.</p>
  <h2>Management interfaces</h2>
  <ul>
    <li><span class="ic">Serial / console</span> — first boot, password reset, disaster recovery.</li>
    <li><span class="ic">SSH / web UI</span> — day-to-day on fat APs.</li>
    <li><span class="ic">Controller GUI / API</span> — fleet-wide config as code (Ansible, Terraform-friendly).</li>
    <li><span class="ic">Zero-touch provisioning (ZTP)</span> — new AP boots, reaches cloud/controller, config is pushed automatically.</li>
  </ul>
  <h2>Why modes matter to tuning</h2>
  <p>Monitoring counters (channels, clients, retries, airtime) live on the controller or the API, not buried in each AP. If you buy "APs" but plan to manage 40 of them individually over SSH, you have chosen an operation mode that will hurt at scale. Choose fat only where you can batch via config management.</p>
  <div class="callout callout-tip">
    <strong>Design habit</strong>
    <p>Size the data plane for your busiest 95th-percentile client count, not the average. CPU/controller exhaustion shows up as laggy joins and confused roaming first.</p>
  </div>
  <div class="callout callout-info">
    <strong>Mesh has a tax</strong>
    <p>Every hop to a wired AP halves capacity. Mesh is a rescue for bad cabling, never a plan A.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000420',
  '01D00000-0000-4000-8000-000000000320',
  1,
  'Controllers, CAPWAP & Management',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Controllers, CAPWAP & Management</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Controllers, CAPWAP &amp; Management</h1>
  <p>One AP is easy to configure. A hundred are not. That is the job the wireless LAN controller (WLC) was made for: one policy, pushed to every radio, enforced everywhere.</p>
  <h2>What the controller owns</h2>
  <ul>
    <li>SSID &amp; security profiles — one change, all APs.</li>
    <li>Channel and power planning, recomputed when an AP fails or a new neighbor appears.</li>
    <li>Roaming database (client-to-AP mapping) and fast handover decisions.</li>
    <li>RADIUS integration, captive portals, and client policy (VLAN/ACL by user group).</li>
    <li>Monitoring, alarming, and packet capture across the fleet.</li>
  </ul>
  <h2>CAPWAP: the control tunnel</h2>
  <p>The protocol that glues AP to controller is <span class="ic">CAPWAP</span> (the modern successor to LWAPP). It carries two planes over the network:</p>
  <pre class="code-block">Control plane:  UDP 5246  (config push, keepalives)
Data plane:     UDP 5247  (tunneled client traffic, optional)

CAPWAP-encapsulation-off (flexconnect / local):
  client traffic exits the AP onto the LAN directly.
CAPWAP-encapsulation-on (central / hub):
  client traffic is wrapped and shipped to the controller.</pre>
  <p>A subtlety: the AP you buy has the radio firmware built in, but the <em>wireless configuration</em> arrives from the controller at boot via CAPWAP. APs without a controller reachable will either run a last-good configuration or stay unprovisioned (AP in time-out, join failure).</p>
  <h2>Join flow in brief</h2>
  <ol>
    <li>AP boots, gets an IP (DHCP); learns controller addresses via DNS/L3 discovery.</li>
    <li>AP and controller mutually authenticate (PSK with a shared join secret or certificates).</li>
    <li>CAPWAP tunnel forms; controller pushes config.</li>
    <li>AP advertises beacons; clients join the BSS.</li>
  </ol>
  <h2>Modes of operation</h2>
  <table>
    <tr><th>Control</th><th>Data</th><th>Typical site</th></tr>
    <tr><td>Central (local)</td><td>Central</td><td>Small suites, SP-level policy shops</td></tr>
    <tr><td>Central</td><td>Local (flexconnect)</td><td>Branch / remote offices, HQ with local internet</td></tr>
    <tr><td>Standalone</td><td>Local</td><td>Home, single AP, no controller at all</td></tr>
  </table>
  <h2>Controller placement</h2>
  <ul>
    <li><span class="ic">On-premise</span> — a physical/VM appliance in your DC; lowest latency, full control, you run it.</li>
    <li><span class="ic">Cloud</span> — the vendor's platform, often fine-grained APIs; ZTP is the norm.</li>
    <li><span class="ic">Embedded</span> — some systems pick the "virtual/expert" AP to be the control head and the rest follow (unified modes).</li>
  </ul>
  <p>Whatever the model, the risk to manage is <em>single-point latency</em> at roam time: if the controller joins every client and routes every byte, its link must be fast and redundant.</p>
  <h2>Management hygiene</h2>
  <ul>
    <li>Logging and NTP on every AP; clock skew breaks certs and lease expiry.</li>
    <li>Back up the controller config before changes; restore drills work.</li>
    <li>Polarity of network: keep controller management on a management VLAN with strong ACLs.</li>
    <li>Patch queues: controllers have web UIs — attack surface. Roll updates in maintenance windows.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Design habit</strong>
    <p>For a large campus, put the controller near the L3 core and use flexconnect local switching at branches. Central control with fragmented data paths gives you both scale and autonomy.</p>
  </div>
  <div class="callout callout-info">
    <strong>Emergency mode</strong>
    <p>If CAPWAP is down, central-mode APs stop serving a new BSS. Keep at least one AP locally configured (or a "recovery" SSID) so a controller outage does not become a total wireless blackout.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000422',
  '01D00000-0000-4000-8000-000000000322',
  1,
  'Roaming Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Roaming Fundamentals</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Roaming Fundamentals</h1>
  <p>Roaming is the invisible handoff of a device from one AP to another without severing your VPN, your call, or your stream. It is also where many Wi-Fi networks "feel slow" even when every AP looks healthy.</p>
  <h2>Why it is hard</h2>
  <p>A client is only ever associated to one BSS at a time. When it decides to move, it must tear down radios, authenticate and re-associate with the new AP, and re-establish its IP session — all while data keeps flowing. Because the decision is made by the <em>client</em>, the network can only influence it with hints.</p>
  <h2>The client's decision</h2>
  <p>Most devices scan channels periodically and look at beacon/probe RSSI. When the current AP drops far below a threshold — and a candidate is much better — the client roams. Aggressive clients roam early; sticky clients cling to one AP until the signal is awful, dragging everyone via CSMA/CA. Controllers nudge with <span class="ic">band steering</span> (push clients to 5/6 GHz) and <span class="ic">802.11v BSS Transition Management</span>.</p>
  <h2>Fast transitions: 802.11r</h2>
  <p>A classic stuck-roam takes over a second — unacceptable for voice but barely noticed elsewhere. <span class="ic">802.11r (fast transition, FT)</span> lets the client and the new AP derive fresh keys without bouncing through RADIUS: the PMK is exchanged from the old AP to the new one ahead of time, and the client skips the full 4-way negotiation:</p>
  <pre class="code-block">Client decides to roam
  - uses pre-distributed PMK-R0/PMK-R1
  - sends FT authentication + reassociate to new AP
  - new AP already has the keys (PMK cached)
  - reassociation returns quickly: ~50-150 ms total</pre>
  <h2>Three more helpers</h2>
  <ul>
    <li><span class="ic">PMK caching</span> — the new AP reuses a previously derived PMK, skipping EAP entirely on general-net auth.</li>
    <li><span class="ic">Opportunistic key caching (OKC)</span> — one RADIUS success seeds every AP in the ESS, so roams never hit RADIUS.</li>
    <li><span class="ic">CAPWAP mobility</span> — with the controller forming the ESS, mobility anchors (like a GPRS-ish L2 tunnel) keep the client's IP session on one subnet.</li>
  </ul>
  <h2>Layer 3 roaming</h2>
  <p>If the new AP is on a different subnet, the client cannot just reuse its IP — it needs DHCP again, breaking sessions. Solutions: design all APs for one roaming subnet per region (bridged mobility), or use <span class="ic">L3 mobility / inter-subnet roaming</span> where the controller tunnels traffic back to the original subnet (home AP/agent) so the IP never changes.</p>
  <h2>Sizing your exchange</h2>
  <p>Every roam is effort. For voice-class users you want each handoff under 100 ms and zero packet loss. Budget-wise: fewer clients per AP with more APs, tight overlap (10&ndash;15% signal margin), and 802.11r + PMK caching active. For general data, 250&ndash;500 ms is fine.</p>
  <div class="callout callout-tip">
    <strong>Field habit</strong>
    <p>Complainers about "lag when I walk across the office" are roaming complaints. Check the client's association history; if it flapped between APs, look at channel overlap and 11r config — not the compute.</p>
  </div>
  <div class="callout callout-info">
    <strong>802.11r caveat</strong>
    <p>FT doesn't rescue a network with broken RADIUS or CA trust. Fix the identity layer first; 11r only removes the wait for it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000423',
  '01D00000-0000-4000-8000-000000000323',
  1,
  'Wireless Site Survey',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wireless Site Survey</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Wireless Site Survey</h1>
  <p>A site survey turns "I think a couple of APs will do" into a measured, defensible design. It walks the floor, hears the neighbors, and produces the coverage and capacity map your budget asks for.</p>
  <h2>Two questions, one survey</h2>
  <ul>
    <li><span class="ic">Coverage survey</span> — is there a usable signal (-67 dBm or better) where people actually sit?</li>
    <li><span class="ic">Capacity survey</span> — can the radios serve the number of clients at the required data rates?</li>
  </ul>
  <p>Dense cafeterias fail on capacity long before coverage. A survey that only shows "green everywhere" has answered half the question.</p>
  <h2>Before you start</h2>
  <ol>
    <li>Get the floor plan as a real CAD/PDF with walls drawn to scale.</li>
    <li>Inventory obstacles: metal shelving, elevators, water pipes, glass.</li>
    <li>Sample the neighbor grid: any 2.4 GHz channel that already has tenants is a poor home for that unit.</li>
    <li>Fix the rules: define the target RSSI, the minimum data rate, and the channel plan (usually 1 / 6 / 11 on 2.4 GHz, 36/40/44+ on 5 GHz).</li>
  </ol>
  <h2>Active vs passive</h2>
  <p><span class="ic">Passive</span> surveys listen with a scanner while you walk; good for coexistence studies. <span class="ic">Active</span> surveys associate to your equipment and report real throughput/round-trip at each point. Rely on active for capacity claims; passive for interference scouting.</p>
  <h2>Heatmaps and what to read</h2>
  <pre class="code-block">Desired RSSI colorband:
  -65 dBm and below : ideal
  -67 to -75 dBm    : usable
  below -75 dBm     : redesign area

Check in this order:
  1. RSSI by area        (coverage holes)
  2. RSSI overlap        (dead seams between cells)
  3. SINR / noise        (interference pockets)
  4. data rate reached   (capacity story)</pre>
  <h2>Iteration is normal</h2>
  <p>First pass rarely nails it. Adjust AP positions, channel, and power, then re-walk. Expect 2&ndash;3 passes on a big floor. Leave the plan documented: a survey is only useful while the floor plan records where each AP hangs — pictures and labels included.</p>
  <h2>What a survey cannot fix</h2>
  <ul>
    <li>Too few APs for the client count — more radios, not louder ones.</li>
    <li>2.4 GHz atoms: neighbors and micro-oven noise. Move those clients to 5/6 GHz.</li>
    <li>Backhaul: if the PoE port or uplink is congested, no antenna helps.</li>
  </ul>
  <div class="callout callout-tip">
    <strong>Walk the real path</strong>
    <p>Survey where people actually move and gather — desks, aisles, counters — not imaginary diagonals. Coverage in the hallway nobody uses is wasted design work.</p>
  </div>
  <div class="callout callout-info">
    <strong>Re-survey after walls move</strong>
    <p>You redesigned the floor, put in a glass wall, filled the loft with metal shelving? Re-walk the affected cells. Old heatmaps rot.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000425',
  '01D00000-0000-4000-8000-000000000325',
  1,
  'Wireless Troubleshooting',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wireless Troubleshooting</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Wireless Troubleshooting</h1>
  <p>"The Wi-Fi is slow." Every wireless event ever opened. The skill is not running fifty tools — it is knowing which one to reach for first, and how to read the answer.</p>
  <h2>Start with the wedge</h2>
  <p>Classify the symptom before touching anything:</p>
  <table>
    <tr><th>Symptom</th><th>Think</th><th>First check</th></tr>
    <tr><td>One device fails</td><td>Client, not network</td><td>Signal, DHCP, driver, keys</td></tr>
    <tr><td>Many devices, one area</td><td>Coverage / interferencer</td><td>Survey the spot with a scanner</td></tr>
    <tr><td>Whole floor slow</td><td>Capacity / airtime</td><td>AP counters: clients, retries, rates</td></tr>
    <tr><td>Everything dead</td><td>Infrastructure</td><td>PoE, switch port, controller state</td></tr>
  </table>
  <p>Most "Wi-Fi problems" turn out to be DHCP, DNS, or a client's stale profile — only a minority are RF. Confirm quickly before the rabbit hole.</p>
  <h2>The RF toolkit</h2>
  <ul>
    <li><span class="ic">Spectrum analyzer</span> — jammer-style interference: microwaves, Bluetooth storms, jammers.</li>
    <li><span class="ic">Wireshark in monitor mode</span> — who is beaconing, what security, retransmissions.</li>
    <li><span class="ic">Wi-Fi analyzer apps</span> — RSSI, channels, and neighbors in the palm of your hand.</li>
    <li><span class="ic">AP counters</span> — retries, airtime utilization, client PHY rates. Your best data source on big fleets.</li>
  </ul>
  <h2>Read the counters</h2>
  <pre class="code-block">Retry rate  &gt; 10%   : collisions or weak signal, fix geometry
Airtime util &gt; 80%  : the band is exhausted, add APs or move bands
PHY rate    drops   : client is far / fading, check SNR
RSSI good, rate low  : look for hidden node or interference</pre>
  <p>One weak client at 1 Mbps occupies more airtime than a dozen at 300 Mbps. The <span class="ic">minimum data rate</span> setting is a lever: raise it (e.g., 12 or 24 Mbps on 2.4 GHz) to eject ancient chattery clients.</p>
  <h2>A canned drill for "slow all over"</h2>
  <ol>
    <li>Graph AP airtime &amp; retries for 15 minutes.</li>
    <li>Scan channels: is a neighbor crowding your cell?</li>
    <li>Check the roaming map: are clients sticky on a far AP?</li>
    <li>Confirm the uplink: saturate one AP against a local iperf to rule out wiring.</li>
    <li>Apply one change, re-measure. Never change six things at once.</li>
  </ol>
  <h2>Rogue &amp; security triage</h2>
  <p>An unexpected SSID with your network name is a <span class="ic">rogue AP</span>. Use <span class="ic">WIDS/WIPS</span> to detect and (on capable controllers) contain it. Remember that a well-meaning employee's home router, wired into the LAN, is a rogue too — and a security hole.</p>
  <div class="callout callout-tip">
    <strong>One change at a time</strong>
    <p>Wireless is a churn of variables. Alter power, channel, or rate limits individually, then re-measure. Anything else is astrology with counters.</p>
  </div>
  <div class="callout callout-info">
    <strong>Document to remember</strong>
    <p>Keep a "known-good floor" survey. When someone later says WiFi broke in the warehouse, you compare against the baseline in minutes instead of guessing.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000426',
  '01D00000-0000-4000-8000-000000000326',
  1,
  'Analyzing the WPA2 Handshake',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Analyzing the WPA2 Handshake</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Analyzing the WPA2 Handshake</h1>
  <p>A WPA2-Personal join produces one of the most-studied packet sequences in wireless: the <span class="ic">4-way handshake</span>. Reading it tells you whether keys exchanged correctly, which message failed, and — for auditors — whether an offline dictionary attack is possible against the passphrase.</p>
  <h2>The four messages again, in capture form</h2>
  <pre class="code-block">Message 1  AP -&gt; client : EAPOL-Key (ANonce, replay counter)
Message 2  client -&gt; AP : EAPOL-Key (SNonce, MIC, RSN IE)
Message 3  AP -&gt; client : EAPOL-Key (GTK, MIC, ANonce)
Message 4  client -&gt; AP : EAPOL-Key (MIC confirm)

In Wireshark, filter:  eapol
Look for the "Key Descriptor Version" and
the MIC error column which usually reads "Correct".</pre>
  <p>Each EAPOL-Key frame carries a <span class="ic">MIC</span> that only the owner of the PMK can compute. A failed message 2 or 4 (MIC wrong, "incorrect MIC") means passphrase mismatch — the classic "wrong password" at association time.</p>
  <h2>Watch which fields matter</h2>
  <ul>
    <li><span class="ic">Key Info / Key Descriptor</span> — AES-CCMP (74/bitwise) vs TKIP round.</li>
    <li><span class="ic">Key MIC</span> — the unforgeable check you validate.</li>
    <li><span class="ic">Replay counter</span> — must increase; replay attacks are visible as counter regression.</li>
    <li><span class="ic">RSN IE</span> — the pairwise/group cipher negotiation (whether PMF will be enforced).</li>
  </ul>
  <h2>From capture to passphrase check</h2>
  <p>Given Message 1 and Message 2, you know: ANonce, SNonce, both MACs, and the MIC. Recover the PMK candidates offline (PBKDF2 over a wordlist) and test the MIC — this is the offline attack that WPA2-Personal inherits from shared passphrases.</p>
  <pre class="code-block">Typical WPA2 attack flow (you are the auditor):
  airmon-ng start wlan0
  airodump-ng --bssid &lt;AP&gt; -c &lt;ch&gt; wlan0mon   (capture 4-way)
  aircrack-ng -w wordlist.txt capture.cap       (dictionary guess)
      -> success = weak passphrase, change it now</pre>
  <p>The takeaway for design is not "WPA2 is broken" — it is that a passphrase <em>is</em> the keymaterial in WPA2-Personal. Long, random, rotated passphrases neutralize the attack class. Nothing short of that.</p>
  <h2>WPA3 vs the handshake</h2>
  <p>SAE replaces the whole dance: commit, confirm, then keys flow. Because the exchange is zero-knowledge, a captured SAE flow carries <em>no</em> offline-testable material. If you own both client and AP, WPA3-Personal is strictly the stronger choice; if only some clients support it, run a bridge SSID and keep the old handshake at arm's length.</p>
  <h2>Legitimate uses (and the boundary line)</h2>
  <p>Analyzing your own network to validate passphrase strength is standard practice. Attacking a network you do not own is illegal in most jurisdictions, and this lesson exists to help you justify the right settings in your own org — not to encourage intrusions. Know your scope, and get written authorization when in doubt.</p>
  <div class="callout callout-tip">
    <strong>Auditor checklist</strong>
    <p>Capture a fresh handshake, test the 1000 most likely passphrases offline. If any guess succeeds, you have a finding. Then rotate the passphrase and re-test.</p>
  </div>
  <div class="callout callout-info">
    <strong>Prefer not to be in this movie</strong>
    <p>The shortest way to never analyze a cracked handshake is WPA3-Personal or 802.1X with proper keys. Design the passphrase gate so it holds; do not rely on monitoring to save you.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01D00000-0000-4000-8000-000000000427',
  '01D00000-0000-4000-8000-000000000327',
  1,
  'Capstone: Designing a Wireless Network',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone: Designing a Wireless Network</title>
<style>
.lesson-page { font-family: 'Segoe UI', system-ui, -apple-system, sans-serif; line-height: 1.7; color: #1f2937; max-width: 780px; margin: 0 auto; padding: 8px 16px 32px; }
.lesson-page h1 { color: #111827; font-size: 28px; border-bottom: 3px solid #2563eb; padding-bottom: 10px; margin-bottom: 20px; }
.lesson-page h2 { color: #1d4ed8; font-size: 21px; margin: 28px 0 8px; }
.lesson-page p { margin: 12px 0; }
.lesson-page ul, .lesson-page ol { margin: 12px 0; padding-left: 24px; }
.lesson-page li { margin: 6px 0; }
.lesson-page .ic { background: #dbeafe; color: #1e40af; padding: 2px 6px; border-radius: 4px; font-family: 'Consolas', 'Courier New', monospace; font-size: 0.92em; }
.lesson-page pre.code-block { background: #0f172a; color: #e2e8f0; padding: 16px; border-radius: 8px; overflow-x: auto; font-family: 'Consolas', 'Courier New', monospace; font-size: 14px; }
.lesson-page .callout { background: #dbeafe; border-left: 4px solid #2563eb; padding: 12px 16px; border-radius: 6px; margin: 16px 0; }
.lesson-page .callout-info { background: #e0f2fe; border-left-color: #0ea5e9; }
.lesson-page .callout-tip { background: #dcfce7; border-left-color: #22c55e; }
.lesson-page .callout strong { text-transform: uppercase; font-size: 0.8em; letter-spacing: 0.5px; }
.lesson-page table { border-collapse: collapse; width: 100%; margin: 16px 0; }
.lesson-page table th, .lesson-page table td { border: 1px solid #93c5fd; padding: 8px 12px; text-align: left; }
.lesson-page table th { background: #dbeafe; color: #1d4ed8; }
.dark .lesson-page { color: #e5e7eb; }
.dark .lesson-page h1 { color: #f9fafb; border-bottom-color: #93c5fd; }
.dark .lesson-page h2 { color: #bfdbfe; }
.dark .lesson-page .ic { background: #1e3a8a; color: #93c5fd; }
.dark .lesson-page .callout { background: #1e3a8a; border-left-color: #60a5fa; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #1e3a8a; }
.dark .lesson-page table th { background: #1e3a8a; color: #93c5fd; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: Designing a Wireless Network</h1>
  <p>This is where the whole course meets one building. You are the wireless architect for a 4-storey office: ~450 seats, light manufacturing on the ground floor, a call-center open-plan on floor 3, and a quiet exec wing on floor 4. Your job: deliver a defensible design on paper before anyone buys a single AP.</p>
  <h2>Step 1 — Requirements</h2>
  <p>Bind the design to real numbers, not feelings:</p>
  <pre class="code-block">Speak with the users, then commit:
  - 450 active clients, ~70% Wi-Fi 6 capable
  - Call center: low-latency voice/VoIP, needs &lt; 100 ms roams
  - Manufacturing: rugged warehouse tablets
  - Exec wing: secure, isolated, guest access for visitors
  - Redundancy target: no single AP kills a wing

Convert deliverables:
  - coverage: -67 dBm everywhere users sit
  - capacity: AP airtime &lt; 50% during peak in call center
  - security: WPA3 where possible, guest segmented</pre>
  <h2>Step 2 — AP sizing math</h2>
  <p>Estimate AP count from capacity, then check coverage. For a dense call center, budget roughly 20&ndash;25 high-rate clients per radio: ~20 seats/AP modulated by real traffic, so about 2 APs per 40 seats; 100 seats &rarr; &asymp;5 APs. Then overlay coverage: never assume one per floor is enough for 5 GHz range limits.</p>
  <h2>Step 3 — Channel plan</h2>
  <table>
    <tr><th>Band</th><th>Width</th><th>Plan</th></tr>
    <tr><td>2.4 GHz</td><td>20 MHz</td><td>1 / 6 / 11 skip pattern</td></tr>
    <tr><td>5 GHz</td><td>40 MHz</td><td>36/40/44/52/56/60 lace</td></tr>
    <tr><td>6 GHz</td><td>80 MHz</td><td>new band, few collisions</td></tr>
  </table>
  <p>Mark each AP's cell radius from your spreadsheet loss model, then bounce the pattern until adjacent cells never share the same channel range.</p>
  <h2>Step 4 — Security zoning</h2>
  <ul>
    <li><span class="ic">Staff SSID</span> — WPA3-Personal on 802.11w; or 802.1X + PEAP for badge identities.</li>
    <li><span class="ic">VoIP SSID</span> — same trust, QoS marks (WMM), minimum data rate raised to protect jitter.</li>
    <li><span class="ic">Guest SSID</span> — isolated VLAN, captive portal, no east-west, rate-limited.</li>
    <li><span class="ic">IoT</span> — wherever possible, a device VLAN with ACLs to the services it needs.</li>
  </ul>
  <h2>Step 5 — The design review</h2>
  <p>Before purchasing, run the checklist you built all course:</p>
  <ol>
    <li>Every seat in a -67 dBm cell (survey it, later).</li>
    <li>Channel neighbors never overlap.</li>
    <li>Roaming SSIDs: 802.11r + PMK caching on staff/VoIP.</li>
    <li>Controller uplink sized for the peak data plane.</li>
    <li>Go-live walk: you survey, you sign off, you re-check in 90 days.</li>
  </ol>
  <h2>The honest finish line</h2>
  <p>A good wireless design is not the fanciest kit — it is the one that survives a Tuesday 10am with all seats filled, a guest enrolling on the portal, a forklift in the warehouse, and a voice call that never drops. If your paper plan passes those, your radio skills have arrived.</p>
  <div class="callout callout-tip">
    <strong>Sign-off discipline</strong>
    <p>You are accountable for the numbers you committed to. Put the target table (RSSI, capacity per AP, roam latency) in the SOW and hold your own rollout to it.</p>
  </div>
  <div class="callout callout-info">
    <strong>Revisit the basics</strong>
    <p>Every design answers three questions in order: Who are the clients? What must stay clean? How do people move? Everything else is antenna placement and channel lists.</p>
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
  ('01D00000-0000-4000-8000-000000000501', '01D00000-0000-4000-8000-000000000303',
   'Which unit measures the number of wave cycles per second?',
   'Frequency is measured in hertz (Hz); Wi-Fi radios operate in the gigahertz range.', 1),
  ('01D00000-0000-4000-8000-000000000502', '01D00000-0000-4000-8000-000000000303',
   'As frequency increases, what happens to wavelength?',
   'Wavelength equals the speed of light divided by frequency, so higher frequency means shorter wavelength.', 2),
  ('01D00000-0000-4000-8000-000000000503', '01D00000-0000-4000-8000-000000000303',
   'What best describes attenuation in a wireless link?',
   'Attenuation is the loss of signal power as the wave travels and passes through materials.', 3),
  ('01D00000-0000-4000-8000-000000000504', '01D00000-0000-4000-8000-000000000306',
   'What does dBi express?',
   'dBi is antenna gain measured against an isotropic radiator, a theoretical point source.', 1),
  ('01D00000-0000-4000-8000-000000000505', '01D00000-0000-4000-8000-000000000306',
   'How is EIRP calculated?',
   'EIRP equals transmit power plus antenna gain minus cable and connector losses.', 2),
  ('01D00000-0000-4000-8000-000000000506', '01D00000-0000-4000-8000-000000000306',
   'Cutting transmit power in half changes the signal by how much?',
   'Half the power is a change of about minus 3 dB.', 3),
  ('01D00000-0000-4000-8000-000000000507', '01D00000-0000-4000-8000-000000000309',
   'Which amendment introduced OFDMA and opened the 6 GHz band?',
   '802.11ax, marketed as Wi-Fi 6 and Wi-Fi 6E, brought OFDMA and 6 GHz operation.', 1),
  ('01D00000-0000-4000-8000-000000000508', '01D00000-0000-4000-8000-000000000309',
   'Which three 2.4 GHz channels do not overlap at 20 MHz?',
   'Channels 1, 6, and 11 are spaced far enough apart to avoid overlap.', 2),
  ('01D00000-0000-4000-8000-000000000509', '01D00000-0000-4000-8000-000000000309',
   'Why does 5 GHz usually beat 2.4 GHz for throughput?',
   'The 5 GHz band offers many more non-overlapping channels and far less congestion.', 3),
  ('01D00000-0000-4000-8000-000000000510', '01D00000-0000-4000-8000-000000000312',
   'What does the CA in CSMA/CA stand for?',
   'CA stands for collision avoidance; Wi-Fi tries to avoid collisions because it cannot detect them over the air.', 1),
  ('01D00000-0000-4000-8000-000000000511', '01D00000-0000-4000-8000-000000000312',
   'Which frame confirms successful delivery of a unicast data frame?',
   'The receiving station returns an ACK (acknowledgment) frame to the sender.', 2),
  ('01D00000-0000-4000-8000-000000000512', '01D00000-0000-4000-8000-000000000312',
   'What exchange helps solve the hidden node problem?',
   'RTS/CTS reserves the channel so hidden stations know to keep quiet.', 3),
  ('01D00000-0000-4000-8000-000000000513', '01D00000-0000-4000-8000-000000000315',
   'Which legacy protocol relies on RC4 and is considered broken?',
   'WEP uses a weak RC4 keystream and easily cracked keys; it must never be deployed.', 1),
  ('01D00000-0000-4000-8000-000000000514', '01D00000-0000-4000-8000-000000000315',
   'Which cipher does WPA2 use to encrypt user data?',
   'WPA2 uses AES-CCMP to provide confidentiality and integrity.', 2),
  ('01D00000-0000-4000-8000-000000000515', '01D00000-0000-4000-8000-000000000315',
   'What replaces the pre-shared key in WPA3 personal mode?',
   'WPA3 personal mode uses SAE, providing forward secrecy and blocking offline dictionary attacks.', 3),
  ('01D00000-0000-4000-8000-000000000516', '01D00000-0000-4000-8000-000000000318',
   'Which role does the RADIUS server play in 802.1X?',
   'RADIUS is the authentication server that decides whether to open the port.', 1),
  ('01D00000-0000-4000-8000-000000000517', '01D00000-0000-4000-8000-000000000318',
   'Which protocol carries EAP traffic between the AP and the backend?',
   'RADIUS transports EAP packets between the authenticator and the authentication server.', 2),
  ('01D00000-0000-4000-8000-000000000518', '01D00000-0000-4000-8000-000000000318',
   'How do you keep guest traffic off the corporate LAN?',
   'Put guests on a dedicated VLAN with client isolation and an egress-only firewall policy.', 3),
  ('01D00000-0000-4000-8000-000000000519', '01D00000-0000-4000-8000-000000000321',
   'What does an AP in monitor mode do?',
   'It passively captures wireless frames and enables spectrum and security analysis.', 1),
  ('01D00000-0000-4000-8000-000000000520', '01D00000-0000-4000-8000-000000000321',
   'Which protocol connects lightweight APs to a controller?',
   'CAPWAP carries both control and data traffic between AP and controller.', 2),
  ('01D00000-0000-4000-8000-000000000521', '01D00000-0000-4000-8000-000000000321',
   'What does RRM on a wireless controller provide?',
   'RRM automatically assigns channels and transmit power to optimize the RF environment.', 3),
  ('01D00000-0000-4000-8000-000000000522', '01D00000-0000-4000-8000-000000000324',
   'What is it called when a client reassociates from one AP to another?',
   'Roaming is the transition of a connected client between access points.', 1),
  ('01D00000-0000-4000-8000-000000000523', '01D00000-0000-4000-8000-000000000324',
   'What does a passive site survey measure?',
   'A passive survey listens and records RSSI and SNR at points across the floor without associating.', 2),
  ('01D00000-0000-4000-8000-000000000524', '01D00000-0000-4000-8000-000000000324',
   'What is the main benefit of 802.11r fast BSS transition?',
   'It reduces the disconnect time during roaming by pre-caching handshake keys.', 3),
  ('01D00000-0000-4000-8000-000000000525', '01D00000-0000-4000-8000-000000000328',
   'Doubling transmit power adds how many dB?',
   'A factor of two in power is about 3 dB.', 1),
  ('01D00000-0000-4000-8000-000000000526', '01D00000-0000-4000-8000-000000000328',
   'Which bands provide the most non-overlapping 20 MHz channels?',
   'The 5 GHz and 6 GHz bands offer far more channels than 2.4 GHz.', 2),
  ('01D00000-0000-4000-8000-000000000527', '01D00000-0000-4000-8000-000000000328',
   'What is derived from the SSID and passphrase before the 4-way handshake starts?',
   'The PMK is computed with PBKDF2 from the SSID and passphrase; the handshake then derives the PTK.', 3),
  ('01D00000-0000-4000-8000-000000000528', '01D00000-0000-4000-8000-000000000328',
   'A client has strong RSSI but poor throughput. What should you check first?',
   'Check SNR and retry rates; noise and airtime contention often cause poor performance despite good signal.', 4),
  ('01D00000-0000-4000-8000-000000000529', '01D00000-0000-4000-8000-000000000328',
   'Which passphrase provides the strongest WPA2-PSK security?',
   'A long, random passphrase resists offline dictionary and brute force attacks.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): frequency unit
  ('01D00000-0000-4000-8000-000000001001', '01D00000-0000-4000-8000-000000000501', 'Hertz (Hz)', TRUE,  1),
  ('01D00000-0000-4000-8000-000000001002', '01D00000-0000-4000-8000-000000000501', 'Decibels (dB)', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001003', '01D00000-0000-4000-8000-000000000501', 'Milliwatts (mW)', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001004', '01D00000-0000-4000-8000-000000000501', 'Volts (V)', FALSE, 4),
  -- Q1 (501)q2: wavelength
  ('01D00000-0000-4000-8000-000000001005', '01D00000-0000-4000-8000-000000000502', 'Longer', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001006', '01D00000-0000-4000-8000-000000000502', 'Shorter', TRUE,  2),
  ('01D00000-0000-4000-8000-000000001007', '01D00000-0000-4000-8000-000000000502', 'Unchanged', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001008', '01D00000-0000-4000-8000-000000000502', 'Amplified', FALSE, 4),
  -- Q1 (501)q3: attenuation
  ('01D00000-0000-4000-8000-000000001009', '01D00000-0000-4000-8000-000000000503', 'Encryption of the data stream', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001010', '01D00000-0000-4000-8000-000000000503', 'Gain added by an amplifier', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001011', '01D00000-0000-4000-8000-000000000503', 'The number of SSIDs broadcast', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001012', '01D00000-0000-4000-8000-000000000503', 'Signal loss as the wave travels', TRUE,  4),
  -- Q2 (504): dBi
  ('01D00000-0000-4000-8000-000000001013', '01D00000-0000-4000-8000-000000000504', 'Antenna gain relative to an isotropic radiator', TRUE,  1),
  ('01D00000-0000-4000-8000-000000001014', '01D00000-0000-4000-8000-000000000504', 'Cable loss in a feed line', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001015', '01D00000-0000-4000-8000-000000000504', 'Raw transmit power of the radio', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001016', '01D00000-0000-4000-8000-000000000504', 'Number of spatial streams', FALSE, 4),
  -- Q2 (504)q2: EIRP
  ('01D00000-0000-4000-8000-000000001017', '01D00000-0000-4000-8000-000000000505', 'Transmit power minus antenna gain', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001018', '01D00000-0000-4000-8000-000000000505', 'Transmit power plus antenna gain minus cable loss', TRUE,  2),
  ('01D00000-0000-4000-8000-000000001019', '01D00000-0000-4000-8000-000000000505', 'Receiver sensitivity only', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001020', '01D00000-0000-4000-8000-000000000505', 'The noise floor at the client', FALSE, 4),
  -- Q2 (504)q3: half power
  ('01D00000-0000-4000-8000-000000001021', '01D00000-0000-4000-8000-000000000506', 'No change in dB', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001022', '01D00000-0000-4000-8000-000000000506', 'About -10 dB', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001023', '01D00000-0000-4000-8000-000000000506', 'About -3 dB', TRUE,  3),
  ('01D00000-0000-4000-8000-000000001024', '01D00000-0000-4000-8000-000000000506', 'About -1 dB', FALSE, 4),
  -- Q3 (507): 802.11ax
  ('01D00000-0000-4000-8000-000000001025', '01D00000-0000-4000-8000-000000000507', '802.11ax (Wi-Fi 6E)', TRUE,  1),
  ('01D00000-0000-4000-8000-000000001026', '01D00000-0000-4000-8000-000000000507', '802.11n', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001027', '01D00000-0000-4000-8000-000000000507', '802.11ac', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001028', '01D00000-0000-4000-8000-000000000507', '802.11g', FALSE, 4),
  -- Q3 (507)q2: non-overlapping channels
  ('01D00000-0000-4000-8000-000000001029', '01D00000-0000-4000-8000-000000000508', '1, 3 and 5', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001030', '01D00000-0000-4000-8000-000000000508', '1, 6 and 11', TRUE,  2),
  ('01D00000-0000-4000-8000-000000001031', '01D00000-0000-4000-8000-000000000508', '2, 5 and 8', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001032', '01D00000-0000-4000-8000-000000000508', '3, 7 and 9', FALSE, 4),
  -- Q3 (507)q3: 5 GHz advantage
  ('01D00000-0000-4000-8000-000000001033', '01D00000-0000-4000-8000-000000000509', 'Lower licensing fees', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001034', '01D00000-0000-4000-8000-000000000509', 'Better wall penetration', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001035', '01D00000-0000-4000-8000-000000000509', 'Longer range at the same power', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001036', '01D00000-0000-4000-8000-000000000509', 'More non-overlapping channels and less congestion', TRUE,  4),
  -- Q4 (510): CA
  ('01D00000-0000-4000-8000-000000001037', '01D00000-0000-4000-8000-000000000510', 'Collision avoidance', TRUE,  1),
  ('01D00000-0000-4000-8000-000000001038', '01D00000-0000-4000-8000-000000000510', 'Collision detection', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001039', '01D00000-0000-4000-8000-000000000510', 'Carrier aggregation', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001040', '01D00000-0000-4000-8000-000000000510', 'Channel allocation', FALSE, 4),
  -- Q4 (510)q2: ACK
  ('01D00000-0000-4000-8000-000000001041', '01D00000-0000-4000-8000-000000000511', 'Beacon', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001042', '01D00000-0000-4000-8000-000000000511', 'ACK (acknowledgment)', TRUE,  2),
  ('01D00000-0000-4000-8000-000000001043', '01D00000-0000-4000-8000-000000000511', 'Probe response', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001044', '01D00000-0000-4000-8000-000000000511', 'RTS', FALSE, 4),
  -- Q4 (510)q3: RTS/CTS
  ('01D00000-0000-4000-8000-000000001045', '01D00000-0000-4000-8000-000000000512', 'ARP', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001046', '01D00000-0000-4000-8000-000000000512', 'DHCP', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001047', '01D00000-0000-4000-8000-000000000512', 'RTS/CTS', TRUE,  3),
  ('01D00000-0000-4000-8000-000000001048', '01D00000-0000-4000-8000-000000000512', 'IGMP', FALSE, 4),
  -- Q5 (513): WEP
  ('01D00000-0000-4000-8000-000000001049', '01D00000-0000-4000-8000-000000000513', 'WEP', TRUE,  1),
  ('01D00000-0000-4000-8000-000000001050', '01D00000-0000-4000-8000-000000000513', 'WPA2', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001051', '01D00000-0000-4000-8000-000000000513', 'WPA3', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001052', '01D00000-0000-4000-8000-000000000513', '802.1X', FALSE, 4),
  -- Q5 (513)q2: AES-CCMP
  ('01D00000-0000-4000-8000-000000001053', '01D00000-0000-4000-8000-000000000514', 'TKIP', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001054', '01D00000-0000-4000-8000-000000000514', 'AES-CCMP', TRUE,  2),
  ('01D00000-0000-4000-8000-000000001055', '01D00000-0000-4000-8000-000000000514', 'RC4', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001056', '01D00000-0000-4000-8000-000000000514', 'DES', FALSE, 4),
  -- Q5 (513)q3: SAE
  ('01D00000-0000-4000-8000-000000001057', '01D00000-0000-4000-8000-000000000515', 'TKIP', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001058', '01D00000-0000-4000-8000-000000000515', 'MSCHAPv2', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001059', '01D00000-0000-4000-8000-000000000515', 'SAE (Simultaneous Authentication of Equals)', TRUE,  3),
  ('01D00000-0000-4000-8000-000000001060', '01D00000-0000-4000-8000-000000000515', 'PEAP', FALSE, 4),
  -- Q6 (516): 802.1X role
  ('01D00000-0000-4000-8000-000000001061', '01D00000-0000-4000-8000-000000000516', 'Authentication server', TRUE,  1),
  ('01D00000-0000-4000-8000-000000001062', '01D00000-0000-4000-8000-000000000516', 'Supplicant', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001063', '01D00000-0000-4000-8000-000000000516', 'Authenticator', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001064', '01D00000-0000-4000-8000-000000000516', 'Stateful firewall', FALSE, 4),
  -- Q6 (516)q2: RADIUS
  ('01D00000-0000-4000-8000-000000001065', '01D00000-0000-4000-8000-000000000517', 'CAPWAP', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001066', '01D00000-0000-4000-8000-000000000517', 'RADIUS', TRUE,  2),
  ('01D00000-0000-4000-8000-000000001067', '01D00000-0000-4000-8000-000000000517', 'SNMP', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001068', '01D00000-0000-4000-8000-000000000517', 'ICMP', FALSE, 4),
  -- Q6 (516)q3: guest isolation
  ('01D00000-0000-4000-8000-000000001069', '01D00000-0000-4000-8000-000000000518', 'A longer PSK passphrase', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001070', '01D00000-0000-4000-8000-000000000518', 'More antennas per AP', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001071', '01D00000-0000-4000-8000-000000000518', 'A wider channel width', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001072', '01D00000-0000-4000-8000-000000000518', 'A dedicated VLAN with client isolation', TRUE,  4),
  -- Q7 (519): monitor mode
  ('01D00000-0000-4000-8000-000000001073', '01D00000-0000-4000-8000-000000000519', 'Passively captures nearby frames without associating', TRUE,  1),
  ('01D00000-0000-4000-8000-000000001074', '01D00000-0000-4000-8000-000000000519', 'Bridges two wired segments', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001075', '01D00000-0000-4000-8000-000000000519', 'Repeats a parent access point signal', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001076', '01D00000-0000-4000-8000-000000000519', 'Terminates the wired uplink', FALSE, 4),
  -- Q7 (519)q2: CAPWAP
  ('01D00000-0000-4000-8000-000000001077', '01D00000-0000-4000-8000-000000000520', 'SNMP', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001078', '01D00000-0000-4000-8000-000000000520', 'CAPWAP', TRUE,  2),
  ('01D00000-0000-4000-8000-000000001079', '01D00000-0000-4000-8000-000000000520', 'LLDP', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001080', '01D00000-0000-4000-8000-000000000520', 'Multicast DNS', FALSE, 4),
  -- Q7 (519)q3: RRM
  ('01D00000-0000-4000-8000-000000001081', '01D00000-0000-4000-8000-000000000521', 'Wired LAN switching', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001082', '01D00000-0000-4000-8000-000000000521', 'Client certificate enrollment', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001083', '01D00000-0000-4000-8000-000000000521', 'Automatic channel and power assignment', TRUE,  3),
  ('01D00000-0000-4000-8000-000000001084', '01D00000-0000-4000-8000-000000000521', 'Captive portal hosting', FALSE, 4),
  -- Q8 (522): roaming
  ('01D00000-0000-4000-8000-000000001085', '01D00000-0000-4000-8000-000000000522', 'Roaming', TRUE,  1),
  ('01D00000-0000-4000-8000-000000001086', '01D00000-0000-4000-8000-000000000522', 'Channel bonding', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001087', '01D00000-0000-4000-8000-000000000522', 'Multiplexing', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001088', '01D00000-0000-4000-8000-000000000522', 'Beamforming', FALSE, 4),
  -- Q8 (522)q2: passive survey
  ('01D00000-0000-4000-8000-000000001089', '01D00000-0000-4000-8000-000000000523', 'Sending test traffic to a remote server', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001090', '01D00000-0000-4000-8000-000000000523', 'Listen-only measurement of RSSI and SNR at each location', TRUE,  2),
  ('01D00000-0000-4000-8000-000000001091', '01D00000-0000-4000-8000-000000000523', 'A DHCP lease audit', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001092', '01D00000-0000-4000-8000-000000000523', 'An uplink capacity test', FALSE, 4),
  -- Q8 (522)q3: 802.11r
  ('01D00000-0000-4000-8000-000000001093', '01D00000-0000-4000-8000-000000000524', 'It raises the transmit power of each AP', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001094', '01D00000-0000-4000-8000-000000000524', 'It adds channels to the 2.4 GHz band', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001095', '01D00000-0000-4000-8000-000000000524', 'It reduces disconnect time during a client transition', TRUE,  3),
  ('01D00000-0000-4000-8000-000000001096', '01D00000-0000-4000-8000-000000000524', 'It encrypts beacon frames', FALSE, 4),
  -- Q9 (525): 3 dB
  ('01D00000-0000-4000-8000-000000001097', '01D00000-0000-4000-8000-000000000525', 'About 3 dB', TRUE,  1),
  ('01D00000-0000-4000-8000-000000001098', '01D00000-0000-4000-8000-000000000525', 'About 1 dB', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001099', '01D00000-0000-4000-8000-000000000525', 'About 6 dB', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001100', '01D00000-0000-4000-8000-000000000525', 'About 30 dB', FALSE, 4),
  -- Q9 (525)q2: most channels
  ('01D00000-0000-4000-8000-000000001101', '01D00000-0000-4000-8000-000000000526', 'The 2.4 GHz band', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001102', '01D00000-0000-4000-8000-000000000526', 'The 5 GHz and 6 GHz bands', TRUE,  2),
  ('01D00000-0000-4000-8000-000000001103', '01D00000-0000-4000-8000-000000000526', 'The 900 MHz band', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001104', '01D00000-0000-4000-8000-000000000526', 'All bands equally', FALSE, 4),
  -- Q9 (525)q3: PMK
  ('01D00000-0000-4000-8000-000000001105', '01D00000-0000-4000-8000-000000000527', 'GTK', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001106', '01D00000-0000-4000-8000-000000000527', 'BSSID', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001107', '01D00000-0000-4000-8000-000000000527', 'PMK (pairwise master key)', TRUE,  3),
  ('01D00000-0000-4000-8000-000000001108', '01D00000-0000-4000-8000-000000000527', 'SSID', FALSE, 4),
  -- Q9 (525)q4: SNR and retries
  ('01D00000-0000-4000-8000-000000001109', '01D00000-0000-4000-8000-000000000528', 'Reboot the DHCP server', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001110', '01D00000-0000-4000-8000-000000000528', 'Change the SSID name', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001111', '01D00000-0000-4000-8000-000000000528', 'Disable all other access points', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001112', '01D00000-0000-4000-8000-000000000528', 'Check SNR and retry rates', TRUE,  4),
  -- Q9 (525)q5: passphrase
  ('01D00000-0000-4000-8000-000000001113', '01D00000-0000-4000-8000-000000000529', 'A short dictionary word', FALSE, 1),
  ('01D00000-0000-4000-8000-000000001114', '01D00000-0000-4000-8000-000000000529', 'The network SSID repeated', FALSE, 2),
  ('01D00000-0000-4000-8000-000000001115', '01D00000-0000-4000-8000-000000000529', 'A common phrase such as password123', FALSE, 3),
  ('01D00000-0000-4000-8000-000000001116', '01D00000-0000-4000-8000-000000000529', 'A long random passphrase', TRUE,  4)
ON CONFLICT (id) DO NOTHING;