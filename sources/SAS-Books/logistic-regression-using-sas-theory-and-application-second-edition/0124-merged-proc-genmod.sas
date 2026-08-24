/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0124-data-zero.sas --- */
DATA zero;
  INPUT x y z f;
  DATALINES;
1    1    1    20
1    0    1     5
1    1    0     5
1    0    0     5
0    1    1     4
0    0    1    11
0    1    0     0
0    0    0     0
;

/* --- 0125-proc-genmod.sas --- */
PROC GENMOD DATA=zero DESC;
  FREQ f;
  MODEL y = x z / D=B AGGREGATE;
RUN;

/* --- 0126-proc-genmod.sas --- */
PROC GENMOD DATA=zero;
  MODEL f=x z y x*z y*z y*x / D=P AGGREGATE;
  OUTPUT OUT=a PRED=pred;
RUN;

/* --- 0127-proc-genmod.sas --- */
PROC GENMOD DATA=zero;
  WHERE f NE 0;
  MODEL f=x z y x*z y*z y*x / D=P AGGREGATE;
RUN;
