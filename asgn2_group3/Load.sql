DROP TABLE book_category;
DROP TABLE student_book;
DROP TABLE student_room;
DROP TABLE room_info;
DROP TABLE works_in;
DROP TABLE student_job;
DROP TABLE staff;
DROP TABLE bookinfo;
DROP TABLE job_info;
DROP TABLE student;
DROP TABLE lib_building;


CREATE TABLE student(
fname     	VARCHAR2(15) NOT NULL,
mname     	CHAR,
lname     	VARCHAR2(15) NOT NULL,
student_id 	CHAR(10) PRIMARY KEY,
email_address   VARCHAR2 (28),
dob       	DATE
);


INSERT INTO student VALUES
('Timothea','J','Warner','1234567','warti100@student.otago.ac.nz',TO_DATE('01-05-1997', 'DD-MM-YYYY'));
INSERT INTO student VALUES
('Gina','A','Alvarez','7895623','alvgi101@student.otago.ac.nz',TO_DATE('21-12-1998','DD-MM-YYYY'));
INSERT INTO student VALUES
('Theo','T','Stevens','4562359','steth102@student.otago.ac.nz',TO_DATE('15-01-1997','DD-MM-YYYY'));
INSERT INTO student VALUES
('Estelle','A','Garner','4513150','gares103@student.otago.ac.nz',TO_DATE('22-12-2000','DD-MM-YYYY'));
INSERT INTO student VALUES
('Ramona','R','Sims','5147967','simra104@student.otago.ac.nz',TO_DATE('31-12-2002','DD-MM-YYYY'));
INSERT INTO student VALUES
('Eugenia','E','Townsend','7894520','toweu105@student.otago.ac.nz',TO_DATE('06-11-1995','DD-MM-YYYY'));
INSERT INTO student VALUES
('Sally','S','Hum','4468206','humsa106@student.otago.ac.nz',TO_DATE('28-11-1998','DD-MM-YYYY'));
INSERT INTO student VALUES
('Alicia','J','Smith','8888222','smial107@student.otago.ac.nz',TO_DATE('30-03-1999','DD-MM-YYYY'));
INSERT INTO student VALUES
('Jennifer','X','Wallace','9658201','walje108@student.otago.ac.nz',TO_DATE('20-02-2002','DD-MM-YYYY'));
INSERT INTO student VALUES
('Vicky','v','He','8546073','hevic109@student.otago.ac.nz',TO_DATE('11-11-2000','DD-MM-YYYY'));


CREATE TABLE lib_building(
lib_name	  VARCHAR2(20) PRIMARY KEY,
lib_address	  VARCHAR2(50),
opening_hours     VARCHAR2(30)
);

INSERT INTO lib_building VALUES('Central', '65 Albany Street', '7am-11pm');
INSERT INTO lib_building VALUES('Robertson', '135 Union Street East', '7am-11pm');
INSERT INTO lib_building VALUES('Science', '100 Castle Street North', '7am-11pm');
INSERT INTO lib_building VALUES('Law', '85 Albany Street', '7am-11pm');


CREATE TABLE bookinfo(
barcode         CHAR(12)     PRIMARY KEY,
title  		VARCHAR2(50) NOT NULL,
author 		VARCHAR2(30) NOT NULL,
publisher  	VARCHAR2(30) NOT NULL,
status          VARCHAR2(15) NOT NULL, 
lib_name   	VARCHAR2(20) NOT NULL CONSTRAINT libbuilding_fk REFERENCES lib_building(lib_name) DISABLE
);

ALTER TABLE bookinfo ENABLE CONSTRAINT libbuilding_fk;


INSERT INTO bookinfo VALUES('278462740182', 'To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott and Co.', 'Unavailable', 'Central');
INSERT INTO bookinfo VALUES('123649071295', 'War and Peace', 'Leo Tolstoy', 'The Russian Messenger.','Unavailable', 'Robertson');
INSERT INTO bookinfo VALUES('874021833362', 'The Handmaid’s Tale', 'Margaret Atwood', 'McClelland and Stewart','Unavailable', 'Law');
INSERT INTO bookinfo VALUES('938566720192', 'The Hobbit', 'J.R.R Tolkien', 'Allen and Unwin', 'Unavailable','Science');
INSERT INTO bookinfo VALUES('876543645110', '1984', 'George Orwell', 'Secker and Warburg', 'Unavailable','Central');
INSERT INTO bookinfo VALUES('198567651657', 'Pride and Prejudice', 'Jane Austen','T.Egertin, Whitehall', 'Available', 'Central');

