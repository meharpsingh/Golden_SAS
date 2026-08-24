/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0082-data-improvement.sas --- */
DATA improvement;
INPUT  subject  before  after ;
DATALINES;
1 138 324
2 284 520
3 234 318
4 132 220
5 183 232
;
RUN;

/* --- 0083-proc-ttest.sas --- */
PROC TTEST DATA=improvement CI=NONE ALPHA=0.01;
PAIRED before*after ;
TITLE 'Objective 6.4';
RUN;

/* --- 0085-proc-ttest.sas --- */
PROC TTEST DATA=improvement SIDES=L ALPHA=0.01;
PAIRED before * after;
RUN;
