/*
  firstname 또는 lastname 중 하나라도 null이 아니고 빈 문자열이 아닌 승객의 수를 계산한다.
*/

SELECT COUNT(*) AS answer
FROM passenger
WHERE (firstname IS NOT NULL AND firstname <> '')
   OR (lastname IS NOT NULL  AND lastname <> '');