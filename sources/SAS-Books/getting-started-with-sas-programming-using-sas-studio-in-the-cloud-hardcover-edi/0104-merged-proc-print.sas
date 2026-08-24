/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0104-data-uppity.sas --- */
data Uppity;
   informat Name $15. Q1-Q5 $1.;
   input Name Q1-Q5;
   array Up[6] Name Q1-Q5;
   do i = 1 to 6;
      Up[i] = upcase(Up[i]);
   end;
   drop i;
datalines;
;

/* --- 0105-proc-print.sas --- */
proc print data=Uppity noobs;
run;
