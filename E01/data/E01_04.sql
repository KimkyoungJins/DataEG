SELECT *
FROM Bible

## 신약인 책들만 모아 놓는다.
WHERE book IN (
               'Matthew', 'Mark', 'Luke', 'John', 'Acts', 'Romans',
               '1 Corinthians', '2 Corinthians', 'Galatians', 'Ephesians',
               'Philippians', 'Colossians', '1 Thessalonians', '2 Thessalonians',
               '1 Timothy', '2 Timothy', 'Titus', 'Philemon',
               'Hebrews', 'James', '1 Peter', '2 Peter',
               '1 John', '2 John', '3 John', 'Jude', 'Revelation'
    )

  ## 그리고 텍스트에서 요셉이 있는 것
  AND text LIKE '%Joseph%'

## 출력 순서는 성경책 순서대로여야 한다.
ORDER BY
    ## CASE 명령어를 통하여서 성경 순서대로 정렬
    CASE book
    WHEN 'Matthew'          THEN 1
    WHEN 'Mark'             THEN 2
    WHEN 'Luke'             THEN 3
    WHEN 'John'             THEN 4
    WHEN 'Acts'             THEN 5
    WHEN 'Romans'           THEN 6
    WHEN '1 Corinthians'    THEN 7
    WHEN '2 Corinthians'    THEN 8
    WHEN 'Galatians'        THEN 9
    WHEN 'Ephesians'        THEN 10
    WHEN 'Philippians'      THEN 11
    WHEN 'Colossians'       THEN 12
    WHEN '1 Thessalonians'  THEN 13
    WHEN '2 Thessalonians'  THEN 14
    WHEN '1 Timothy'        THEN 15
    WHEN '2 Timothy'        THEN 16
    WHEN 'Titus'            THEN 17
    WHEN 'Philemon'         THEN 18
    WHEN 'Hebrews'          THEN 19
    WHEN 'James'            THEN 20
    WHEN '1 Peter'          THEN 21
    WHEN '2 Peter'          THEN 22
    WHEN '1 John'           THEN 23
    WHEN '2 John'           THEN 24
    WHEN '3 John'           THEN 25
    WHEN 'Jude'             THEN 26
    WHEN 'Revelation'       THEN 27
    ELSE 99
    END,
    chapter,
    verse;

