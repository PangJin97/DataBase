
# 회원 테이블 

CREATE TABLE REACT_MEMBER(
	MEM_ID VARCHAR(10) PRIMARY KEY 
	, MEM_NAME VARCHAR(10) NOT NULL 
	, MEM_PW VARCHAR(10) NOT NULL
	, MEM_TEL VARCHAR(15) UNIQUE 
	, MEM_INTRO VARCHAR(30) 
	, JOIN_DATE DATETIME DEFAULT SYSDATE()
);

DROP TABLE react_member;

SELECT * FROM REACT_MEMBER;

INSERT INTO REACT_MEMBER VALUES(
	'java'
	,'김자바'
	,'1111'
	,'010-1111-1111'
	,'안녕하세요'
	,NOW()
);

DELETE FROM react_member
WHERE MEM_ID = '';

COMMIT;

SELECT * FROM react_member;


study_db