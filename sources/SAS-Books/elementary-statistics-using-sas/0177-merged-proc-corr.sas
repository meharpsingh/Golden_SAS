/* Merged listing: this program was assembled from 9 consecutive listings in the same book,
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

/* --- 0178-proc-corr.sas --- */
proc corr data=kilowatt2;
   var ac dryer kwh;
title 'Automatic Behavior with Missing Values for KILOWATT2';
run;
proc corr data=kilowatt2 nomiss;
   var ac dryer kwh;
title 'NOMISS Option for KILOWATT2';
run;
proc reg data=kilowatt;
   id ac;
   model kwh=ac;
   plot kwh*ac / nostat cline=red;
title 'Straight-line Regression for KILOWATT Data';
run;
   print p clm cli;
run;
quit;
ods graphics on;
proc reg data=kilowatt plots(only)=fit(stats=none);
   model kwh=ac / p clm cli;
title 'Straight-line Regression for KILOWATT Data';
run;
quit;
ods graphics off;
proc reg data=kilowatt;
   model kwh=ac;
title 'Straight-line Regression for KILOWATT Data';
run;
   symbol1 color=blue;
   symbol2 color=red line=1;
   symbol3 color=green line=2;
   symbol4 color=green line=2;
   symbol5 color=purple line=3;
   symbol6 color=purple line=3;
   plot kwh*ac / pred conf nostat;
run;
quit;

/* --- 0181-proc-reg.sas --- */
options formchar="|----|+|---+=|-/\<>*";
proc reg data=kilowatt lineprinter;
   model kwh=ac;
   plot kwh*ac="+";
title 'Straight-line Regression for KILOWATT Data';
run;
quit;

/* --- 0182-proc-reg.sas --- */
options formchar="|----|+|---+=|-/\<>*";
proc reg data=kilowatt lineprinter;
   model kwh=ac;
  plot kwh*ac="+" p.*ac="p" / overlay;
title 'Straight-line Regression for KILOWATT Data';
run;
quit;

/* --- 0183-proc-reg.sas --- */
options formchar="|----|+|---+=|-/\<>*";
proc reg data=kilowatt lineprinter;
   model kwh=ac;
   plot kwh*ac="+" p.*ac="p" lcl.*ac="I" lclm.*ac="M"
        ucl.*ac="I" uclm.*ac="M" / overlay ;
title 'Straight-line Regression for KILOWATT Data';
run;
quit;

/* --- 0185-proc-reg.sas --- */
ods graphics on;
proc reg data=kilowatt plots(only)=residuals;
   model kwh=ac;
run;
quit;

/* --- 0186-proc-reg.sas --- */
ods graphics on;
proc reg data=kilowatt plots(only)=residuals;
   var dryer;
   model kwh=ac;
run;
   plot r.*dryer / nostat nomodel;
run;
quit;

/* --- 0187-proc-reg.sas --- */
ods graphics on;
proc reg data=kilowatt plots(only)=residualbypredicted;
   model kwh=ac;
run;
quit;

/* --- 0188-proc-reg.sas --- */
proc reg data=kilowatt;
   model kwh=ac;
   plot r.*obs. / nostat nomodel;
run;
quit;
