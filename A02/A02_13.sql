/*
   다음 조건을 모두 만족하는 승객의 이름, 비행편 번호, 좌석 번호를 중복 없이 조회한다
  승객의 성(lastname)이 'Pinkney'인 경우
  승객의 이름(firstname)이 'A'로 시작하고 중간에 'D'를 포함하는 패턴 
  해당 승객이 탑승한 비행편의 출발일(departure)이 2015년 6월 30일인 경우
  passenger, booking, flight 테이블을 조인하여 필요한 정보를 가져온다.
*/

SELECT DISTINCT p.firstname, p.lastname, f.flightno, b.seat FROM passenger p
JOIN booking b ON p.passenger_id = b.passenger_id
JOIN flight f ON b.flight_id = f.flight_id

WHERE p.lastname = 'Pinkney' AND
    p.firstname LIKE 'A%D%' AND
    DATE(f.departure) = '2015-06-30';
