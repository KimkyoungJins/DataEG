/*
  employee 테이블에서 다음 조건을 만족하는 직원들의 급여, 이름, 급여를 조회한다:
  해당 직원의 급여가 전체 직원의 평균 급여보다 높은 경우
  해당 직원의 거주 국가(country)가 'Denmark'인 경우
   급여를 기준으로 내림차순 정렬하여 출력한다.
*/

SELECT salary, firstname, salary FROM employee
WHERE salary >
      (SELECT AVG(salary) FROM employee)
AND country = 'Denmark'
ORDER BY salary DESC;