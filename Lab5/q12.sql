SELECT snum, amt
FROM  orders
WHERE amt IN (SELECT max(amt)
              FROM orders
              GROUP BY snum
              )
ORDER BY snum;