CREATE TABLE staff(
fname     	 VARCHAR2(15)   NOT NULL,
mname     	 CHAR,
lname     	 VARCHAR2(15)   NOT NULL,
staff_id  	 CHAR(8)  	PRIMARY KEY,
email_address    VARCHAR2(28),
ddi       	 VARCHAR2(11),
salary    	 NUMBER(6)
);

INSERT INTO staff VALUES
('Pearl','A','Robbins','12345678','robpe12a@otago.ac.nz','+6434798910',30000);
INSERT INTO staff VALUES
('Harmony','B','Cook','12345679','cooha52p@otago.ac.nz','+6434798910',35000);
INSERT INTO staff VALUES
('Tamara','C','Marsh','12496583','marta14s@otago.ac.nz','+6434798914',50000);
INSERT INTO staff VALUES
('Juliet','D','Mills','45612134','milju95o@otago.ac.nz','+6434795116',56320);
INSERT INTO staff VALUES
('Faye','E','Harper','88888884','harfa89q@otago.ac.nz','+6434798803',40000);

CREATE TABLE job_info (
job_title 	VARCHAR(20) 	PRIMARY KEY,
salary 		NUMBER(6) 		NOT NULL
);

INSERT INTO job_info VALUES
('returns', 3200);
INSERT INTO job_info VALUES
('data entry', 3100);
INSERT INTO job_info VALUES
('help desk', 4000);


CREATE TABLE student_job (
student_id 	         CHAR(10) 	NOT NULL
CONSTRAINT stu_id_cnst REFERENCES student(student_id) DISABLE,
staff_id 	         CHAR(8)        PRIMARY KEY,
job_title 	         VARCHAR(20) 	NOT NULL
CONSTRAINT job_title_cnst REFERENCES job_info(job_title) DISABLE
);

ALTER TABLE student_job ENABLE CONSTRAINT stu_id_cnst;
ALTER TABLE student_job ENABLE CONSTRAINT job_title_cnst;

INSERT INTO student_job VALUES
('1234567', '12345678', 'returns');
INSERT INTO student_job VALUES
('7895623', '12345679', 'data entry');
INSERT INTO student_job VALUES
('4562359', '12496583', 'returns');
INSERT INTO student_job VALUES
('8888222', '45612134', 'help desk');

CREATE TABLE works_in (
staff_id 	CHAR(8) 	NOT NULL
CONSTRAINT staff_id_cnst REFERENCES staff(staff_id) DISABLE,
lib_name 	VARCHAR2(20) 	NOT NULL
CONSTRAINT lib_name_cnst REFERENCES lib_building(lib_name) DISABLE
);

ALTER TABLE works_in ENABLE CONSTRAINT staff_id_cnst;
ALTER TABLE works_in ENABLE CONSTRAINT lib_name_cnst;

INSERT INTO works_in VALUES
('12345678', 'Science');
INSERT INTO works_in VALUES
('12345679', 'Robertson');
INSERT INTO works_in VALUES
('12496583', 'Law');
INSERT INTO works_in VALUES
('45612134', 'Central');

CREATE TABLE room_info (
room_id 	VARCHAR2(10)	PRIMARY KEY,
r_num 		NUMBER 		NOT NULL 		CHECK (r_num >1 and r_num <11),
status          VARCHAR2(15)    NOT NULL,
lib_name 	VARCHAR2(20) 	NOT NULL
CONSTRAINT lib_name_cnst1 REFERENCES lib_building(lib_name) DISABLE
);

ALTER TABLE room_info ENABLE CONSTRAINT lib_name_cnst1;

INSERT INTO room_info VALUES('CentGS1', 8, 'Available','Central');
INSERT INTO room_info VALUES('CentGS2', 10,'Unavailable', 'Central');
INSERT INTO room_info VALUES('CentGS3', 4, 'Unavailable','Central');
INSERT INTO room_info VALUES('LawGS 6.1', 4,'Available', 'Law');
INSERT INTO room_info VALUES('LawGS 9.1', 6, 'Unavailable','Law');
INSERT INTO room_info VALUES('RobGS1', 10, 'Available','Robertson');
INSERT INTO room_info VALUES('RobGS2', 6,'Unavailable', 'Robertson');
INSERT INTO room_info VALUES('RobGS3', 8, 'Available','Robertson');
INSERT INTO room_info VALUES('SciGS G01' , 8, 'Unavailable','Science');
INSERT INTO room_info VALUES('SciGS 103' ,8, 'Available','Science');
INSERT INTO room_info VALUES('SciGS 106' ,8,'Unavailable', 'Science');

