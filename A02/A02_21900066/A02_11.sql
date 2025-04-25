/*
  employee 테이블에서 부서별 직원 수를 계산한 뒤,
  직원 수가 200명 이상인 부서만 조회한다.
   GROUP BY department : 부서별로 그룹화하여 집계
  COUNT(*) AS 'num_employee' : 각 부서의 직원 수를 계산하고, 해당 값을 'num_employee'라는 별칭으로 표시
  HVING COUNT(*) >= 200 : 그룹화된 결과 중 직원 수가 200명 이상인 부서만 필터링
*/

SELECT department, COUNT(*) AS 'num_employee' FROM employee
GROUP BY department
HAVING COUNT(*) >= 200;
