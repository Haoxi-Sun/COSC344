DROP TABLE hou_emp;

CREATE TABLE hou_emp
AS( SELECT fname, lname, address, salary
FROM employee WHERE address LIKE '%Houston%');

SELECT * FROM hou_emp;
 
