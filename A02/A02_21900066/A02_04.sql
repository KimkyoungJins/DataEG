/*
  이름에 'airline'이라는 단어가 포함되지 않은 항공사의 iata 코드를 조회한다.
*/

SELECT airline.iata FROM airline
WHERE airlinename NOT LIKE '%airline%';
