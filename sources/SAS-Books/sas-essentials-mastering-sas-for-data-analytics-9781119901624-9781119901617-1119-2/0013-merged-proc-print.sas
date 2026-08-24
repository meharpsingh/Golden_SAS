/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0013-data-mydata.sas --- */
DATA MYDATA;
INPUT ID $ SBP DBP GENDER $ AGE WT;
DATALINES;


;
DATA MYDATA;
INPUT ID $ SBP DBP GENDER $ AGE WT;
DATALINES;


001 120 80 M    15    115


002 130 70 F 25 180


003 140 100 M 89 170


004 120 80 F 30 150


005 125 80 F 20 110


;

/* --- 0014-proc-print.sas --- */
PROC PRINT DATA=MYDATA;
RUN;
