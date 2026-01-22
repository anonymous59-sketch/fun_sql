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

SELECT *
FROM board;

INSERT INTO board (title, content, writer)
VALUES ("제목1", "내용1", "작성자1");
INSERT INTO board (title, content, writer)
VALUES ("제목2", "내용2", "작성자2");
INSERT INTO board (title, content, writer)
VALUES ("제목3", "내용3", "작성자3");