
# 쇼핑몰 회원 정보 테이블 
CREATE TABLE MEMBER (
	MAN_ID VARCHAR(20) PRIMARY KEY #중복 불가, NULL불가
	, MAN_PW VARCHAR(20) NOT NULL
	, MAN_NAME VARCHAR(10) 
	, MAN_AGE INT DEFAULT 1
	, MAN_TEL VARCHAR(15) UNIQUE #중복 불가, 값을 넣지 않아도 NULL가능
	, JOIN_DATE DATETIME DEFAULT SYSDATE() 
);

SELECT SYSDATE(), NOW();
# 현재 날짜(둘중에 편한거 쓰셈) 


SELECT * FROM member;
# 노란색 키 = 프라이머리 키 

INSERT INTO member (MAN_ID, MAN_PW) 
VALUES('KIM','1111');

INSERT INTO member(MAN_ID, MAN_PW, MAN_NAME, JOIN_DATE) 
VALUES('LEE','1234','홍길동','2025-01-01');

INSERT INTO member(MAN_ID, MAN_PW, MAN_NAME, JOIN_DATE) 
VALUES('PARK','1234','홍길동','2025-01-01 10:30:50');

INSERT INTO member(MAN_ID, MAN_PW, MAN_NAME, JOIN_DATE) 
VALUES('CHOI','1234','홍길동',20250101103050);

COMMIT;

ROLLBACK;


# 테이블 삭제와 다르다! 주의요망 

# 데이터 삭제 
# DELETE FROM 테이블명 WHERE 조건; 
DELETE FROM member;
#WHERE절이 없으면 데이터 모두 삭제됨 

DELETE FROM member
WHERE MAN_NAME IS NULL;


# 데이터 수정
# UPDATE 테이블명 SET 컬럼=바꿀값, 컬럼=바꿀값...WHERE 조건;

UPDATE member 
SET 
MAN_NAME = '이순신',
MAN_AGE = 20 
WHERE MAN_ID = 'CHOI';






