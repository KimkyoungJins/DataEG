/*
    일본에 거주하며 성별이 여성인 승객 중에서,
  이메일 주소가 'ne.jp' 또는 'co.jp'로 끝나는 사람의
  국가명과 이메일 주소를 출력한다.
*/

SELECT country, emailaddress FROM passengerdetails
WHERE country = 'Japan' AND
    sex = 'w' AND
      emailaddress LIKE '%ne.jp'
   OR emailaddress LIKE '%co.jp';