CREATE TABLE student_room(
student_id 		CHAR(10)        PRIMARY KEY
CONSTRAINT stu_id_cnst2 REFERENCES student(student_id) DISABLE,
room_id 		VARCHAR2(10)	NOT NULL
CONSTRAINT room_id_cnst REFERENCES room_info(room_id) DISABLE,
booking_time 		DATE		NOT NULL,
time_duration 		NUMBER 		CHECK (time_duration >0 and time_duration <4)
);

ALTER TABLE student_room ENABLE CONSTRAINT stu_id_cnst2;
ALTER TABLE student_room ENABLE CONSTRAINT room_id_cnst;

INSERT INTO student_room VALUES
('1234567', 'CentGS2', TO_DATE('22-08-2020 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), 2);
INSERT INTO student_room VALUES
('5147967', 'LawGS 9.1', TO_DATE('23-08-2020 17:00:00', 'dd-mm-yyyy hh24:mi:ss'), 3);
INSERT INTO student_room VALUES
('8888222', 'CentGS3', TO_DATE('24-08-2020 16:00:00', 'dd-mm-yyyy hh24:mi:ss'), 2);
INSERT INTO student_room VALUES
('4562359', 'RobGS2', TO_DATE('22-08-2020 09:00:00', 'dd-mm-yyyy hh24:mi:ss'), 1);
INSERT INTO student_room VALUES
('7894520', 'SciGS 106', TO_DATE('23-08-2020 07:00:00', 'dd-mm-yyyy hh24:mi:ss'), 3);
INSERT INTO student_room VALUES
('9658201', 'SciGS G01', TO_DATE('25-08-2020 11:00:00', 'dd-mm-yyyy hh24:mi:ss'), 2);


CREATE TABLE student_book(
student_id     CHAR(10) PRIMARY KEY
CONSTRAINT student_f REFERENCES student(student_ID) DISABLE,
barcode	       CHAR(12) NOT NULL
CONSTRAINT bar_fk REFERENCES bookinfo(barcode) DISABLE,	
borrow_date    DATE,
due_date       DATE
);
ALTER TABLE student_book ENABLE CONSTRAINT student_f;
ALTER TABLE student_book ENABLE CONSTRAINT bar_fk;

INSERT INTO student_book VALUES('1234567', '278462740182', TO_DATE('30-04-2000','DD-MM-YYYY'), TO_DATE('30-05-2000','DD-MM-YYYY'));

INSERT INTO student_book VALUES('7895623', '123649071295', TO_DATE('02-04-2001','DD-MM-YYYY'), TO_DATE('02-05-2000','DD-MM-YYYY'));

INSERT INTO student_book VALUES('4562359', '874021833362', TO_DATE('30-03-2000','DD-MM-YYYY'), TO_DATE('30-04-2000','DD-MM-YYYY'));

INSERT INTO student_book VALUES('4513150', '938566720192', TO_DATE('15-12-2000','DD-MM-YYYY'), TO_DATE('15-01-2001','DD-MM-YYYY'));

INSERT INTO student_book VALUES('5147967', '876543645110', TO_DATE('17-11-2002','DD-MM-YYYY'), TO_DATE('17-11-2002','DD-MM-YYYY'));

CREATE TABLE book_category(
category VARCHAR2(20) NOT NULL,
barcode  CHAR(12)     PRIMARY KEY
CONSTRAINT bookinfo_fk  references bookinfo(barcode) DISABLE
);

ALTER TABLE book_category ENABLE CONSTRAINT bookinfo_fk;

INSERT INTO book_category VALUES('Fiction', '278462740182'); 
INSERT INTO book_category VALUES('Nonfiction', '123649071295'); 
INSERT INTO book_category VALUES('Nonfiction', '874021833362'); 
INSERT INTO book_category VALUES('Fiction', '938566720192'); 
INSERT INTO book_category VALUES('Romance', '876543645110');
INSERT INTO book_category VALUES('Fiction','198567651657');
INSERT INTO book_category VALUES('Romance','198567651657');

COMMIT;
