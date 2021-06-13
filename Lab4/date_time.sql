DROP TABLE date_time;

CREATE TABLE date_time(a_day DATE, day_time DATE);

INSERT INTO date_time VALUES(TO_DATE('31-01-2000','dd-mm-yyyy'),
                             TO_DATE('10:30:45','hh:mi:ss'));

INSERT INTO date_time VALUES(TO_DATE('31-01-2000','dd-mm-yyyy'),
                             TO_DATE('10:31:45','hh:mi:ss'));

INSERT INTO date_time VALUES(TO_DATE('31-01-2000','dd-mm-yyyy'),
                             TO_DATE('10:32:45','hh:mi:ss'));

INSERT INTO date_time VALUES(TO_DATE('31-01-2000','dd-mm-yyyy'),
                             TO_DATE('10:33:45','hh:mi:ss'));

SELECT TO_CHAR(a_day,'dd-mm-yyyy'),TO_CHAR(day_time, 'hh:mi:ss') FROM date_time ;
SELECT TO_CHAR(a_day,'dd-mon-yyyy'),TO_CHAR(day_time, 'hh:mi') FROM date_time ;
SELECT TO_CHAR(a_day,'dd/mm/yyyy'),TO_CHAR(day_time, 'hh:mi:ss') FROM date_time ;
SELECT TO_CHAR(a_day,'mm/dd/yyyy') FROM date_time ;
