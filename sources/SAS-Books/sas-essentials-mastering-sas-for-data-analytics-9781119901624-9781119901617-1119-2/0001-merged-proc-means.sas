/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0001-data-example.sas --- */
DATA EXAMPLE;
INPUT AGE @@;
DATALINES;


* PUT YOUR TITLE ON THE NEXT LINE;
;
DATA EXAMPLE;
INPUT AGE @@;
DATALINES;


12 11 12 12 9 11 8 8 7 11 12 14 9 10 7 13


6 11 12 4 11 9 13 6 9 7 13 9 13 12 10 13


11 8 11 15 12 14 10 10 13 13 10 8 12 7 13


11 9 12


12 11 12 12 9 11 8 8 7 11 12 14 9 10 7 13
6 11 12 4 11 9 13 6 9 7 13 9 13 12 10 13
11 8 11 15 12 14 10 10 13 13 10 8 12 7 13
11 9 12


;
PROC MEANS DATA=EXAMPLE;
    VAR AGE;
RUN;

/* --- 0002-proc-means.sas --- */
PROC MEANS DATA=EXAMPLE;
    VAR AGE;
RUN;
