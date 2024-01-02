CREATE TABLE IF NOT EXISTS Suppliers (
	supplier_id INT PRIMARY KEY,
	supplier_name VARCHAR(255),
	contact_name VARCHAR(255),
	address VARCHAR(255),
	city VARCHAR(100),
	postal_code VARCHAR(20),
	country VARCHAR(100),
	phone VARCHAR(20)
);