/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0074-data-chocs.sas --- */
DATA chocs;
   INPUT id choose dark soft nuts @@;
   DATALINES;
 1 0 0 0 0    1 0 0 0 1   1 0 0 1 0    1 0 0 1 1
 1 1 1 0 0    1 0 1 0 1   1 0 1 1 0    1 0 1 1 1
 2 0 0 0 0    2 0 0 0 1   2 0 0 1 0    2 0 0 1 1
 2 0 1 0 0    2 1 1 0 1   2 0 1 1 0    2 0 1 1 1
 3 0 0 0 0    3 0 0 0 1   3 0 0 1 0    3 0 0 1 1
 3 0 1 0 0    3 0 1 0 1   3 1 1 1 0    3 0 1 1 1
 4 0 0 0 0    4 0 0 0 1   4 0 0 1 0    4 0 0 1 1
 4 1 1 0 0    4 0 1 0 1   4 0 1 1 0    4 0 1 1 1
 5 0 0 0 0    5 1 0 0 1   5 0 0 1 0    5 0 0 1 1
 5 0 1 0 0    5 0 1 0 1   5 0 1 1 0    5 0 1 1 1
 6 0 0 0 0    6 0 0 0 1   6 0 0 1 0    6 0 0 1 1
 6 0 1 0 0    6 1 1 0 1   6 0 1 1 0    6 0 1 1 1
 7 0 0 0 0    7 1 0 0 1   7 0 0 1 0    7 0 0 1 1
 7 0 1 0 0    7 0 1 0 1   7 0 1 1 0    7 0 1 1 1
 8 0 0 0 0    8 0 0 0 1   8 0 0 1 0    8 0 0 1 1
 8 0 1 0 0    8 1 1 0 1   8 0 1 1 0    8 0 1 1 1
 9 0 0 0 0    9 0 0 0 1   9 0 0 1 0    9 0 0 1 1
 9 0 1 0 0    9 1 1 0 1   9 0 1 1 0    9 0 1 1 1
;

/* --- 0075-proc-logistic.sas --- */
PROC LOGISTIC DATA=chocs;
  MODEL choose(EVENT='1')=dark soft nuts;
  STRATA id;
RUN;
