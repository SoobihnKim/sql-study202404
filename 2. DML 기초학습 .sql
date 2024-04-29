CREATE TABLE goods (
  id NUMBER(6) PRIMARY KEY,
  goods_name VARCHAR2(10) NOT NULL, -- 10����Ʈ(�ѱ��� 10���� �ƴ�)
  price NUMBER(10) DEFAULT 1000,
  reg_date DATE   
);

-- INSERT
INSERT INTO goods
  (id, goods_name, price, reg_date)
VALUES
   (1, '��ǳ��', 120000, SYSDATE);
   
INSERT INTO goods
  (id, goods_name, price, reg_date)
VALUES
   (2, '��Ź��', 2000000, SYSDATE);
   
INSERT INTO goods
  (id, goods_name, reg_date)
VALUES
   (3, '�ް�', SYSDATE);
   
INSERT INTO goods
  (id, goods_name)
VALUES
   (4, '���');
   
INSERT INTO goods
  (goods_name, id, reg_date, price)
VALUES
   ('����', 5, SYSDATE, '49000'); -- �Ϲ��� ����ȯ
   
-- �÷��� ������ ���̺� ���� ������� �ڵ� ����(�׷����� ���°� ����)
INSERT INTO goods
  
VALUES
   (6, '�����', 1000000, SYSDATE); 

SELECT * FROM goods; 



-- UPDATE
UPDATE goods
SET goods_name = '������'
WHERE id = 1;

-- WHERE ������ ��ü ����
UPDATE goods
SET price = 9999;

UPDATE tbl_user
SET age = age + 1;

UPDATE goods
SET id = 11
WHERE id = 4; -- ���� id�� �ٲ�������

UPDATE goods
SET goods_name = null -- NOT NULL�̱� ������ ������
WHERE id = 3;

UPDATE goods
SET goods_name = 'û����', price = 299000
WHERE id = 3; -- WHERE price >= 2000 �̷��͵� ����


-- DELETE

DELETE FROM goods
WHERE id = 11;

-- ���Ǿ��� delete�ϸ� ��ü ������
-- �ٸ� �� ������ ������ ������
DELETE FROM goods;
TRUNCATE TABLE goods; -- ���� �Ұ�
DROP TABLE goods; -- ���� �Ұ�, ���̺� ��ü ������

SELECT * FROM goods; 



-- SELECT 
SELECT
 certi_cd, certi_nm, issue_insti_nm
FROM tb_certi;

SELECT
 certi_nm, certi_cd, issue_insti_nm
FROM tb_certi;

SELECT
 certi_nm, issue_insti_nm
FROM tb_certi;

-- �ߺ�����
SELECT DISTINCT
 issue_insti_nm
FROM tb_certi;

SELECT ALL--ALL�� �������� (���� �Ⱦ�)
 certi_nm, issue_insti_nm
FROM tb_certi;

-- ��� �÷� ��ȸ(�ǹ����� �� �Ⱦ�, �����ؼ� ��)
SELECT * 
FROM tb_certi;

-- �� ��Ī �ο�
SELECT 
  emp_nm AS "�����",
  addr AS "�ּ�"
FROM tb_emp
;

-- AS, "" ���� ����
SELECT 
  emp_nm �����,
  addr "������ �ּ�" -- ���� ������ "" ���� �Ұ���
FROM tb_emp
;

-- ���ڿ� �����ϱ� ||
SELECT
  '�ڰ���: ' || certi_nm AS "�ڰ��� ����"
FROM tb_certi;

SELECT
 certi_nm || ' (' || issue_insti_nm || ')' AS "�ڰ���"
FROM tb_certi;


