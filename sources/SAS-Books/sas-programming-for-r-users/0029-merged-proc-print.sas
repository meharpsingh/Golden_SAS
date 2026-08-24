/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0029-data-employees.sas --- */
data employees;
    input name $ bday :mmddyy8. @@;
    datalines;
    Jill 01011960 Jack 05111988 Joe 08221975
;
run;

/* --- 0030-proc-print.sas --- */
proc print data=employees;
run;
