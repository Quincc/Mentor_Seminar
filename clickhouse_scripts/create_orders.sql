CREATE TABLE IF NOT EXISTS orders
(
    order_id UInt64,
    user_id UInt64,
    payment_status String,
    total_amount Float64,
    order_date DateTime
) ENGINE = MergeTree
ORDER BY order_id;
