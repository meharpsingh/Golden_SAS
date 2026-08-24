/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
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

/* --- 0080-data-m1.sas --- */
DATA m1;
INPUT Key $ Value1;
CARDS;
A 11.1
A 11.2
B 12.1
B 12.2
;

/* --- 0089-data-from3.sas --- */
DATA from3;
MERGE sorted1 m1(RENAME=(value1=Tenths) ) sorted2;
BY key;
RUN;
