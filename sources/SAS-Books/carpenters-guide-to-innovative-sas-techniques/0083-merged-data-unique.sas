/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0083-proc-sort.sas --- */
proc sort data=advrpt.lab_chemistry
                     (keep = subject visit labdt)
          out=labs;
   by subject visit; n
   run;
data dups;
   set labs;
   by subject visit; n
   if not (first.visit and last.visit); o
   run;
proc print data=dups;
   run;

/* --- 0084-data-unique.sas --- */
data unique;
   set labs(keep=subject visit);
   by subject visit;
   if first.visit;
   run;
