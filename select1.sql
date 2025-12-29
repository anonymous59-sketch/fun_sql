-- scott 계정소유의 테이블 목록 조회.
-- SQL : Structured Query Language
select * from tab; 
-- table / column 구분해야됨

select * from customer;
-- *는 전체 column을 보겠다는 의미

desc customer; 
-- 테이블의 구조 확인 (데이터 타입 확인 가능)

select gno, gname from customer; 
-- 원하는 column만 보는 방법

select * from professor;
-- professor 라는 table의 모든 column을 조회

SELECT 'hello, ' || name "Name"
FROM student;
-- SELECT와 FROM은 대문자로 쓰는게 보기 편하고 위와같이 명령어는 엔터로 띄워쓰는게 가시성이 좋다.
-- ||가 두개의 문자열을 연결하겠다는 뜻, '' 안에 문자를 적을 수 있다. "" 안되는거 주의
-- as "원하는 column명" 여기엔 ""를 쓰는 것을 주의 alias(별칭), ""없이 as name으로 사용하면 NAME으로 대문자로 출력해줌

SELECT *
FROM department;
-- 학과

SELECT '부서번호는 ' || deptno || ', 이름은 ' || ename as "Name with Dept"
FROM emp
order by ename;
-- 사원 정보
-- distinct 중복되는 값을 제외하고 조회하기
-- distinct 두 개의 column을 하면 둘 다 중복되는 것이 있는지 확인하고 중복 값을 제외한다.
-- select, from, order by 순으로 명령어를 작성한다. order by 뒤에 column명을 적으면 그 column을 정렬하여 표시한다
-- SELECT '부서번호는 ' || deptno, ', 이름은 ' || ename 와 SELECT '부서번호는 ' || deptno || ', 이름은 ' || ename는 column이 2개이냐, 1개이냐의 차이가 있다.

SELECT *
FROM dept;
-- 부서정보

-- 연습문제
SELECT name ||q'['s ID: ]' || id || ' , WEIGHT is ' || weight || 'kg' 
              as "ID AND WEIGHT"
FROM student;

SELECT '''s'
FROM dual;
-- 결과창에 바로 출력하고 싶을 때 table을 dual로 정해서 하면 출력이 바로 나옴

SELECT ename || '(' || job || '), ' || ename || '''' || job || '''' 
              as "NAME AND JOB"
FROM emp
order by hiredate;

SELECT ename || q'['s sal is $]' || sal 
              as "Name And Sal"
FROM emp
order by hiredate;

SELECT *
FROM emp;