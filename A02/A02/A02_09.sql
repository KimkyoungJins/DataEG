/*
employee 테이블에서 다음 조건을 모두 만족하는 직원 수를 계산한다
생년월일의 월(MONTH(birthdate))이 4월인 직원
부서가 Management인 직원
해당 조건을 만족하는 직원의 총 인원 수를 answer 컬럼으로 출력한다.
*/

SELECT COUNT(*) AS answer
FROM employee

WHERE MONTH(birthdate) = 4 AND
      department = 'Management'
;
