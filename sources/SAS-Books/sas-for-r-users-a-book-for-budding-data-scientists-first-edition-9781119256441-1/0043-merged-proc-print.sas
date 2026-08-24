/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0043-data-names.sas --- */
Data names;
INPUT name $30.;
DATALINES; /* here we have used to separate the first name,

/* --- 0044-proc-print.sas --- */
proc print data=names;
Run;
