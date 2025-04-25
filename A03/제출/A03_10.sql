/*
  JOIN을 통하여서
	teachers_course와 연결한다. 
    그리고 선생님의 이름을 오름차순으로 정렬한다. 

*/

SELECT t.teacher_name AS teacher_name
FROM teachers t
         JOIN teachers_courses tc ON t.teacher_id = tc.teacher_id
ORDER BY t.teacher_name ASC;
