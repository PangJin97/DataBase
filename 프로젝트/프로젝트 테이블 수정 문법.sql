# 각 테이블 수정하는 문법


#데이터 타입(자료형) 변경 
ALTER TABLE environment
MODIFY COLUMN TEMPERATURE FLOAT;

#  칼럼과 데이터 추가
ALTER TABLE ENVIRONMENT ADD COLUMN HUMIDITY FLOAT;

# 테이블 구조는 두고 데이터만 삭제team4(id값도 1부터 시작)
TRUNCATE TABLE environment;

DELETE FROM user 
WHERE USER_NAME = '정테스트';
######################################################




#칼럼명 변경하기 
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


#칼럼 추가하고 속성도 추가하기 
ALTER TABLE crop_standards
ADD COLUMN id INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;

#이미지 칼럼 추가하고 데이터 타입  
ALTER TABLE crop_standards
ADD COLUMN IMG_NAME VARCHAR(100);


