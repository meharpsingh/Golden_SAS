/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0169-data-table.sas --- */
  DATA TABLE;
  INPUT EXPOSURE DISEASE COUNT;
  DATALINES;
  0 0 24
  0 1 8
  1 0 9
  1 1 19
  ;
  PROC FREQ DATA=TABLE; WEIGHT COUNT;
  TABLES EXPOSURE*DISEASE/CHISQ;
  RUN;

/* --- 0173-proc-sql.sas --- */
  PROC SQL;
     SELECT  column(s)
     FROM  table-name  |  view-name
     WHERE  expression
     GROUP BY  column(s )
     HAVING  expression
     ORDER BY  column(s);
  QUIT;

/* --- 0344-proc-means.sas --- */
ODS TRACE ON;
ODS GRAPHICS ON;
ODS LISTING; *standard output;
ODS HTML [BODY ='FILENAME.HTML'];
ODS PDF [FILE ='FILENAME.PDF'];
ODS RTF [FILE ='FILENAME.RTF'];
ODS PS [FILE ='FILENAME.PS'];
  PROC MEANS * PUT PROCS HERE;
ODS TYPE CLOSE;
ODS TRACE OFF;
ODS GRAPHICS OFF;
SQL Examples (Chapter 9)
    * Sample SQL program;
    PROC SQL;
    SELECT ID, GP, AGE
               FROM MYSASLIB.SOMEDATA
    WHERE GENDER CONTAINS "Female"
      ORDER BY ID;
      QUIT;
      * Sample SQL code to create a SAS dataset;
      PROC SQL;
            CREATE TABLE MYQUERY AS
            SELECT * FROM MYSASLIB.SOMEDATA;
      QUIT;
*Sample SQL code show order of clauses;
      PROC SQL;
         SELECT  column(s)
         FROM  table-name | view-name
         WHERE  expression
         GROUP BY  column(s)
         HAVING  expression
         ORDER BY  column(s) ;
      QUIT;
