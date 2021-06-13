SELECT snum, sname
FROM salespeople
WHERE 1 < (
             SELECT COUNT(*)
             FROM customers
             WHERE salespeople.snum = customers.snum);
SELECT *
FROM orders outers
WHERE amt > (
            SELECT AVG(amt)
            FROM orders inners
            WHERE outers.cnum = inners.cnum
            );
SELECT fname, lname
FROM employee
WHERE NOT EXISTS(SELECT *
                 FROM dependent
                 WHERE employee.ssn = dependent.essn)
ORDER BY  lname, fname;
INSERT INTO department VALUES
('TempDept',6,'123456789', TO_DATE('18-Jul-2002','DD-MON-YYYY'));

INSERT INTO project VALUES('TemProject',50,'Houston', 6);


SELECT pnumber
FROM project
JOIN department ON project.dnum = department.dnumber
JOIN employee ON department.mgrssn = employee.ssn
WHERE employee.lname = 'Smith'
UNION
SELECT pnumber
FROM project
JOIN works_on ON works_on.pno = project.pnumber
JOIN employee ON employee.ssn = works_on.essn
WHERE employee.lname = 'Smith';
UPDATE employee
SET salary =  salary*1.1
WHERE lname != 'Borg';


SELECT lname, salary FROM employee;
DROP TABLE hou_emp;

CREATE TABLE hou_emp
AS( SELECT fname, lname, address, salary
FROM employee WHERE address LIKE '%Houston%');

SELECT * FROM hou_emp;
 
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
