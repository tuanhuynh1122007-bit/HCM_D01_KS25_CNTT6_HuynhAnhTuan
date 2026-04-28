CREATE DATABASE SalesManagenement ;
USE SalesManagenement;

CREATE TABLE product (
	product_id VARCHAR(100) PRIMARY KEY ,
    product_name VARCHAR(100) NOT NULL ,
    facturer VARCHAR(100) NOT NULL ,
    price DECIMAL(15,2) CHECK(price > 0),
    stock INT 
);
CREATE TABLE customer(
	customer_id VARCHAR(100) PRIMARY KEY ,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL ,
    phone VARCHAR(100) UNIQUE  ,
    address VARCHAR(100) NOT NULL 
);

CREATE TABLE orders(
	order_id VARCHAR(100) PRIMARY KEY ,
    customer_id VARCHAR(100),
    dateorder DATE NOT NULL,
    sumprice DECIMAL (15,2),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE order_detail(
	order_id VARCHAR(100) ,
    product_id VARCHAR(100) ,
    purchased INT NOT NULL ,
    sellingprice DECIMAL(15,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
ALTER TABLE orders ADD notes TEXT;
ALTER TABLE product RENAME COLUMN facturer TO manufacturer ;

DROP TABLE order_detail ;
DROP TABLE orders; 

INSERT INTO customer (customer_id,fullname,email,phone,address) 
VALUES
('A001','Kiêm Miale','kiemama@gmail.com','094141414','HCM'),
('A002','hi a hi a','woaini@gmail.com','019314131','Hà Nội'),
('A003','kachia wa','kakachiwa@gmail.com',NULL,'Đà nẵng'),
('A004','chichiwa','chichi@gmail.com','0391313133','Nha trang'),
('A005','bakazaro','memeka@gmail.com','0391301331','Tokyo');

INSERT INTO product (product_id,product_name,manufacturer,price,stock )
VALUES 
('QR001','Mô hình từ xa','MQW',120000,15),
('QR002','MacBook','Táo',1500000,3),
('QR003','Air','Táo',2000000000,13),
('QR004','Xe máy','BQW',200000,15),
('QR005','AI','XIAOMI',200000,25);

SET SQL_SAFE_UPDATES = 0;
UPDATE product
SET price = price * 1.10
WHERE manufacturer = 'Táo';

DELETE FROM customer
WHERE Phone IS NULL;

SELECT * FROM product
WHERE price BETWEEN 1000000 AND 2000000; 

SELECT* FROM product 
WHERE product_id = 'QR001'



