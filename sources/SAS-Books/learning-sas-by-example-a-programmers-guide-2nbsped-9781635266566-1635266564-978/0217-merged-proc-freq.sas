/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0217-proc-format.sas --- */
  proc format;
value Colors
1 = 'Yellow'
2 = 'Blue'
3 = 'Red'
4 = 'Green'
. = 'Missing';
  run;
  data Test;
input Color @@;
  datalines;
  3 4 1 2 3 3 3 1 2 2
  ;
  title "Default Order (Internal)";
  proc freq data=Test;
tables Color / nocum nopercent missing;
format Color Colors.;
  run;

/* --- 0218-proc-freq.sas --- */
  proc freq data=Test order=formatted;
tables Color / nocum nopercent;
format Color Colors.;
  run;
  title "ORDER = Data";
  proc freq data=Test order=data;
tables Color / nocum nopercent;
format Color Colors.;
  run;
  title "ORDER = Freq";
  proc freq data=test order=freq;
tables Color / nocum nopercent;
format Color Colors.;
  run;
