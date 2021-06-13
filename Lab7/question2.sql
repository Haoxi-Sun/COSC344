DECLARE
        CURSOR ec IS
               SELECT * FROM works_on;
        emp ec%ROWTYPE;
        tooless EXCEPTION;
BEGIN
        FOR emp IN ec LOOP
            IF emp.hours >= 8.0 THEN
               DBMS_OUTPUT.PUT_LINE(emp.pno||' '||emp.essn||' '||emp.hours);
             ELSE
                RAISE tooless;
            END IF;
        END LOOP;
EXCEPTION
        WHEN tooless THEN
             DBMS_OUTPUT.PUT_LINE('Someone works hours are less than 8 hours.');
END;
/
