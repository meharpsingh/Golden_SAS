/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0033-data-test.sas --- */
data test ;
prodID = 011 ;
result = put(prodID , 3.) ;
run ;
proc print data=test;
run;

/* --- 0034-proc-contents.sas --- */
proc contents data=test;
run;
