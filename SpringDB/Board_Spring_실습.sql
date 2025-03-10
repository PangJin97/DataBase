CREATE TABLE BOARD(
	BOARD_NUM INT PRIMARY KEY AUTO_INCREMENT
	,TITLE VARCHAR(30) NOT NULL
	,WRITER VARCHAR(30) NOT NULL
	,CONTENT VARCHAR(30)
	,READ_CNT INT DEFAULT 0
	,REG_DATE DATETIME DEFAULT SYSDATE()
);

INSERT INTO BOARD(TITLE, WRITER, CONTENT, READ_CNT) VALUES(
	'첫번째 글'
	,'김자바'
	,'안녕하세요'
	,5
);

COMMIT;

DELETE FROM BOARD
WHERE BOARD_NUM = 5;

SELECT * FROM board;

-- 검색 
SELECT * FROM board
WHERE TITLE LIKE '%java%'; 

SELECT * FROM board
WHERE WRITER LIKE '%java%'
