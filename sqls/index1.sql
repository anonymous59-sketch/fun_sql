-- index

SELECT /*+ INDEX_DESC (e EMP_EMP_ID_PK) */e.rowid, e.*
-- 인덱스로 실행 계획을 지정할 수 있음 사용 예시 : /*+ INDEX (COLUMN INDEX_NAME)*/
FROM employees e;

-- employee_id column의 정보를 index table에 저장함, primarykey라서

SELECT e.rowid, e.*
FROM employees e
ORDER BY e.employee_id
-- ORDER BY는 시간이 오래 걸림, INDEX는 자동으로 정렬이 되니까 INDEX로 사용하자
;

CREATE INDEX emp_hiredate_ix
ON employees2(hire_date);

SELECT *
FROM tab;