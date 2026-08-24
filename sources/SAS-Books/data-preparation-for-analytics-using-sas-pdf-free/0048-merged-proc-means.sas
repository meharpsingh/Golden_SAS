/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0048-data-skewed.sas --- */
DATA skewed;
INPUT a @@;
CARDS;
1 0 -1 20 4 60 8 50 2 4 7 4 2 1
;
RUN;

/* --- 0049-proc-means.sas --- */
PROC MEANS DATA = skewed MIN;
RUN;
