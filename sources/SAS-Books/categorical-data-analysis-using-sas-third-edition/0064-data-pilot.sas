data pilot;
input rater1 rater2 count @@;
datalines;
1 1 4 1 2 0 1 3 1 1 4 0
2 1 0 2 2 2 2 3 6 2 4 1
3 1 1 3 2 0 3 3 2 3 4 1
4 1 0 4 2 2 4 3 1 4 4 3
;
proc freq;
weight count;
tables rater1*rater2 /norow nocol nopct;
exact kappa;
run;
