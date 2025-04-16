--CREATE TABLE

CREATE TABLE logs_v2 (
    log_id BIGINT,
    transaction_id BIGINT,
    category STRING,
    comment STRING,
    log_timestamp TIMESTAMP
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ';'
STORED AS TEXTFILE;

LOAD DATA INPATH 'gs://bucket-hse/raw/logs.txt' INTO TABLE logs_v2;
