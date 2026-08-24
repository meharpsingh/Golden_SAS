/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0013-proc-http.sas --- */
filename SPX "%sysfunc(getoption(WORK))/SPX_Mem
proc http
      url="https://github.com/finsasdata/Bookda
      out=SPX
      method ="get";
run;

/* --- 0023-data-bitcoin.sas --- */
data bitcoin;
input date mmddyy10. bitcoin;
format date mmddyy10. bitcoin dollar10.;
datalines;
12/16/2022      16837.95
12/17/2022      16718.5
12/18/2022      16753.05
12/19/2022      16586.82
12/20/2022      16881.54
12/21/2022      16793.1
12/22/2022      16792.25
12/23/2022      16811.33
12/24/2022      16829.82
12/25/2022      16830.25
d
i
f
d
r


12/26/2022      16833.01
12/27/2022      16692.55
;
run;
proc sort data=bitcoin;
by date;
run;

/* --- 0024-data-bitspx.sas --- */
data bitspx;
      merge bitcoin spx;
      by date;
run;
proc print data=bitspx;
run;
