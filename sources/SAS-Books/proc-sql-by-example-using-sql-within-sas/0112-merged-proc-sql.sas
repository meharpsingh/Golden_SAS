/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0112-data-a.sas --- */
DATA a;
Aa = 1;
RUN;
DATA b;
Bb = 2;
RUN;

/* --- 0113-proc-sql.sas --- */
PROC SQL;
SELECT       *
FROM         a CROSS JOIN b
;
QUIT;

/* --- 0114-proc-sql.sas --- */
PROC SQL;
( SELECT     *
  FROM       a )
UNION
( SELECT     *
  FROM       b )
;
QUIT;
