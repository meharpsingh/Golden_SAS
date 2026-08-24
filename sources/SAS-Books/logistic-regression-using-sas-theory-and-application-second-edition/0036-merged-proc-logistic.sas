/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0036-data-tab4_1b.sas --- */
DATA tab4_1b;
  INPUT death total blackd;
  DATALINES;
22 74 0
28 73 1
;

/* --- 0037-proc-logistic.sas --- */
PROC LOGISTIC DATA=tab4_1b;
  MODEL death/total = blackd;
RUN;
