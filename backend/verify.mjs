import pgPool from "./src/config/database.js";

const { rows } = await pgPool.query(`
SELECT c.id AS course,
  (SELECT count(*) FROM modules m WHERE m.course_id=c.id) AS modules,
  (SELECT count(*) FROM chapters ch WHERE ch.module_id IN (SELECT id FROM modules WHERE course_id=c.id)) AS chapters,
  (SELECT count(*) FROM lessons l WHERE l.chapter_id IN (SELECT id FROM chapters WHERE module_id IN (SELECT id FROM modules WHERE course_id=c.id))) AS lessons,
  (SELECT count(*) FROM lessons l WHERE l.chapter_id IN (SELECT id FROM chapters WHERE module_id IN (SELECT id FROM modules WHERE course_id=c.id)) AND l.type='QUIZ') AS quiz_lessons,
  (SELECT count(*) FROM lesson_contents lc WHERE lc.lesson_id IN (SELECT id FROM lessons WHERE chapter_id IN (SELECT id FROM chapters WHERE module_id IN (SELECT id FROM modules WHERE course_id=c.id)))) AS contents,
  (SELECT count(*) FROM quizzes q WHERE q.lesson_id IN (SELECT id FROM lessons WHERE chapter_id IN (SELECT id FROM chapters WHERE module_id IN (SELECT id FROM modules WHERE course_id=c.id)))) AS quizzes,
  (SELECT count(*) FROM quiz_options qo WHERE qo.quiz_id IN (SELECT q.id FROM quizzes q WHERE q.lesson_id IN (SELECT id FROM lessons WHERE chapter_id IN (SELECT id FROM chapters WHERE module_id IN (SELECT id FROM modules WHERE course_id=c.id))))) AS options,
  (SELECT count(*) FROM course_objectives o WHERE o.course_id=c.id) AS objectives
FROM courses c
WHERE c.id::text LIKE '0%'
ORDER BY c.id
`);
console.log("New courses (prefix 0): expect 5/10/28/9/19/29/116/5");
console.table(rows);

const bad = rows.filter(r =>
  Number(r.modules) !== 5 || Number(r.chapters) !== 10 || Number(r.lessons) !== 28 ||
  Number(r.quiz_lessons) !== 9 || Number(r.contents) !== 19 || Number(r.quizzes) !== 29 ||
  Number(r.options) !== 116 || Number(r.objectives) !== 5);
console.log(bad.length === 0 ? "ALL OK" : "MISMATCHES:");
console.table(bad);

const totals = await pgPool.query(`SELECT count(*) AS total_courses FROM courses`);
console.log("total courses:", totals.rows[0].total_courses);

const opt = await pgPool.query(`SELECT count(*) FILTER (WHERE is_correct) AS true_opts, count(*) FILTER (WHERE NOT is_correct) AS false_opts FROM quiz_options`);
console.log("quiz options totals:", opt.rows[0]);

await pgPool.end();
