/* Merged listing: this program was assembled from 5 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0296-data-wide.sas --- */
DATA wide;
INPUT ID $ Estimated Net Gross Adjusted;
CARDS;
A 11 12 13 14
B 21 22 23 24
;

/* --- 0299-proc-sql.sas --- */
PROC SQL;
CREATE TABLE long AS
SELECT       ID, 'Estimated' AS Item, Estimated AS Value
FROM         wide
UNION ALL
SELECT       ID, 'Net'              , Net
FROM         wide
UNION ALL
SELECT       ID, 'Gross'            , Gross
FROM         wide
UNION ALL
SELECT       ID, 'Adjusted'         , Adjusted
FROM         wide
;
QUIT;

/* --- 0301-proc-sql.sas --- */
PROC SQL;
CREATE TABLE numbered AS
SELECT       id, varnum, item, value
FROM         long
             INNER JOIN
             ( SELECT name, varnum
               FROM   dictionary.columns
               WHERE  libname='WORK' AND
                      memname='WIDE'
             )
             ON       name=item
;
QUIT;

/* --- 0302-proc-sql.sas --- */
PROC SQL;
CREATE TABLE verticalsums AS
SELECT       varnum, item, SUM(value) as Sum
FROM         numbered
GROUP BY     varnum, item
ORDER BY     varnum
;
QUIT;

/* --- 0303-proc-transpose.sas --- */
PROC TRANSPOSE DATA=verticalsums
 OUT=horizontalsums(drop = _name_);
ID item;
VAR sum;
RUN;
