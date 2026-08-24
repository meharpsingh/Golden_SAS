/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0063-data-one.sas --- */
DATA one;
DO Value1 = 11,12;
   OUTPUT;
   END;
RUN;
DATA two;
DO Value2 = 21,22,23;
   OUTPUT;
   END;
RUN;

/* --- 0064-data-combined.sas --- */
DATA combined;
MERGE one two;
RUN;

/* --- 0065-proc-sql.sas --- */
PROC SQL;
CREATE TABLE combined AS
SELECT       *
FROM         one CROSS JOIN two
;
QUIT;
