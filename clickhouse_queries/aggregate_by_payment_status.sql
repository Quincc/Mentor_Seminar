SELECT 
    payment_status, 
    COUNT(*) AS order_count, 
    SUM(total_amount) AS total_amount, 
    AVG(total_amount) AS avg_order_amount
FROM orders
GROUP BY payment_status;
