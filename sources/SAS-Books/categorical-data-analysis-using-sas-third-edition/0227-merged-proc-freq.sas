/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0227-data-cpain.sas --- */
data cpain;
input
center $ diagnosis $ treat $ status $ count @@;
datalines;
I
A active excellent
1 I
A active
;

/* --- 0228-proc-freq.sas --- */
proc freq data=cpain order=data;
weight count;
tables center*diagnosis*treat*status/ measures;
run;

/* --- 0229-proc-sort.sas --- */
proc sort data=cpain; by diagnosis;
proc freq data=cpain order=data; by diagnosis;
weight count;
where (center='II' and (diagnosis='A' or diagnosis='B'));
tables treat*status/ measures;
run;
