/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0033-data-work-encode.sas --- */
data work.encode (encoding="ebcdic");
x=1;
abc123 = 'abc123';
run;

/* --- 0037-data-work-encode2.sas --- */
data work.encode2 (encoding="ascii");
set work.encode (encoding="ebcdic");
run;

/* --- 0038-proc-print.sas --- */
proc print data=work.encode2 (encoding="ebcdic");
run;

/* --- 0039-proc-print.sas --- */
proc print data=work.encode2 (encoding="ascii");
run;
