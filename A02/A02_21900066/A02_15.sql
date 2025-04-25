/*
    항공권 가격이 정확히 $1.00인 예약 건들 중,
  출발 공항이 위치한 국가별로 탑승자 수를 집계한다.
  booking 테이블에서 price가 1.00인 예약만 선택
  해당 예약의 flight_id를 통해 flight 테이블과 조인하여 비행 정보를 가져옴
  flight 테이블의 출발지(f.from)를 airport_geo 테이블과 연결하여 출발 국가를 확인
  국가별로 그룹화(한 뒤, COUNT(*)로 탑승자 수를 계산
  가장 많은 탑승자가 있는 국가부터 내림차순 정렬 후 상위 5개 국가만 조회
*/

SELECT
    ag.country,
    COUNT(*) AS n_passengers
FROM booking AS b
         JOIN flight AS f ON b.flight_id = f.flight_id
         JOIN airport_geo AS ag ON f.from = ag.airport_id
WHERE b.price = 1.00
GROUP BY ag.country
ORDER BY n_passengers DESC
LIMIT 5;