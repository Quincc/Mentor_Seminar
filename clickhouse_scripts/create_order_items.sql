-- Create Table order_items
CREATE TABLE IF NOT EXISTS order_items
(
    item_id UInt64,
    order_id UInt64,
    product_name String,
    product_price Float64,
    quantity UInt32
) ENGINE = MergeTree
ORDER BY item_id;

-- Insert into order_items
INSERT INTO order_items
SELECT *
FROM s3(
    'https://storage.yandexcloud.net/bucket-hse/raw/order_items/order_items.txt',
    '<access_key>',
    '<secret_key>',
    'CSVWithNames'
)
SETTINGS format_csv_delimiter = ';';
