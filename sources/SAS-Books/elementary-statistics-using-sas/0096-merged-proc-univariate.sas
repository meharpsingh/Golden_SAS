/* Merged listing: this program was assembled from 8 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0096-proc-format.sas --- */
proc format;
value $gentext 'm' = 'Male'
               'f' = 'Female';
run;
data bodyfat;
   input gender $ fatpct @@;
   format gender $gentext.;
   label fatpct='Body Fat Percentage';
   datalines;
m 13.3 f 22 m 19 f 26 m 20 f 16 m 8 f 12 m 18 f 21.7
m 22 f 23.2 m 20 f 21 m 31 f 28 m 21 f 30 m 12 f 23
m 16 m 12 m 24
;
run;
proc means data=bodyfat;
   class gender;
   var fatpct;
title 'Brief Summary of Groups';
run;

/* --- 0098-proc-univariate.sas --- */
ods select moments basicmeasures extremeobs plots;
proc univariate data=bodyfat plot;
   class gender;
   var fatpct;
title 'Detailed Summary of Groups';
run;

/* --- 0100-proc-univariate.sas --- */
proc univariate data=bodyfat noprint;
   class gender;
   var fatpct;
   histogram fatpct;
title 'Comparative Histograms of Groups';
run;

/* --- 0102-proc-chart.sas --- */
proc chart data=bodyfat;
   vbar fatpct / group=gender;
   title 'Charts for Fitness Program';
run;

/* --- 0105-proc-sort.sas --- */
proc sort data=bodyfat;
   by gender;
run;
proc boxplot data=bodyfat;
   plot fatpct*gender;
title 'Comparative Box Plots of Groups';
run;

/* --- 0107-proc-ttest.sas --- */
proc ttest data=bodyfat;
   class gender;
   var fatpct;
title 'Comparing Groups in Fitness Program';
run;

/* --- 0108-proc-ttest.sas --- */
ods select equality;
proc ttest data=bodyfat;
   class gender;
   var fatpct;
run;

/* --- 0110-proc-ttest.sas --- */
ods select conflimits;
proc ttest data=bodyfat alpha=0.10;
   class gender;
   var fatpct;
run;
