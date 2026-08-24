/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0039-data-new3.sas --- */
data new3;
format a1 b1 date9.;
a0='01jan2009:00:00:00'dt;
b0='01jan2012:00:00:00'dt;
a1=datepart(a0);

/* --- 0040-proc-print.sas --- */
proc print data=NEW3;
run;

/* --- 0041-proc-contents.sas --- */
proc contents data=NEW3;
run;
