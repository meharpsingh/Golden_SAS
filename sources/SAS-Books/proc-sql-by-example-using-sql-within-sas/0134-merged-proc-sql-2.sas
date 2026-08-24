/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0134-data-abc.sas --- */
DATA ABC;
RETAIN ID 1;
DO CODE = 'aa','aa',
          'bb','bb','bb','bb',
          'cc','cc';
   OUTPUT;
   END;
RUN;
DATA ab;
RETAIN ID 1;
DO CODE = 'aa','aa','aa',
          'bb','bb';
   OUTPUT;
   END;
RUN;

/* --- 0144-proc-sql.sas --- */
PROC SQL;
CREATE TABLE exceptall AS
SELECT       *
FROM         abc
EXCEPT ALL
SELECT       *
FROM         ab
;
QUIT;

/* --- 0146-data-except.sas --- */
DATA except;
MERGE abc(IN=in_abc) ab(IN=in_ab);
BY id code;
IF FIRST.code AND in_abc AND NOT in_ab;
RUN;

/* --- 0147-proc-sql.sas --- */
PROC SQL;
SELECT       *
FROM         ab
EXCEPT ALL
SELECT       *
FROM         abc
;
QUIT;
