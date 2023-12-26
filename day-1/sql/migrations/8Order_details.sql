CREATE TABLE IF NOT EXISTS Order_details (
	order_detail_id INT PRIMARY KEY,
	order_id INT,
	product_id INT,
	quantity INT CHECK (quantity >= 0),
	FOREIGN KEY (order_id) REFERENCES Orders(order_id),
	FOREIGN KEY (product_id) REFERENCES Products(product_id)
);