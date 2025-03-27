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

#도서 이미지 정보
CREATE TABLE BOOK_IMG (
	IMG_CODE INT PRIMARY KEY AUTO_INCREMENT
	,ORIGIN_FILE_NAME VARCHAR(100) NOT NULL
	,ATTACHED_FILE_NAME VARCHAR(100) NOT NULL
	,IS_MAIN VARCHAR(3) NOT NULL    #Y 메인이미지, N 상세이미지
	,BOOK_CODE INT NOT NULL REFERENCES book(BOOK_CODE) ON DELETE CASCADE # 참조 무결성 (부모태그가 삭제되면 자식 태그도 삭제된다)
);
#당연히 도서가 사라지면 이미지도 사라져야한다. 그래서 CASCADE 


#모든 상품에 대해서 첨부된 상품 이미지명, 상품명, 가격을 조회 
#메인 페이지만 화면에 띄우기 위한 조회
#화면에 띄우려면 첨부된 이미지를 조회하면 된다 
SELECT ATTACHED_FILE_NAME, BOOK_NAME, BOOK_PRICE
FROM book B INNER JOIN book_img I
ON B.BOOK_CODE = I.BOOK_CODE
WHERE IS_MAIN = 'Y';


SELECT * FROM BOOK_IMG;
SELECT * FROM BOOK;

# 한 번에 여러 데이터 INSERT 하기 
INSERT INTO book_img (IMG_CODE, ORIGIN_FILE_NAME, ATTACHED_FILE_NAME, IS_MAIN, BOOK_CODE)
VALUES
(1,'aaa.jpg','1111-2222.jpg','Y', 1),
(3,'aaa.jpg','1111-2222.jpg','N', 1);


#book테이블과 동일한 book_code를 넣어야함 (직접 지정해서 넣어야함)
#왜냐 BOOK테이블에선 자동생성하지만 Img_book은 빈값을 넣어줘야한다 단, 동일하게 

#book 테이블에 저장된 book_code 중 가장 큰 수 조회하는데 
SELECT MAX(BOOK_CODE) FROM book;
#만약 데이터가 없으면 null이 조회된다 그럼 null을 0으로 바꿔준다.
SELECT IFNULL(MAX(BOOK_CODE),0)+1 FROM book;

ROLLBACK;
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
	,USER_ROLL VARCHAR(10) DEFAULT 'USER' #권한 user: 사용자 admin:관리자 
	,IS_USING VARCHAR(10) DEFAULT 'Y'
	,JOIN_DATE DATETIME DEFAULT SYSDATE()
); 


SELECT * FROM SHOP_USER;

# 로그인 
SELECT * FROM shop_user 
WHERE USER_ID = 'kindred'
AND USER_PW = 1234;



# 관리자 정보를 insert
INSERT INTO shop_user VALUES(
 'admin', '1111', '관리자', 'aa@gmail.com'
 ,'010-2344-1214', 'ADMIN', 'Y', NOW()
);

COMMIT;







