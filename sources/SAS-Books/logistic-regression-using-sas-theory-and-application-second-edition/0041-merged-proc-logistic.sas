/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0041-data-working.sas --- */
DATA working;
  INPUT france manual famanual total working;
  DATALINES;
1   1   1  107  85
1   1   0   65  44
1   0   1   66  24
1   0   0  171  17
0   1   1   87  24
0   1   0   65  22
0   0   1   85   1
0   0   0  148   6
;

/* --- 0042-proc-logistic.sas --- */
PROC LOGISTIC DATA=working;
  MODEL working/total = france manual famanual / SCALE=NONE;
RUN;

/* --- 0043-proc-logistic.sas --- */
PROC LOGISTIC DATA=working;
  MODEL working/total = france manual famanual
    france*manual france*famanual manual*famanual /
    SCALE=NONE;
RUN;
