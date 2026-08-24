/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0023-data-report.sas --- */
DATA REPORT;
INPUT @1 NAME $10. @11 SCORE 5.2 @17 BDATE DATE9.;
FORMAT BDATE WORDDATE12.;
DATALINES;


;
DATA REPORT;
INPUT @1 NAME $10. @11 SCORE 5.2 @17 BDATE DATE9.;
FORMAT BDATE WORDDATE12.;
DATALINES;


Bill    22.12 09JAN2016


Jane    33.01 02FEB2000


Clyde   15.45 23MAR1999


Bill    22.12 09JAN2016
Jane    33.01 02FEB2000
Clyde   15.45 23MAR1999


;
PROC PRINT DATA=REPORT;
RUN;

/* --- 0024-proc-print.sas --- */
PROC PRINT DATA=REPORT;
RUN;
