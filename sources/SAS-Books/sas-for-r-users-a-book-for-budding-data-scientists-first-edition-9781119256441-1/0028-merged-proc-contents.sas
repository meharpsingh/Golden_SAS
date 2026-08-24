/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0028-data-ajay2.sas --- */
data ajay2;
a="1234567";
Run;
proc print data=ajay2;
Run;

/* --- 0030-data-ajay21.sas --- */
data ajay21;
set ajay2;
a2=1*a;
run;
proc print data=ajay21;
Run;

/* --- 0031-proc-contents.sas --- */
proc contents data=ajay21;
run;
