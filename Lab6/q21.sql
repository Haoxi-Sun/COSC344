SELECT fname, lname
FROM employee
WHERE NOT EXISTS(SELECT *
                 FROM dependent
                 WHERE employee.ssn = dependent.essn)
ORDER BY  lname, fname;
