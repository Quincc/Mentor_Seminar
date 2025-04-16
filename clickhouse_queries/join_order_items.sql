SELECT 
    o.order_id,
    SUM(i.quantity) AS total_quantity, 
    SUM(i.product_price * i.quantity) AS total_amount, 
    AVG(i.product_price) AS avg_product_price
FROM orders o
JOIN order_items i ON o.order_id = i.order_id
GROUP BY o.order_id;
