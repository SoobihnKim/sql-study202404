

-- # ���ڿ� ��

-- CHARŸ�Գ����� ��
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
WHERE sn = '101' -- where�� true�� ��ȸ�� �ǰ� false�� ��ȸ�ȵ�
 AND char_4 = char_6;
 
 SELECT * FROM char_compare
WHERE sn = '102' 
 AND char_4 > char_6; -- true
 
 
 -- ������ VARCHARŸ���� ����� ��
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
 AND char_4 = TRIM(varchar_6) ; --TRIM �յ� ���� ����
 
 
-- ��� ���ڿ� ��
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


-- ������ �Լ�(�ึ�� �Լ� ȣ��)
SELECT
 emp_nm, SUBSTR(addr, 1, 3) -- ���ڿ� �ڸ��� �Լ�
FROM tb_emp
;

SELECT 
    LOWER('Hello WORLD'),  -- ���� �ҹ��ڷ� ��ȯ
    UPPER('hello World'),  -- ���� �빮�ڷ� ��ȯ
    INITCAP('abcDEF')      -- ù���ڸ� �빮�ڷ� �������� �ҹ��ڷ� ��ȯ
FROM dual; -- �ƹ��͵� ���� ���̺� �������̺� (�׽�Ʈ��)

SELECT
    ASCII('A'), -- ���ڸ� �ƽ�Ű�ڵ��
    CHR(97)     -- �ƽ�Ű�ڵ带 ���ڷ�
FROM dual;

SELECT 
    -- 'SQL' || 'Developer' - ����Ŭ�� ������
    CONCAT('SQL', 'Developer'),   -- ���ڿ��� ����
    SUBSTR('SQL Developer', 1, 3), -- ���ڿ� �ڸ� 1������ 3���ڸ� (ù���ڰ� 1��)
    LENGTH('HELLO WORLD'),         -- ���ڿ��� ����
    TRIM('    HI   '),             -- �¿� ���� ����
    LTRIM('   HELLO    '),         -- ���� ���� ����
    RTRIM('   HELLO    '),         -- ������ ���� ����
    LTRIM('HELLOhello', 'HE')      -- ���ʿ��� �߰ߵ� HE�� ����(�߰��� ���žȵ�)
FROM dual;

SELECT 
    RPAD('Steve', 10, '-'), -- �����ʿ� �־��� ���ڸ� ä��
    LPAD('Steve', 10, '*'),  -- ���ʿ� �־��� ���ڸ� ä��
    REPLACE('Java Programmer Java', 'Java', 'BigData') AS "REPLACE" -- ���ڸ� ����
    , REPLACE('Java Programmer', 'Java') AS "REPLACE" -- ���ڸ� ����
FROM dual;


-- �������� 2���� ��Ʈ 1 12��
SELECT
 LTRIM('xxYYZZxYZxx', 'x')
FROM dual;
-- �������� 2���� ��Ʈ 1 15��
-- LENGTH(REPLACE(C1, CHR(10)) C1���� �ٹٲ� ����
-- 1   A\nA      (LENGTH)3 -2+1 = 2
-- 2   B\nB\nB   (LENGTH)5 -3+1 = 3
SELECT 
	(LENGTH(C1) - LENGTH(REPLACE(C1, CHR(10))) + 1) AS CC
FROM TAB1;






 