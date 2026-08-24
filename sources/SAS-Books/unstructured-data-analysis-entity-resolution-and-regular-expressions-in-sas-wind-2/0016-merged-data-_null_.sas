/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0016-data-sample.sas --- */
data sample;
input address $50.;
datalines;
;

/* --- 0017-data-_null_.sas --- */
data _null_;
set sample end=last;
Street_RXID = PRXPARSE('s/\s+?(S|s)\w+?\s+/ St.
/o');
AddParse_RXID = PRXPARSE('s/(.+?),*?\s+?(\w+?),*?
\s+?(\w+?)\s+?(\d+?)/$1, $2, $3, $4/o');
text = PRXCHANGE(Street_RXID,-1,address);
text2 = PRXCHANGE(AddParse_RXID,-1,text);
put Street_RXID AddParse_RXID;
if last then do;
   CALL PRXFREE(Street_RXID);
   CALL PRXFREE(AddParse_RXID);
   put Street_RXID AddParse_RXID;
   end;
run;
