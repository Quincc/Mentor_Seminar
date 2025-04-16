SELECT TO_DATE(transaction_date) AS transaction_date, 
       COUNT(*) AS transaction_count, 
       SUM(amount) AS total_amount, 
       AVG(amount) AS avg_amount
FROM transactions_v2
GROUP BY TO_DATE(transaction_date)
ORDER BY transaction_date;
