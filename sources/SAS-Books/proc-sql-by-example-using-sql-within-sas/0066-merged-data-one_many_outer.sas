/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
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

/* --- 0081-data-m2.sas --- */
DATA m2;
INPUT Key $ Value2;
CARDS;
A 21.1
A 21.2
A 21.3
C 23.1
C 23.2
;

/* --- 0088-data-one_many_outer.sas --- */
DATA one_many_outer;
MERGE u1 m2;
BY key;
RUN;
