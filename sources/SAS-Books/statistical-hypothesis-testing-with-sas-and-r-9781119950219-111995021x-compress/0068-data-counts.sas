data counts;
input gp1 gp2 counts;
datalines;
1 1 10
1 2
1 3 12
2 1 13
2 2 14
2 3
3 1
3 2 10
3 3 20
;
run;
* Apply the test;
proc freq;
tables gp1*gp2;
weight counts;
exact agree;
run;
