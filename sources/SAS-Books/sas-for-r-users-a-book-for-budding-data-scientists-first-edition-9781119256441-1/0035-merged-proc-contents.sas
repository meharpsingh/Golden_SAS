/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0035-data-new1.sas --- */
data new1;
maindate = "12JUL2017";
date = input(maindate,date9.);
format date date9.;
Run;
proc print data=new1;
Run;

/* --- 0036-proc-contents.sas --- */
proc contents data=new1;
run;
