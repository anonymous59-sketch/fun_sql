SELECT empno
	  ,ename
	  ,dname
	  ,loc
	  ,e.deptno
FROM emp e
-- driving table 또는 주 테이블
JOIN dept d ON e.deptno = d.deptno
-- join table
-- table alias 활용하기
-- 조건이 두 개가 같다 : equijoin이라고도 부른다, 값이 null이면 제외하고 join한다 = inner join
-- ANSI JOIN 표준 문법
WHERE dname = 'ACCOUNTING'
;

SELECT empno
	 , ename
	 , e.deptno
	 , dname
	 , loc
	 , d.deptno
FROM emp e
	,dept d
-- Cartesian Product 카티션 곱이라고 부른다
WHERE dname = 'ACCOUNTING';

SELECT empno
	 , ename
	 , e.deptno
	 , dname
	 , loc
	 , d.deptno
FROM emp e
	,dept d
WHERE e.deptno = d.deptno
AND dname = 'ACCOUNTING';

-- 학생, 교수, 학과 조인 해보기
SELECT *
FROM student;
SELECT *
FROM professor;
SELECT *
FROM department;

-- 학번, 이름, 담당교수 이름, 학과명
SELECT s.studno "학번"
	 , s.name "학생이름"
	 , p.name "교수이름"
	 , d.dname "학생의 주전공"
FROM student s
JOIN professor p ON s.profno = p.profno
-- 학생과 교수 테이블의 교수 번호로 연결
JOIN department d ON s.deptno1 = d.deptno
-- 학생과 학과 테이블의 학과 번호로 연결
;

-- none-equi join
SELECT *
FROM customer;
SELECT *
FROM gift;
SELECT c.*
	 , g.gname
FROM customer c
--JOIN gift g ON c.point BETWEEN g.g_start AND g.g_end
JOIN gift g ON c.point >= g.g_start AND c.point <= g.g_end
;

SELECT *
FROM student;
SELECT *
FROM score;
SELECT *
FROM hakjum;
SELECT s.studno "학번"
	 , s.name "이름"
	 , sc.total "점수"
	 , h.grade "학점"
FROM student s
JOIN score sc ON s.studno = sc.studno
JOIN hakjum h ON sc.total >= h.min_point AND sc.total <= h.MAX_POINT
;

-- 254p
SELECT *
FROM student;
SELECT *
FROM department;
-- ANSI 문법
SELECT s.name "STU_NAME"
	 , s.deptno1 "DEPTNO1"
	 , d.dname "DEPT_NAME"
FROM student s
JOIN department d ON s.deptno1 = d.deptno;
-- Oracle 문법
SELECT s.name "STU_NAME"
	 , s.deptno1 "DEPTNO1"
	 , d.dname "DEPT_NAME"
FROM student s
	,department d
WHERE s.deptno1 = d.deptno;


SELECT *
FROM emp2;
SELECT *
FROM p_grade;
-- ANSI 문법
SELECT e.name "NAME"
	 , e.position "POSITION"
	 , e.pay "PAY"
	 , p.s_pay "Low PAY"
	 , p.e_pay "High PAY"
FROM emp2 e
JOIN p_grade p ON e.position = p.POSITION;
-- Oracle 문법
SELECT e.name "NAME"
	 , e.position "POSITION"
	 , e.pay "PAY"
	 , p.s_pay "Low PAY"
	 , p.e_pay "High PAY"
FROM emp2 e
	,p_grade p
WHERE e.POSITION = p.POSITION;

SELECT *
FROM emp2;
SELECT *
FROM p_grade;
SELECT e.name
     , TRUNC(MONTHS_BETWEEN(sysdate, e.birthday)/12)"AGE"
     , e.birthday
     , e.POSITION "CURR_POSITION"
     , p.POSITION "BE_POSITION"
FROM emp2 e
JOIN p_grade p ON TRUNC(MONTHS_BETWEEN(sysdate, e.birthday)/12) >= p.s_age
               AND TRUNC(MONTHS_BETWEEN(sysdate, e.birthday)/12) <= p.e_age;

UPDATE emp2
SET    birthday = ADD_MONTHS(birthday, 2)
WHERE 1=1
-- 나이를 수정하기 위해 emp2 테이블의 생일을 조정함
;

-- Outer join ; 값이 null이라도 연결하는 join
SELECT s.studno "학번"
     , s.name "학생이름"
     , p.profno "교수번호"
     , p.name "교수이름"
FROM student s
--LEFT OUTER JOIN professor p ON s.profno = p.profno
-- 왼쪽 테이블을 기준으로 값을 가져오겠다. ; 왼쪽 테이블에 null값이 있더라도 다 가져온다는 뜻
-- driving table, inner table // driven table, outer table 구분
--RIGHT OUTER JOIN professor p ON s.profno = p.profno
-- 오른쪽 테이블을 기준으로
FULL OUTER JOIN professor p ON s.profno = p.profno
-- 두 테이블 전부 다 NULL값이 있더라도 가져오겠다
;

SELECT *
FROM professor;

-- self join
SELECT e1.empno "사원번호"
      ,e1.ename "사원이름"
      ,e2.empno "관리자번호"
      ,e2.ename "관리자이름"
FROM emp e1
FULL OUTER JOIN emp e2 ON e1.mgr = e2.empno ;

-- 255p
SELECT *
FROM customer;
SELECT *
FROM gift;
SELECT c.gname "CUST_NAME"
     , c.point "POINT"
     , g.gname "GIFT_NAME"
FROM gift g
JOIN customer c ON c.point > 600000
WHERE g.gno = 7
;
SELECT c.gname "CUST_NAME"
	 , c.point "POINT"
	 , g.gname "GIFT_NAME"
FROM customer c
JOIN gift g ON c.point >= 600001 AND g.gno = 7;


SELECT p1.profno "PROFNO"
     , p1.name "NAME"
     , p1.hiredate "HIREDATE"
     , count(p2.hiredate) "COUNT"
FROM professor p1
LEFT OUTER JOIN professor p2 ON p1.hiredate > p2.hiredate
GROUP BY p1.profno, p1.name, p1.hiredate
ORDER BY 4;

SELECT *
FROM emp;

SELECT e1.empno empno
     , e1.ename ename
     , e1.hiredate hiredate
     , COUNT(e2.hiredate) count
FROM emp e1
LEFT OUTER JOIN emp e2 ON e1.hiredate > e2.hiredate
GROUP BY e1.empno, e1.ename, e1.hiredate
ORDER BY 4;

SELECT e1.empno empno
	 , e1.ename ename
	 , e1.hiredate hiredate
	 , COUNT(e2.empno) count
FROM emp e1, emp e2
WHERE e1.hiredate > e2.hiredate(+)
GROUP BY e1.empno, e1.ename, e1.hiredate
ORDER BY 4;
