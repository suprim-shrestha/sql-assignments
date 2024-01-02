CREATE TABLE IF NOT EXISTS Customers (
	customer_id INT PRIMARY KEY,
	customer_name VARCHAR(255),
	contact_name VARCHAR(255),
	address VARCHAR(255),
	city VARCHAR(100),
	postal_code VARCHAR(20),
	country VARCHAR(100)
);