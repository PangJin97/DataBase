SELECT EMP.EMPNO, EMP.ENAME, EMP.SAL
FROM emp;
#컬럼명 앞에는 테이블명이 생략되있다.

SELECT E.EMPNO, E.ENAME, E.SAL
FROM emp E;
# 데이터 베이스에서의 별칭은 최대한 간결하게
# 테이블도 별칭 사용 가능



SELECT * FROM dept; # 4
SELECT * FROM emp;  # 14 

# 사원번호, 사원명, 급여, 부서번호, 부서명, 부서의 지역을 조회

#cross join (전부 나열)
SELECT EMPNO, ENAME, SAL ,E.DEPTNO, D.DEPTNO, DNAME, LOC 
FROM emp E JOIN dept D;
#중복되는 테이블 구분해야함
#크로스 조인은 데이터가 명확하지 않음 그래서 안씀 



#의미있는 진짜 데이터 찾기
# E.DEPTNO = D.DEPTNO 여야 정확한 데이터가 조회됨


#INNER JOIN 
SELECT EMPNO, ENAME, SAL, E.DEPTNO, D.DEPTNO, DNAME, LOC 
FROM emp E INNER JOIN dept D
ON E.DEPTNO = D.DEPTNO;
# WHERE E.DEPTNO = D.DEPTNO;


# 직급이 '사원' 이 아닌 
#직원의 사번, 사원명, 직급, 부서번호, 부서명 조회 

SELECT EMPNO, ENAME, JOB, E.DEPTNO, DNAME 
# DEPTNO 컬럼이 중복 되니까 E.DEPTNO를 넣든 E.DEPTNO를 넣든 상관없다
FROM emp E INNER JOIN dept D
ON E.DEPTNO = D.DEPTNO
WHERE JOB != '사원';


#부서번호가 10, 20번인 
#직원의 사번, 사원명, 부서명, 부서의 지역을 조회

SELECT EMPNO, ENAME, DNAME, LOC
FROM emp E INNER JOIN dept D 
ON E.DEPTNO = D.DEPTNO
WHERE E.DEPTNO IN(10,20);


#시험 대비 문제 10번
SELECT EMPNO, ENAME, HIREDATE, SAL, E.DEPTNO, DNAME
# 컬럼 E.DEPTNO와 D.EMPTNO 가 중복되니 조회할땐 하나만 
FROM emp E INNER JOIN dept D
ON E.DEPTNO = D.DEPTNO
WHERE DNAME != '인사부' AND SAL >= 500
ORDER BY EMPNO DESC, ENAME ASC;






 