# 도서 쇼핑몰 프로젝트 테이블

# 도서  카테고리 테이블(소설, 자기계발....)
CREATE TABLE BOOK_CATEGORY(
	CATE_CODE INT PRIMARY KEY AUTO_INCREMENT #카테고리 코드
	,CATE_NAME VARCHAR(30) NOT NULL UNIQUE #카테고리 이름
); 

INSERT INTO book_category VALUES(1,'IT/인터넷');
INSERT INTO book_category VALUES(2,'소설');
INSERT INTO book_category VALUES(3,'자기계발');
COMMIT;

SELECT * FROM book_category;


# 도서 테이블 
CREATE TABLE BOOK(
	BOOK_CODE INT PRIMARY KEY AUTO_INCREMENT 
	,BOOK_NAME VARCHAR(30) NOT NULL
	,BOOK_PRICE INT NOT NULL
	,PUBLISHER VARCHAR(30) NOT NULL
	,BOOK_INFO VARCHAR(100)
	,REG_DATE DATETIME DEFAULT SYSDATE()
	,BOOK_STOCK INT DEFAULT 10 #도서 재고 
	,CATE_CODE INT NOT NULL REFERENCES BOOK_CATEGORY(CATE_CODE)
);


SELECT * FROM book;


#조회결과 있음 => 사용불가(중복이기 때문에)
#조회결가 없음 => 사용가능(중복이 없어)
SELECT CATE_NAME
FROM book_category
WHERE CATE_NAME = '자바';


CREATE TABLE SHOP_USER(
	USER_ID VARCHAR(30) PRIMARY KEY
	,USER_PW VARCHAR(30) NOT NULL
	,USER_NAME VARCHAR(10) NOT NULL
	,USER_EMAIL VARCHAR(30)
	,USER_TEL VARCHAR(16) NOT NULL UNIQUE
	,USER_ROLL VARCHAR(10) DEFAULT 'USER'
	,IS_USING VARCHAR(10) DEFAULT 'Y'
	,JOIN_DATE DATETIME DEFAULT SYSDATE()
); 


SELECT * FROM SHOP_USER;

# 로그인 
SELECT * FROM shop_user 
WHERE USER_ID = 'kindred'
AND USER_PW = 1234










