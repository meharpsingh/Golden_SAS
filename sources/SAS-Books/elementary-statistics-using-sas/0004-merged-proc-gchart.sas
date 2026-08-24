/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0004-data-bodyfat.sas --- */
options pagesize=60 linesize=80 nodate nonumber;
data bodyfat;
   input gender $ fatpct @@;
   datalines;
m 13.3 f 22 m 19 f 26 m 20 f 16 m 8 f 12 m 18 f 21.7
m 22 f 23.2 m 20 f 21 m 31 f 28 m 21 f 30 m 12 f 23
m 16 m 12 m 24
;
run;
proc print data=bodyfat;
title 'Body Fat Data for Men and Women in Fitness Program';
footnote 'Unsupervised Aerobic and Strength Training';
run;
proc means data=bodyfat;
   class gender;
   var fatpct;
title 'Body Fat for Men and Women in Fitness Program';
run;

/* --- 0054-proc-gchart.sas --- */
proc gchart data=bodyfat;
   vbar gender;
   title 'Bar Chart for Men and Women in Fitness Program';
run;

/* --- 0056-proc-chart.sas --- */
options ps=50;
proc chart data=bodyfat;
   vbar gender;
 title 'Line Printer Bar Chart for Fitness Program';
run;

/* --- 0063-proc-gchart.sas --- */
proc gchart data=bodyfat;
   hbar gender / nostat;
run;
