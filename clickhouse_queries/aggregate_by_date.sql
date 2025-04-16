SELECT 
    toDate(order_date) AS order_date, 
    COUNT(*) AS order_count, 
    SUM(total_amount) AS total_amount
FROM orders
GROUP BY order_date
ORDER BY order_date;
