/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0038-data-dateconversion.sas --- */
data DateConversion;
input Euro ddmmyy. FourDigit ddmmyy10.;
datalines;
010118 01012018


120117 12012017
;
run;

/* --- 0039-proc-print.sas --- */
proc print data=work.DateConversion;
format euro mmddyy8. fourdigit mmddyy10.;
run;

/* --- 0040-proc-print.sas --- */
proc print data=work.DateConversion;
format euro date7. fourdigit date10.;
run;
