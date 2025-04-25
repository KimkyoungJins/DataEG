/*
  한 과목도 배정되지 않은 선생님을 찾기 위해서,
  teachers 테이블에서 teachers_name을 가져오는데 
 teachers_course에 없는 teachers_id를 가져오고
 오름차순으로 정렬한다. 
 
  
  
  
*/

SELECT t.teacher_name AS teacher_name
FROM teachers t
WHERE t.teacher_id NOT IN (SELECT teacher_id FROM teachers_courses)
ORDER BY t.teacher_name ASC;