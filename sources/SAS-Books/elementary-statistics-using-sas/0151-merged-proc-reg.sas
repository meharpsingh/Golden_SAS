/* Merged listing: this program was assembled from 5 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0151-data-kilowatt.sas --- */
data kilowatt;
   input kwh ac dryer @@;
   datalines;
35 1.5 1 63 4.5 2 66 5.0 2 17 2.0 0 94 8.5 3 79 6.0 3
93 13.5 1 66 8.0 1 94 12.5 1 82 7.5 2 78 6.5 3 65 8.0 1
77 7.5 2 75 8.0 2 62 7.5 1 85 12.0 1 43 6.0 0 57 2.5 3
33 5.0 0 65 7.5 1 33 6.0 0
;
run;

/* --- 0164-proc-reg.sas --- */
ods graphics on;
proc reg data=kilowatt plots(only)=fit(nocli stats=none);
   model kwh=ac;
run;
quit;

/* --- 0165-proc-reg.sas --- */
ods graphics on;
proc reg data=kilowatt plots(only)=fit(noclm stats=none);
   model kwh=ac;
run;
quit;

/* --- 0166-proc-reg.sas --- */
ods graphics on;
proc reg data=kilowatt plots(only)=fit(nolimits stats=none);
   model kwh=ac;
run;
quit;

/* --- 0172-proc-reg.sas --- */
proc reg data=kilowatt;
   model kwh=ac dryer / p clm cli;
title 'Multiple Regression for KILOWATT Data';
run;
