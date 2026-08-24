/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0022-data-money.sas --- */
data money;
infile datalines ;
input name$ ;
datalines;
'50000'
'50,000'
'$50000'
50000
'50000'
'50000.00'
;
run;

/* --- 0023-proc-print.sas --- */
proc print data=money;
run;

/* --- 0024-data-money2.sas --- */
data money2;
set money;
name2=compress(name,",$'");
name3 = input(name2,6.);
run;
