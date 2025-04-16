-- Самые активные пользователи по сумме заказов
SELECT 
    user_id, 
    SUM(total_amount) AS total_spent
FROM orders
GROUP BY user_id
ORDER BY total_spent DESC
LIMIT 10;

-- Самые активные пользователи по количеству заказов
SELECT 
    user_id, 
    COUNT(*) AS order_count
FROM orders
GROUP BY user_id
ORDER BY order_count DESC
LIMIT 10;
