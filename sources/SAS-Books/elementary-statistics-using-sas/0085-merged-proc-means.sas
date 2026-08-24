/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0085-data-rates.sas --- */
data rates;
   input mortrate @@;
   label mortrate='Mortgage Rate';
   datalines;
5.750 5.750 5.500 5.750 5.500 5.750 5.750 5.750 5.625
5.750 5.875 5.625 5.875 5.625 5.750 5.750 5.750 5.875
5.750 5.875 5.625 5.750 5.750 5.500 5.750 5.500 5.625
5.750 5.500 5.625
;
run;
proc means data=rates n mean stddev clm maxdec=3;
   var mortrate;
title 'Summary of Mortgage Rate Data';
run;

/* --- 0086-proc-means.sas --- */
proc means data=rates n mean stddev clm alpha=0.10;
   var mortrate;
title 'Summary of Mortgage Rate Data with 90% CI';
run;
