/*
   예약 기록이 한 번도 없는 승객의 이름과 성을 조회한다.
  passenger 테이블을 기준으로 booking 테이블과 LEFT JOIN을 수행하여 모든 승객 정보를 가져온다.
  WHERE 절에서 booking_id가 NULL인 경우만 필터링하여,
    예약 테이블에 연결되지 않은 승객, 즉 예약 내역이 없는 승객만 선택한다.
*/

SELECT
    p.firstname,
    p.lastname
FROM passenger AS p
         LEFT JOIN booking AS b ON p.passenger_id = b.passenger_id
WHERE b.booking_id IS NULL;
