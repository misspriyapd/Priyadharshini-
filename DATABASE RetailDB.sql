CREATE DATABASE RetailDB;
USE RetailDB;


CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL CHECK (stock >= 0)
);

CREATE TABLE Suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    contact VARCHAR(50)
);

CREATE TABLE Sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    date DATE NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id)
);



INSERT INTO Products (name, price, stock) VALUES
('Laptop', 1200.00, 15),
('Mouse', 25.50, 50),
('Keyboard', 45.00, 30),
('Monitor', 200.00, 8),
('Printer', 150.00, 5);

INSERT INTO Suppliers (name, contact) VALUES
('Tech Supplies Inc.', 'tech@supplies.com'),
('Office Essentials', 'office@essentials.com');

INSERT INTO Sales (product_id, date, quantity, total_price) VALUES
(1, '2025-02-01', 2, 2400.00),
(2, '2025-02-02', 5, 127.50),
(4, '2025-02-03', 3, 600.00),
(5, '2025-02-04', 1, 150.00);


-- List all products
SELECT * FROM Products;

-- Show products with stock less than 10
SELECT * FROM Products WHERE stock < 10;

-- List sales with product names and total prices
SELECT Sales.id, Products.name AS product_name, Sales.total_price
FROM Sales
JOIN Products ON Sales.product_id = Products.id;

-- Calculate the total sales for each product
SELECT Products.name AS product_name, SUM(Sales.total_price) AS total_sales
FROM Sales
JOIN Products ON Sales.product_id = Products.id
GROUP BY Products.name;
