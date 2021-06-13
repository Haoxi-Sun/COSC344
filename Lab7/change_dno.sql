CREATE OR REPLACE TRIGGER change_dno
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














