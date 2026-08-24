/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0090-data-chromat.sas --- */
data chromat;
   input hp std @@;
   methdiff=hp-std;
   datalines;
12.1 14.7 10.9 14.0 13.1 12.9 14.5 16.2 9.6 10.2 11.2 12.4
9.8 12.0 13.7 14.8 12.0 11.8 9.1 9.7
;
run;
ods select TestsForLocation;
proc univariate data=chromat;
   var methdiff;
title 'Testing for Differences between Chromatography Methods';
run;

/* --- 0092-proc-ttest.sas --- */
proc ttest data=chromat;
   paired hp*std;
title 'Paired Differences with PROC TTEST';
run;

/* --- 0094-proc-univariate.sas --- */
ods select TestsForLocation;
proc univariate data=chromat;
   var methdiff;
title 'Testing for Differences between Chromatography Methods';
run;
