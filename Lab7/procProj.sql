CREATE or REPLACE
PROCEDURE getSSNHours(pnum IN INT)
AS
	CURSOR w_o IS 
	       SELECT * FROM works_on WHERE pno = pnum;
	w w_o%ROWTYPE;
	fewHours EXCEPTION;
BEGIN
	FOR w in w_o LOOP
	    DBMS_OUTPUT.PUT_LINE( w.essn || ' ' || w.hours);
	    IF w.hours < 8.0 THEN
	       RAISE fewHours;
	    END IF;
	END LOOP;
EXCEPTION
	WHEN NO_DATA_FOUND THEN NULL;
	WHEN fewHours THEN
	     DBMS_OUTPUT.PUT_LINE('Works less than 8 hours!');
END;
/
