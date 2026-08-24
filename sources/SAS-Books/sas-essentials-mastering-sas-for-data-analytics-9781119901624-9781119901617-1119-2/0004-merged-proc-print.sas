/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0004-data-temp.sas --- */
DATA TEMP;
INPUT ID SBP DBP SEX $ AGE WT;
DATALINES;


;
DATA TEMP;
INPUT ID SBP DBP SEX $ AGE WT;
DATALINES;


1 120 80 M 15 115


2 130 70 F 25 180


3 140 100 M 89 170


4 120 80 F 30 150


5 125 80 F 20 110


1 120 80 M 15 115
2 130 70 F 25 180
3 140 100 M 89 170
4 120 80 F 30 150
5 125 80 F 20 110


;
RUN;

/* --- 0005-proc-print.sas --- */
PROC PRINT DATA=TEMP;
TITLE 'Exercise 1.1 - Your Name';
RUN;

/* --- 0007-proc-print.sas --- */
PROC PRINT DATA=TEMP;
TITLE 'Exercise 1.1 - Your Name';
RUN;
PROC MEANS;
RUN;
TITLE
C:\SASDATA\MYEXERCISE1.1.SAS
