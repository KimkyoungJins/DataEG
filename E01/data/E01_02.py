#!/usr/bin/env python3

import pathlib  ## 파일 경로를 다루는 표준 라이브러리이다.
import re       ## 제어 문자나 공백을 간편하게 찾아서 정리할때 쓰는 것
import sys      ## 프로그램을 강제로 종료 하거나, 커맨드라인 인자를 읽을때


# ---------- 0. 경로 설정 ----------
BASE = pathlib.Path(__file__).parent
SRC_TXT   = BASE / "kjvdat.txt"
ABBR_TXT  = BASE / "bible-3letter.txt"
FULL_TXT  = BASE / "bible-fullname.txt"
OUT_SQL   = BASE / "import.sql"

# ---------- 1. 약어 → 정식명 매핑 ----------
try:
    abbrs = [l.strip() for l in ABBR_TXT.read_text(encoding="utf-8").splitlines() if l.strip()]
    fulls = [l.strip() for l in FULL_TXT.read_text(encoding="utf-8").splitlines() if l.strip()]
except FileNotFoundError as e:
    sys.exit(f"[ERROR] 매핑 파일이 없습니다: {e.filename}")

if len(abbrs) != len(fulls):
    sys.exit("[ERROR] 약어/정식명 파일 길이가 다릅니다.")

mapping = dict(zip(abbrs, fulls))  # e.g.  {'Gen': 'Genesis', ...}

# ---------- 2. 본문 정제 함수 ----------
_ctrl_regex = re.compile(r"[\x00-\x1F]")            # 제어문자(탭, CR 등)
_space_regex = re.compile(r"\s{2,}")                # 두 칸 이상 연속 공백

def clean(raw: str) -> str:
    """본문에서 포맷용 특수문자를 제거하고 SQL-safe 하게 변환한다."""
    text = raw.rstrip().rstrip("~")                 # 행 끝 마커 '~' 제거
    text = text.strip()
    text = _ctrl_regex.sub(" ", text)               # 보이지 않는 제어문자 → 공백
    text = _space_regex.sub(" ", text)              # 중복 공백 1칸으로
    text = text.replace("'", "''")                  # SQL 작은따옴표 이스케이프
    return text

# ---------- 3. INSERT 구문 생성 ----------
def make_sql(book: str, chap: int, verse: int, text: str) -> str:
    return (f"INSERT INTO Bible (book, chapter, verse, text) "
            f"VALUES ('{book}', {chap}, {verse}, '{text}');\n")

# ---------- 4. 메인 루프 ----------
rows = 0
with SRC_TXT.open(encoding="utf-8") as src, OUT_SQL.open("w", encoding="utf-8") as out:
    out.write("USE Bible;\n\n")
    for line in src:
        line = line.rstrip("\n")
        if not line:
            continue
        try:
            abbr, chap_str, verse_str, raw_text = line.split("|", 3)
        except ValueError:
            print(f"[WARN] 구문 오류(건너뜀): {line[:50]}...")
            continue

        book = mapping.get(abbr, abbr)              # 매핑 없으면 약어 그대로
        chap  = int(chap_str)
        verse = int(verse_str)
        text  = clean(raw_text)

        out.write(make_sql(book, chap, verse, text))
        rows += 1

print(f"[DONE] import.sql 생성 완료 — {rows:,} 행 기록")
