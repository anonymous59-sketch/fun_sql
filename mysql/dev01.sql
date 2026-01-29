SHOW DATABASES;
USE dev;

-- 테이블생성 
CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    phone VARCHAR(45) NOT NULL,
    address VARCHAR(100) NULL,
    PRIMARY KEY (id)
);
SELECT *
FROM customers;

-- 홍길동, hong@email.com, 010-1234-5678 데이터 넣기
INSERT INTO customers (name, email, phone)
VALUES ('홍길동', 'hong@email.com', '010-1234-5678');

UPDATE customers
SET address = "대구"
WHERE id >= 5;

DELETE FROM customers
WHERE id <= 5;

CREATE TABLE member (
  user_id VARCHAR(45) NOT NULL,
  user_pw VARCHAR(100) NOT NULL,
  user_name VARCHAR(100) NOT NULL,
  user_img VARCHAR(100),
  PRIMARY KEY (user_id)
);

SELECT *
FROM member
ORDER BY 1;

-- sql safe updates 푸는 방법, 0: 풀기, 1: 설정
SET SQL_SAFE_UPDATES = 1;
DELETE FROM member;

-- column 추가 일반사용자 / 관리자 구분, enum(a,b) a 또는 b 값만 들어올 수 있다.
ALTER TABLE member ADD COLUMN responsibility enum('Admin', 'User') DEFAULT 'User';

INSERT INTO member 
VALUES ('22', 'test', 'test', 'test', 'ad');

UPDATE member
SET responsibility = 'Admin'
WHERE user_id = '12';

DELETE FROM member
WHERE user_id = 'test123' OR user_id = 'test1234' OR user_id = 'test1235';

SELECT *
FROM member;