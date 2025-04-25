

## 성경 본문을 import 파이프라인으로 바꾼다.
import re
import sys

# 파일 경로 설정
ABBR_FILE = '/mnt/data/bible-3letter.txt'
FULL_FILE = '/mnt/data/bible-fullname.txt'
KJV_FILE  = '/mnt/data/kjvdat.txt'
OUT_FILE  = '/mnt/data/import.sql'

# 1. 약어 ↔ 정식명 매핑 불러오기
try:
    with open(ABBR_FILE, encoding='utf-8') as f:
        abbrs = [line.strip() for line in f if line.strip()]
    with open(FULL_FILE, encoding='utf-8') as f:
        fulls = [line.strip() for line in f if line.strip()]
except FileNotFoundError as e:
    sys.exit(f"[ERROR] 매핑 파일을 찾을 수 없습니다: {e.filename}")

if len(abbrs) != len(fulls):
    sys.exit("[ERROR] bible-3letter.txt와 bible-fullname.txt의 라인 수가 다릅니다.")

mapping = dict(zip(abbrs, fulls))  # {'Gen': 'Genesis', ...}

# 2. 본문 정제 함수 정의
_ctrl_regex = re.compile(r"[\x00-\x1F]")
_space_regex = re.compile(r"\s{2,}")

def clean(raw: str) -> str:
    """포맷용 특수문자를 제거하고 SQL-safe하게 변환"""
    text = raw.rstrip().rstrip('~').strip()
    text = _ctrl_regex.sub(' ', text)
    text = _space_regex.sub(' ', text)
    text = text.replace("'", "''")  # 작은따옴표 이스케이프
    return text

# 3. SQL INSERT 구문 생성 및 파일 쓰기
count = 0
with open(KJV_FILE, encoding='utf-8') as src, \
     open(OUT_FILE, 'w', encoding='utf-8') as out:
    out.write("USE Bible;\n\n")
    for line in src:
        line = line.rstrip('\n')
        if not line:
            continue
        parts = line.split('|', 3)
        if len(parts) != 4:
            print(f"[WARN] 잘못된 포맷, 건너뜀: {line[:50]}...")
            continue
        abbr, chap_str, verse_str, raw_text = parts
        book   = mapping.get(abbr, abbr)
        chapter = int(chap_str)
        verse   = int(verse_str)
        text    = clean(raw_text)
        out.write(
            f"INSERT INTO Bible (book, chapter, verse, text) "
            f"VALUES ('{book}', {chapter}, {verse}, '{text}');\n"
        )
        count += 1

print(f"[DONE] 생성된 INSERT 구문 수: {count}")
