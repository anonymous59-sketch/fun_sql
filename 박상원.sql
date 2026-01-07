-- 테이블 확인용
SELECT *
FROM tab;
SELECT *
FROM employees;
SELECT *
FROM departments;
SELECT *
FROM jobs;
SELECT *
FROM prof;

-- 1번 문제 답
SELECT employee_id "사원번호"
     , last_name "이름(last_name)"
     , salary "급여"
     , department_id "부서번호"
FROM employees
WHERE salary >= 7000
AND salary <= 12000
AND last_name LIKE 'H%';

-- 2번 문제 답
SELECT employee_id "사원번호"
     , first_name || '-' || last_name "이름"
     , job_id "업무(JOB_ID)"
     , salary "급여"
     , department_id "부서번호"
FROM employees
WHERE department_id IN (50, 60)
AND salary > 5000;

-- 3번 문제 답
SELECT first_name || '-' || last_name "사원이름"
     , salary "급여" 
     , CASE WHEN salary <= 5000                      THEN salary * 1.20
     		WHEN salary > 5000  AND salary <= 10000  THEN salary * 1.15
     		WHEN salary > 10000 AND salary <= 15000  THEN salary * 1.10
     		WHEN salary >= 15001                     THEN salary    		
       END "인상된 급여"
FROM employees
WHERE employee_id = :eid;

-- 4번 문제 답
SELECT d.department_id "부서번호"
     , d.department_name "부서이름"
     , l.city "도시명"
FROM departments d
JOIN locations l ON d.location_id = l.location_id;

-- 5번 문제 답
SELECT employee_id "사원번호"
     , last_name "이름(LAST_NAME)"
     , job_id "업무(JOB_ID)"
FROM employees
WHERE department_id = (SELECT department_id
                       FROM departments
                       WHERE department_name = 'IT');
-- 6번 문제 답
SELECT employee_id
     , first_name
     , last_name
     , email
     , phone_number
     , TO_CHAR(hire_date, 'dd-mon-yy') "HIRE_DATE"
     , job_id
     , salary
     , commission_pct
     , manager_id
     , department_id
FROM employees
WHERE hire_date < '2014-01-01'
AND job_id = 'ST_CLERK';
-- 중간 날짜 형식이 다른 것 같아서 수정

-- 만약 날짜 형식이 리눅스버전 차이라서 상관이 없다면 아래 주석처리한 쿼리
--SELECT *
--FROM employees
--WHERE hire_date < '2014-01-01'
--AND job_id = 'ST_CLERK';

-- 7번 문제 답
SELECT last_name
     , job_id
     , salary
     , commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC;

-- 8번 문제 답
CREATE TABLE prof (
  PROFNO NUMBER(4),
  NAME VARCHAR2(15) NOT NULL,
  ID VARCHAR2(15) NOT NULL,
  HIREDATE DATE,
  PAY NUMBER(4)
);

-- 9번 문제 답 (1)
INSERT INTO prof (profno, name, id, hiredate, pay)
VALUES (1001, 'Mark', 'm1001', '07/03/01', 800);
INSERT INTO prof (profno, name, id, hiredate)
VALUES (1003, 'Adam', 'a1003', '11/03/02');

-- (2)
UPDATE prof
SET pay = 1200
WHERE profno = 1001;

-- (3)
DELETE FROM prof
WHERE profno = 1003;

-- 10번 문제 답 (1)
ALTER TABLE prof MODIFY (profno PRIMARY KEY);

-- (2)
ALTER TABLE prof ADD (gender CHAR(3));

-- (3) 
ALTER TABLE prof MODIFY (name VARCHAR2(20));


--11번
--최소 2개의 JOIN 조건이 필요하다
-- 예시
SELECT e.employee_id
     , e.first_name || '-' || e.last_name "name"
     , d.department_name
     , j.job_title
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN jobs j ON e.job_id = j.job_id;