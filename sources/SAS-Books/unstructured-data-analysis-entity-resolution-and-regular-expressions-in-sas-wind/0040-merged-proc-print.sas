/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0040-data-hex2dec_example.sas --- */
data hex2dec_example;
input nums Hex2.;
datalines;


00


02


99


FF


AF


;
run;

/* --- 0041-proc-print.sas --- */
proc print data=work.hex2dec_example;
run;
