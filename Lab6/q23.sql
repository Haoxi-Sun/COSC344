UPDATE employee
SET salary =  salary*1.1
WHERE lname != 'Borg';


SELECT lname, salary FROM employee;
