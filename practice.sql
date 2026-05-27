-- Active: 1779889906883@@127.0.0.1@3306@mysql
CREATE TABLE student (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT,
    age INTEGER
);

INSERT INTO student (name, age)
VALUES
('Manish', 21),
('Rahul', 19),
('Aisha', 22);

CREATE TABLE customers (
    id INTEGER,
    name TEXT,
    city TEXT
);

CREATE TABLE products (
    id INTEGER,
    name TEXT,
    price INTEGER
);

CREATE TABLE orders (
    id INTEGER,
    customer_id INTEGER,
    product_id INTEGER,
    quantity INTEGER
);

INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Ravi', 'Mumbai'),
(3, 'Neha', 'Delhi');

INSERT INTO products VALUES
(1, 'Laptop', 50000),
(2, 'Phone', 20000),
(3, 'Tablet', 30000);

INSERT INTO orders VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 2, 2, 1),
(4, 3, 3, 1);

SELECT * FROM customers WHERE city = 'Delhi';
SELECT * FROM products
ORDER BY price DESC;
SELECT * FROM products
ORDER BY price ASC LIMIT 4;
SELECT * FROM products;