SELECT DISTINCT fname, lname
FROM employee, works_on
WHERE hours < 18 AND ssn=essn;
