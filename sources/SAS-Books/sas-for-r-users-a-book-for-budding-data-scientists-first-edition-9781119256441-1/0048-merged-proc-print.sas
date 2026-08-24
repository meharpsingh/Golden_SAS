/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0048-data-new.sas --- */
data new;
char = '1234567';
numeric = input(char, 8.);
Run;
proc contents data=new;
run;

/* --- 0050-proc-print.sas --- */
proc print data=new;
Run;
