SELECT *
FROM orders
WHERE snum IN ( SELECT snum
				FROM salespeople
				WHERE city = 'London');
