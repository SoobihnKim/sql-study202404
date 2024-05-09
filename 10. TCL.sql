
-- 트랜잭션
CREATE TABLE student (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER
);

INSERT INTO student VALUES (1, '김철수', 15);
INSERT INTO student VALUES (2, '홍길동', 16);

SELECT * FROM student;

COMMIT;

INSERT INTO student VALUES (3, '도우너', 12);

SELECT * FROM student;

ROLLBACK;

-- 계좌이체
UPDATE tb_account
SET balance = balance + 5000
WHERE name = '김철수';

UPDATE tb_account
SET balance = balance - 5000
WHERE name = '박영희';

COMMIT; -- 둘 다 성공했을때 커밋해야함

DELETE FROM student;

ROLLBACK;
SELECT * FROM student;
TRUNCATE TABLE student; -- 롤백으로 되돌릴 수 없음



