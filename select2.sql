 SELECT ename
             , sal as "인상전 급여"
             , sal + comm as "총 급여"
             , sal * 1.1 as "인상된 급여"
             , (sal + comm) * 1.1 as "인상된 급여 (급여 + 보너스)"
 FROM emp
 WHERE sal < 3000
 AND job = 'SALESMAN'
 ORDER BY ename desc;   
 -- 조건절 (where 절 안에 column의 조건을 작성해서 목록 표시
 -- WHERE 절 뒤에 AND나 OR을 통해 조건을 계속해서 덧붙일 수 있음
 -- order by 에서 desc는 역순으로 정렬
 -- select from where and(or) order by 순으로 적는거 잊지말자
 
 SELECT *
 FROM emp;
 
 SELECT *
 FROM emp
 WHERE sal > 2000
 OR job = 'SALESMAN';
 
 SELECT *
 FROM emp
 WHERE sal <= 3000
 AND sal >= 2000;
 -- 위 구문을 간단하게 작성하면 아래 구문이 된다
 
 SELECT *
 FROM emp
 WHERE sal BETWEEN 2000 AND 3000;
 
 SELECT *
 FROM emp
 WHERE hiredate BETWEEN '1981/01/01' AND '1981/12/23';
 -- 오라클이 날짜인걸 알아서 인식하고 출력함
 
 SELECT *
 FROM emp
 WHERE hiredate BETWEEN '81/01/01' AND '81/12/31'
 ORDER BY hiredate;
 
 -- in (a, b, c ...) a, b, c 등등의 값을 가진 것을 들고오겠다라는 뜻
 SELECT *
 FROM emp
 WHERE deptno IN (10, 20)
 AND ename IN ('SMITH', 'FORD');
 -- WHERE deptno >= 10 AND deptno <= 20; 이것과는 차이가  크다
 
SELECT *
FROM emp
WHERE deptno IN(10, 20)
AND ename NOT IN ('SMITH', 'FORD');
-- NOT을 사용하면 제외하겠다는 뜻

-- is null / is not null
SELECT *
FROM emp
WHERE comm IS NOT null; 
-- 값이 ''이라는 공백이라는 뜻과는 다름, null은 계산 못하는 특이값이라고 생각하면 된다. 
-- 그래서 = null이라고 사용하면 안되고 is null이나 is not null 이라고 사용해야된다. null은 비교를 못함

-- LIKE ( = )
SELECT *
FROM emp
WHERE ename LIKE '%LA%';
-- %라는 뜻은 *와 같은 뜻을 가짐, 어떠한 값이 있다는 뜻, _는 글자 하나만 대응해서 __면 2글자가 있다는 뜻, _는 1글자가 있다는 뜻

-- 실습 
SELECT *
FROM professor
-- 중복된 값이 들어오면 안되는 키 = Primary Key 
WHERE deptno IN (101, 103)
AND position NOT LIKE '%full%';
-- NOT을 비교 연산자 앞에 넣어줘야 함
-- AND position = 'a full professor' 또는 AND position != 'a full professor'

SELECT *
FROM professor
-- WHERE name LIKE '%an%';
-- WHERE bonus IS NOT null;
-- WHERE pay + bonus > 300 OR pay >= 300;
-- WHERE (bonus IS NULL AND pay >= 300) OR (pay + bonus >= 300);
-- null 값은 계산하지 못한다는 것을 꼭 기억하자
WHERE pay + nvl(bonus, 0) >= 300;
-- nvl 이라는 함수 : (왼쪽 값, 오른쪽 값) 왼쪽 값이 null이면 오른쪽 값으로 치환해서 생각하겠다.

SELECT *
FROM professor;

SELECT *
FROM department;

-- 교수, 학생 => 교수 교수(학생)번호/ 이름/ 학과정보)
SELECT profno, name, deptno
FROM professor
UNION ALL
SELECT studno, name, deptno1
FROM student;
-- UNION ALL 두 table을 합쳐서 가져오는데 중복된 값이 있더라도 다 가져옴
-- UNION  -- 중복된 값을 제거하고 가져옴

SELECT *
FROM professor;

SELECT *
FROM student;

--
SELECT studno, name
FROM student
WHERE deptno1 = 101
UNION ALL
SELECT studno, name
FROM student
WHERE deptno2 = 201
ORDER BY 1;
-- ORDER BY 1 : 첫번째 column을 기준으로 정렬한다.

SELECT studno, name
FROM student
WHERE deptno1 = 101
-- INTERSECT
-- UNION
MINUS
SELECT studno, name
FROM student
WHERE deptno2 = 201
ORDER BY 1;
-- UNION은 중복값(intersect)을 제거하고 가져온다. INTERSECT를 하면 중복값만 가지고 온다. MINUS : 첫번째 데이터 테이블에서 두번째 데이터 테이블에도 존재하는 것을 제외하고 가져온다.

-- 과제
SELECT ename || q'['s sal is $]' || sal 
              as "Name And Sal"
FROM emp
ORDER BY empno;
