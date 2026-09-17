-- ============================================================================
-- SEED 028: Complete course — "Cryptography & Encryption"
-- ----------------------------------------------------------------------------
-- Instructor : Elena Rodriguez  (10000000-0000-4000-8000-000000000005)
-- Category   : Cybersecurity    (20000000-0000-4000-8000-000000000005)
-- Level      : INTERMEDIATE · Access : SUBSCRIPTION · Status : PUBLISHED
-- Position   : 26
--
-- Structure (5 modules → 10 chapters → 28 lessons):
--   M1 Foundations of Cryptography      → C1 Security Goals & Concepts · C2 Historical Ciphers & Terminology
--   M2 Symmetric Encryption & Integrity → C3 AES & Block Cipher Modes · C4 Hashing & Password Security
--   M3 Public-Key Cryptography          → C5 RSA & Public-Key Encryption · C6 Key Exchange & Digital Signatures
--   M4 Certificates & TLS               → C7 Certificates & the PKI · C8 TLS in Practice
--   M5 Capstone: Secure Notes App       → C9 Building the Encryption Core · C10 Hardening & Shipping
--
-- Content: 19 TEXT lessons with lesson_contents (self-contained HTML + inline
-- CSS, dollar-quoted so apostrophes need no escaping) and 9 QUIZ lessons with
-- 29 questions / 116 options across `quizzes` and `quiz_options`.
--
-- Idempotency: every statement uses ON CONFLICT (id) DO NOTHING with fixed,
-- deterministic UUIDs (prefix 01C00000), so this file can be re-run safely.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. COURSE + OBJECTIVES
-- ----------------------------------------------------------------------------

