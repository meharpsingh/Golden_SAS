/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0144-data-prdsal2.sas --- */
DATA prdsal2;
 SET sashelp.prdsal2;
 ID = CATX('_',state,product);
RUN;

/* --- 0145-proc-sort.sas --- */
PROC SORT DATA = prdsal2;
 BY ID;
RUN;
