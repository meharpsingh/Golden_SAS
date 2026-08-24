/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0171-data-dates.sas --- */
DATA DATES;
INPUT @1 BDATE MMDDYY8.;
TARGET=MDY(08,25,2023);          * Uses MDY() function;
AGE=INTCK('YEAR',BDATE,TARGET);  * INTCK function;
DATALINES;


;
DATA DATES;
INPUT @1 BDATE MMDDYY8.;
TARGET=MDY(08,25,2023);          * Uses MDY() function;
AGE=INTCK('YEAR',BDATE,TARGET);  * INTCK function;
DATALINES;


07101952


07041776


01011900


07101952
07041776
01011900


;
PROC PRINT DATA=DATES;
FORMAT BDATE WEEKDATE. TARGET MMDDYY8.;
RUN;

/* --- 0172-proc-print.sas --- */
PROC PRINT DATA=DATES;
FORMAT BDATE WEEKDATE. TARGET MMDDYY8.;
RUN;
