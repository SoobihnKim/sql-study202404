

-- # 문자열 비교

-- CHAR타입끼리의 비교
DROP TABLE CHAR_COMPARE;
CREATE TABLE CHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    char_6 CHAR(6)
);

INSERT INTO char_compare VALUES ('101', 'SQLD', 'SQLD');
INSERT INTO char_compare VALUES ('102', 'SQLD', 'SQLA');
INSERT INTO char_compare VALUES ('103', 'SQLD', '  SQLD');

SELECT * FROM char_compare;

SELECT * FROM char_compare
WHERE sn = '101' -- where절 true면 조회가 되고 false면 조회안됨
 AND char_4 = char_6;
 
 SELECT * FROM char_compare
WHERE sn = '102' 
 AND char_4 > char_6; -- true
 
 
 -- 한쪽이 VARCHAR타입일 경우의 비교
DROP TABLE VARCHAR_COMPARE;
CREATE TABLE VARCHAR_COMPARE (
    sn CHAR(10),
    char_4 CHAR(4),
    varchar_6 VARCHAR2(6)
);

INSERT INTO varchar_compare VALUES ('101', 'SQLD', 'SQLD  ');
INSERT INTO varchar_compare VALUES ('102', 'SQLD', 'SQLA  ');
INSERT INTO varchar_compare VALUES ('103', 'SQLD', 'SQLD');
COMMIT;

SELECT * FROM varchar_compare;

SELECT * FROM varchar_compare
WHERE sn = '101'
 AND char_4 = varchar_6 ; --false
 
SELECT * FROM varchar_compare
WHERE sn = '101'
 AND char_4 = TRIM(varchar_6) ; --TRIM 앞뒤 공백 제거
 
 
-- 상수 문자열 비교
SELECT 
*
FROM varchar_compare
WHERE sn = '101'
  AND char_4 = 'SQLD  '; -- true
  
SELECT 
*
FROM varchar_compare
WHERE sn = '101'
  AND varchar_6 = 'SQLD' ; -- false


-- 단일행 함수(행마다 함수 호출)
SELECT
 emp_nm, SUBSTR(addr, 1, 3) -- 문자열 자르는 함수
FROM tb_emp
;

SELECT 
    LOWER('Hello WORLD'),  -- 전부 소문자로 변환
    UPPER('hello World'),  -- 전부 대문자로 변환
    INITCAP('abcDEF')      -- 첫글자만 대문자로 나머지는 소문자로 변환
FROM dual; -- 아무것도 없는 테이블 더미테이블 (테스트용)

SELECT
    ASCII('A'), -- 문자를 아스키코드로
    CHR(97)     -- 아스키코드를 문자로
FROM dual;

SELECT 
    -- 'SQL' || 'Developer' - 오라클만 가능함
    CONCAT('SQL', 'Developer'),   -- 문자열을 결합
    SUBSTR('SQL Developer', 1, 3), -- 문자열 자름 1번부터 3개자름 (첫글자가 1번)
    LENGTH('HELLO WORLD'),         -- 문자열의 길이
    TRIM('    HI   '),             -- 좌우 공백 제거
    LTRIM('   HELLO    '),         -- 왼쪽 공백 제거
    RTRIM('   HELLO    '),         -- 오른쪽 공백 제거
    LTRIM('HELLOhello', 'HE')      -- 왼쪽에서 발견된 HE를 제거(중간은 제거안됨)
FROM dual;

SELECT 
    RPAD('Steve', 10, '-'), -- 오른쪽에 주어진 문자를 채움
    LPAD('Steve', 10, '*'),  -- 왼쪽에 주어진 문자를 채움
    REPLACE('Java Programmer Java', 'Java', 'BigData') AS "REPLACE" -- 문자를 변경
    , REPLACE('Java Programmer', 'Java') AS "REPLACE" -- 문자를 제거
FROM dual;


-- 실전문제 2과목 파트 1 12번
SELECT
 LTRIM('xxYYZZxYZxx', 'x')
FROM dual;
-- 실전문제 2과목 파트 1 15번
-- LENGTH(REPLACE(C1, CHR(10)) C1에서 줄바꿈 제거
-- 1   A\nA      (LENGTH)3 -2+1 = 2
-- 2   B\nB\nB   (LENGTH)5 -3+1 = 3
SELECT 
	(LENGTH(C1) - LENGTH(REPLACE(C1, CHR(10))) + 1) AS CC
FROM TAB1;






 