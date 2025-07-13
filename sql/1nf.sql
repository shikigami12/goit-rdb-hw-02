DROP TABLE IF EXISTS unnormalized_orders;

CREATE TABLE orders_1nf (
    order_number INT,
    product_name VARCHAR(100),
    quantity INT,
    client_address VARCHAR(255),
    order_date DATE,
    client_name VARCHAR(100)
);