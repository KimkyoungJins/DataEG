## 데이터를 정제해가지고 한다.
short_file = 'bible-3letter.txt'       ## 짧은 이름만 있는 것
long_file = 'bible-fullname.txt'      ## 긴 이름만 있는 것
kjv_file  = 'kjvdat.txt'              ## 성경 전문
sql_file  = 'import.sql'      ## import.sql


## for문과 매핑을 통하여서 짧은 이름과 긴 이름을 연결한다.
short = open(short_file, encoding='utf-8').read().splitlines()
long = open(long_file, encoding='utf-8').read().splitlines()

## 짧은 이름과 긴 이름을 서로 매핑한다.
mapping = {}

## 짧은 이름을 키로 그 값을 정식 명칭으로 한다.
## for 문을 사용하여서 둘이 매핑을 해준다.
## Gen - Genesis가 될 수 있도록
for i in range(len(short)):
    mapping[short[i]] = long[i]


k = open(kjv_file, encoding='utf-8')        ## kjv에 있는 파일을 읽어오고
s = open(sql_file, 'w', encoding='utf-8')   ## sql파일에 써 넣을 것이다.

## Bible 데이터베이스를 사용해야한다.
s.write('USE Bible;\n\n')

## for문을 사용하여서 한 줄씩 처리를 해야한다.
for line in k:                  ## 한 줄씩 읽어온다.
    line = line.strip()         ## 개행문자 모두 삭제, 끝에 있는 공백 삭제함
    
    if not line:                ## 빈 문자열이면 건너 뛴다.
        continue
        
        
    parts = line.split('|') ## |을 기준으로 분리한다.
                            ## Gen |1| |1| text... 형식으로 분류가 되어 있기 때문에
    if len(parts) < 4:
        continue
    abbr = parts[0]
    chap = parts[1]
    verse = parts[2]
    text = parts[3]
    
    # 끝에 물결표 제거한다.
    if text.endswith('~'):
        text = text[:-1]
        
    # 작은따옴표 이스케이프
    text = text.replace("'", "''")
    
    # 책 이름 변환한다.
    book = mapping.get(abbr, abbr)
    
    # SQL INSERT문 작성한다.
    sql = "INSERT INTO Bible (book, chapter, verse, text) VALUES ('" + book + "', " + chap + ", " + verse + ", '" + text + "');\n"
    s.write(sql)

## 파일을 닫는다.
k.close()
s.close()
