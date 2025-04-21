-- CREATE EXTERNAL TABLE

CREATE EXTERNAL TABLE IF NOT EXISTS transactions_v2 (
    transaction_id INT,
    user_id INT,
    amount DECIMAL(10,2),
    currency STRING,
    transaction_date TIMESTAMP,
    is_fraud INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 's3a://bucket-hse/raw/transactions/';
