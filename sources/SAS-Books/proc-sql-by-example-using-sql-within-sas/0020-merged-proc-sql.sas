/* Merged listing: this program was assembled from 5 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0020-data-threex3.sas --- */
DATA threex3;
INPUT a b c;
CARDS;
1.1 2.0 3.0
6.0 5.0 4.4
7.7 8.0 9.0
;

/* --- 0021-proc-sql.sas --- */
PROC SQL;
SELECT       MEAN(a,b,c) LABEL='Mean of 3'
FROM         threex3
;
QUIT;

/* --- 0022-proc-sql.sas --- */
PROC SQL;
SELECT       MEDIAN(a,b,c) LABEL='Median of 3'
FROM         threex3
;
QUIT;

/* --- 0023-proc-sql.sas --- */
PROC SQL;
SELECT       MEAN(a) LABEL='Mean of 1'
FROM         threex3
;
QUIT;

/* --- 0024-proc-sql.sas --- */
PROC SQL;
SELECT       MEDIAN(a) LABEL='Median of 1'
FROM         threex3
;
QUIT;
