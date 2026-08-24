/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0227-proc-format.sas --- */
options ls=80 ps=60 nodate nonumber;
proc format;
   value $gentxt 'M' = 'Male'
                 'F' = 'Female';
   value $majtxt 'S' = 'Statistics'
                 'NS' = 'Other';
run;
data statclas;
   input student gender $ major $ @@;
   format gender $gentxt.;
   format major $majtxt.;
   datalines;
;

/* --- 0228-proc-freq.sas --- */
proc freq data=statclas;
   tables gender*major;
title 'Major and Gender for Students in Statistics Class';
run;
proc freq data=statclas;
   tables gender*major /  norow nocol nopercent;
title 'Counts for Students in Statistics Class';
run;
data penalty;
   input decision $ defrace $ count @@;
   datalines;


;

/* --- 0230-proc-freq.sas --- */
ods graphics on;
proc freq data=statclas;
   tables gender*major / plots=freqplot;
title 'Side-by-Side Charts';
run;

/* --- 0231-proc-freq.sas --- */
ods graphics on;
proc freq data=statclas;
   tables gender*major
/ plots=freqplot(twoway=stacked scale=percent);
title 'Stacked Percentage Chart';
run;
