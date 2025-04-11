CREATE TABLE ENVIRONMENT(
	ENV_ID INT PRIMARY KEY AUTO_INCREMENT #날짜별로 얻은 데이터를 구별하기 위해 식별번호 ID를 부여 
	,TEMPERATURE FLOAT #온도	
	,ILLUMINANCE INT	#조도 
	,JOIN_DATE DATETIME DEFAULT SYSDATE() #측정 날짜
	,HUMIDITY FLOAT #습도
	,SOIL_MOISTURE FLOAT #토양 수분 
);

COMMIT;

#온도 데이터 타입 변경 
ALTER TABLE environment
MODIFY COLUMN TEMPERATURE FLOAT;

# 습도 데이터 추가
ALTER TABLE ENVIRONMENT ADD COLUMN HUMIDITY FLOAT;

#토양 수분 데이터 추가
ALTER TABLE ENVIRONMENT ADD COLUMN SOIL_MOISTURE FLOAT;

# 테이블 구조는 두고 데이터만 삭제(id값도 1부터 시작)
TRUNCATE TABLE environment;

#환경변수 조회 
SELECT * FROM environment;


###################################


#식물 기본 정보 조회 
SELECT * FROM crop_standards;

#적정 데이터 설명 칼럼 추가 
ALTER TABLE crop_standards ADD COLUMN DESCRIPTION TEXT;

#식물 기본 정보 데이터 타입 수정
ALTER TABLE crop_standards
CHANGE COLUMN 작물 CROP VARCHAR(50),
MODIFY COLUMN temp_min FLOAT,
MODIFY COLUMN temp_max FLOAT,
MODIFY COLUMN humid_min FLOAT,
MODIFY COLUMN humid_max FLOAT,
MODIFY COLUMN soil_min FLOAT,
MODIFY COLUMN soil_max FLOAT,
MODIFY COLUMN lux_min INT,
MODIFY COLUMN lux_max INT,
MODIFY COLUMN adc_min INT,
MODIFY COLUMN adc_max INT;

#식물 기본 정보 컬럼명 대문자로 변경 
ALTER TABLE crop_standards
CHANGE COLUMN id ID INT,
CHANGE COLUMN crop CROP VARCHAR(50),
CHANGE COLUMN temp_min TEMP_MIN FLOAT,
CHANGE COLUMN temp_max TEMP_MAX FLOAT,
CHANGE COLUMN humid_min HUMID_MIN FLOAT,
CHANGE COLUMN humid_max HUMID_MAX FLOAT,
CHANGE COLUMN soil_min SOIL_MIN FLOAT,
CHANGE COLUMN soil_max SOIL_MAX FLOAT,
CHANGE COLUMN lux_min LUX_MIN INT,
CHANGE COLUMN lux_max LUX_MAX INT,
CHANGE COLUMN adc_min ADC_MIN INT,
CHANGE COLUMN adc_max ADC_MAX INT;


#각 작물을 조회하기 위해서는 PK값이 필요하다 
ALTER TABLE crop_standards
ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

#각 작물의 이미지 추가 
ALTER TABLE crop_standards
ADD COLUMN IMG_NAME VARCHAR(100);

#영어 이름추가
ALTER TABLE crop_standards
ADD COLUMN ENG_NAME VARCHAR(100);

#영어이름 업데이트 쿼리
UPDATE crop_standards
SET ENG_NAME = CASE
    WHEN ID = 1 THEN 'Lettuce'
    WHEN ID = 2 THEN 'Basil'
    WHEN ID = 3 THEN 'Apple Mint'
    WHEN ID = 4 THEN 'Red Pepper'
    WHEN ID = 5 THEN 'Strawberry'
    WHEN ID = 6 THEN 'Tomato'
    WHEN ID = 7 THEN 'Spinach'  
    WHEN ID = 8 THEN 'Rosemary'  
    WHEN ID = 9 THEN 'Coralberry'  
    WHEN ID = 10 THEN 'Monstera'  
   
END
WHERE ID IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

#회원정보테이블
CREATE TABLE USER(
	USER_EMAIL VARCHAR(50) PRIMARY KEY NOT NULL,
	USER_PASSWORD VARCHAR(100) NOT NULL UNIQUE,
	USER_TEL VARCHAR(50) NOT NULL UNIQUE,
	USER_ROLE VARCHAR(50) NOT NULL DEFAULT 'FARMER',
	JOIN_DATE DATETIME NOT NULL DEFAULT SYSDATE(),
	USER_NAME VARCHAR(50) NOT NULL
); 

SELECT * FROM USER;


#테스트용 회원정보
INSERT INTO USER (USER_EMAIL, USER_PASSWORD, USER_TEL, USER_ROLE, USER_NAME)
VALUES 
('admin@example.com', 'admin1234!', '010-1111-2222', 'ADMIN', '관리자'),
('farmer1@example.com', 'farmer123!', '010-2222-3333', 'FARMER', '홍길동'),
('farmer2@example.com', 'plantlover99', '010-3333-4444', 'FARMER', '김초록'),
('user1@example.com', 'userpass1', '010-4444-5555', 'USER', '이유저');




CREATE TABLE FREE_BOARD(
	BOARD_NUM INT PRIMARY KEY AUTO_INCREMENT
	,TITLE VARCHAR(100) NOT NULL
	,CONTENT TEXT NOT NULL
	,READ_CNT INT DEFAULT 0
	,REG_DATE DATETIME DEFAULT SYSDATE()
	,USER_EMAIL VARCHAR(50) NOT NULL REFERENCES USER(USER_EMAIL)
);

#조회수 기본값을 0으로 변경 
ALTER TABLE FREE_BOARD
MODIFY READ_CNT INT DEFAULT 0;


#테스트용 게시글 내용
INSERT INTO FREE_BOARD (TITLE, CONTENT, USER_EMAIL)
VALUES 
('처음 글입니다', '안녕하세요. 반갑습니다!', 'farmer1@example.com'),
('질문이 있어요', '물을 얼마나 자주 줘야 하나요?', 'user1@example.com'),
('후기 공유해요', '몬스테라가 엄청 잘 자랐어요!', 'farmer2@example.com'),
('센서 설치 후기', 'IoT 센서를 직접 설치해봤습니다.', 'admin@example.com');



#테스트용 삭제
DELETE FROM FREE_BOARD WHERE TITLE LIKE '테스트%';


SELECT * FROM FREE_BOARD;





