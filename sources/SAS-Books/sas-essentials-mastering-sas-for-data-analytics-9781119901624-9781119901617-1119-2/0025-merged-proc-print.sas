/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0025-data-people.sas --- */
DATA PEOPLE;
   INFORMAT LASTNAME FIRSTNAME $12. AGE 3. SCORE 4.2;
   INPUT LASTNAME FIRSTNAME AGE SCORE;
   DATALINES;


;
DATA PEOPLE;
   INFORMAT LASTNAME FIRSTNAME $12. AGE 3. SCORE 4.2;
   INPUT LASTNAME FIRSTNAME AGE SCORE;
   DATALINES;


Lincoln   George    35 3.45


Ryan      Lacy      33 5.5


Lincoln   George    35 3.45
Ryan      Lacy      33 5.5


;
PROC PRINT DATA=PEOPLE;
RUN;

/* --- 0026-proc-print.sas --- */
PROC PRINT DATA=PEOPLE;
RUN;
