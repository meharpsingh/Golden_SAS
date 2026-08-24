 DATA ONESAMPLE;
 INPUT LENGTH @@;
 DATALINES;
 4      3.95   4.01   3.95   4.00
 3.98   3.97   3.97   4.01   3.98
 3.99   4.01   4.02   4.02   3.98
 4.01   3.99   4.03   4.00   3.99
 ;
 Title 'Single sample t-test, using PROC UNIVARIATE';
 PROC UNIVARIATE DATA=ONESAMPLE MU0=4;VAR LENGTH; RUN;
 Title 'Single sample t-test using PROC TTEST';
 PROC TTEST DATA=ONESAMPLE H0=4;var LENGTH;
 RUN;
