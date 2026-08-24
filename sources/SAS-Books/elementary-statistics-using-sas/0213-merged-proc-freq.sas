/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0213-proc-format.sas --- */
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

/* --- 0214-proc-freq.sas --- */
proc freq data=statclas;
   tables gender*major;
   title 'Major and Gender for Students in Statistics Class';
run;

/* --- 0215-proc-freq.sas --- */
proc freq data=statclas;
   tables gender*major / norow nocol nopercent;
title 'Counts for Students in Statistics Class';
run;
