/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0034-data-tab4_1a.sas --- */
DATA tab4_1a;
  INPUT f blackd death;
  DATALINES;
22 0 1
28 1 1
52 0 0
45 1 0
;

/* --- 0035-proc-logistic.sas --- */
PROC LOGISTIC DATA=tab4_1a;
  FREQ f;
  MODEL death(EVENT='1') = blackd
RUN;

/* --- 0038-proc-freq.sas --- */
PROC FREQ DATA=tab4_1a;
  WEIGHT f;
  TABLES blackd*death / CHISQ RELRISK;
RUN;
