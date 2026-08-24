/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0007-data-extract.sas --- */
data extract;
input address $50.;
text = PRXPARSE('/\s+(\w+),\s+(\w+)\s+(\d+)/o');
   if PRXMATCH(text, address) then
      do;
         city = PRXPOSN(text, 1, address);
         state = PRXPOSN(text, 2, address);
         zip = PRXPOSN(text, 3, address);
         output;
      end;
keep city state zip;
datalines;
;

/* --- 0008-proc-print.sas --- */
proc print data=extract;
run;
