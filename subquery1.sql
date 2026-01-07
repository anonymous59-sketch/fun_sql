-- subquery 
SELECT ename, comm
FROM emp
WHERE comm < (SELECT comm
              FROM emp
              WHERE ename = 'WARD');
SELECT *
FROM emp;
SELECT *
FROM department;

SELECT name stud_name
     , dname dept_name
FROM student s
JOIN department d ON s.deptno1 = d.deptno
WHERE deptno1 = (SELECT deptno1
                 FROM student
                 WHERE name = 'Anthony Hopkins');

SELECT *
FROM professor;
SELECT *
FROM department;
SELECT name prof_name
     , hiredate
     , dname dept_name
FROM professor p
JOIN department d ON p.deptno = d.deptno
WHERE hiredate > (SELECT hiredate
                  FROM professor
                  WHERE name = 'Meg Ryan');

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

SELECT name
     , weight || 'kg' weight
FROM student s
WHERE weight > (SELECT AVG(weight)
                FROM student
--                WHERE deptno1 = 201
                GROUP BY deptno1
                HAVING deptno1 = 201
                );

-- 다중행 Sub Query
SELECT e.empno, e.name, e.deptno
FROM emp2 e
WHERE e.deptno IN (SELECT dcode
                   FROM dept2
                   WHERE area = 'Pohang Main Office')
-- sql 초반에 배웠던 IN 연산자
;

-- exists 연산자
SELECT *
FROM dept
WHERE EXISTS (SELECT deptno
              FROM dept
              WHERE deptno = :dno)
-- exist는 값이 존재한다면 메인 쿼리를 조건에 상관없이 실행
-- 데이터의 존재여부 체크를 위한 연산자
-- &변수 = :변수 둘 다 사용자에게 값을 받는 기능
;

-- 434p
SELECT name
     , position
     , TO_CHAR(pay, '$999,999,999,999') salary
FROM emp2
WHERE pay > (SELECT MIN(pay)
             FROM emp2
             GROUP BY position
             HAVING position = 'Section head');
             
SELECT name
     , position
     , TO_CHAR(pay, '$999,999,999') salary
FROM emp2
WHERE pay >ANY (SELECT pay 
                FROM emp2 
                WHERE position ='Section head');
                
SELECT name
     , grade
     , weight
FROM student
WHERE weight <ALL (SELECT weight
                   FROM student
                   WHERE grade = 2);
                   
SELECT d.dname dname
     , e.name name
     , TO_CHAR(e.pay, '$999,999,999') salary
FROM emp2 e
JOIN dept2 d ON e.deptno = d.dcode
WHERE pay <ALL (SELECT AVG(pay)
                FROM emp2
                GROUP BY deptno);