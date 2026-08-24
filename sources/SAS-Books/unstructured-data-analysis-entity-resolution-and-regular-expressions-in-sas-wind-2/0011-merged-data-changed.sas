/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0011-data-example.sas --- */
data example;
   input text $80.;
   datalines;
Ken can be reached at (801)443-9876
;

/* --- 0012-data-changed.sas --- */
data changed;
   set example;
   *RegEx_ID = PRXPARSE('s/\d+/***NUMBER
REMOVED***/o');
   RegEx_ID = PRXPARSE('s/\([1-9]\d\d\)\s?[1-
9]\d\d-\d\d\d\d/*REDACTED*/o');
   Call PRXCHANGE(RegEx_ID, -1, text, text,
length, trunc_val, num_changes);
   put text=;
run;
proc print data=changed;
run;
