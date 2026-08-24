/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0004-proc-surveyselect.sas --- */
PROC SURVEYSELECT DATA=MYDATA.Listings SAMPRATE=0.20 SEED=42
       OUT=Full OUTALL METHOD=SRS;
RUN;

/* --- 0005-data-train.sas --- */
DATA TRAIN TEST;
    SET Full;
       IF Selected=0 THEN OUTPUT TRAIN; ELSE OUTPUT TEST;
       DROP Selected;
RUN;

/* --- 0006-proc-univariate.sas --- */
PROC UNIVARIATE DATA=TRAIN;
       VAR Price;
       HISTOGRAM;
RUN;

/* --- 0007-data-price.sas --- */
DATA Price;
       SET TRAIN;
       WHERE 30 le Price le 750;
       Price_Log = LOG(Price);
RUN;
