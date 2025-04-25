/*
  teachser_name을 출력하는데 
  
  courses 테이블에서 teacher_id가 비어있지 않은곳에
  속하지 않는 teacher_id를 NOT IN으로 구한다.
  그리고 오름차순으로 정리한다. 
*/

SELECT name AS teacher_name FROM teachers
WHERE teacher_id NOT IN (SELECT teacher_id FROM courses
                                           WHERE teacher_id IS NOT NULL)
ORDER BY name ASC;