SELECT *
FROM orders outers
WHERE amt > (
            SELECT AVG(amt)
            FROM orders inners
            WHERE outers.cnum = inners.cnum
            );
