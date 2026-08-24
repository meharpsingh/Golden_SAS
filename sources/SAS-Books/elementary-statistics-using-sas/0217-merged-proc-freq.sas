/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0217-data-penalty.sas --- */
data penalty;
   input decision $ defrace $ count @@;
   datalines;
;

/* --- 0218-proc-freq.sas --- */
proc freq data=penalty;
   tables decision*defrace;
   weight count;
   title 'Table for Death Penalty Data';
run;

/* --- 0222-proc-freq.sas --- */
proc freq data=penalty;
   tables decision*defrace / expected chisq
          norow nocol nopercent;
   weight count;
   title 'Death Penalty Data: Statistical Tests';
run;
