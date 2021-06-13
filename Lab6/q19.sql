SELECT snum, sname
FROM salespeople
WHERE 1 < (
             SELECT COUNT(*)
             FROM customers
             WHERE salespeople.snum = customers.snum);
