SELECT *
FROM orders
WHERE amt > (SELECT AVG(ALL amt)
			FROM orders
			WHERE odate = TO_DATE('03-10-1990','DD-MM-YYYY')) ;
