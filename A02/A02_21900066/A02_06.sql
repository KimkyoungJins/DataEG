/*
  flightschedule 테이블에서 토요일에만 운항하는 항공편을 조회한다.
  - saturday = 1 : 토요일 운항
  - 나머지 요일 = 0 : 토요일 외에는 운항하지 않음으로 해석한다. 
  해당 조건을 만족하는 항공편 중에서
  출발시간(departure)을 기준으로 내림차순 정렬한 하고
  상위 2개의 항공편의 출발시간과 편명(flightno)을 출력한다.
*/

SELECT departure, flightno FROM flightschedule
WHERE saturday = 1 AND
         saturday = 1 AND
         monday = 0 AND
         tuesday = 0 AND
         wednesday = 0 AND
         thursday = 0 AND
         friday = 0 AND
         sunday = 0
ORDER BY departure DESC
limit 2;
