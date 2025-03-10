# 게시글 테이블 

CREATE TABLE BASIC_BOARD(
	BOARD_NUM INT PRIMARY KEY AUTO_INCREMENT
	, TITLE VARCHAR(30)
	, WRITER VARCHAR(20)
	, CONTENT VARCHAR(50)
	, READ_CNT INT DEFAULT 0
	, CREATE_DATE DATETIME DEFAULT SYSDATE()
);

INSERT INTO BASIC_BOARD(TITLE, WRITER, CONTENT) 
VALUES('제목1','작성자1','내용1');

INSERT INTO BASIC_BOARD(TITLE, WRITER, CONTENT, READ_CNT, CREATE_DATE) 
VALUES('제목2','작성자2','내용2', 5, '2025-02-04');

COMMIT;

SELECT * FROM BASIC_BOARD;

SELECT * FROM BASIC_BOARD
WHERE BOARD_NUM = 1;
