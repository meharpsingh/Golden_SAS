/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0119-data-complete.sas --- */
data complete;
input gender region count response @@;
datalines;
0 0 0
0 0 5
0 1 1
0 1 0
1 0 0
1 0 175 0
1 1 53 1
1 1 0
;

/* --- 0120-proc-logistic.sas --- */
proc logistic data=complete descending;
freq count;
model response = gender region / firth clparm=pl;
exact gender region;
run;
