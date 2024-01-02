CREATE TABLE IF NOT EXISTS Orders (
	order_id INT PRIMARY KEY,
	customer_id INT,
	employee_id INT,
	order_date TIMESTAMP,
	shipper_id INT,
	FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
	FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
	FOREIGN KEY (shipper_id) REFERENCES Shippers(shipper_id)
);