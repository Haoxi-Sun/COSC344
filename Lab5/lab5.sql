SELECT snum, amt
FROM  orders
WHERE amt IN (SELECT max(amt)
              FROM orders
              GROUP BY snum
              )
ORDER BY snum;


SELECT snum, MAX(amt)
FROM orders
GROUP BY snum
HAVING MAX(amt) > 3000
;
SELECT snum, MAX(amt)
FROM orders
GROUP BY snum
HAVING MAX(amt) > 3000
;
SELECT fname, lname, salary
FROM employee
ORDER BY salary, lname;
SELECT orders.onum, customers.cname, customers.cnum, salespeople.snum
FROM orders, customers, salespeople
WHERE customers.city != salespeople.city AND orders.cnum = customers.cnum AND 					salespeople.snum = customers.snum;
SELECT cname, amt
FROM customers, orders
WHERE amt = ( SELECT MAX(amt)
			FROM orders
			) 
		AND customers.cnum = orders.cnum; 
SELECT *
FROM orders
WHERE amt > (SELECT AVG(ALL amt)
			FROM orders
			WHERE odate = TO_DATE('03-10-1990','DD-MM-YYYY')) ;
SELECT *
FROM orders
WHERE snum IN ( SELECT snum
				FROM salespeople
				WHERE city = 'London');
