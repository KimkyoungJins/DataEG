/*
courses 테이블에서 데이터를 선택함
teachers_courses 테이블에 없는 course_id만 필터링함
과목 이름을 오름차순으로 정렬함
*/

SELECT c.course_name AS course_name
FROM courses c
WHERE c.course_id NOT IN (SELECT course_id FROM teachers_courses)
ORDER BY c.course_name ASC;
