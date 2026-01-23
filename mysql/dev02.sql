use dev;
-- 글번호, 제목, 내용, 작성자, 일시
CREATE TABLE board (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  content TEXT NOT NULL,
  writer VARCHAR(5) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE board MODIFY writer VARCHAR(50) NOT NULL;

SELECT count(*)
FROM board;
SELECT *
FROM board;

SELECT *
FROM board
ORDER BY 1
LIMIT 10 OFFSET 0;
-- LIMIT 가지고 오고싶은 수, OFFSET 이 수 다음의 것부터 가져오기

INSERT INTO board (title, content, writer)
SELECT title, content, writer
FROM board;

INSERT INTO board (title, content, writer)
VALUES ('제목test3', '내용test3', '작성자3');

DELETE FROM board
WHERE id > 500;