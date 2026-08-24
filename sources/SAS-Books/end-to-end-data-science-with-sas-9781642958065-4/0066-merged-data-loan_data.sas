/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0066-proc-surveyselect.sas --- */
 PROC SURVEYSELECT DATA=MYDATA.LOAN OUT=LOAN_SAMP
       METHOD=SRS SAMPSIZE=500000 SEED=42;
RUN;

/* --- 0067-data-loan_data.sas --- */
DATA LOAN_DATA;
  SET LOAN_SAMP;
