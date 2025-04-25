/*
booking 테이블에서 좌석 정보(seat)가 없는 예약 건의 수를 계산한다.
  seat IS NULL : 좌석 정보가 NULL인 경우
  TRIM(seat) = '' : 공백만 입력되었거나 빈 문자열로 좌석 정보가 없는 경우를 위해서
  두 조건 중 하나라도 해당되는 경우를 모두 포함하여 COUNT(*)로 개수를 계산하고 answer라는 컬럼명으로 출력한다.
*/

SELECT COUNT(*) AS answer
FROM booking
WHERE seat IS NULL OR TRIM(seat) = '';