/* Merged listing: this program was assembled from 5 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0126-data-train.sas --- */
DATA TRAIN;
  SET MYDATA.MODEL_TRAIN;
  WHERE '01JAN2015'd le issue_date
le '01DEC2015'd;
RUN;
PROC FREQ DATA=TRAIN; TABLES BAD;
RUN;

/* --- 0131-data-test.sas --- */
DATA TEST;
  SET MYDATA.MODEL_TEST;
  WHERE '01JAN2015'd le issue_date
le '01DEC2015'd;
RUN;
PROC FREQ DATA=TEST; TABLES BAD;
RUN;

/* --- 0132-proc-logistic.sas --- */
PROC LOGISTIC DATA=TRAIN
DESCENDING PLOTS=NONE;
       MODEL BAD = &num_vars. /
SELECTION=STEPWISE SLE=0.01
SLS=0.01;
       SCORE DATA=TEST
OUT=TEST_SCORE;
RUN;

/* --- 0133-proc-means.sas --- */
PROC MEANS DATA=TEST_SCORE N NMISS
MIN MAX MEAN;
       VAR BAD P_0 P_1;
RUN;

/* --- 0134-listing.sas --- */
%INCLUDE 'C:/Users/James
Gearheart/Desktop/SAS Book
Stuff/Projects/separation.sas';
%separation(data = TEST_SCORE,
score = P_1, y = bad);
