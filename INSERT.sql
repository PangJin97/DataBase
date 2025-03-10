-- 연습용 자동차 정보 테이블

-- 테이블 만들기 

CREATE TABLE TEST_CAR(
	MODEL_NUMBER INT PRIMARY KEY -- 중복데이터 안되고, NULL안됨
	, MODEL_NAME VARCHAR(20)
	, PRICE INT
	, BRAND VARCHAR(20)
);

SELECT * FROM test_car;


-- 게시글 정보
CREATE TABLE BOARD(
	BOARD_NUM INT PRIMARY KEY
	, TITLE VARCHAR(30) NOT NULL 
	, WRITER VARCHAR(20) 
	, READ_CNT INT DEFAULT 0
);

SELECT * FROM board;


-- 데이터 삽입 
-- INSERT INTO 테이블명 (컬럼, 컬럼...) VALUES (데이터, 데이터...);
INSERT INTO board(BOARD_NUM, TITLE, WRITER, READ_CNT) 
VALUES(1, '제목1', '김자바', 0);
-- 나열한 컬럼의 순서대로 값을 넣어야한다.

INSERT INTO board(BOARD_NUM, TITLE, WRITER, READ_CNT) 
VALUES(2, '제목1', '김자바', 0);

INSERT INTO board(BOARD_NUM, TITLE, READ_CNT) 
VALUES(3, '제목2', 3);
-- 필요한 데이터만 넣을 수 있다. 

INSERT INTO board(BOARD_NUM, READ_CNT) 
VALUES(4, 3);
-- 오류 발생! 타이틀에 제약 조건 NOT NULL
-- 값을 안넣으면 자동으로 NULL이 들어감 

INSERT INTO board(BOARD_NUM,TITLE) 
VALUES(5,'제목3');
-- 제약조건 DEFAULT : 값을 넣지 않으면 그때는 디폴트 값으로 정의한 값이 들어감 

INSERT INTO board VALUES(9,'제목5','김',10);


COMMIT;
-- 데이터 확정
-- 한번 확정 지으면 롤백 적용 안됨 

ROLLBACK;
-- 데이터 삽입 삭제 수정할때(변할때) 
-- 데이터가 틀렸을 때 롤백


