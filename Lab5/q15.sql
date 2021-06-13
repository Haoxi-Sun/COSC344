SELECT orders.onum, customers.cname, customers.cnum, salespeople.snum
FROM orders, customers, salespeople
WHERE customers.city != salespeople.city AND orders.cnum = customers.cnum AND 					salespeople.snum = customers.snum;
