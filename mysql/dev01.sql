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