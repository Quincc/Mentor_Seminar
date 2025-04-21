-- CREATE EXTERNAL TABLE

CREATE EXTERNAL TABLE IF NOT EXISTS logs_v2 (
    log_id BIGINT,
    transaction_id BIGINT,
    category STRING,
    comment STRING,
    log_timestamp TIMESTAMP
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ';'
STORED AS TEXTFILE
LOCATION 's3a://bucket-hse/raw/logs/';
