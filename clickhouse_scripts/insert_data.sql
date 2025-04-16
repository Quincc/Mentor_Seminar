INSERT INTO orders
SELECT * FROM CSV('s3://bucket-hse/raw/orders.csv');

INSERT INTO order_items
SELECT * FROM CSV('s3://bucket-hse/raw/order_items.csv');
