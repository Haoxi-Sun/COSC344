LOAD DATA
INFILE 'lab2a.dat'
INTO TABLE lab2a
FIELDS TERMINATED BY ','
(i, r, txt, when DATE "dd-mm-yyyy")
