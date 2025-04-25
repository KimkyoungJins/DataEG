/*
  KoreaAirlines가 보유한 Boeing 747 항공기의 총 수용 인원을 계산한다.
  airplane 테이블에서 항공기 정보를 가져오고,
  airline 테이블과 JOIN하여 항공사가 'Korea Airlines'인지 확인하며,
  airplane_type 테이블과 JOIN하여 항공기 유형이 'Boeing 747'인지 확인한다.
  조건을 만족하는 모든 항공기의 capacity 값을 SUM으로 합산하여 출력한다.
*/

SELECT SUM(a.capacity) AS capacity
FROM airplane a
         JOIN airline al ON a.airline_id = al.airline_id
         JOIN airplane_type at ON a.type_id = at.type_id
WHERE al.airlinename = 'Korea Airlines'
  AND at.identifier = 'Boeing 747';