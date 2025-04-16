SELECT category, COUNT(*) AS frequency
FROM logs_v2
GROUP BY category
ORDER BY frequency DESC
LIMIT 10;
