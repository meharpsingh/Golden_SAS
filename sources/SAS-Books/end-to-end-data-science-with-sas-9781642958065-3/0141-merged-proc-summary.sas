/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0141-macro-knn.sas --- */
%MACRO KNN;
       %do k=1 %to 15;
/*A KNN model will be built for
each value of K*/
              PROC DISCRIM
DATA=MYDATA.BANK_TRAIN METHOD=NPAR
K=&k.
TESTDATA=MYDATA.BANK_TEST
TESTOUT=SCORED_&k.;
                     CLASS TARGET;
                     VAR
&num_vars.;
              RUN;
/*Create indicators for metric
creation*/
              DATA SUM;
                SET SCORED_&k.;
                if TARGET = 1 and
_INTO_ = 1 then TP = 1;
                if TARGET = 1 and
_INTO_ = 0 then FN = 1;
                if TARGET = 0 and
_INTO_ = 0 then TN = 1;
                if TARGET = 0 and
_INTO_ = 1 then FP = 1;
                if TARGET = 1 then
P = 1;
                if TARGET = 0 then
N = 1;
              RUN;

/* --- 0142-proc-summary.sas --- */
              PROC SUMMARY
DATA=SUM;
                VAR TP FN TN FP P
N;
              OUTPUT OUT=SUM2
SUM=;
/*Append summarized indicators to
evaluation dataset*/
              PROC APPEND
DATA=SUM2 BASE=MYDATA.MASTER force
nowarn; RUN;
