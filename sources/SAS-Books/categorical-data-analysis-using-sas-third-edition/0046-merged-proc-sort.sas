/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0046-data-mice.sas --- */
data mice;
input LogRank Treatment $ count @@;
datalines;
0.909
Ca 1 0.909
Ce 1
0.709
Ca 3 0.709
Ce 1
0.334
Ca 5 0.334
Ce 1
0.234
Ca 1 0.234
Ce 0
-0.099 Ca 1 -0.099 Ce 2
-0.433 Ca 0 -0.433 Ce 2
-0.933 Ca 1 -0.933 Ce 1
-1.433 Ca 0 -1.433 Ce 1
;

/* --- 0047-proc-sort.sas --- */
proc sort data=mice;
by LogRank;
run;
