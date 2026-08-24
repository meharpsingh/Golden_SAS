DATA one;
INPUT Group $ w x y z;
example1 = (group = "A");
example2 = (INT(w/2) = w/2 );
example3 = (x >= 30);
example4 = ( (group ne "A") OR (y < 100) ) ;
example5 = ( (group ne "A") AND (y < 100) );
example6 = z + 5*(group = "A") + 10*(group = "B");
DATALINES ;
A  17  35  104  79
A  19  32   90  92
B  16  39  101  89
B  21  40   95  85
C  12  29   88  81
C  16  27   84  83
;
PROC PRINT DATA=one NOOBS;
RUN;
QUIT;
