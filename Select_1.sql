
-- 주석

-- 실행 : 현재 열려있는 쿼리탭의 모든 쿼리를 일괄 실행 
-- 선택 실행 : 마우스로 드래그한 쿼리만 실행 
-- 현재 쿼리 실행 : 현재 커서가 올라가 있는 쿼리만 실행(ctrl shift f9) / 세미클론 안에서 



-- 데이터 조회
-- SELECT 컬럼명 FROM 테이블명 WHERE 조건; 

-- EMP 테이블의 사원들의 사번을 조회 
SELECT EMPNO FROM emp;


-- EMP 테이블에서 모든 사원의 사번, 사원명, 급여를 조회 
SELECT EMPNO, ENAME, SAL FROM emp;


-- 별칭사용, 조회 시 조회되는 컬럼명을 변경하여 조회
SELECT EMPNO AS '사번', ENAME AS '사원명', SAL AS '급여'FROM emp;
-- AS라는 키워드는 생략 가능하다.  컬럼 구분은' , '로



-- EMP테이블의 모든 컬럼을 조회
SELECT * FROM emp; 

SELECT * FROM emp WHERE empno = 1001; 


-- SELECT로 이런 것도 조회할 수 있어요
SELECT 5,  FROM emp; 
-- 5가 14(emp 데이터의 갯수)개 나옴
SELECT 5, 'JAVA' FROM emp; 
SELECT 5, 'JAVA', 3+3 FROM dept;

-- 테이블의 갯수 만큼 조회된다 

--  이런것 들은 문법 확인 용(SELECT 뒤에는 컬럼이 나와야한다. 숫자가 나오는건 옳지 않지만 문법 확인용으로만)
SELECT 'DB', 3+5;
-- SELECT EMPNO; 오류! 컬럼명 조회 시는 받드시 테이블명 명시
-- EMP테이블의 데이터 갯수만큼 출력




-- 조회에 조건 사용하기

-- 크기 비교: >, <, >=, <=, = (같다), != (같지않다), <> (같지 않다)   

-- =이 여기선 말 그대로 같다는 뜻이다. 
--  자바랑 다름(값을 담는 용도가 아님)

-- 동시에 만족 : AND 
-- 둘중 하나를 만족 : OR 
-- WHERE 조건1 OR 조건2


-- 급여가 300이상인 사원들의 사번, 사원명, 급여를 조회
SELECT EMPNO, ENAME, SAL FROM emp 
WHERE SAL >= 300; 


-- 직급이 대리인 사원들의 사번, 사원명, 직급, 입사일을 조회
SELECT EMPNO, ENAME, JOB, HIREDATE FROM emp
WHERE JOB = '대리';


-- 급여가 400이상이고, 직급이 과장인 사원들의 모든 컬럼을 조회
SELECT * FROM emp 
WHERE SAL >= 400 AND JOB = '과장';


-- EMP 테이블의 모든 사원들 중에 
-- 급여가 400 이하이거나 700이상인 사원들의 사번, 사원명, 급여를 조회
SELECT EMPNO, ENAME, SAL FROM emp
WHERE SAL <= 400 OR SAL >= 700;



-- 조건절을 작성할 때는 NULL 체크 문법에 주의!
-- 조건 : COMM이 NULL이 데이터만 조회
SELECT EMPNO, ENAME, SAL, COMM FROM emp 
WHERE COMM IS NULL;


-- 데이터베이스 PART2 중간 점검 문제. 

-- 1번
SELECT EMPNO, ENAME, SAL, COMM FROM emp;

-- 2번
SELECT EMPNO, ENAME AS 사원, JOB FROM emp
WHERE EMPNO >= 1005;

-- 3번
SELECT ENAME, JOB, SAL FROM emp
WHERE JOB = '대리' OR JOB = '과장';

-- 4번
SELECT * FROM emp
WHERE SAL >= 300 AND COMM >= 300;

-- 5번 
SELECT ENAME, JOB, SAL, COMM FROM emp
WHERE SAL <= 900 AND COMM IS NOT NULL AND (JOB = '대리' OR JOB ='과장'); 
-- 연산식 , 조건식에서 괄호 넣었던 것을 기억하자 같은 원리 (AND와 OR이 같이 쓰일 때) 





















