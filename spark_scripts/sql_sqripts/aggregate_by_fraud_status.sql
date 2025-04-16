SELECT is_fraud, COUNT(*) AS transaction_count, SUM(amount) AS total_amount, AVG(amount) AS avg_amount
FROM transactions_v2
GROUP BY is_fraud;
