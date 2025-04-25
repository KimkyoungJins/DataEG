/*
  t.name과 COUNT(*)를 통하여서 
  두 과목 이상을 맡은 선생님들의 이름과 숫자를 알려준다.
JOIN을 이용하여서 다른 테이블과의 연결성을 짓고
GROUP BY를 통하여서 겹치는 것들을 그룹화 한 뒤에 
HAVING으로 2개 이상인 값들을 고른다.   
  
*/

SELECT t.name, COUNT(*) AS num_courses FROM teachers t
JOIN courses c on t.teacher_id = c.teacher_id
GROUP BY c.teacher_id
HAVING COUNT(*) > 1;