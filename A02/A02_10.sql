/*
  employee 테이블에서 다음 조건을 만족하는 직원들의 생일 날짜 수(중복 제외)를 계산한다:
  생년월일의 월이 4월인 경우
  부서가 Management인 경우
  동일한 날짜에 태어난 직원이 여러 명 있어도 하루는 한 번만 계산된다. 
  4월 중 Management 부서 직원들의 생일이 존재하는 '서로 다른 날짜 수'를 answer 컬럼으로 출력한다.
*/

SELECT COUNT(DISTINCT DAY(birthdate)) AS answer
FROM employee
WHERE MONTH(birthdate) = 4
  AND department = 'Management';
