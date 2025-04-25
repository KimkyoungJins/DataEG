/*
  teachers 테이블과 teachers_courses 테이블을 조인하여 선생님별로 배정된 과목 수를 구함
그룹핑하여 각 선생님의 과목 수를 집계함
 과목 수가 2개 이상인 선생님만 선택함
 결과를 선생님 이름 오름차순으로 정렬함
*/

SELECT t.teacher_name AS teacher_name, COUNT(tc.course_id) AS num_courses
FROM teachers t
         JOIN teachers_courses tc ON t.teacher_id = tc.teacher_id
GROUP BY t.teacher_id, t.teacher_name
HAVING COUNT(tc.course_id) >= 2
ORDER BY t.teacher_name ASC;