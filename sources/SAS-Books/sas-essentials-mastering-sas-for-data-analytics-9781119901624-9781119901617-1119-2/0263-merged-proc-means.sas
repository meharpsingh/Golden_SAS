/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0263-macro-carmpg.sas --- */
%MACRO CARMPG(B);
  DATA &B;
     SET MYSASLIB.AUTOMPG;
     WHERE BRAND="&B";
  RUN;

/* --- 0264-proc-means.sas --- */
  PROC MEANS DATA=&B;
  VAR CITYMPG HWYMPG;
  RUN;
