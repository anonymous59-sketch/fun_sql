CREATE SEQUENCE product_seq;
-- 시퀀스 생성

SELECT product_seq.nextval from dual;
-- 빈 테이블에 시퀀스 행동 확인하기
-- 1부터 시작해서 1씩 증가함 (기본값)

SELECT *
FROM user_sequences;
-- 만든 시퀀스 확인하는 방법

SELECT *
FROM board; 

drop sequence product_seq;
-- 시퀀스 삭제

desc board;

INSERT INTO board (board_no, title, content, writer)
VALUES (product_seq.nextval, 33, 33, 4);
-- 값을 추가하는 쿼리에 시퀀스를 넣어서 사용하는 것으로 하면 적용 됨