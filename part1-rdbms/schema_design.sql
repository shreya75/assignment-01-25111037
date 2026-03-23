-- Offices
CREATE TABLE offices (
    office_id INT PRIMARY KEY,
    office_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL
);
INSERT INTO offices VALUES
(1, 'Bangalore Office', 'MG Road, Bangalore - 560001'),
(2, 'Hyderabad Office', 'Banjara Hills, Hyderabad - 500034'),
(3, 'Chennai Office', 'T Nagar, Chennai - 600017');


--  Sales Representatives
CREATE TABLE sales_reps (
    sales_rep_id INT PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    office_id INT NOT NULL,
    FOREIGN KEY (office_id) REFERENCES offices(office_id)
);
INSERT INTO sales_reps VALUES
(101, 'Amit Sharma', 1),
(102, 'Priya Verma', 2),
(103, 'Rahul Reddy', 3),
(104, 'Sneha Iyer', 4),
(105, 'Karan Mehta', 5);


-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);
INSERT INTO customers VALUES
(201, 'Ravi Kumar', 'ravi@gmail.com'),
(202, 'Anita Singh', 'anita@gmail.com'),
(203, 'Vikram Rao', 'vikram@gmail.com'),
(204, 'Pooja Nair', 'pooja@gmail.com'),
(205, 'Arjun Das', 'arjun@gmail.com');


--  Products 
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);
INSERT INTO products VALUES
(301, 'Laptop', 'Electronics', 75000.00),
(302, 'Mobile Phone', 'Electronics', 25000.00),
(303, 'Office Chair', 'Furniture', 8000.00),
(304, 'Desk Table', 'Furniture', 12000.00),
(305, 'Headphones', 'Accessories', 2000.00);


-- Orders 
CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    sales_rep_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);
INSERT INTO orders VALUES
('ORD1001', '2025-01-10', 201, 101),
('ORD1002', '2025-01-11', 202, 102),
('ORD1003', '2025-01-12', 203, 103),
('ORD1004', '2025-01-13', 204, 104),
('ORD1005', '2025-01-14', 205, 105);


-- Order Items 
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id VARCHAR(20) NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO order_items VALUES
(1, 'ORD1001', 301, 1),
(2, 'ORD1002', 302, 2),
(3, 'ORD1003', 303, 1),
(4, 'ORD1004', 304, 1),
(5, 'ORD1005', 305, 3);