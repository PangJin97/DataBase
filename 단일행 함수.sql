
#단일행 함수 : 데이터의 갯수에 상관없이 무조건 1행의 데이터만 조회되는 함수

#단일행 함수가 아닌 함수의 예시
#이 함수들은 테이블에 저장된 데이터 수에 따라 조회 결과 갯수가 달라진다. => 단일행 함수가 아님
SELECT COMM, IFNULL(COMM, 0), CONCAT(EMPNO,'_',ENAME), SUBSTR(JOB, 1, 1)
FROM emp;

# 단일행 함수의 예시 : 모든 사원들 중 급여가 가장 높은 사원의 급여를 조회
# -> 이 예시의 경우에는 사원수가 달라져도 조회 결과는 무조건 1행만 조회된다. 

SELECT MAX(SAL) FROM emp;
SELECT MIN(SAL) FROM emp;
SELECT SUM(SAL) FROM emp;
SELECT AVG(SAL) FROM emp;
SELECT COUNT(SAL) FROM emp;

# 단일행 함수 사용 시 주의점 1 

# COUNT와 AVG함수 사용 시에는 NULL데이터에 유의! 
# COUNT 함수에서 데이터의 갯수는 'NULL데이터는 제외한' 갯수를 알려줌
# 결론 : 만약 테이블에 저장된 데이터의 갯수를 알고 싶다면 NULL데이터가 들어간 칼럼으로 COUNT() 함수를 사용하는 것은 금지! 

# COUNT 함수는 'pk칼럼'으로 하는 것이 제일 안전
SELECT COUNT(SAL), COUNT(COMM) FROM emp;   

SELECT COUNT(EMPNO), COUNT(*) FROM emp;
#SQLD 시험에서 COUNT(*) => 테이블의 전체 데이터 갯수 조회 : 성능이 느림 그래서 PK를 넣음 

#AVG함수로 평균을 계산 할때도 NULL은 데이터의 갯수에서 제외되기 때문에 주의!!
SELECT AVG(SAL), AVG(COMM), SUM(COMM), AVG(IFNULL(COMM, 0)) FROM emp;


#단일행 함수 사용 시 주의점2
#조회문의 각 칼럼은 조회 결과 데이터의 수가 일치하는 칼럼만 사용 가능! 
# EX) 사원들 중 가장 높은 급여와 그 급여를 받는 사원 명을 조회 
#결론 : '단일행 함수는 단일행 함수끼리만 사용가능!!'(다른 일반 칼럼과 단일행 함수를 같이 사용하면 쿼리 오류!)
#       	단, GRPUP BY 절에 작성한 칼럼은 단일행 함수와 함께 사용가능!

SELECT MAX(SAL), ENAME FROM emp;



#조회 데이터 그룹화 하기 
#모든 사원 정보에서 가장 높은 급여를 조회하시오
SELECT MAX(SAL) FROM emp;


#모든 사원 정보에서 부서별로 가장 높은 급여를 조회하시오.
#GROUP BY 절은 단일행 함수와 같이 쓸 수 있다. 
SELECT DEPTNO, MAX(SAL), MIN(SAL), SUM(SAL), COUNT(SAL), AVG(SAL)
FROM emp
GROUP BY DEPTNO; 
# GROUP BY에 있는 컬럼은 유일하게 단일행 함수와 같이 쓸 수 있다.


#직급별 인원 수 조회, 직급 기준 내림차순
SELECT JOB, COUNT(EMPNO) AS 사원수
FROM emp
GROUP BY JOB
ORDER BY JOB DESC;

#월별 입사자 주 

SELECT MONTH(HIREDATE), COUNT(EMPNO)
FROM emp
GROUP BY MONTH(HIREDATE);


#부서별 커미션의 평균을 조회
# 단, 10번 부서는 제외하고, 동시에 평균은 전체 사원수를 기준으로 조회 

SELECT DEPTNO, AVG(IFNULL(COMM,0))
FROM emp
WHERE DEPTNO <> 10 
GROUP BY DEPTNO;

#부서별로 급여의 합을 조회. 
#단, 급여의 합이 2000이상인 데이터만 조회

# -> 위의 조건은 그룹화한 후 적용되는 조건이다
# 이런 조건은 HAVING절에 조건을 작성한다
SELECT DEPTNO, SUM(SAL)
FROM emp
WHERE DEPTNO <> 10 #그룹화 하기 전 조건 
GROUP BY DEPTNO
HAVING SUM(SAL) >= 2000; #그룹화 하고 난 후 조건 

#직급별 최소 급여 조회하되, 사원 직급은 제외하며
#직급별 최소급여가 300미만인 데이터로 제외한다 
#조회 결과 데이터를 직급 기준 오름 차순으로 정렬하세요

SELECT JOB, MIN(SAL)
FROM emp 
WHERE JOB <> '사원'
GROUP BY JOB
HAVING MIN(SAL) > 300
ORDER BY JOB ASC;

























 