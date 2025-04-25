/*
  teacher_id 가 NULL인 값을 통하여서
	course_name에 선생님이 없는값을
    오름차순으로 찾아낸다. 
*/
SELECT course_name FROM courses
WHERE teacher_id IS NULL
ORDER BY course_name ASC;