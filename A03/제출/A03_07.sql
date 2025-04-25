/*
  이 또한 Course_name을 그룹으로 묶어서 
  HAVING을 통하여서 1이상인 것들을 찾아낸다.   
*/

SELECT course_name, COUNT(*) AS num_teachers FROM courses c
JOIN teachers t on c.teacher_id = t.teacher_id
GROUP BY c.course_name HAVING COUNT(*) > 1;