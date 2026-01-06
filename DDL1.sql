-- 게시판(제목, 내용, 작성자, 작성시간, 조회수, 수정시간 ...)
CREATE TABLE board (
-- 테이블 만들기 DDL
  board_no NUMBER PRIMARY KEY
-- primary key는 중복되는 값이 들어가면 안됨, not null 제약도 포함되어있음
 ,title varchar2(100) NOT NULL 
-- 컬럼명, 타입, 제약조건; 구분은 공란으로 나눈다.
 ,content varchar2(1000) NOT NULL
 ,writer varchar2(50) NOT NULL
 ,write_date DATE DEFAULT sysdate
 -- insert로 데이터를 등록할 때 write_date에 대한 등록 데이터가 없다면 현재 시간을 가지고 값을 담는다
);

SELECT *
FROM board;

INSERT INTO board (title, content, writer, board_no)
VALUES ('신규회원등록관련', '신규회원아이디는 50글자 미만으로 작성해주세요.', 'admin2', 7)
-- DML 데이터를 테이블에 추가하기
;
INSERT INTO board (title, content, writer, write_date)
VALUES ('제목', '내용', '작성자', '2025-01-02');

-- 새로운 columns을 추가
ALTER TABLE board ADD (click_cnt NUMBER);

-- columns 명을 변경
ALTER TABLE board RENAME COLUMN click_cnt TO view_cnt;

-- columns의 타입을 변경
ALTER TABLE board MODIFY writer varchar2(100);

-- table 자체를 삭제
DROP TABLE board;

-- CRUD 기능 (Create, Read, Update, Delete)
SELECT *
FROM dept2;

INSERT INTO dept2
-- columns을 따로 지정하지 않으면 모든 columns에 대해서 데이터를 입력
VALUES('9000', 'temp_1', '1006', 'temp area');

SELECT *
FROM product;

-- p_code : 999, p_name : Potato Chip, p_price : 1200을 넣기
INSERT INTO product
VALUES(999, 'Potato Chip', 1200);

-- commit(데이터베이스에 변경사항을 반영), rollback(커밋을 이전 커밋으로 되돌린다)
ROLLBACK;

-- CTAS 기존 테이블의 형식과 데이터를 모두 가져와서 새로운 테이블을 만드는 방식
CREATE TABLE professor2
AS
SELECT *
FROM professor;

-- ITAS
INSERT INTO professor2
SELECT * 
FROM professor;

SELECT *
FROM professor2;

-- 테이블 데이터만 삭제
DELETE FROM professor2;
DELETE FROM professor2
WHERE profno = 1001;

-- 테이블을 update 하기
SELECT *
FROM professor2;
-- profno 1001의 pay, bonus를 변경
UPDATE professor2
SET pay = 650
  , bonus = 200
WHERE profno = 1001
-- 데이터 업데이트를 할 때 where 조건 없이 적용하면 모든 값이 변경되니까 주의
;

SELECT *
FROM board;

DELETE FROM board
WHERE board_no > 4;

-- 5번글, 게시글 연습입니다, 신규글 등록합니다, user01 => 등록
-- 5번글의 제목 :게시글 수정입니다, 내용 : 신규글을 수정합니다.
-- 5번글 삭제.
INSERT INTO board (board_no, title, content, writer)
VALUES (5, '게시글 연습입니다.', '신규글 등록합니다', 'user01');

UPDATE board
SET title = '게시글 수정입니다'
  , content = '신규글을 수정합니다'
WHERE board_no = 5;

DELETE FROM board
WHERE board_no = 5;

ALTER TABLE board MODIFY writer varchar2(50);

CREATE TABLE student2
AS
SELECT *
FROM student;

CREATE TABLE student3
AS 
SELECT *
FROM student
WHERE 1=2
-- 만족하는 데이터가 없으니 테이블의 형식만 가져와서 만든다
;
INSERT INTO student3
SELECT * FROM student;
DELETE FROM student3;

SELECT *
FROM student3;
SELECT *
FROM professor;

-- prof name Jodie Foster를 Anthony Hopkins의 porfno로 넣기
-- subquery를 사용해서 만들기, subquery 결과를 확인하고 값이 대응이 잘 되는지 확인해야됨
UPDATE student3
SET profno = (SELECT profno FROM professor WHERE name = 'Jodie Foster')
WHERE name = 'Anthony Hopkins';

-- grade = 3, deptno2 = null의 전공을 Computer Enginerring으로 지정
SELECT *
FROM department;

UPDATE student2
SET deptno2 = (SELECT deptno FROM department WHERE dname = 'Computer Engineering')
WHERE grade = 3
AND deptno2 IS NULL;