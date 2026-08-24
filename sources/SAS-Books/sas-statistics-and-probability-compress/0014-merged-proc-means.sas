/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0014-data-htwt.sas --- */
data htwt;
* open HTWT;
set htwt;
* read HTWT;
/* more statements can go here */
run;

/* --- 0034-data-htwt2.sas --- */
data htwt2;
set htwt;

/* --- 0035-proc-means.sas --- */
proc means data=htwt2 maxdec=3;
* summary stats with labels;
run;
