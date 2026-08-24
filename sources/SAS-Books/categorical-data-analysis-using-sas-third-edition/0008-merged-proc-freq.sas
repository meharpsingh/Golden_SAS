/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0008-data-severe.sas --- */
data severe;
input treat $ outcome $ count;
datalines;
Test
f 10
Test
u 2
Control f 2
Control u 4
;
proc freq order=data;
weight count;
tables treat*outcome / chisq nocol;
run;

/* --- 0013-proc-freq.sas --- */
proc freq order=data data=severe;
weight count;
tables treat*outcome / riskdiff(cl=(wald newcombe exact) correct );
exact riskdiff;
run;
