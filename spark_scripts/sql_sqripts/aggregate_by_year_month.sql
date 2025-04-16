SELECT YEAR(transaction_date) AS year, MONTH(transaction_date) AS month, 
       COUNT(*) AS transaction_count, 
       SUM(amount) AS total_amount, 
       AVG(amount) AS avg_amount
FROM transactions_v2
GROUP BY YEAR(transaction_date), MONTH(transaction_date)
ORDER BY year, month;
