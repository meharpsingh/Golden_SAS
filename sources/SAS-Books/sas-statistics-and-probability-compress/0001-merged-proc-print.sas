/* Merged listing: this program was assembled from 9 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0001-data-htwt.sas --- */
data htwt;
* name data set;
input name $ sex $ age height weight;  * specify variables;
x = height + weight;
* define variable;
datalines;
alfred     M 14 69 112
alice      F 13 56  84
barbara    F 14 62 102
henry      M 15 67 135
john       M 16 70 165
sally      F 16 63 120
;
run;

/* --- 0002-proc-print.sas --- */
proc print data=htwt;
run;

/* --- 0004-proc-print.sas --- */
proc print data=htwt;
var name sex age;
* specify variable to print;
title;
* turn title off;
run;

/* --- 0005-proc-print.sas --- */
proc print data=htwt(obs=3);
run;

/* --- 0006-proc-print.sas --- */
proc print data=htwt(firstobs=2 obs=4);
run;

/* --- 0007-proc-means.sas --- */
proc means data=htwt;
run;

/* --- 0009-proc-means.sas --- */
proc means data=htwt maxdec=3;
* set maximum decimals;
var age height weight;
* specify variables;
run;

/* --- 0011-proc-plot.sas --- */
proc plot data=htwt;
plot weight*height;
run;

/* --- 0012-proc-gplot.sas --- */
proc gplot data=htwt;
plot weight*height;
run;
