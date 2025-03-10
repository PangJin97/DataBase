#수치 관련 함수

# CEIL : 올림
# FLOOR : 내림
# ROUND : 반올림 
SELECT CEIL(70.1), FLOOR(70.1), ROUND(70.1);

#1과 2는 자릿수
SELECT ROUND(123.456, 1), ROUND(123.456, 2);

#TRUNCATE : 버림
SELECT TRUNCATE(123.456, 1), TRUNCATE(123.456, 2);

# 나눗셈의 나머지 구하는 연산 
SELECT MOD(10, 4);

#EMP테이블에서 사번이 짝수인 사원들의 모든 칼럼값 조회
SELECT * FROM emp
WHERE MOD(EMPNO, 2) = 0;



#문자 관련 함수 

SELECT SUBSTR('ABCDEF', 3)
	# 3번째 글자부터 보여줘
	, SUBSTRING('ABCDEF', 3)
	# 시작위치, 문자 수
	# 시험에 AB CDEF 이렇게 띄어쓰기 => 공백도 문자로 취급한다 
	, SUBSTR('ABCEDF', 3,2)
	, SUBSTRING('ABCDEF',3,2);


# 대소문자 변경함수 
SELECT 'MariaDB', UPPER('MariaDB'), LOWER('MariaDB');


# 데이터의 글자수를 맞추는 함수
# LPAP(원본문자, 완성할 글자수, 채워줄 문자)
# RPAD(원본문자, 완성할 글자수, 채워줄 문자)
SELECT LPAD('DB', 5, '@'), RPAD('DB', 5, '@');


# 공백 제거 함수 
SELECT LTRIM('   DB   '), RTRIM('   DB   '), TRIM('   DB   '); 
# LTRIM: 왼쪽 공백제거 / RTRIM: 오른쪽 공백제거 / TRIM: 공백 제거 


SELECT CHAR_LENGTH('디비'), LENGTHB('디비');
# CHAR_LENGTH : 문자 수 
# LENGTHB : byte 수 

# 영어, 숫자 한 글자 : 1byte
# 국어, 한자 한 글자 : 3byte


# CONCAT() : 문자 나열 
SELECT CONCAT(JOB, ENAME) AS '나열값' FROM emp;

# REPLACE : 일부 문자 대체 
SELECT REPLACE ('나는 HOME에 있고 싶다' , 'HOME', '집');

# 논리 연산 
SELECT IF(10 > 2, '참', '거짓');


# IFNULL(컬럼, 대체 값) 
# 첫번째 인자로 주어진 데이터가 NULL이 아니면 원래 데이터가 조회
# 첫번째 인자로 주어진 데이터가 NULL이면 두번째 인자로 전달된 데이터 조회
SELECT COMM, IFNULL(COMM, 0) FROM emp;
#평균 구할때 많이씀 





