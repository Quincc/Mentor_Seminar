SELECT currency, SUM(amount) AS total_amount
FROM transactions_v2
WHERE currency IN ('USD', 'EUR', 'RUB')
GROUP BY currency;
