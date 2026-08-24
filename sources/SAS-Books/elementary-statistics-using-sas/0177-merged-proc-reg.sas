/* Merged listing: this program was assembled from 7 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0177-data-kilowatt.sas --- */
options ps=60 ls=80 nonumber nodate;
data kilowatt;
   input kwh ac dryer @@;
   datalines;
35 1.5 1 63 4.5 2 66 5.0 2 17 2.0 0 94 8.5 3 79 6.0 3
93 13.5 1 66 8.0 1 94 12.5 1 82 7.5 2 78 6.5 3 65 8.0 1
77 7.5 2 75 8.0 2 62 7.5 1 85 12.0 1 43 6.0 0 57 2.5 3
33 5.0 0 65 7.5 1 33 6.0 0
;
run;
ods select ScatterPlot;
ods graphics on;
proc corr data=kilowatt plots=scatter(noinset ellipse=none);
   var ac kwh;
run;
ods graphics off;
ods graphics on;
ods select MatrixPlot;
proc corr data=kilowatt plots=matrix(histogram nvar=all);
   var ac dryer kwh;
run;
ods graphics off;
ods select SimpleStats;
proc corr data=kilowatt;
   var ac dryer kwh;
   title 'Summary Statistics for KILOWATT Data Set';
run;
proc corr data=kilowatt;
   var ac dryer kwh;
   title 'Correlations for KILOWATT Data Set';
run;
data kilowatt2;
   input kwh ac dryer @@;
   datalines;
35 1.5 . 63 4.5 2 66 5.0 2 17 2.0 0 94 8.5 3 79 6.0 3
93 13.5 1 66 8.0 1 94 12.5 1 82 7.5 2 78 6.5 3 65 8.0 1


;

/* --- 0189-proc-reg.sas --- */
ods graphics on;
proc reg data=kilowatt
         plots(only)=(residuals residualbypredicted);
   var dryer;
   model kwh=ac;
run;
   plot r.*dryer / nostat nomodel;
run;
   plot r.*obs. / nostat  nomodel;
quit;

/* --- 0190-proc-reg.sas --- */
ods graphics on;
proc reg data=kilowatt
         plots(only)=(residuals(unpack) residualbypredicted);
   model kwh=ac dryer;
run;
   plot r.*obs. / nostat  nomodel;
quit;

/* --- 0194-proc-reg.sas --- */
proc reg data=kilowatt;
   model kwh=ac dryer / r;
   plot student.*obs. / vref=-2 2 cvref=red nostat;
run;
quit;

/* --- 0195-proc-reg.sas --- */
proc reg data=kilowatt;
   model kwh=ac / lackfit;
run;

/* --- 0196-proc-reg.sas --- */
proc reg data=kilowatt;
   model kwh=ac dryer / lackfit;
run;

/* --- 0199-proc-reg.sas --- */
ods graphics on;
proc reg data=kilowatt
     plots(only)=(residualhistogram residualboxplot qqplot);
   model kwh=ac dryer;
run;
quit;
