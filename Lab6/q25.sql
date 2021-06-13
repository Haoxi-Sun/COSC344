DROP TABLE emp_dep;

CREATE TABLE emp_dep
AS(
        SELECT fname, lname,dependent_name,dependent.sex,dependent.bdate
        FROM employee, dependent
        WHERE ssn = essn
        );
COMMIT;

SELECT*
FROM emp_dep
ORDER BY fname;
