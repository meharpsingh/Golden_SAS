/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0001-data-htwt.sas --- */
data htwt;
* name data set;
input name $ sex $ age height weight;  * specify variables;
x = height + weight;
* define variable;
datalines;
alfred     M 14 69 112
alice      F 13 56  84
barbara    F 14 62 102
henry      M 15 67 135
john       M 16 70 165
sally      F 16 63 120
;
run;

/* --- 0013-data-htwt2.sas --- */
data htwt2;
* creates a new data set;
set htwt;
* read HTWT;
/* more statements can go here */
run;
