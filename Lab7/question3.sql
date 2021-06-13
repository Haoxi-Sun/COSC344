CREATE OR REPLACE TRIGGER question3
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
