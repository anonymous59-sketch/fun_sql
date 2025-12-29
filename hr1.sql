SELECT *
FROM tab;

SELECT *
FROM employees
-- 계정마다 table을 확인할 수 있는 권한이 달라서 다른 계정의 table을 확인할 수 없다.
-- WHERE job_id = 'IT_PROG'
WHERE employee_id = 103;

SELECT *
FROM departments;

-- oracle 데이터베이스는 관계형 데이터베이스이다.

-- Shipping 부서의 모든 사원들을 조회하기
SELECT *
FROM employees
WHERE department_id = 50
AND salary >= 3000;

SELECT *
FROM departments;

-- 급여가 10000 초과하는 사람들 조회. 단,  commission_pct 까지 포함해서 조회
SELECT *
FROM employees
WHERE salary * (1 + nvl(commission_pct, 0)) > 10000
-- AND department_id = 20 OR department_id = 80;
AND department_id IN (20,80);