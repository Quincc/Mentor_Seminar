--CREATE TABLE

CREATE TABLE IF NOT EXISTS transactions_v2 (
    transaction_id INT,
    user_id INT,
    amount DECIMAL,
    currency STRING,
    transaction_date TIMESTAMP,
    is_fraud INT
    )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA INPATH 'gs://bucket-hse/raw/transactions.csv' INTO TABLE transactions_v2;
