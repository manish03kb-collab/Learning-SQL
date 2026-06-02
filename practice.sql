-- Active: 1780408668479@@127.0.0.1@3306@practice
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

SELECT city, COUNT(*)
FROM customers
GROUP BY city;

SELECT SUM(quantity)
FROM orders;

SELECT name, price
FROM products
ORDER BY price ASC
LIMIT 1;

SELECT name, price
FROM products
WHERE price = (SELECT MIN(price) FROM products)
LIMIT 1;

SELECT c.name, o.quantity
FROM customers c
INNER JOIN orders o
ON c.id = o.customer_id
GROUP BY c.name, o.quantity;

SELECT c.name AS customer_name,
         p.name AS product_name,
         o.quantity
FROM customers c
INNER JOIN orders o
ON c.id = o.customer_id
INNER JOIN products p
ON o.product_id = p.id;

DROP TABLE customers;
DROP TABLE products;
DROP TABLE orders;

SELECT * FROM student;

SELECT c.name,
       SUM(o.quantity * p.price) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.id = o.customer_id
INNER JOIN products p
ON o.product_id = p.id
GROUP BY c.name
ORDER BY total_spending ASC;

SELECT c.name,
       o.quantity
FROM customers c
LEFT JOIN orders o
ON c.id = o.customer_id;

SELECT c.name,
       SUM(o.quantity * p.price) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.id = o.customer_id
INNER JOIN products p
ON o.product_id = p.id
GROUP BY c.name
HAVING total_spending > 50000;

SELECT p.name,
       p.price
FROM products p
WHERE price = (SELECT MAX(price) FROM products);

SELECT p.name,
       SUM(o.quantity) AS total_quantity
FROM products p
LEFT JOIN orders o
ON p.id = o.product_id
GROUP BY p.name
ORDER BY total_quantity DESC
LIMIT 1;

SELECT AVG(p.price) AS average_price
FROM products p;

SELECT p.name,
       p.price
FROM products p
WHERE price > (SELECT AVG(price) FROM products);

SELECT c.name,
       SUM(p.price * o.quantity) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.id = o.customer_id
INNER JOIN products p
ON o.product_id = p.id
GROUP BY c.name
ORDER BY total_spending DESC
LIMIT 1;

SELECT c.name,
       p.name,
       (p.price * o.quantity) AS order_value
FROM customers c
INNER JOIN orders o
ON c.id = o.customer_id
INNER JOIN products p
ON p.id = o.product_id
ORDER BY order_value DESC
LIMIT 1;

SELECT c.name,
       SUM(o.quantity) AS total_items
FROM customers c
INNER JOIN orders o
ON c.id = o.customer_id
GROUP BY c.name
ORDER BY total_items DESC
LIMIT 1;

SELECT p.name,
       SUM(p.price * o.quantity) AS total_revenue
FROM products p
INNER JOIN orders o 
ON p.id = o.product_id
GROUP BY p.name
ORDER BY total_revenue DESC
LIMIT 1;

SELECT c.name,
       COUNT(o.quantity) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.id = o.customer_id
GROUP BY c.name
HAVING total_orders > 1;

SELECT c.name,
       SUM(p.price * o.quantity) AS total_spending
FROM customers c
INNER JOIN orders o
ON c.id = o.customer_id
INNER JOIN products p
ON p.id = o.product_id
GROUP BY c.name
ORDER BY total_spending DESC;

UPDATE customers
SET city = 'New Delhi'
WHERE city = 'Delhi';

UPDATE products
SET price = price + (price * 0.02)
WHERE price < 50000;

SELECT * FROM products;
