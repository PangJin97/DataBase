
#서브쿼리 - 하나의 쿼리문 안에 또 다른 쿼리문이 들어간 sql 문법

#김사랑 사원과 같은 부서에 속한 사원들의 사번, 사원명, 부서번호를 조회

# 1 -> 김사랑 사원이 속한 부서를 확인 

SELECT DEPTNO 
FROM emp
WHERE ENAME = '김사랑'; 

# 2 -> 20번 부서에 속한 사원들의 사번, 사원명, 부서번호를 조회   
SELECT EMPNO, ENAME, DEPTNO
FROM emp 
WHERE DEPTNO = (SELECT DEPTNO 
						FROM emp
						WHERE ENAME = '김사랑');  


# 사번이 1001번인 사원과 같은 직급을 갖는 사원들의 모든 정보를 조회 

SELECT JOB 
FROM emp
WHERE EMPNO = 1001;


SELECT * FROM emp
WHERE JOB = (SELECT JOB 
					FROM emp
					WHERE EMPNO = 1001);
					

# 사원의 사번, 사원명, 부서번호, 부서명, 부서가 위치한 지역을 조회

SELECT EMPNO
		,ENAME
		,DEPTNO
		,(SELECT DNAME FROM dept WHERE DEPTNO = emp.DEPTNO) AS DNAME 
		,(SELECT LOC FROM dept WHERE DEPTNO = emp.DEPTNO) AS LOC
FROM emp; 


#모든 사원의 평균 급여보다 급여가 더 많은 사원의 사번, 사원명, 급여 조회

SELECT EMPNO, ENAME, SAL FROM emp
WHERE SAL > (SELECT AVG(SAL) FROM emp);  

#우선 큰 틀부터 잡고 고민하기



SELECT * FROM board;
SELECT * FROM board_reply; 


#댓글번호가 40번인 댓글내용, 댓글 작성자, 해당 댓글이 달린 게시글의 제목, 내용을 조회하세요 

SELECT REPLY_CONTENT, REPLY_WRITER, B.TITLE, B.CONTENT 
FROM board B INNER JOIN board_reply R
ON B.BOARD_NUM = R.BOARD_NUM
WHERE REPLY_NUM = 40;

SELECT REPLY_CONTENT 
			,REPLY_WRITER
			,(SELECT TITLE FROM board WHERE BOARD_NUM = board_reply.BOARD_NUM) AS TITLE
			,(SELECT CONTENT FROM board WHERE BOARD_NUM = board_reply.BOARD_NUM) AS CONTENT
FROM board_reply
WHERE REPLY_NUM = 40;


#모든 게시글의 글번호, 제목, 작성자, 해당 게시글에 달린 댓글 수를 조회
SELECT BOARD_NUM 
		,TITLE 
		,WRITER 
		,(SELECT COUNT(BOARD_NUM) FROM board_reply WHERE BOARD_NUM = board.BOARD_NUM) AS '댓글 수'
FROM board;





