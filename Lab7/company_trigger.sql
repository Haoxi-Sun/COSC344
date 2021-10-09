DROP TABLE e1 cascade constraints;
DROP TABLE d1 cascade constraints;

CREATE TABLE d1
  (dname        VARCHAR2(15)  NOT NULL UNIQUE,
   dnumber      NUMBER(2)     PRIMARY KEY,
   tot_sal      NUMBER(12) DEFAULT 0);

INSERT INTO d1 VALUES
   ('Research', 5, 0);
INSERT INTO d1 VALUES
   ('Administration', 4, 0);
INSERT INTO d1 VALUES
   ('Headquarters', 1, 0);


CREATE TABLE e1
  (fname    VARCHAR2(15) NOT NULL,
   ssn      CHAR(9)      PRIMARY KEY,
   salary   NUMBER(6),
   dno      INT          NOT NULL 
      REFERENCES d1(dnumber));

-- trigger to update total salary if salary changed
CREATE or REPLACE TRIGGER sum_sal
AFTER INSERT OR UPDATE OR DELETE OF salary ON e1
FOR EACH ROW
BEGIN
        IF INSERTING THEN
           UPDATE d1
           SET tot_sal = tot_sal + :NEW.salary
           WHERE dnumber = :NEW.dno;
        ELSIF UPDATING THEN
              UPDATE d1
              SET tot_sal = tot_sal + :NEW.salary - :OLD.salary
              WHERE dnumber = :OLD.dno;
        ELSE -- deleting
             UPDATE d1
             SET tot_sal = tot_sal - :OLD.salary
             WHERE dnumber = :OLD.dno;
        END IF;
END;
/

-- trigger to update total salary if dno changed
CREATE OR REPLACE TRIGGER dno_change
AFTER UPDATE OF dno ON e1
FOR EACH ROW
BEGIN
 UPDATE d1
 SET tot_sal = tot_sal - :OLD.salary
 WHERE dnumber = :OLD.dno;
 UPDATE d1
 SET tot_sal = tot_sal + :NEW.salary
 WHERE dnumber = :NEW.dno;
END;
/


INSERT INTO e1 VALUES
  ('John','123456789',30000,5);
INSERT INTO e1 VALUES
  ('Franklin','333445555',40000,5);
INSERT INTO e1 VALUES
  ('Alicia','999887777',25000,4);
INSERT INTO e1 VALUES
  ('Jennifer','987654321',43000,4);
INSERT INTO e1 VALUES
  ('Ramesh','666884444',38000,5);
INSERT INTO e1 VALUES
  ('Joyce','453453453',25000,5);
INSERT INTO e1 VALUES
  ('Ahmad','987987987',25000,4);
INSERT INTO e1 VALUES
  ('James','888665555',55000,1);




SELECT * FROM d1;
-- Should update department 1 total by 87500
INSERT into e1 VALUES ('Kate', '4121984', 87500, 1);
SELECT * FROM d1;
-- Department 4 total decreases by 25000
DELETE from e1 WHERE ssn = '999887777';
SELECT * FROM d1;
-- Department 4 total increases by 3500
UPDATE e1 SET salary = '28500' WHERE ssn = '987987987';
SELECT * FROM d1;
-- Department 5 total decreases by 30000 and department 1 total increases by 30000
UPDATE e1 SET dno = 1 WHERE ssn = '123456789';
SELECT * FROM d1;


COMMIT;










