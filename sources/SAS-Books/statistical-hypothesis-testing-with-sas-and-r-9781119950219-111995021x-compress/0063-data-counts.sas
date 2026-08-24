data counts;
input r c counts;
datalines;
1 1 9
1 2 11
2 1 16
2 2 4
;
run;
proc freq;
tables r*c /fisher;
weight counts;
run;