INSERT INTO courses (
  id, instructor_id, category_id, name, slug, description, status, level, access_type, position
) VALUES (
  '01C00000-0000-4000-8000-000000000001',
  '10000000-0000-4000-8000-000000000005',
  '20000000-0000-4000-8000-000000000005',
  'Cryptography & Encryption',
  'cryptography-and-encryption',
  'Protect data in transit and at rest. Master symmetric and asymmetric ciphers, hashing, HMAC, key exchange, digital signatures, certificates, and TLS — then build a client-side encrypted notes application from the ground up.',
  'PUBLISHED',
  'INTERMEDIATE',
  'SUBSCRIPTION',
  26
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO course_objectives (id, course_id, content, position) VALUES
  ('01C00000-0000-4000-8000-000000000011', '01C00000-0000-4000-8000-000000000001', 'Explain the security goals of confidentiality, integrity, and authenticity and map them to the right primitive.', 1),
  ('01C00000-0000-4000-8000-000000000012', '01C00000-0000-4000-8000-000000000001', 'Encrypt and protect data with AES block cipher modes and authenticated encryption (AEAD).',                                    2),
  ('01C00000-0000-4000-8000-000000000013', '01C00000-0000-4000-8000-000000000001', 'Use hash functions, HMAC, and key derivation functions to store passwords and verify integrity safely.',                          3),
  ('01C00000-0000-4000-8000-000000000014', '01C00000-0000-4000-8000-000000000001', 'Apply public-key cryptography, Diffie-Hellman key exchange, and digital signatures in practical secure designs.',                 4),
  ('01C00000-0000-4000-8000-000000000015', '01C00000-0000-4000-8000-000000000001', 'Validate certificates, configure TLS securely, and build a hardened client-side encrypted notes application.',                   5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. MODULES
-- ----------------------------------------------------------------------------

INSERT INTO modules (id, course_id, position, name, description, status) VALUES
  ('01C00000-0000-4000-8000-000000000101', '01C00000-0000-4000-8000-000000000001', 1, 'Foundations of Cryptography',      'Understand the security goals cryptography serves and the vocabulary every cryptographer uses.',      'PUBLISHED'),
  ('01C00000-0000-4000-8000-000000000102', '01C00000-0000-4000-8000-000000000001', 2, 'Symmetric Encryption & Integrity', 'Encrypt data with AES and protect integrity with hashes, HMAC, and key derivation.',                  'PUBLISHED'),
  ('01C00000-0000-4000-8000-000000000103', '01C00000-0000-4000-8000-000000000001', 3, 'Public-Key Cryptography',          'Explore asymmetric encryption, key exchange, and digital signatures.',                               'PUBLISHED'),
  ('01C00000-0000-4000-8000-000000000104', '01C00000-0000-4000-8000-000000000001', 4, 'Certificates & TLS',               'Bind identities to keys with certificates and secure the web with TLS.',                             'PUBLISHED'),
  ('01C00000-0000-4000-8000-000000000105', '01C00000-0000-4000-8000-000000000001', 5, 'Capstone: Secure Notes App',       'Build and harden a client-side encrypted notes application end to end.',                             'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. CHAPTERS
-- ----------------------------------------------------------------------------

INSERT INTO chapters (id, module_id, position, name, description, status) VALUES
  ('01C00000-0000-4000-8000-000000000201', '01C00000-0000-4000-8000-000000000101', 1, 'Security Goals & Concepts',          'The CIA triad and what cryptography is for.',             'PUBLISHED'),
  ('01C00000-0000-4000-8000-000000000202', '01C00000-0000-4000-8000-000000000101', 2, 'Historical Ciphers & Terminology',   'Classic ciphers, threat models, and modern definitions.', 'PUBLISHED'),
  ('01C00000-0000-4000-8000-000000000203', '01C00000-0000-4000-8000-000000000102', 1, 'AES & Block Cipher Modes',           'Symmetric ciphers, stream ciphers, and modes of operation.','PUBLISHED'),
  ('01C00000-0000-4000-8000-000000000204', '01C00000-0000-4000-8000-000000000102', 2, 'Hashing & Password Security',        'Hash functions, HMAC, and key derivation for passwords.', 'PUBLISHED'),
  ('01C00000-0000-4000-8000-000000000205', '01C00000-0000-4000-8000-000000000103', 1, 'RSA & Public-Key Encryption',        'Asymmetric key pairs and how RSA is used safely.',        'PUBLISHED'),
  ('01C00000-0000-4000-8000-000000000206', '01C00000-0000-4000-8000-000000000103', 2, 'Key Exchange & Digital Signatures', 'Diffie-Hellman and signatures for authenticity.',         'PUBLISHED'),
  ('01C00000-0000-4000-8000-000000000207', '01C00000-0000-4000-8000-000000000104', 1, 'Certificates & the PKI',             'The X.509 certificate and the chain of trust.',           'PUBLISHED'),
  ('01C00000-0000-4000-8000-000000000208', '01C00000-0000-4000-8000-000000000104', 2, 'TLS in Practice',                    'How TLS protects the web and how to configure it.',       'PUBLISHED'),
  ('01C00000-0000-4000-8000-000000000209', '01C00000-0000-4000-8000-000000000105', 1, 'Building the Encryption Core',       'Design and implement the capstone encryption library.',   'PUBLISHED'),
  ('01C00000-0000-4000-8000-000000000210', '01C00000-0000-4000-8000-000000000105', 2, 'Hardening & Shipping',               'Harden the app and ship it with confidence.',             'PUBLISHED')
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 4. LESSONS  (id: 01C00000-…-0301 .. 0328)
-- ----------------------------------------------------------------------------

INSERT INTO lessons (id, chapter_id, position, name, description, type, status, access_type, xp_points, duration_minutes) VALUES
  ('01C00000-0000-4000-8000-000000000301', '01C00000-0000-4000-8000-000000000201', 1, 'What Is Cryptography?',                           'Understand the primitives that protect modern communication.',            'TEXT',  'PUBLISHED', 'FREE', 10,  6),
  ('01C00000-0000-4000-8000-000000000302', '01C00000-0000-4000-8000-000000000201', 2, 'The CIA Triad: Confidentiality, Integrity, Authenticity','Map security goals to the cryptographic tools that achieve them.',      'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01C00000-0000-4000-8000-000000000303', '01C00000-0000-4000-8000-000000000201', 3, 'Foundations of Cryptography Quiz',                 'Check your understanding of the core goals and definitions.',              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01C00000-0000-4000-8000-000000000304', '01C00000-0000-4000-8000-000000000202', 1, 'Historical Ciphers & Terminology',                 'Caesar, substitution, transposition, and the one-time pad.',               'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01C00000-0000-4000-8000-000000000305', '01C00000-0000-4000-8000-000000000202', 2, 'Threats, Attack Models & Kerckhoffs''s Principle',  'Model adversaries and learn why open designs win.',                        'TEXT',  'PUBLISHED', 'FREE', 10,  7),
  ('01C00000-0000-4000-8000-000000000306', '01C00000-0000-4000-8000-000000000202', 3, 'Ciphers & Threat Models Quiz',                     'Test your grasp of classic ciphers and cryptanalysis.',                    'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01C00000-0000-4000-8000-000000000307', '01C00000-0000-4000-8000-000000000203', 1, 'Symmetric Encryption & Stream Ciphers',            'One shared key for both directions of communication.',                     'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01C00000-0000-4000-8000-000000000308', '01C00000-0000-4000-8000-000000000203', 2, 'AES & Block Cipher Modes',                         'The workhorse cipher and the modes that make it safe.',                    'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01C00000-0000-4000-8000-000000000309', '01C00000-0000-4000-8000-000000000203', 3, 'Symmetric Encryption Quiz',                        'Verify your understanding of AES modes of operation.',                     'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01C00000-0000-4000-8000-000000000310', '01C00000-0000-4000-8000-000000000204', 1, 'Hash Functions & Their Properties',                'One-way digests for integrity and beyond.',                                'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01C00000-0000-4000-8000-000000000311', '01C00000-0000-4000-8000-000000000204', 2, 'HMAC, Password Storage & KDFs',                    'Keyed hashes and how modern systems store passwords.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01C00000-0000-4000-8000-000000000312', '01C00000-0000-4000-8000-000000000204', 3, 'Hashing & Passwords Quiz',                         'Check how well you understand integrity and key derivation.',              'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01C00000-0000-4000-8000-000000000313', '01C00000-0000-4000-8000-000000000205', 1, 'Public-Key Cryptography Fundamentals',             'Key pairs, their roles, and hybrid encryption.',                           'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01C00000-0000-4000-8000-000000000314', '01C00000-0000-4000-8000-000000000205', 2, 'RSA in Practice',                                  'Padding, sizes, and the rules for using RSA safely.',                      'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01C00000-0000-4000-8000-000000000315', '01C00000-0000-4000-8000-000000000205', 3, 'Public-Key Encryption Quiz',                       'Test your knowledge of asymmetric cryptography.',                           'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01C00000-0000-4000-8000-000000000316', '01C00000-0000-4000-8000-000000000206', 1, 'Diffie-Hellman Key Exchange',                      'Agree on a shared secret over an insecure channel.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01C00000-0000-4000-8000-000000000317', '01C00000-0000-4000-8000-000000000206', 2, 'Digital Signatures & Authenticity',                'Sign a digest to prove origin and non-repudiation.',                       'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01C00000-0000-4000-8000-000000000318', '01C00000-0000-4000-8000-000000000206', 3, 'Key Exchange & Signatures Quiz',                   'Check your skills at key agreement and signing.',                          'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01C00000-0000-4000-8000-000000000319', '01C00000-0000-4000-8000-000000000207', 1, 'Certificates & the Public Key Infrastructure',     'Bind public keys to identities with X.509.',                               'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01C00000-0000-4000-8000-000000000320', '01C00000-0000-4000-8000-000000000207', 2, 'Certificate Validation & Trust Anchors',           'The checks a client must pass before trusting a key.',                     'TEXT',  'PUBLISHED', 'FREE', 10,  9),
  ('01C00000-0000-4000-8000-000000000321', '01C00000-0000-4000-8000-000000000207', 3, 'Certificates & PKI Quiz',                          'Verify your understanding of the chain of trust.',                         'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01C00000-0000-4000-8000-000000000322', '01C00000-0000-4000-8000-000000000208', 1, 'TLS: The Handshake & Ciphersuites',                'How TLS establishes a secure, authenticated channel.',                     'TEXT',  'PUBLISHED', 'FREE', 10, 11),
  ('01C00000-0000-4000-8000-000000000323', '01C00000-0000-4000-8000-000000000208', 2, 'TLS Configuration & Vulnerabilities',              'Disable legacy, prefer TLS 1.3 and AEAD, and test your setup.',            'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01C00000-0000-4000-8000-000000000324', '01C00000-0000-4000-8000-000000000208', 3, 'HTTPS & TLS Quiz',                                 'Check your TLS configuration knowledge.',                                  'QUIZ',  'PUBLISHED', 'FREE', 15,  5),
  ('01C00000-0000-4000-8000-000000000325', '01C00000-0000-4000-8000-000000000209', 1, 'Capstone Overview & Architecture',                 'Design a client-side encrypted notes application.',                        'TEXT',  'PUBLISHED', 'FREE', 10,  8),
  ('01C00000-0000-4000-8000-000000000326', '01C00000-0000-4000-8000-000000000209', 2, 'Building the Encryption Core',                     'Implement key derivation, AEAD encryption, and tag verification.',         'TEXT',  'PUBLISHED', 'FREE', 10, 12),
  ('01C00000-0000-4000-8000-000000000327', '01C00000-0000-4000-8000-000000000210', 1, 'Hardening the App & Audit Checklist',              'Harden the capstone and audit it like an attacker.',                       'TEXT',  'PUBLISHED', 'FREE', 10, 10),
  ('01C00000-0000-4000-8000-000000000328', '01C00000-0000-4000-8000-000000000210', 2, 'Final Assessment',                                 'Prove what you learned across the whole course.',                          'QUIZ',  'PUBLISHED', 'FREE', 30, 10)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 5. LESSON CONTENTS  (19 TEXT lessons, id: 01C00000-…-0401 .. 0419)
--    Content = self-contained HTML doc with inline (scoped) CSS.
-- ----------------------------------------------------------------------------

INSERT INTO lesson_contents (id, lesson_id, position, name, content) VALUES
(
  '01C00000-0000-4000-8000-000000000401',
  '01C00000-0000-4000-8000-000000000301',
  1,
  'What Is Cryptography?',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>What Is Cryptography?</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>What Is Cryptography?</h1>
  <p>Cryptography is the science of <strong>secure communication in the presence of adversaries</strong>. It is the mathematical toolbox that lets two parties talk privately, prove who they are, and detect any tampering with their messages.</p>
  <p>Far from a single trick, cryptography is a family of <em>primitives</em> — small, well-understood building blocks. The art is in choosing the right block and combining blocks without breaking their guarantees.</p>
  <h2>What does cryptography protect?</h2>
  <ul>
    <li><strong>Confidentiality</strong> — only the intended recipient can read the data.</li>
    <li><strong>Integrity</strong> — data has not been altered since it was created.</li>
    <li><strong>Authenticity</strong> — the data really came from the party who claims to sent it.</li>
    <li><strong>Non-repudiation</strong> — a sender cannot later deny having acted.</li>
  </ul>
  <h2>The primitives at a glance</h2>
  <table>
    <tr><th>Primitive</th><th>Primary service</th></tr>
    <tr><td>Symmetric cipher (AES, ChaCha20)</td><td>Confidentiality</td></tr>
    <tr><td>Hash function (SHA-256)</td><td>Integrity</td></tr>
    <tr><td>HMAC</td><td>Integrity + authenticity</td></tr>
    <tr><td>Digital signature</td><td>Authenticity + non-repudiation</td></tr>
    <tr><td>Key derivation function</td><td>Password storage, key generation</td></tr>
  </table>
  <div class="callout callout-info">
    <strong>Cryptography is not the same as security</strong>
    <p>A cryptographic lock is only as strong as where you put it and who holds the key. Strong algorithms around a stolen key are theater — design the system, too.</p>
  </div>
  <h2>Where you already rely on it</h2>
  <ul>
    <li><span class="ic">HTTPS</span> on every page you visit.</li>
    <li>Full-disk and file encryption on your laptop and phone.</li>
    <li>Password vaults and application logins.</li>
    <li>Code signing and software update verification.</li>
  </ul>
  <h2>A labeled pipeline</h2>
  <pre class="code-block">plaintext --encrypt(key)--&gt; ciphertext --decrypt(key)--&gt; plaintext
message   --hash()--&gt; digest          (integrity only)
message   --hmac(key)--&gt; tag          (integrity + authenticity)</pre>
  <h2>A brief vocabulary</h2>
  <ul>
    <li><strong>Plaintext</strong> — the readable message before encryption.</li>
    <li><strong>Ciphertext</strong> — the transformed, unreadable version.</li>
    <li><strong>Key</strong> — the secret value that drives the transformation.</li>
    <li><strong>Cryptanalysis</strong> — the study of breaking these systems.</li>
  </ul>
  <p>With these four terms you can read almost any security paper, RFC, or vendor datasheet without flinching. Throughout the course, whenever you see <span class="ic">encrypt()</span>, <span class="ic">hash()</span>, <span class="ic">hmac()</span>, or <span class="ic">sign()</span>, ask which of the goals above it serves — that habit is the course in one sentence.</p>
  <h2>How to study this course</h2>
  <p>Each module pairs two concept lessons with a quick quiz before moving on, and the capstone reassembles everything into one working app. Skim nothing: the quizzes are curated to catch exactly the details that matter in production.</p>
  <div class="callout callout-tip">
    <strong>Pick the goal first</strong>
    <p>In this course you will learn which primitive solves which problem — and, just as important, when combining primitives is still not enough.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000402',
  '01C00000-0000-4000-8000-000000000302',
  1,
  'The CIA Triad: Confidentiality, Integrity, Authenticity',
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>The CIA Triad: Confidentiality, Integrity, Authenticity</h1>
  <p>Every cryptographic algorithm exists to serve a small set of security goals. The classical trio is <strong>Confidentiality</strong>, <strong>Integrity</strong>, and <strong>Authenticity</strong> (the classic acronym &ldquo;CIA&rdquo;). Learn the goal, then the tool that serves it.</p>
  <h2>Confidentiality</h2>
  <p>Only the intended recipient can read the data. Encryption turns readable text into ciphertext that reveals nothing about the original without the key. Both symmetric and asymmetric encryption provide confidentiality.</p>
  <h2>Integrity</h2>
  <p>Integrity means detecting accidental or malicious modification. A <strong>hash</strong> produces a digest any party can recompute; a <strong>MAC</strong> does so using a secret key, so only key-sharing parties can produce a valid tag.</p>
  <p>The difference decides your deployment: use a MAC where both ends already share a secret, and signatures where the verifier is anyone — a storefront, a package manager, a browser.</p>
  <h2>Authenticity &amp; non-repudiation</h2>
  <p>Authenticity proves <em>who</em> created or sent something. Academic HMAC authenticates between parties that already share a key; digital signatures provide public, verifiable proof and carry non-repudiation — the signer cannot deny signing.</p>
  <h2>From goals to tools</h2>
  <table>
    <tr><th>Goal</th><th>Plain-language phrasing</th><th>Primitive</th></tr>
    <tr><td>Confidentiality</td><td>Only you can read it</td><td>AES-GCM, ChaCha20</td></tr>
    <tr><td>Integrity</td><td>It has not changed</td><td>SHA-256, BLAKE2</td></tr>
    <tr><td>Authenticity</td><td>It really came from this party</td><td>HMAC, signatures</td></tr>
    <tr><td>Non-repudiation</td><td>They cannot deny it</td><td>Ed25519, RSA-PSS</td></tr>
  </table>
  <h2>Thinking in guarantees</h2>
  <p>When a product claims it is &ldquo;secure.&rdquo; ask the sharper question: <em>which</em> guarantee, against <em>whom</em>, and for <em>how long</em>? Encryption alone still lets an attacker swap bytes you will never notice unless a keyed integrity check rides along with it.</p>
  <div class="callout">
    <strong>Availability completes the trio</strong>
    <p>The full classic CIA includes Availability: data keeps working when you need it. Cryptography rarely helps here — redundancy, backups, and monitoring do.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Name the goal out loud</strong>
    <p>Before choosing any tool, ask: exactly which goal am I protecting? The wrong primitive protects nothing, however strong it may be.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000404',
  '01C00000-0000-4000-8000-000000000304',
  1,
  'Historical Ciphers & Terminology',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Historical Ciphers & Terminology</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Historical Ciphers &amp; Terminology</h1>
  <p>Today&rsquo;s algorithms look nothing like the codes of antiquity, but old ciphers teach the essential vocabulary: <strong>plaintext</strong>, <strong>ciphertext</strong>, <strong>key</strong>, and <strong>cryptanalysis</strong>.</p>
  <h2>The Caesar cipher</h2>
  <p>The classic substitution cipher: every letter shifts by a fixed amount. It has at most 25 useful keys, and the letter frequencies of the source language survive intact — cryptanalysis breaks it in seconds.</p>
  <pre class="code-block">plaintext :  HELLO
shift = 3  :  KHOOR
shift = 25 :  GDKKN</pre>
  <h2>Substitution and transposition</h2>
  <ul>
    <li><strong>Substitution</strong> replaces elements of the message (letter for letter).</li>
    <li><strong>Transposition</strong> reorders elements without changing them.</li>
    <li>Both preserve the <em>frequency distribution</em> of characters — and that is their fatal flaw.</li>
  </ul>
  <p>Frequency analysis compares letter counts in the ciphertext against known statistics for the language and maps them back to plaintext.</p>
  <h2>Why frequency analysis works</h2>
  <p>Every language has stable letter-frequency curves. A pure substitution shuffles letters but preserves those frequencies, so an analyst matches the ciphertext distribution against the language&rsquo;s and solves the mapping in minutes.</p>
  <h2>The one-time pad</h2>
  <p>A truly random key as long as the message, used <em>exactly once</em>, yields information-theoretic security: the ciphertext is provably unbreakable. The impracticality is distributing and protecting the key material.</p>
  <table>
    <tr><th>Cipher</th><th>Type</th><th>Modern status</th></tr>
    <tr><td>Caesar</td><td>Substitution</td><td>Broken</td></tr>
    <tr><td>Vigen&egrave;re</td><td>Polyalphabetic</td><td>Broken</td></tr>
    <tr><td>One-time pad</td><td>Stream</td><td>Secure, impractical keys</td></tr>
    <tr><td>AES</td><td>Block (substitution + permutation)</td><td>Secure</td></tr>
  </table>
  <p>The one-time pad&rsquo;s spirit survives as a benchmark: modern stream ciphers stretch a short key into a pseudorandom keystream. The difference — the keystream is computed, not truly random — is precisely why keystream reuse is catastrophic.</p>
  <div class="callout">
    <strong>History is instructive, not a toolbox</strong>
    <p>Never build a system around substitution or transposition. They are teaching examples, not ingredients for real design.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Why size beats cleverness</strong>
    <p>The real lesson: a long, unpredictable key makes a cipher strong; short keys and key reuse make any design collapse.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000405',
  '01C00000-0000-4000-8000-000000000305',
  1,
  'Threats, Attack Models & Kerckhoffs''s Principle',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Threats, Attack Models & Kerckhoffs''s Principle</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Threats, Attack Models &amp; Kerckhoffs&rsquo;s Principle</h1>
  <p>A cipher is only meaningful against a <strong>defined adversary</strong>. You cannot reason about whether AES is &ldquo;enough&rdquo; until you say what the attacker can do, see, and own.</p>
  <h2>Kerckhoffs&rsquo;s principle</h2>
  <p>The system must remain secure even when everything about it — except the key — is public knowledge. Security by obscurity, hiding the algorithm instead, protects nothing: a leaked design collapses instantly, and open designs benefit from global review.</p>
  <p>Work the principle backward too: the moment a design depends on keeping an algorithm secret, it is <em>already</em> broken as a system — the secret will leak, and there is no layer of defense left behind it.</p>
  <div class="callout">
    <strong>Review is security</strong>
    <p>Public algorithms receive decades of adversarial review by thousands of cryptographers. A secret in-house cipher gets a handful of eyeballs — and a lifetime of embarrassment.</p>
  </div>
  <h2>Common threats</h2>
  <table>
    <tr><th>Threat</th><th>What the attacker does</th></tr>
    <tr><td>Eavesdropping</td><td>Reads messages they should not see</td></tr>
    <tr><td>Tampering</td><td>Alters messages in transit</td></tr>
    <tr><td>Impersonation</td><td>Pretends to be another party</td></tr>
    <tr><td>Replay</td><td>Resends a previously valid message</td></tr>
    <tr><td>Man-in-the-middle</td><td>Sits between two parties, relaying and editing traffic</td></tr>
  </table>
  <h2>Attack models</h2>
  <p>From weakest to strongest assumptions about what the attacker holds:</p>
  <ul>
    <li><strong>Ciphertext-only</strong> — the attacker sees only ciphertext.</li>
    <li><strong>Known-plaintext</strong> — the attacker has some plaintext/ciphertext pairs.</li>
    <li><strong>Chosen-plaintext</strong> — the attacker can encrypt chosen inputs.</li>
    <li><strong>Chosen-ciphertext</strong> — the attacker can also decrypt chosen inputs.</li>
  </ul>
  <p>Read the list as a ladder: a scheme that only survives the top rungs is decorative, while one that survives the bottom is real. Modern validated designs are tested against the strongest rung.</p>
  <div class="callout">
    <strong>Name the attacker before you name the cipher</strong>
    <p>&ldquo;AES-256&rdquo; answers nothing until you answer: who is the adversary, what do they already hold, and what may they do with it? That sentence is your threat model.</p>
  </div>
  <div class="callout callout-info">
    <strong>Strongest model wins</strong>
    <p>Modern standards demand security against chosen-ciphertext attacks. If a scheme survives that, it will certainly survive everything weaker.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Design for your attacker</strong>
    <p>When you build the capstone, write the threat model first — what can the attacker steal and do? — and let the primitives follow from it.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000407',
  '01C00000-0000-4000-8000-000000000307',
  1,
  'Symmetric Encryption & Stream Ciphers',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Symmetric Encryption & Stream Ciphers</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Symmetric Encryption &amp; Stream Ciphers</h1>
  <p>Symmetric (secret-key) encryption uses <strong>one key</strong> for both directions: the same key encrypts and decrypts. It is the workhorse for bulk data because it is orders of magnitude faster than asymmetric math.</p>
  <h2>How it works</h2>
  <pre class="code-block">key       = generate_random(32 bytes)   // 256-bit key
ciphertext = encrypt(key, plaintext)
plaintext  = decrypt(key, ciphertext)   // same key</pre>
  <h2>Stream ciphers</h2>
  <p>A stream cipher XORs the plaintext with a pseudorandom <strong>keystream</strong> produced from the key, one bit at a time. Simple and fast — but security collapses if any keystream material is reused.</p>
  <ul>
    <li><span class="ic">ChaCha20</span> — the modern recommended stream cipher.</li>
    <li><span class="ic">RC4</span> — historically pervasive, now fully broken; never use it.</li>
    <li>WEP and early TLS died on keystream-reuse mistakes. Reuse is unforgivable.</li>
  </ul>
  <h2>Why one long-lived key is not enough</h2>
  <p>A single key shared by everyone is a single point of collapse: one leak rewrites the whole history and leaves no way to recover. Real systems negotiate a fresh session key, then destroy it when the session ends.</p>
  <h2>Symmetric vs asymmetric at a glance</h2>
  <table>
    <tr><th>Property</th><th>Symmetric</th><th>Asymmetric</th></tr>
    <tr><td>Keys</td><td>One shared secret</td><td>Public + private pair</td></tr>
    <tr><td>Speed</td><td>Very fast</td><td>Slow</td></tr>
    <tr><td>Typical use</td><td>Bulk data encryption</td><td>Key exchange, signatures</td></tr>
  </table>
  <div class="callout">
    <strong>The catch: key distribution</strong>
    <p>Both parties must obtain the same secret without an adversary learning it. That is the hard problem — asymmetric cryptography (module three) exists largely to solve it.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Costs are not symmetric</strong>
    <p>Encrypting megabytes with AES-256 is almost free. Encrypting even hundreds of bytes with RSA is not. Hybrid designs use asymmetric math <em>once</em> and symmetric math <em>for the data</em>.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000408',
  '01C00000-0000-4000-8000-000000000308',
  1,
  'AES & Block Cipher Modes',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AES & Block Cipher Modes</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>AES &amp; Block Cipher Modes</h1>
  <p>AES (Advanced Encryption Standard) is the most studied cipher on Earth: selected by NIST in 2001 after a public competition, it encrypts <strong>128-bit blocks</strong> using keys of 128, 192, or 256 bits.</p>
  <h2>The single block is not the story</h2>
  <p>A block cipher encrypts one fixed-size block. Real data is many blocks — a <strong>mode of operation</strong> wires blocks together so the whole message is protected.</p>
  <h2>Modes of operation</h2>
  <table>
    <tr><th>Mode</th><th>Kind</th><th>Note</th></tr>
    <tr><td>ECB</td><td>Independent blocks</td><td>Identical blocks become identical ciphertext; leaks structure. Never use it.</td></tr>
    <tr><td>CBC</td><td>Chaining</td><td>Needs a unique IV and padding; vulnerable to padding-oracle attacks in legacy TLS.</td></tr>
    <tr><td>CTR</td><td>Stream-like</td><td>Turns AES into a stream; a unique nonce is mandatory, reuse is fatal.</td></tr>
    <tr><td>GCM</td><td>Authenticated (AEAD)</td><td>Confidentiality plus an integrity tag in one API. Prefer it.</td></tr>
  </table>
  <div class="callout">
    <strong>ECB is the penguin anti-pattern</strong>
    <p>The classic ECB picture: images with repeating regions stay visibly repeating after &ldquo;encryption.&rdquo; Whatever the key, structure survives — confidentiality is already lost.</p>
  </div>
  <h2>Size your attack surface</h2>
  <p>CBC without integrity lets an attacker flip chosen plaintext bits; CTR makes tampering trivial because a flipped ciphertext bit flips the same plaintext bit. Only an authenticated mode closes both doors at once.</p>
  <h2>The modern call looks like this</h2>
  <pre class="code-block">nonce      = random_bytes(12)
ciphertext = aes_gcm_encrypt(key, nonce, plaintext)  // returns (ciphertext, tag)
plaintext  = aes_gcm_decrypt(key, nonce, ciphertext, tag) // verify tag</pre>
  <p>Notice what is missing from the call: no padding machinery, no separate MAC plumbing. The mode returns integrity together with secrecy — which is why authenticated (AEAD) modes keep displacing CBC-plus-HMAC pairings in new designs.</p>
  <div class="callout callout-tip">
    <strong>Authenticated encryption is the default</strong>
    <p>Pick a combined mode — AES-GCM or ChaCha20-Poly1305 — so integrity is inseparable from confidentiality. Never reuse a nonce for the same key.</p>
  </div>
  <div class="callout callout-info">
    <strong>What GCM is doing</strong>
    <p>AES-GCM is CTR-mode encryption plus a GHASH authentication tag. One operation therefore delivers both confidentiality and integrity.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000410',
  '01C00000-0000-4000-8000-000000000310',
  1,
  'Hash Functions & Their Properties',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hash Functions & Their Properties</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Hash Functions &amp; Their Properties</h1>
  <p>A hash function maps an arbitrary-length input to a <strong>fixed-size digest</strong>. Good cryptographic hashes look like colored noise: every output bit is unpredictable from the input, and the mapping is one-way.</p>
  <h2>The four properties</h2>
  <ul>
    <li><strong>Deterministic</strong> — the same input always yields the same digest.</li>
    <li><strong>One-way</strong> — given a digest, recovering the input is infeasible.</li>
    <li><strong>Avalanche effect</strong> — changing one input bit flips roughly half the digest bits.</li>
    <li><strong>Collision-resistant</strong> — finding two inputs with the same digest is infeasible.</li>
  </ul>
  <h2>Where hashes earn their keep</h2>
  <ul>
    <li>Integrity checks for downloads, snapshots, and backups.</li>
    <li>Password storage — but only through a key derivation function, never alone.</li>
    <li>Content addressing in version control and content-addressable storage.</li>
    <li>Commitment schemes, deduplication, and fingerprinting.</li>
  </ul>
  <h2>Families and their status</h2>
  <table>
    <tr><th>Hash</th><th>Digest size</th><th>Status</th></tr>
    <tr><td>MD5</td><td>128 bits</td><td>Broken</td></tr>
    <tr><td>SHA-1</td><td>160 bits</td><td>Broken</td></tr>
    <tr><td>SHA-256 / SHA-512</td><td>256 / 512 bits</td><td>Recommended</td></tr>
    <tr><td>SHA-3</td><td>224-512 bits</td><td>Recommended</td></tr>
    <tr><td>BLAKE2</td><td>256 / 512 bits</td><td>Fast, recommended</td></tr>
  </table>
  <pre class="code-block">$ sha256sum backup.tar.gz
5f9a3e...2b41c7   backup.tar.gz   (compare against the published value)</pre>
  <p>The published value only helps if you trust its source. A checksum hosted beside the very files it guards is a paper tiger — fetch the expected digest from a separate, trusted channel.</p>
  <div class="callout callout-info">
    <strong>A hash does not hide content</strong>
    <p>Digests are public by design. And because hashing is fast, a bare hash of a password lets a GPU try billions of candidates per second — another reason passwords need KDFs, next lesson.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Verify, then trust</strong>
    <p>Use digests to verify downloads and artifacts you did not create yourself. Never rely on MD5 or SHA-1 for anything security-related.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000411',
  '01C00000-0000-4000-8000-000000000311',
  1,
  'HMAC, Password Storage & KDFs',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HMAC, Password Storage & KDFs</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>HMAC, Password Storage &amp; KDFs</h1>
  <p>A plain hash can be computed by anyone. A <strong>Message Authentication Code</strong> adds a secret key: only parties who share the key can create, or verify, a valid tag.</p>
  <h2>HMAC</h2>
  <p><span class="ic">HMAC</span> (Hash-based MAC) wraps a hash function with a key. The construction survives even weaknesses in the underlying hash and is the standard keyed-integrity primitive.</p>
  <pre class="code-block">tag = hmac_sha256(key, message)     // only key-sharers can verify</pre>
  <h2>Storing passwords</h2>
  <p>Never store plaintext, and never use a fast hash alone. The industry recipe: a <strong>unique random salt</strong> per user plus a <strong>slow, memory-hard KDF</strong>.</p>
  <h2>Choosing the work factor</h2>
  <p>Pick the largest cost your servers tolerate while keeping logins under about half a second, then raise it as hardware improves. Store the cost with each record so old accounts can be upgraded later.</p>
  <table>
    <tr><th>KDF</th><th>Memory-hard</th><th>Status</th></tr>
    <tr><td>PBKDF2</td><td>No</td><td>Acceptable, weak against GPUs</td></tr>
    <tr><td>bcrypt</td><td>Partially</td><td>Good</td></tr>
    <tr><td>scrypt</td><td>Yes</td><td>Good</td></tr>
    <tr><td>Argon2id</td><td>Yes</td><td>Recommended</td></tr>
  </table>
  <pre class="code-block">salt = random_bytes(16)                       // unique per user
hash = argon2id(password, salt, t=2, m=19456, p=1)
store: { salt, hash, params }</pre>
  <p>Why salt, and why one per user? Without it, identical passwords collapse to identical hashes: attackers spot duplicate victims in a leaked dump instantly and reuse precomputed tables against the weakest account.</p>
  <h2>Verifying a login</h2>
  <pre class="code-block">candidate = argon2id(input, salt, params)
ok = constant_time_equal(candidate, stored_hash)   // fixed-time compare</pre>
  <div class="callout">
    <strong>&ldquo;Hash the password&rdquo; means a KDF</strong>
    <p>Using SHA-256 for passwords lets attackers hash billions of candidates per second. A work factor tuned so one attempt takes hundreds of milliseconds turns that superpower into a crawl.</p>
  </div>
  <div class="callout callout-tip">
    <strong>You will reuse this in the capstone</strong>
    <p>The same KDF idea does double duty: derive a strong 256-bit encryption key from a passphrase, and let the salt + params ride alongside every stored record.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000413',
  '01C00000-0000-4000-8000-000000000313',
  1,
  'Public-Key Cryptography Fundamentals',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Public-Key Cryptography Fundamentals</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Public-Key Cryptography Fundamentals</h1>
  <p>Asymmetric (public-key) cryptography works with a <strong>mathematically linked pair of keys</strong>: a <em>public</em> key anyone can know, and a <em>private</em> key only the owner holds. The magic is that knowing the public key reveals nothing usable about the private one.</p>
  <h2>Two keys, two roles</h2>
  <table>
    <tr><th>Operation</th><th>Key used</th></tr>
    <tr><td>Encrypt a message to a recipient</td><td>Recipient&rsquo;s public key</td></tr>
    <tr><td>Decrypt that message</td><td>Recipient&rsquo;s private key</td></tr>
    <tr><td>Sign a message</td><td>Signer&rsquo;s private key</td></tr>
    <tr><td>Verify a signature</td><td>Signer&rsquo;s public key</td></tr>
  </table>
  <h2>Why keys sizes differ so wildly</h2>
  <table>
    <tr><th>Symmetric (bits)</th><th>Equivalent RSA (bits)</th><th>ECC (bits)</th></tr>
    <tr><td>128</td><td>3072</td><td>256</td></tr>
    <tr><td>256</td><td>15360</td><td>512</td></tr>
  </table>
  <p>The security classes differ: RSA leans on factoring big integers, ECC on elliptic-curve discrete logarithms — each needs far larger keys than symmetric schemes.</p>
  <h2>Hybrid encryption — how it really happens</h2>
  <p>Real systems do <em>not</em> RSA-encrypt megabytes. They exchange a symmetric session key with one small asymmetric operation, then encrypt the data body with AES-GCM. One asymmetric step, gigabytes of cheap symmetric math.</p>
  <h2>One concrete envelope</h2>
  <p>Alice generates a fresh random AES key, encrypts the data with AES-GCM, then wraps the AES key under Bob&rsquo;s public key. Bob unwraps the key with his private key and decrypts. The same envelope powers PGP, S/MIME, and every TLS session.</p>
  <div class="callout callout-info">
    <strong>A public key is not an identity</strong>
    <p>Anyone can generate a key pair claiming any name. Proving which public key belongs to which identity is the entire job of certificates — module four.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Separate your keys</strong>
    <p>Keep encryption keys and signing keys distinct. Compromise of one duty must never reach the other.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000414',
  '01C00000-0000-4000-8000-000000000314',
  1,
  'RSA in Practice',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RSA in Practice</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>RSA in Practice</h1>
  <p>RSA rests on the practical difficulty of <strong>factoring the product of two large primes</strong>. It is one of the oldest public-key schemes still in wide use — and one of the easiest to misuse.</p>
  <h2>The math in one paragraph</h2>
  <p>Choose two large primes <span class="ic">p</span> and <span class="ic">q</span>; let the modulus be <span class="ic">n = p &times; q</span>. Pick a public exponent <span class="ic">e</span>; the private exponent <span class="ic">d</span> is its modular inverse. Security rests on nobody being able to factor <span class="ic">n</span> back into <span class="ic">p</span> and <span class="ic">q</span>.</p>
  <h2>Padding — never &ldquo;textbook RSA&rdquo;</h2>
  <p>Raising the raw message to the power <span class="ic">e</span> leaks structure and enables many chosen-ciphertext attacks. Encrypt with <strong>RSA-OAEP</strong>; sign with <strong>RSA-PSS</strong>. Both are randomized and proven constructions.</p>
  <p>The padding is not optional dressing: it randomizes, so the same plaintext never encrypts identically twice, and it hardens against low-exponent and chosen-ciphertext tricks.</p>
  <h2>Sizing your keys</h2>
  <table>
    <tr><th>Key bits</th><th>Purpose</th><th>Note</th></tr>
    <tr><td>2048</td><td>Laboratory and legacy interop</td><td>Deprecated minimum</td></tr>
    <tr><td>3072</td><td>Production default</td><td>Roughly &ldquo;128-bit&rdquo; strength</td></tr>
    <tr><td>4096</td><td>High-assurance environments</td><td>Slower handshakes</td></tr>
  </table>
  <div class="callout">
    <strong>Never implement RSA arithmetic yourself</strong>
    <p>Side channels hide in textbook math. Use audited libraries — OpenSSL, WebCrypto, or libsodium-style wrappers — and keep their default padding.</p>
  </div>
  <pre class="code-block">openssl genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:3072 -out key.pem</pre>
  <p>Treat key size like a warranty: it must outlive the data it protects. 2048 is the floor for legacy interop, 3072 the working default (roughly 128-bit symmetric strength), and 4096 only where the data&rsquo;s lifetime justifies slower handshakes.</p>
  <div class="callout callout-tip">
    <strong>Prefer ECC unless forced</strong>
    <p>For new work, elliptic-curve keys (P-256, Ed25519) are smaller, faster, and equally strong. Reaching for RSA usually means a legacy compat constraint.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000416',
  '01C00000-0000-4000-8000-000000000316',
  1,
  'Diffie-Hellman Key Exchange',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Diffie-Hellman Key Exchange</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Diffie-Hellman Key Exchange</h1>
  <p>Two parties need a shared secret to start symmetric encryption — but any message they send can be read by Eve, and they have no prior secret. This is the classic <strong>key distribution problem</strong>.</p>
  <h2>The elegant trick</h2>
  <p>Diffie-Hellman lets each party combine their own secret with the other&rsquo;s public value to arrive at the <em>same</em> shared secret. Eve watches the whole exchange and still cannot reconstruct it.</p>
  <pre class="code-block">a  = alice_secret     (big random number)
A  = g^a mod p        (public)
b  = bob_secret       (big random number)
B  = g^b mod p        (public)
shared = B^a mod p    ==    A^b mod p     // same secret, both sides</pre>
  <h2>Static vs ephemeral</h2>
  <table>
    <tr><th>Kind</th><th>Property</th></tr>
    <tr><td>Static DH</td><td>Same key material reused; no forward secrecy</td></tr>
    <tr><td>Ephemeral (DHE)</td><td>Fresh keys every session; forward secrecy</td></tr>
  </table>
  <h2>The flaw you must respect</h2>
  <p>Raw DH is passively secure but <strong>actively vulnerable to man-in-the-middle</strong>: without authentication, Eve can negotiate one secret with Alice and another with Bob. Authentication — certificates — is what closes this hole.</p>
  <div class="callout">
    <strong>Key exchange alone is not enough</strong>
    <p>Never run DH in production without authenticating the other end. It answers &ldquo;how do we get a shared secret?&rdquo; but not &ldquo;who am I even sharing it with?&rdquo;</p>
  </div>
  <h2>The one-way door</h2>
  <p>Modular exponentiation is cheap forward but intractable backward: watching <span class="ic">g^a mod p</span> and <span class="ic">g^b mod p</span> gives Eve no usable shortcut to either secret. That asymmetry is the engine of the exchange.</p>
  <div class="callout callout-tip">
    <strong>Forward secrecy by default</strong>
    <p>In TLS 1.3 an ephemeral (EC)DHE exchange happens on every connection, so keys are discarded after each session — recording traffic today stays secret even if long-term keys leak tomorrow.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000417',
  '01C00000-0000-4000-8000-000000000317',
  1,
  'Digital Signatures & Authenticity',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Digital Signatures & Authenticity</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Digital Signatures &amp; Authenticity</h1>
  <p>A digital signature answers two questions at once: <strong>who sent this?</strong> and <strong>is it exactly what they sent?</strong> A valid signature proves both.</p>
  <h2>How signing works</h2>
  <ol>
    <li>Hash the message to produce a fixed-size digest.</li>
    <li>Sign the <em>digest</em> with the signer&rsquo;s private key.</li>
    <li>Send the message together with the signature.</li>
    <li>The verifier recomputes the digest and checks it against the signer&rsquo;s public key.</li>
  </ol>
  <pre class="code-block">digest   = sha256(message)
signature = sign_with_private(private_key, digest)
valid     = verify_with_public(public_key, digest, signature)</pre>
  <pre class="code-block">$ openssl dgst -sha256 -sign private.pem note.txt &gt; sig.bin
$ openssl dgst -sha256 -verify public.pem -signature sig.bin note.txt
Verified OK</pre>
  <h2>What a signature provides</h2>
  <table>
    <tr><th>Service</th><th>Meaning</th></tr>
    <tr><td>Integrity</td><td>Any change to the message invalidates the signature</td></tr>
    <tr><td>Authenticity</td><td>Only the private-key holder could have produced it</td></tr>
    <tr><td>Non-repudiation</td><td>The holder cannot deny having signed</td></tr>
  </table>
  <p>Because the signature binds to exactly those bytes, editing a single character flips verification to false. That binding is the bedrock of supply-chain trust for packages, images, and firmware.</p>
  <h2>Algorithm families</h2>
  <ul>
    <li><span class="ic">RSA-PSS</span> — probabilistic, standardized, still widespread.</li>
    <li><span class="ic">ECDSA</span> — elliptic-curve based, compact signatures.</li>
    <li><span class="ic">EdDSA</span> (Ed25519) — modern, fast, constant-time friendly; the preferred choice for new designs.</li>
  </ul>
  <div class="callout">
    <strong>A signature is not encryption</strong>
    <p>Signing a plaintext message leaves it perfectly readable by anyone. Signatures prove origin and integrity — never secrecy.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Why sign a digest?</strong>
    <p>Hash-then-sign keeps signatures small and fast while still binding to every bit of the message. This is why schemes sign the hash, not the whole file.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000419',
  '01C00000-0000-4000-8000-000000000319',
  1,
  'Certificates & the Public Key Infrastructure',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Certificates & the Public Key Infrastructure</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Certificates &amp; the Public Key Infrastructure</h1>
  <p>A public key alone proves nothing about identity — anyone can mint a key claiming your name. The <strong>Public Key Infrastructure (PKI)</strong> wraps keys in signed certificates so identities can be verified by strangers.</p>
  <h2>The X.509 certificate</h2>
  <ul>
    <li><strong>Subject</strong> — the identity the key belongs to (a domain, a user, a device).</li>
    <li><strong>Public key</strong> — the actual key material being certified.</li>
    <li><strong>Issuer</strong> — the authority that vouches for the binding.</li>
    <li><strong>Validity period</strong> — explicit start and end dates.</li>
    <li><strong>Key usage</strong> — what the key may be used for.</li>
    <li><strong>Signature</strong> — the issuer&rsquo;s signature over all of the above.</li>
  </ul>
  <h2>The chain of trust</h2>
  <p>A root CA&rsquo;s self-signed certificate lives in your trust store. The root signs intermediate CAs, which sign leaf (server) certificates. Your client walks the chain back to an anchor it already believes.</p>
  <pre class="code-block">leaf certificate  (example.com)
    signed-by: intermediate CA
        signed-by: root CA     &lt;-- pre-installed in the trust store</pre>
  <p>Chains keep the root private key offline: a compromised intermediate can be revoked and reissued without ever touching the anchors already trusted by countless devices.</p>
  <h2>Actors and roles</h2>
  <table>
    <tr><th>Entity</th><th>Role</th></tr>
    <tr><td>Root CA</td><td>Ultimate trust anchor</td></tr>
    <tr><td>Intermediate CA</td><td>Issues leaf certificates at scale</td></tr>
    <tr><td>Leaf certificate</td><td>The server or client identity</td></tr>
    <tr><td>Client</td><td>Validates the chain before trusting</td></tr>
  </table>
  <div class="callout">
    <strong>Self-signed is not invalid — it is just not vetted</strong>
    <p>A self-signed certificate is honest about being its own root. Fine for testing; dangerous when an application silently accepts one in production.</p>
  </div>
  <div class="callout callout-info">
    <strong>PKI at scale</strong>
    <p>Let&rsquo;s Encrypt issues free certificates through short-lived intermediate chains, making deployed PKI practical for nearly everyone on the web.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000420',
  '01C00000-0000-4000-8000-000000000320',
  1,
  'Certificate Validation & Trust Anchors',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Certificate Validation & Trust Anchors</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Certificate Validation &amp; Trust Anchors</h1>
  <p>Trusting a certificate is a <strong>checklist</strong>, not a vibe. Clients must run every check in sequence; a single failure means the connection must be rejected.</p>
  <h2>The validation checklist</h2>
  <ol>
    <li><strong>Chain</strong> — each signature in the chain verifies up to a trust anchor.</li>
    <li><strong>Validity dates</strong> — now must lie inside the certificate&rsquo;s period.</li>
    <li><strong>Revocation</strong> — not listed on a CRL and not flagged by OCSP.</li>
    <li><strong>Hostname</strong> — the name matches the subject alternative names.</li>
    <li><strong>Key usage</strong> — the key is permitted to do this operation.</li>
  </ol>
  <table>
    <tr><th>Check</th><th>What it stops</th></tr>
    <tr><td>Chain + signatures</td><td>Forged or substitution certificates</td></tr>
    <tr><td>Validity dates</td><td>Expired or not-yet-valid keys</td></tr>
    <tr><td>Revocation status</td><td>Compromised or retired keys</td></tr>
    <tr><td>Hostname match</td><td>Man-in-the-middle on that name</td></tr>
    <tr><td>Key usage</td><td>Keys used outside their purpose</td></tr>
  </table>
  <h2>Validation as code</h2>
  <pre class="code-block">for each cert in the chain:
    verify its signature against the issuer  -> else reject
    check the validity window                -> else reject
    check revocation status                  -> else reject
hostname must match the subject alternative names
key usage must permit this operation</pre>
  <p>That is the whole job. Lean on a mature validation library so no step is skipped by hand — partial validation is no validation.</p>
  <h2>Common failure modes</h2>
  <ul>
    <li>Expired certificates caught only when clients start complaining.</li>
    <li>Name mismatch — connecting by IP when the certificate names a host.</li>
    <li>Self-signed leaves silently accepted inside mobile apps.</li>
    <li>Hidden clock skew on servers making everything "expired."</li>
  </ul>
  <div class="callout">
    <strong>Encrypted is not authenticated</strong>
    <p>Encryption alone turns your traffic into a secret you are sharing with an unknown party. Validation is what turns a random key into the server you actually meant to reach.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Pin sparingly, rotate deliberately</strong>
    <p>Certificate pinning adds resilience against rogue CAs but creates brittleness. If you pin, schedule rotation and add backup pins from day one.</p>
  </div>
  <div class="callout callout-info">
    <strong>OCSP stapling</strong>
    <p>The server attaches its freshness-checked revocation status directly to the handshake — one fewer round trip and no extra queries.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000422',
  '01C00000-0000-4000-8000-000000000322',
  1,
  'TLS: The Handshake & Ciphersuites',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TLS: The Handshake & Ciphersuites</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>TLS: The Handshake &amp; Ciphersuites</h1>
  <p>TLS (Transport Layer Security) is the protocol behind <span class="ic">https://</span>. It packages everything you have learned — authenticated key exchange, AEAD encryption, certificate validation — into one negotiated session.</p>
  <h2>The handshake at a glance</h2>
  <ol>
    <li>Client advertises supported versions and a client random.</li>
    <li>Server picks a ciphersuite and sends its certificate chain.</li>
    <li>Both sides run an (EC)DHE key exchange to derive session keys.</li>
    <li>The client validates the chain and both sides send &ldquo;Finished.&rdquo;</li>
    <li>Application data flows under an AEAD cipher.</li>
  </ol>
  <h2>TLS 1.2 vs 1.3</h2>
  <table>
    <tr><th>Thing</th><th>TLS 1.2</th><th>TLS 1.3</th></tr>
    <tr><td>Handshake round trips</td><td>Two</td><td>One</td></tr>
    <tr><td>Key exchange</td><td>RSA or (EC)DHE</td><td>(EC)DHE only</td></tr>
    <tr><td>Ciphers</td><td>Mixed CBC + AEAD</td><td>AEAD required</td></tr>
    <tr><td>Forward secrecy</td><td>Optional</td><td>Always</td></tr>
  </table>
  <div class="callout">
    <strong>Why forward secrecy is now required</strong>
    <p>With ephemeral DH, session keys are destroyed when the connection closes. Even if a server&rsquo;s long-term key leaks years later, recorded traffic stays unreadable. TLS 1.3 made this mandatory.</p>
  </div>
  <pre class="code-block">openssl s_client -connect example.com:443 -tls1_3 -brief</pre>
  <h2>Reading a ciphersuite name</h2>
  <p><span class="ic">TLS_AES_256_GCM_SHA384</span> packs three facts: the AEAD cipher (AES-256 in GCM) and the hash for the handshake transcript (SHA-384). Once you can decode one, an entire config file stops being alphabet soup.</p>
  <ul>
    <li><span class="ic">TLS_AES_128_GCM_SHA256</span> — the compact default most platforms ship first.</li>
    <li><span class="ic">TLS_CHACHA20_POLY1305_SHA256</span> — the fast software fallback on mobile-class CPUs.</li>
  </ul>
  <div class="callout callout-info">
    <strong>Authenticity comes from validation</strong>
    <p>The handshake is only trustworthy because the client validates the server&rsquo;s certificate chain — the checklist from the previous lesson.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Grow your defense with HSTS</strong>
    <p>Once you are confident in your chain, send the HSTS header so browsers refuse to ever connect over plain HTTP again.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000423',
  '01C00000-0000-4000-8000-000000000323',
  1,
  'TLS Configuration & Vulnerabilities',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TLS Configuration & Vulnerabilities</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>TLS Configuration &amp; Vulnerabilities</h1>
  <p>Enabling HTTPS is step one. Configuring it <em>correctly</em> is the rest — and the history of TLS is a museum of configuration mistakes.</p>
  <h2>Disable the legacy stack</h2>
  <ul>
    <li>SSL 2.0 and SSL 3.0 — cryptographically broken protocols.</li>
    <li>TLS 1.0 and 1.1 — deprecated; every modern client supports 1.2+.</li>
    <li>Cheap ciphers and modes — RC4, 3DES, CBC mode, RSA key transport.</li>
    <li>Compression — CRIME-style attacks recovered secrets from it.</li>
  </ul>
  <h2>A modern baseline</h2>
  <pre class="code-block">ssl_protocols TLSv1.2 TLSv1.3;
ssl_ciphersuites TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256;
ssl_ecdh_curve secp384r1;</pre>
  <p>Modern configs list only AEAD suites in the TLS 1.3 list; TLS 1.2 suites get pruned to AES-GCM and ChaCha20 variants.</p>
  <h2>Follow a generator, not memory</h2>
  <p>Use the Mozilla TLS configuration generator alongside the &ldquo;Intermediate&rdquo; and &ldquo;Modern&rdquo; profiles. They surface current best practice — suites, curves, and the protocol floor — in one reviewable diff.</p>
  <h2>Historic attacks worth knowing</h2>
  <table>
    <tr><th>Attack</th><th>Victim</th><th>Fix</th></tr>
    <tr><td>BEAST</td><td>TLS 1.0 CBC</td><td>Drop TLS 1.0</td></tr>
    <tr><td>POODLE</td><td>SSL 3.0</td><td>Drop SSL 3.0</td></tr>
    <tr><td>Heartbleed</td><td>OpenSSL memory bug</td><td>Patch and rotate keys</td></tr>
    <tr><td>SWEET32</td><td>3DES</td><td>Drop 3DES</td></tr>
  </table>
  <div class="callout callout-tip">
    <strong>Measure your setup</strong>
    <p>Run the SSL Labs Server Test or <span class="ic">testssl.sh</span> against your host. They grade protocol selection, suites, and chain problems in one scan.</p>
  </div>
  <div class="callout">
    <strong>Weakness rotates, never patch your way around it</strong>
    <p>Do not silently "fix" a legacy suite by stripping security elsewhere. Remove the weak offering and move on.</p>
  </div>
  <div class="callout callout-info">
    <strong>Configuration needs operations</strong>
    <p>Add certificate-expiry alerts to your monitoring stack — the strongest config in the world fails the day its certificate silently expires.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000425',
  '01C00000-0000-4000-8000-000000000325',
  1,
  'Capstone Overview & Architecture',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Capstone Overview & Architecture</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Capstone: A Secure Notes App</h1>
  <p>Time to apply everything. Your capstone is <strong>VaultNotes</strong>: a notes app that stores only ciphertext. The server holds salts, parameters, ciphertext, and authentication tags — and nothing else.</p>
  <h2>Architecture</h2>
  <table>
    <tr><th>Layer</th><th>Responsibility</th></tr>
    <tr><td>Client</td><td>KDF, AES-GCM encryption, tag verification</td></tr>
    <tr><td>Transport</td><td>HTTPS over TLS 1.3</td></tr>
    <tr><td>Server</td><td>Stores opaque records; never sees plaintext or keys</td></tr>
  </table>
  <h2>The threat model</h2>
  <p>If an attacker fully owns the server and steals every row of the database, they obtain random-looking bytes plus salted KDF parameters — nothing readable. This is <strong>client-side encryption</strong>.</p>
  <pre class="code-block">vault-notes/
  index.html
  crypto.js     // KDF + AES-GCM + HMAC (the only file with crypto)
  api.js        // HTTPS calls to the backend
  vault.js      // note CRUD over the in-memory plaintext model
  styles.css</pre>
  <h2>Deriving the one secret</h2>
  <p>Everything hinges on the passphrase and the KDF that stretches it. Follow OWASP&rsquo;s Argon2id guidance — memory around 64 MB, time cost above 2 — so offline guessing stays prohibitively expensive.</p>
  <div class="callout callout-info">
    <strong>The rule that keeps it client-side</strong>
    <p>The passphrase-derived key never leaves the browser. If the key ever ships to the server, the whole design collapses back into server-side secrecy.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Threat model before algorithms</strong>
    <p>Write the attacker scenario first — what can they steal, replay, forge, read? — and let the crypto choices follow. The order of design is not optional.</p>
  </div>
  <h2>Build order</h2>
  <ol>
    <li>KDF + AES-GCM core behind a clean <span class="ic">encrypt/decrypt</span> API.</li>
    <li>Vault CRUD in the browser over the in-memory plaintext model.</li>
    <li>HTTPS backend storing opaque records; lock down CORS, HSTS, and CSP.</li>
    <li>Run the audit checklist and prove the threat model holds.</li>
  </ol>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000426',
  '01C00000-0000-4000-8000-000000000326',
  1,
  'Building the Encryption Core',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Building the Encryption Core</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Building the Encryption Core</h1>
  <p>The core follows one rhythm: <strong>derive, encrypt, authenticate</strong>. Every part maps to a lesson you already covered.</p>
  <h2>1. Derive the key from the passphrase</h2>
  <pre class="code-block">const params = { t: 2, m: 19456, p: 1 };
const salt   = fresh_random(16);   // unique 16-byte salt per user
const key    = argon2id(passphrase, salt, params);  // 32-byte key</pre>
  <h2>2. Encrypt a note with AEAD</h2>
  <pre class="code-block">const nonce = freshRandom(12 bytes);              // unique per record
const [ciphertext, tag] = aes256gcmEncrypt(key, nonce, plaintext);
store: { version, salt, params, nonce, ciphertext, tag }</pre>
  <h2>3. Decrypt and verify the tag</h2>
  <pre class="code-block">const plaintext = aes256gcmDecrypt(key, nonce, ciphertext, tag);
// throws AuthError if the tag does not verify</pre>
  <h2>Hard rules for the core</h2>
  <ul>
    <li>A fresh 96-bit random nonce per record — never reuse one.</li>
    <li>Verify the tag <em>before</em> trusting a single byte of plaintext.</li>
    <li>Keep the derived key only in memory; clear it when the vault locks.</li>
    <li>Never serialize the key to disk, logs, or the URL.</li>
  </ul>
  <table>
    <tr><th>Mistake</th><th>Consequence</th></tr>
    <tr><td>Nonce reuse</td><td>Confidentiality destroyed across records</td></tr>
    <tr><td>No tag check</td><td>Tampered ciphertext silently accepted</td></tr>
    <tr><td>Fast hash for the key</td><td>Offline brute force of the passphrase</td></tr>
  </table>
  <p>The stored record is self-describing: version, salt, params, nonce, ciphertext, and tag travel together, so records stay decryptable even when parameters change later.</p>
  <div class="callout">
    <strong>Tag failure is an attack, not a quirk</strong>
    <p>If the tag does not verify, discard the record silently and log nothing sensitive. A failed authentication means an adversary changed bytes.</p>
  </div>
  <div class="callout callout-tip">
    <strong>Keep crypto in one file</strong>
    <p>Expose <span class="ic">encryptNote</span> and <span class="ic">decryptNote</span> only. The rest of the app never touches salts, nonces, or key bytes.</p>
  </div>
  <div class="callout callout-info">
    <strong>Version everything</strong>
    <p>Store the algorithm version and parameters with every record so future migrations can open old records and new records stay compatible. A format without a version is a time bomb.</p>
  </div>
</div>
</body>
</html>
$html$
),
(
  '01C00000-0000-4000-8000-000000000427',
  '01C00000-0000-4000-8000-000000000327',
  1,
  'Hardening the App & Audit Checklist',
  $html$
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Hardening the App & Audit Checklist</title>
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
.dark .lesson-page .ic { background: #312e81; color: #c7d2fe; }
.dark .lesson-page .callout { background: #312e81; border-left-color: #818cf8; }
.dark .lesson-page .callout-info { background: #0c4a6e; border-left-color: #38bdf8; }
.dark .lesson-page .callout-tip { background: #14532d; border-left-color: #4ade80; }
.dark .lesson-page table th, .dark .lesson-page table td { border-color: #4b5563; }
.dark .lesson-page table th { background: #312e81; color: #c7d2fe; }
</style>
</head>
<body>
<div class="lesson-page">
  <h1>Hardening the App &amp; the Audit Checklist</h1>
  <p>A crypto core is done when it survives an adversarial review. Walk your capstone through each item below as if you were the attacker.</p>
  <h2>The security checklist</h2>
  <ul>
    <li><strong>AEAD everywhere</strong> — no mode but GCM or ChaCha20-Poly1305.</li>
    <li><strong>Per-record nonces</strong> — freshly random, never derived.</li>
    <li><strong>KDF with a tunable work factor</strong> — slow on purpose.</li>
    <li><strong>Constant-time authentication</strong> — compare tags in fixed time.</li>
    <li><strong>No sensitive logging</strong> — never keys, tags, or nonces.</li>
    <li><strong>HTTPS only</strong> — HSTS header, TLS 1.2+ enforced.</li>
    <li><strong>Strict CORS and CSP</strong> — the API refuses foreign origins.</li>
    <li><strong>Pinned dependencies</strong> — lock versions and audit updates.</li>
  </ul>
  <h2>The one-sheet audit</h2>
  <table>
    <tr><th>Question</th><th>Target</th></tr>
    <tr><td>Any plaintext record on the server?</td><td>No</td></tr>
    <tr><td>Nonce reused for the same key?</td><td>No</td></tr>
    <tr><td>Tag verified before use?</td><td>Yes</td></tr>
    <tr><td>Keys written to disk or logs?</td><td>No</td></tr>
    <tr><td>TLS 1.2+ enforced at the edge?</td><td>Yes</td></tr>
  </table>
  <h2>Constant time is a real requirement</h2>
  <pre class="code-block">const ok = constant_time_equal(receivedTag, computedTag);
if (!ok) throw new AuthError('authentication failed');</pre>
  <p>Recovery is part of security: rehearse restoring a vault onto a fresh device, and keep a backup that the app can decrypt without ever shipping the passphrase.</p>
  <div class="callout">
    <strong>Timing is an information leak</strong>
    <p>An early-exit compare tells an attacker byte-by-byte whether they guessed right. Compare every tag in constant time — always.</p>
  </div>
  <p>Before you ship, rehearse rotation: generate a new passphrase, re-encrypt a test vault, and confirm the old ciphertext becomes unreadable. Recovery that only works in theory is not recovery.</p>
  <div class="callout callout-tip">
    <strong>Hunt like an attacker</strong>
    <p>Steal the database, pull the logs, grab the client bundle — then ask: is <em>anything</em> there useful alone? The answer must be no.</p>
  </div>
  <div class="callout callout-info">
    <strong>Verify, then trust</strong>
    <p>Ship the hardening pass, re-run the integrity checks, and rotate nothing ad hoc. Predictable, audited deployments beat clever improvisation.</p>
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
  ('01C00000-0000-4000-8000-000000000501', '01C00000-0000-4000-8000-000000000303',
   'Which security goal does encryption primarily deliver?',
   'Encryption keeps data unreadable to anyone without the key — confidentiality.', 1),
  ('01C00000-0000-4000-8000-000000000502', '01C00000-0000-4000-8000-000000000303',
   'Which term describes protection against data being altered in transit?',
   'Integrity ensures data has not been modified since it was created.', 2),
  ('01C00000-0000-4000-8000-000000000503', '01C00000-0000-4000-8000-000000000303',
   'Which combination is described as authenticated encryption?',
   'An AEAD scheme pairs confidentiality with an authentication tag.', 3),
  ('01C00000-0000-4000-8000-000000000504', '01C00000-0000-4000-8000-000000000306',
   'Which cipher is a simple substitution cipher from antiquity?',
   'The Caesar cipher shifts letters by a fixed amount.', 1),
  ('01C00000-0000-4000-8000-000000000505', '01C00000-0000-4000-8000-000000000306',
   'What does Kerckhoffs''s principle state?',
   'Security must rest only on the secrecy of the key.', 2),
  ('01C00000-0000-4000-8000-000000000506', '01C00000-0000-4000-8000-000000000306',
   'Which attack tries every possible key until the correct one works?',
   'Brute force is an exhaustive search over the key space.', 3),
  ('01C00000-0000-4000-8000-000000000507', '01C00000-0000-4000-8000-000000000309',
   'In symmetric cryptography, what do both parties share?',
   'A single secret key encrypts and decrypts on both sides.', 1),
  ('01C00000-0000-4000-8000-000000000508', '01C00000-0000-4000-8000-000000000309',
   'Which candidate is a block cipher?',
   'AES processes fixed-size blocks through rounds of substitution and permutation.', 2),
  ('01C00000-0000-4000-8000-000000000509', '01C00000-0000-4000-8000-000000000309',
   'Which mode encrypts each block independently with the same key?',
   'ECB encrypts blocks separately, so identical blocks leak as identical ciphertext.', 3),
  ('01C00000-0000-4000-8000-000000000510', '01C00000-0000-4000-8000-000000000312',
   'Which property makes a hash change dramatically when any input bit changes?',
   'The avalanche effect spreads small input changes across the whole digest.', 1),
  ('01C00000-0000-4000-8000-000000000511', '01C00000-0000-4000-8000-000000000312',
   'Why store salted, slow KDF output instead of plaintext passwords?',
   'A KDF output cannot be reversed to recover the password, and the work factor slows brute force.', 2),
  ('01C00000-0000-4000-8000-000000000512', '01C00000-0000-4000-8000-000000000312',
   'What does a modern KDF like Argon2 or bcrypt add beyond a plain hash?',
   'A tunable work factor and per-user salt make each guess expensive.', 3),
  ('01C00000-0000-4000-8000-000000000513', '01C00000-0000-4000-8000-000000000315',
   'Which key do you use to encrypt a message intended for a recipient?',
   'The recipient''s public key encrypts; only their private key decrypts.', 1),
  ('01C00000-0000-4000-8000-000000000514', '01C00000-0000-4000-8000-000000000315',
   'Why are RSA keys far larger than AES keys at a comparable security level?',
   'RSA security depends on the hardness of factoring large integers, which demands big keys.', 2),
  ('01C00000-0000-4000-8000-000000000515', '01C00000-0000-4000-8000-000000000315',
   'Which operation uses the private key in an asymmetric scheme?',
   'Private keys decrypt and sign; public keys encrypt and verify.', 3),
  ('01C00000-0000-4000-8000-000000000516', '01C00000-0000-4000-8000-000000000318',
   'What does the Diffie-Hellman exchange accomplish?',
   'It lets two parties derive a shared secret over an insecure channel.', 1),
  ('01C00000-0000-4000-8000-000000000517', '01C00000-0000-4000-8000-000000000318',
   'What does a digital signature primarily prove?',
   'That the message came from the private key''s owner and was not altered.', 2),
  ('01C00000-0000-4000-8000-000000000518', '01C00000-0000-4000-8000-000000000318',
   'Why do schemes sign a digest rather than the whole message?',
   'A hash of the message is signed instead of the full text, keeping signatures small and fast.', 3),
  ('01C00000-0000-4000-8000-000000000519', '01C00000-0000-4000-8000-000000000321',
   'What binds a public key to an identity in an X.509 certificate?',
   'The issuing CA''s signature over the certificate data attests the binding.', 1),
  ('01C00000-0000-4000-8000-000000000520', '01C00000-0000-4000-8000-000000000321',
   'What is the role of a Certificate Authority?',
   'CAs verify identity and issue signed certificates that others can trust.', 2),
  ('01C00000-0000-4000-8000-000000000521', '01C00000-0000-4000-8000-000000000321',
   'Which check must a client pass before trusting a server certificate?',
   'It must chain to a trusted root, be unexpired and unrevoked, and match the hostname.', 3),
  ('01C00000-0000-4000-8000-000000000522', '01C00000-0000-4000-8000-000000000324',
   'What does an ephemeral (EC)DHE key exchange provide?',
   'Ephemeral keys give forward secrecy: old traffic cannot be decrypted later.', 1),
  ('01C00000-0000-4000-8000-000000000523', '01C00000-0000-4000-8000-000000000324',
   'Which guarantees does TLS provide as a whole?',
   'TLS supplies an authenticated, confidential channel with integrity.', 2),
  ('01C00000-0000-4000-8000-000000000524', '01C00000-0000-4000-8000-000000000324',
   'Why is certificate validation still required on an encrypted connection?',
   'Encryption alone does not prove the server''s identity.', 3),
  ('01C00000-0000-4000-8000-000000000525', '01C00000-0000-4000-8000-000000000328',
   'Which property means a signer cannot deny having signed a message?',
   'Non-repudiation ties the signature to the private key holder.', 1),
  ('01C00000-0000-4000-8000-000000000526', '01C00000-0000-4000-8000-000000000328',
   'Which of these provides the strongest modern protection for stored passwords?',
   'Argon2id is a memory-hard KDF designed specifically for password storage.', 2),
  ('01C00000-0000-4000-8000-000000000527', '01C00000-0000-4000-8000-000000000328',
   'Which mode offers both confidentiality and integrity (authenticated encryption)?',
   'GCM and ChaCha20-Poly1305 are authenticated-encryption modes.', 3),
  ('01C00000-0000-4000-8000-000000000528', '01C00000-0000-4000-8000-000000000328',
   'Recorded traffic cannot be decrypted after a session ends, even if the long-term key later leaks. Which property is this?',
   'Forward secrecy discards ephemeral session keys after each session.', 4),
  ('01C00000-0000-4000-8000-000000000529', '01C00000-0000-4000-8000-000000000328',
   'Where should a private key be stored?',
   'Private keys belong in secure key storage and must never be transmitted.', 5)
ON CONFLICT (id) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 7. QUIZ OPTIONS  (116 options)
--    Each question has 4 options; the position of the correct answer varies.
--    Q1 options 1001-1012 · Q2 1013-1024 · Q3 1025-1036 · Q4 1037-1048
--    Q5 1049-1060 · Q6 1061-1072 · Q7 1073-1084 · Q8 1085-1096 · Q9 1097-1116
-- ----------------------------------------------------------------------------

INSERT INTO quiz_options (id, quiz_id, text, is_correct, position) VALUES
  -- Q1 (501): confidentiality
  ('01C00000-0000-4000-8000-000000001001', '01C00000-0000-4000-8000-000000000501', 'Confidentiality', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001002', '01C00000-0000-4000-8000-000000000501', 'Integrity', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001003', '01C00000-0000-4000-8000-000000000501', 'Availability', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001004', '01C00000-0000-4000-8000-000000000501', 'Non-repudiation', FALSE, 4),
  -- Q1 (501)q2: integrity
  ('01C00000-0000-4000-8000-000000001005', '01C00000-0000-4000-8000-000000000502', 'Integrity', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001006', '01C00000-0000-4000-8000-000000000502', 'Anonymity', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001007', '01C00000-0000-4000-8000-000000000502', 'Latency', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001008', '01C00000-0000-4000-8000-000000000502', 'Throughput', FALSE, 4),
  -- Q1 (501)q3: authenticated encryption
  ('01C00000-0000-4000-8000-000000001009', '01C00000-0000-4000-8000-000000000503', 'Encryption plus a Message Authentication Code', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001010', '01C00000-0000-4000-8000-000000000503', 'Two independent hash functions', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001011', '01C00000-0000-4000-8000-000000000503', 'A digital signature plus a salt', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001012', '01C00000-0000-4000-8000-000000000503', 'A certificate and a CSR', FALSE, 4),
  -- Q2 (504): Caesar
  ('01C00000-0000-4000-8000-000000001013', '01C00000-0000-4000-8000-000000000504', 'Caesar cipher', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001014', '01C00000-0000-4000-8000-000000000504', 'AES', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001015', '01C00000-0000-4000-8000-000000000504', 'RSA', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001016', '01C00000-0000-4000-8000-000000000504', 'ChaCha20', FALSE, 4),
  -- Q2 (504)q2: Kerckhoffs
  ('01C00000-0000-4000-8000-000000001017', '01C00000-0000-4000-8000-000000000505', 'The design remains secure when only the key is secret', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001018', '01C00000-0000-4000-8000-000000000505', 'The algorithm itself must never be published', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001019', '01C00000-0000-4000-8000-000000000505', 'Keys must be changed hourly', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001020', '01C00000-0000-4000-8000-000000000505', 'Only government-approved ciphers are allowed', FALSE, 4),
  -- Q2 (504)q3: brute force
  ('01C00000-0000-4000-8000-000000001021', '01C00000-0000-4000-8000-000000000506', 'Brute force', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001022', '01C00000-0000-4000-8000-000000000506', 'Birthday attack', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001023', '01C00000-0000-4000-8000-000000000506', 'Side-channel attack', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001024', '01C00000-0000-4000-8000-000000000506', 'Phishing', FALSE, 4),
  -- Q3 (507): shared key
  ('01C00000-0000-4000-8000-000000001025', '01C00000-0000-4000-8000-000000000507', 'A single shared secret key', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001026', '01C00000-0000-4000-8000-000000000507', 'Two public keys', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001027', '01C00000-0000-4000-8000-000000000507', 'A certificate chain', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001028', '01C00000-0000-4000-8000-000000000507', 'A password hash only', FALSE, 4),
  -- Q3 (507)q2: block cipher
  ('01C00000-0000-4000-8000-000000001029', '01C00000-0000-4000-8000-000000000508', 'AES', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001030', '01C00000-0000-4000-8000-000000000508', 'SHA-256', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001031', '01C00000-0000-4000-8000-000000000508', 'HMAC', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001032', '01C00000-0000-4000-8000-000000000508', 'ECDSA', FALSE, 4),
  -- Q3 (507)q3: ECB
  ('01C00000-0000-4000-8000-000000001033', '01C00000-0000-4000-8000-000000000509', 'ECB', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001034', '01C00000-0000-4000-8000-000000000509', 'CBC', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001035', '01C00000-0000-4000-8000-000000000509', 'CTR', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001036', '01C00000-0000-4000-8000-000000000509', 'GCM', FALSE, 4),
  -- Q4 (510): avalanche
  ('01C00000-0000-4000-8000-000000001037', '01C00000-0000-4000-8000-000000000510', 'The avalanche effect', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001038', '01C00000-0000-4000-8000-000000000510', 'Salting', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001039', '01C00000-0000-4000-8000-000000000510', 'Padding', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001040', '01C00000-0000-4000-8000-000000000510', 'Streaming', FALSE, 4),
  -- Q4 (510)q2: password storage
  ('01C00000-0000-4000-8000-000000001041', '01C00000-0000-4000-8000-000000000511', 'Password hashes are not reversible', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001042', '01C00000-0000-4000-8000-000000000511', 'Hashes are shorter than passwords', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001043', '01C00000-0000-4000-8000-000000000511', 'Hashes compress disk usage', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001044', '01C00000-0000-4000-8000-000000000511', 'Hashes make login instant', FALSE, 4),
  -- Q4 (510)q3: KDF work factor
  ('01C00000-0000-4000-8000-000000001045', '01C00000-0000-4000-8000-000000000512', 'A configurable work factor that slows each attempt', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001046', '01C00000-0000-4000-8000-000000000512', 'A public-key pair for each user', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001047', '01C00000-0000-4000-8000-000000000512', 'A certificate issued by a CA', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001048', '01C00000-0000-4000-8000-000000000512', 'Compression of the plaintext', FALSE, 4),
  -- Q5 (513): encrypt with public
  ('01C00000-0000-4000-8000-000000001049', '01C00000-0000-4000-8000-000000000513', 'The recipient''s public key', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001050', '01C00000-0000-4000-8000-000000000513', 'The recipient''s private key', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001051', '01C00000-0000-4000-8000-000000000513', 'The sender''s private key', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001052', '01C00000-0000-4000-8000-000000000513', 'A public key from a shared database', FALSE, 4),
  -- Q5 (513)q2: RSA size
  ('01C00000-0000-4000-8000-000000001053', '01C00000-0000-4000-8000-000000000514', 'RSA hinges on factoring large integers', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001054', '01C00000-0000-4000-8000-000000000514', 'RSA stores the plaintext inside the key', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001055', '01C00000-0000-4000-8000-000000000514', 'AES requires asymmetric padding', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001056', '01C00000-0000-4000-8000-000000000514', 'RSA uses 256 rounds by design', FALSE, 4),
  -- Q5 (513)q3: private key use
  ('01C00000-0000-4000-8000-000000001057', '01C00000-0000-4000-8000-000000000515', 'Decryption and signing', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001058', '01C00000-0000-4000-8000-000000000515', 'Encryption for everyone', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001059', '01C00000-0000-4000-8000-000000000515', 'Hashing the session key', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001060', '01C00000-0000-4000-8000-000000000515', 'Compression of the ciphertext', FALSE, 4),
  -- Q6 (516): DH goal
  ('01C00000-0000-4000-8000-000000001061', '01C00000-0000-4000-8000-000000000516', 'Agrees on a shared secret without revealing it', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001062', '01C00000-0000-4000-8000-000000000516', 'Signs messages on behalf of the user', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001063', '01C00000-0000-4000-8000-000000000516', 'Encrypts files at rest', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001064', '01C00000-0000-4000-8000-000000000516', 'Compresses the handshake', FALSE, 4),
  -- Q6 (516)q2: signature purpose
  ('01C00000-0000-4000-8000-000000001065', '01C00000-0000-4000-8000-000000000517', 'Authenticity of the sender and integrity of the message', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001066', '01C00000-0000-4000-8000-000000000517', 'That the message is encrypted', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001067', '01C00000-0000-4000-8000-000000000517', 'That the file is compressed', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001068', '01C00000-0000-4000-8000-000000000517', 'That the sender was anonymous', FALSE, 4),
  -- Q6 (516)q3: sign the digest
  ('01C00000-0000-4000-8000-000000001069', '01C00000-0000-4000-8000-000000000518', 'A hash of the message is signed instead of the full text', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001070', '01C00000-0000-4000-8000-000000000518', 'The key is derived directly from the text', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001071', '01C00000-0000-4000-8000-000000000518', 'The message is padded to the key size', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001072', '01C00000-0000-4000-8000-000000000518', 'The signature stores the whole plaintext', FALSE, 4),
  -- Q7 (519): key binding
  ('01C00000-0000-4000-8000-000000001073', '01C00000-0000-4000-8000-000000000519', 'The CA''s digital signature over the certificate data', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001074', '01C00000-0000-4000-8000-000000000519', 'The certificate fingerprint alone', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001075', '01C00000-0000-4000-8000-000000000519', 'The subject''s email address', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001076', '01C00000-0000-4000-8000-000000000519', 'The server''s IP address only', FALSE, 4),
  -- Q7 (519)q2: CA role
  ('01C00000-0000-4000-8000-000000001077', '01C00000-0000-4000-8000-000000000520', 'Issues and signs certificates after verifying identity', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001078', '01C00000-0000-4000-8000-000000000520', 'Encrypts the internet backbone', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001079', '01C00000-0000-4000-8000-000000000520', 'Stores all password hashes', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001080', '01C00000-0000-4000-8000-000000000520', 'Rotates disk encryption keys', FALSE, 4),
  -- Q7 (519)q3: validation checks
  ('01C00000-0000-4000-8000-000000001081', '01C00000-0000-4000-8000-000000000521', 'Chains to a trusted root and matches the hostname', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001082', '01C00000-0000-4000-8000-000000000521', 'It is wrapped in a strong cipher', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001083', '01C00000-0000-4000-8000-000000000521', 'The server responds quickly', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001084', '01C00000-0000-4000-8000-000000000521', 'The page displays a lock icon', FALSE, 4),
  -- Q8 (522): forward secrecy
  ('01C00000-0000-4000-8000-000000001085', '01C00000-0000-4000-8000-000000000522', 'Forward secrecy', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001086', '01C00000-0000-4000-8000-000000000522', 'Certificate revocation', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001087', '01C00000-0000-4000-8000-000000000522', 'Faster hashing', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001088', '01C00000-0000-4000-8000-000000000522', 'Longer key lifetimes', FALSE, 4),
  -- Q8 (522)q2: TLS guarantees
  ('01C00000-0000-4000-8000-000000001089', '01C00000-0000-4000-8000-000000000523', 'Confidentiality, integrity, and server authentication', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001090', '01C00000-0000-4000-8000-000000000523', 'Compression and caching', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001091', '01C00000-0000-4000-8000-000000000523', 'Load balancing and failover', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001092', '01C00000-0000-4000-8000-000000000523', 'Account recovery and reset', FALSE, 4),
  -- Q8 (522)q3: validation still needed
  ('01C00000-0000-4000-8000-000000001093', '01C00000-0000-4000-8000-000000000524', 'Encryption alone does not prove the server''s identity', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001094', '01C00000-0000-4000-8000-000000000524', 'Certificates make traffic faster', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001095', '01C00000-0000-4000-8000-000000000524', 'Validation removes the need for keys', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001096', '01C00000-0000-4000-8000-000000000524', 'It compresses the handshake', FALSE, 4),
  -- Q9 (525): non-repudiation
  ('01C00000-0000-4000-8000-000000001097', '01C00000-0000-4000-8000-000000000525', 'Non-repudiation', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001098', '01C00000-0000-4000-8000-000000000525', 'Confidentiality', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001099', '01C00000-0000-4000-8000-000000000525', 'Availability', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001100', '01C00000-0000-4000-8000-000000000525', 'Plausible deniability', FALSE, 4),
  -- Q9 (525)q2: password KDF
  ('01C00000-0000-4000-8000-000000001101', '01C00000-0000-4000-8000-000000000526', 'Argon2id with a unique salt per user', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001102', '01C00000-0000-4000-8000-000000000526', 'MD5 with no salt', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001103', '01C00000-0000-4000-8000-000000000526', 'Plaintext in an encrypted column', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001104', '01C00000-0000-4000-8000-000000000526', 'SHA-1 of the username', FALSE, 4),
  -- Q9 (525)q3: AEAD mode
  ('01C00000-0000-4000-8000-000000001105', '01C00000-0000-4000-8000-000000000527', 'GCM', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001106', '01C00000-0000-4000-8000-000000000527', 'ECB', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001107', '01C00000-0000-4000-8000-000000000527', 'CBC without a MAC', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001108', '01C00000-0000-4000-8000-000000000527', 'Stream XOR', FALSE, 4),
  -- Q9 (525)q4: forward secrecy
  ('01C00000-0000-4000-8000-000000001109', '01C00000-0000-4000-8000-000000000528', 'Forward secrecy', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001110', '01C00000-0000-4000-8000-000000000528', 'Backward compatibility', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001111', '01C00000-0000-4000-8000-000000000528', 'Certificate pinning', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001112', '01C00000-0000-4000-8000-000000000528', 'Perfect compression', FALSE, 4),
  -- Q9 (525)q5: private key storage
  ('01C00000-0000-4000-8000-000000001113', '01C00000-0000-4000-8000-000000000529', 'In secure key storage, never transmitted', TRUE,  1),
  ('01C00000-0000-4000-8000-000000001114', '01C00000-0000-4000-8000-000000000529', 'In the client-side JavaScript bundle', FALSE, 2),
  ('01C00000-0000-4000-8000-000000001115', '01C00000-0000-4000-8000-000000000529', 'In an email to the administrator', FALSE, 3),
  ('01C00000-0000-4000-8000-000000001116', '01C00000-0000-4000-8000-000000000529', 'In a shared configuration file', FALSE, 4)
ON CONFLICT (id) DO NOTHING;