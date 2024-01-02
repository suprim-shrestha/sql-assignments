CREATE TABLE IF NOT EXISTS Products (
	product_id INT PRIMARY KEY,
	product_name VARCHAR(255),
	supplier_id INT,
	category_id INT,
	unit VARCHAR(50),
    price DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);