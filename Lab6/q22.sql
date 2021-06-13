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
