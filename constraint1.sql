--6, test, 공백, user01 넣어보기 - NULL 제약조건으로 입력이 안됨
SELECT *
FROM tab;

INSERT INTO board (board_no, title, content, writer)
VALUES (6, 'test', ' ', 'user01');

-- 제약조건 이름 추가해서 테이블 생성
CREATE TABLE employees (
  emp_no NUMBER(4) CONSTRAINT employees_pk PRIMARY KEY,
  emp_name VARCHAR2(100) CONSTRAINT emp_name_nn NOT NULL,
  jumin_no CHAR(14) CONSTRAINT emp_jumin_no_nn NOT NULL
                    CONSTRAINT emp_jumin_no_uk UNIQUE,
  -- CAHR 타입으로 넣어두면 무조건 자리수를 채워야해서 공백으로 채워진다. 그래서 비교를 할 때 공백의 존재로 문제가 생길 수 있다.
  deptno NUMBER(2) CONSTRAINT emp_dept_fk REFERENCES dept(deptno)
  -- references는 참조한다는 뜻, dept 테이블의 deptno를 참조한다.
  -- INSERT를 할 때 dept table의 deptno의 값이 아니면 안된다.
);

INSERT INTO employees
VALUES(1001, 'Bong', '990101-1234567', 50)
-- references가 되어있는 원래 table의 값이 들어가야 참조하고 있는 하위 테이블에도 만들어진다. 
-- references가 하위에 달려있으면 상위의 table에서 값을 지울 수 없다. 
-- 하위 테이블에 참조된 것들이 모두 삭제 된 이후 상위 table의 값을 지울 수 있다.
;

SELECT *
FROM employees;