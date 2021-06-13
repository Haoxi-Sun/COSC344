LOAD DATA
INFILE 'xyz.dat'
INTO TABLE xyz
FIELDS TERMINATED BY ','
(i, s, d DATE "dd-mon-yyyy")