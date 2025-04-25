/*
courses 테이블과 teachers_courses 테이블을 조인하여 각 과목별로 배정된 선생님 수를 계산함
각 과목에 배정된 선생님들을 집계함
한 과목에 2명 이상의 선생님이 배정된 과목만 선택함
결과를 과목 이름을 오름차순으로 정렬함

*/

SELECT c.course_name AS course_name, COUNT(tc.teacher_id) AS num_teachers
FROM courses c
         JOIN teachers_courses tc ON c.course_id = tc.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT(tc.teacher_id) > 1
ORDER BY c.course_name ASC;