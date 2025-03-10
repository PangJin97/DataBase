-- emp 테이블에서 급여가 300이상이면서 700이하인
-- 사원들의 사번, 사원명, 급여 조회

SELECT EMPNO, ENAME, SAL FROM emp
WHERE SAL >= 300 AND SAL <= 700;

-- 위와 같이 '특정 범위'를 조건으로 작성할때는 BETWEEN이라는 연산자를 사용해도 된다.
-- WHERE 컬럼 A BETWEEN B

SELECT EMPNO, ENAME, SAL FROM emp
WHERE SAL BETWEEN 300 AND 700;


-- EMP 테이블에 저장된 직원 정보 중
-- 사번이 1003에서 1007번 사이이고, 커미션은 NUL이 아닌
-- 사번, 사원명, 급여, 커미션을 조회

SELECT EMPNO, ENAME, SAL, COMM FROM emp
WHERE EMPNO BETWEEN 1003 AND 1007 AND COMM IS NOT NULL;


-- -------------------------------------------------------------------------


-- EMP 테이블에서 저장된 직원 정보중 
-- 급여가 300, 400, 500인 사원들의 모든 정보 조회

SELECT * FROM emp 
WHERE SAL = 300 OR SAL = 400 OR SAL=500;

-- 위의 쿼리문은 아래처럼 IN연산자를 사용하여 작성 할 수도 있다. 
-- IN연산자 : WHERE 컬럼 IN(값1, 값2, 값3.....); => OR 대신 쓰기


SELECT*
FROM emp
WHERE SAL IN (300,400,500);


-- EMP테이블에 저장된 직원 정보중에서 
-- 사번이 1003, 1005, 1007번인 사원들의 
-- 사번, 사원명, 입사일을 조회 

SELECT EMPNO, ENAME, HIREDATE FROM emp
WHERE EMPNO IN(1003, 1005, 1007);


-- -----------------------------------------------------------------------


-- 조회데이터 정렬하기 
-- 정렬 문법: ORDER BY 정렬 기준 컬럼, 정렬방법(오름차순, 내림차순);
-- 오름차순 : ASC 또는 생략 / 내림차순 : DESC
-- 정렬을 위한 ORDER BY는 무조건 '조회 쿼리문의 가장 마지막'에 작성.


-- 급여기준 오름차순(낮은거 부터 높은 거 순으로 나열) 정렬 조회
SELECT * FROM emp
ORDER BY SAL ASC; 


-- 내림차순(높은거 부터 낮은 순으로 나열) 정렬 조회 
SELECT * FROM emp
ORDER BY SAL DESC; 


-- 사원명 기준 오름차순으로 정렬 조회(문자는 '사전편찬 순' => 가나다 순)
SELECT * FROM emp
ORDER BY ENAME ASC;



-- EMP테이블에 저장된 직원 정보 중에서 
-- 부서번호가 10번이 아닌 직원들의 
-- 사번, 사원명, 부서번호를 조회하되
-- 부서번호 기준 오름차순 정렬 후 사번기준 내림차순 정렬.
-- =>정렬은 여러번 가능 

SELECT EMPNO, ENAME, DEPTNO FROM emp
WHERE DEPTNO != 10 
ORDER BY DEPTNO ASC, EMPNO DESC;

-- EMP테이블에서 직급이 사원, 과장, 부장인 사원들의
-- 사원명, 직급, 급여를 조회 하되
-- 우선 직급기준 내림차순으로 정렬 후, 급여 기준 오름차순으로 정렬

SELECT ENAME, JOB, SAL FROM emp
WHERE JOB IN('사원','과장','부장')
ORDER BY JOB DESC, SAL;



-- ------------------------------------------------------



-- 사원명에 '이' 라는 글자가 포함된 사원들의 모든 칼럼 조회
-- 이렇게 컬럼에 특정한 값이 포함된 데이터를 조회할 때는 

-- lIKE 연산자와 와일드 카드 사용
-- LIKE는 '포함'한다는 의미. 

-- 와일드카드는 '%','_' 두 개가 존재.


-- % : 0개 이상의 어떤 글자.
-- _ : 1개의 어떤 글자


-- '김_' : '김'으로 시작하는 두 글자(김1, 김나....)(김자바, 김 이런건 안됨)
-- '_나__' : 두번째 글자가 '나' 인 네 글자

-- '박%' : '박'으로 시작하는 모든 글자(박, 박나라, 박김 다 가능)
-- '_이%' : 두번째 글자가 '이'인 모든 글자 


SELECT * FROM emp 
WHERE ENAME LIKE '%이%';



-- ---------------------------------------------------------------------



-- 조회 데이터에서 중복 제거하기 : DISTINCT 
-- 조회시 컬럼명 앞에 DISTINCT 키워드를 작성하면 중복 데이터 제거 
SELECT DISTINCT JOB FROM emp;

-- DISTINCT 키워드들 사용하면 모든 칼럼에서 중복을 제거 
-- 중복: 조회되는 모든 컬럼의 값이 같을 경우 중복으로 판단 
SELECT DISTINCT JOB, DEPTNO FROM emp WHERE JOB='과장';
-- DISTINCT 넣고 빼봐 
-- 빼보면 과장 30 , 과장 30 이 반복 조회되는 컬럼이 값이 같다! =>중복



-- ---------------------------------------------------------------------


-- 데이터베이스 PART2 최종점검 문제. 

-- 1번
SELECT ENAME, SAL, COMM FROM emp
WHERE SAL BETWEEN 350 AND 650 AND COMM IS NOT NULL;

-- 2번
SELECT EMPNO, ENAME, JOB FROM emp
WHERE JOB IN('과장','차장','부장')
ORDER BY JOB ASC;

-- 3번
SELECT EMPNO, ENAME, DEPTNO, SAL FROM emp
WHERE DEPTNO IN(10,20) AND ENAME LIKE '%이%'
ORDER BY DEPTNO DESC, SAL ASC;

-- 4번
SELECT * FROM emp
WHERE ENAME LIKE '%기'AND COMM IS NULL AND SAL BETWEEN 400 AND 800;

-- 5번 
-- 3개 







 
