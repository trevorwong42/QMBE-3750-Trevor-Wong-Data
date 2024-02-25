USE bits;



SELECT price,category
FROM tasks;
WHERE price BETWEEN 10 AND 100
GROUP BY category
HAVING abs(pric)>40
ORDER BY price
LIMIT 10;

