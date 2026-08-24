/* Merged listing: this program was assembled from 9 consecutive listings in the same book,
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

/* --- 0152-proc-corr.sas --- */
ods graphics on;
ods select ScatterPlot;
proc corr data=kilowatt
          plots=scatter(noinset ellipse=none);
   var ac kwh;
run;

/* --- 0153-proc-corr.sas --- */
ods graphics on;
ods select MatrixPlot;
proc corr data=kilowatt
          plots=matrix(histogram nvar=all);
   var ac dryer kwh;
run;

/* --- 0154-proc-corr.sas --- */
ods select SimpleStats;
proc corr data=kilowatt;
   var ac dryer kwh;
title 'Summary Statistics for KILOWATT Data Set';
run;

/* --- 0156-proc-corr.sas --- */
proc corr data=kilowatt;
   var ac dryer kwh;
title 'Correlations for KILOWATT Data Set';
run;

/* --- 0160-proc-reg.sas --- */
proc reg data=kilowatt;
   model kwh=ac;
   plot kwh*ac / nostat cline=red;
title 'Straight-line Regression for KILOWATT Data';
run;

/* --- 0161-proc-reg.sas --- */
proc reg data=kilowatt;
   model kwh=ac;
title 'Straight-line Regression for KILOWATT Data';
run;
   plot kwh*ac / nostat cline=red;
run;
quit;

/* --- 0162-proc-reg.sas --- */
proc reg data=kilowatt;
   id ac;
   model kwh=ac / p clm cli;
run;
quit;
proc reg data=kilowatt;
   id ac;
   model kwh=ac;
run;
   print p clm cli;
run;
quit;

/* --- 0163-proc-reg.sas --- */
ods graphics on;
proc reg data=kilowatt plots(only)=fit(stats=none);
   model kwh=ac;
title 'Straight-line Regression for KILOWATT Data';
run;
quit;
