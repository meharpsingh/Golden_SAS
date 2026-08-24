/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0008-data-recovery.sas --- */
DATA RECOVERY;
INPUT LNAME $ RECTIME;
DATALINES;


JONES 3.1


SMITH 3.6


HARRIS 4.2


MCCULLEY 2.1


BROWN 2.8


CURTIS 3.8


JOHNSTON 1.8


JONES 3.1
SMITH 3.6
HARRIS 4.2
MCCULLEY 2.1
BROWN 2.8
CURTIS 3.8
JOHNSTON 1.8


;
RUN;

/* --- 0009-proc-print.sas --- */
PROC PRINT DATA=RECOVERY;
Title 'Exercise 1.2 - Your Name';
RUN;

/* --- 0010-proc-means.sas --- */
PROC MEANS DATA=RECOVERY;
RUN;

/* --- 0011-proc-print.sas --- */
PROC PRINT DATA=RECOVERY;
Title 'Exercise 1.2 - Your Name';
RUN;
PROC MEANS DATA=RECOVERY;
RUN;
