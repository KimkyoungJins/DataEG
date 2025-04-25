/*
  airport_geo에서 country 컬럼에서 URAINE 행의 개수를 찾는다
  */

SELECT COUNT(*) AS 'answer' FROM airport_geo
WHERE country = 'UKRAINE';