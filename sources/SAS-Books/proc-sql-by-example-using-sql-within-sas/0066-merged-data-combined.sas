/* Merged listing: this program was assembled from 6 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0066-data-u1.sas --- */
DATA u1;
INPUT Key $ Value1;
CARDS;
A 11
B 12
;
DATA u2;
INPUT Key $ Value2;
CARDS;
C 23
A 21
;

/* --- 0067-proc-sort.sas --- */
PROC SORT DATA=u1 OUT=sorted1;
BY key;
RUN;
PROC SORT DATA=u2 OUT=sorted2;
BY key;
RUN;

/* --- 0068-data-combined.sas --- */
DATA combined;
MERGE sorted1 sorted2;
BY key;
RUN;

/* --- 0074-data-combined_left.sas --- */
DATA combined_left;
MERGE sorted1(IN=in1) sorted2;
BY key;
IF in1;
RUN;

/* --- 0075-data-combined_right.sas --- */
DATA combined_right;
MERGE sorted1 sorted2(IN=in2);
BY key;
IF in2;
RUN;

/* --- 0079-data-combined_inner.sas --- */
DATA combined_inner;
MERGE sorted1(IN=in1) sorted2(IN=in2);
BY key;
IF in1 AND in2;
RUN;
