SELECT *
FROM employees2;

CREATE TABLE employees2
AS
SELECT *
FROM employees;

SELECT e2.employee_id "사원번호"
     , e2.first_name || '-' || e2.last_name "사원이름"
     , e2.department_id "직무번호"
     , d.department_name "직무이름"
FROM employees2 e2
JOIN departments d
ON e2.department_id = d.department_id
WHERE job_id = 'IT_PROG';

SELECT *
FROM departments;

