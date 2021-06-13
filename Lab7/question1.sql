DECLARE
        CURSOR ec IS
               SELECT * FROM dependent;
        emp ec%ROWTYPE;
BEGIN
        FOR emp IN ec LOOP
            DBMS_OUTPUT.PUT_LINE(emp.dependent_name||' '|| emp.relationship);
        END LOOP;
END;
/
