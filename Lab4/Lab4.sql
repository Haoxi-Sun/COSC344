DESCRIBE employee;
SELECT dependent_name 
FROM dependent 
WHERE relationship = 'Daughter' OR relationship = 'Spouse';
SELECT pname 
FROM project 
WHERE plocation is NULL;
SELECT fname, lname, dname
FROM employee, department
WHERE ssn=mgrssn;
SELECT DISTINCT fname, lname
FROM employee, works_on
WHERE hours < 18 AND ssn=essn;
SELECT fname, lname
FROM employee
WHERE lname LIKE 'W%';

SELECT sname
FROM salespeople
WHERE city IN ('San Jose','Barcelona');
SELECT cname, amt
FROM customers, orders
WHERE amt BETWEEN 1500 AND 5000
	  AND customers.cnum = orders.cnum;
SELECT COUNT(*) FROM orders;
SELECT AVG(amt)
FROM orders;
