SELECT t.transaction_id, 
       COUNT(l.log_id) AS log_count,
       MAX(l.category) AS most_frequent_category
FROM transactions_v2 t
JOIN logs_v2 l ON t.transaction_id = l.transaction_id
GROUP BY t.transaction_id;
