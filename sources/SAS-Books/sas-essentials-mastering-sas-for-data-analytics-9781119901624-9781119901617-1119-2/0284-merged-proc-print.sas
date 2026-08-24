/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0284-proc-means.sas --- */
PROC MEANS
STATS
DIFF
Z
 DATA WT;
 INPUT WEIGHT @@;
 DATALINES;


;
 DATA WT;
 INPUT WEIGHT @@;
 DATALINES;


 64 71 53 67 55 58


 77 57 56 51 76 68


 64 71 53 67 55 58
 77 57 56 51 76 68


 ;
 DATA WTDIFF;SET WT;
 IF :=1 THEN SET STATS;
 DIFF=WEIGHT-WEIGHT_MEAN;
 Z=DIFF/WEIGHT_STDDEV; * Creates standardized scoreE (Z-score);
 RUN;

/* --- 0285-proc-print.sas --- */
 PROC PRINT DATA= WTDIFF;VAR WEIGHT DIFF Z;
 RUN;
