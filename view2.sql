-- 420p 2번
SELECT dname "학과명"
     , max_height "최고 키"
     , max_weight "최고 몸무게"
FROM (SELECT deptno1
           , MAX(height) max_height
           , MAX(weight) max_weight
      FROM student
      GROUP BY deptno1) s
JOIN department d ON s.deptno1 = d.deptno;

SELECT *
FROM department;

DESC student;

-- 420p 문제
SELECT *
FROM professor;
DESC professor;
SELECT *
FROM department;
DESC department;

CREATE OR REPLACE VIEW v_prof_dept2
AS
SELECT profno "교수번호"
     , name "교수이름"
     , dname "학과이름"
FROM professor p
JOIN department d ON p.deptno = d.deptno;
SELECT *
FROM v_prof_dept2;