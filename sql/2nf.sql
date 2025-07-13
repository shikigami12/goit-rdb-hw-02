DROP TABLE IF EXISTS orders_1nf;

-- Table for Clients
CREATE TABLE clients_2nf (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(100),
    client_address VARCHAR(255)
);

-- Table for Orders
CREATE TABLE orders_2nf (
    order_number INT PRIMARY KEY,
    order_date DATE,
    client_id INT,
    FOREIGN KEY (client_id) REFERENCES clients_2nf(client_id)
);

-- Table for Order Items (linking orders and products)
CREATE TABLE order_items_2nf (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_number INT,
    product_name VARCHAR(100),
    quantity INT,
    FOREIGN KEY (order_number) REFERENCES orders_2nf(order_number)
);
