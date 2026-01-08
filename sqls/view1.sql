-- view

SELECT *
FROM tab;


CREATE OR REPLACE VIEW employees_v
-- 인사관리 계정에 view 생성 권한이 없어서 설정을 한 뒤 만들어야 한다.
AS
SELECT employee_id
     , first_name
     , last_name
     , email
     , hire_date
     , job_title
     , department_name
FROM employees2 e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id;

SELECT *
FROM employees_v
-- view를 통해서 데이터를 업데이트 할 수 있지만 view는 데이터를 보는 목적이기때문에 업데이트는 직접 테이블에서 한다.
-- view의 용도는 길고 복잡한 쿼리를 매번 입력하지말고 간단하게 볼 수 있게 한다.
;

-- inline view FROM 뒤에 오는 subquery의 이름을 inline view라고 한다.
SELECT e.department_id, department_name, max_sal
FROM (SELECT department_id
           , MAX(salary) "MAX_SAL"
      FROM employees2
      GROUP BY department_id) e
join departments d ON e.department_id = d.department_id;

SELECT *
FROM tab;

--420p 2번 -- scott계정
