/*
  employee 테이블에서 생일이 4월(MONTH(birthdate) = 4)인 직원들의
  이름, 성, 생년월일을 조회한다.
  결과는 태어난 날짜(DAY 함수 기준)를 오름차순으로 정렬하여,
  4월 중 가장 이른 생일부터 출력되도록 한다.
*/

SELECT firstname, lastname, birthdate
FROM employee
WHERE MONTH(birthdate) = 4
ORDER BY DAY(birthdate) ASC;