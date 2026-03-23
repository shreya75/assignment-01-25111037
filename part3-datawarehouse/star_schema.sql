-- DIMENSION TABLES
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    month_name VARCHAR(20) NOT NULL
);
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL
);


-- FACT TABLE
CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    revenue DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);


-- INSERT CLEANED DATA

-- dim_date (standardized YYYY-MM-DD)
INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 2024, 'January'),
(2, '2024-01-02', 1, 2024, 'January'),
(3, '2024-02-01', 2, 2024, 'February'),
(4, '2024-02-05', 2, 2024, 'February');

-- dim_store
INSERT INTO dim_store VALUES
(1, 'Mumbai Store', 'Mumbai'),
(2, 'Delhi Store', 'Delhi'),
(3, 'Bangalore Store', 'Bangalore');

-- dim_product (category standardized casing)
INSERT INTO dim_product VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Shirt', 'Clothing'),
(3, 'Milk', 'Groceries');


-- fact_sales (cleaned: no NULLs, consistent values)
INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 2, 150000.00),
(2, 1, 2, 2, 5, 7500.00),
(3, 2, 1, 3, 10, 600.00),
(4, 2, 3, 1, 1, 75000.00),
(5, 3, 2, 2, 3, 4500.00),
(6, 3, 3, 3, 8, 480.00),
(7, 4, 1, 1, 1, 75000.00),
(8, 4, 2, 3, 6, 360.00),
(9, 3, 1, 2, 4, 6000.00),
(10, 2, 2, 1, 1, 75000.00);