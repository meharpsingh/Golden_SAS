/* Merged listing: this program was assembled from 4 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0067-data-afqt.sas --- */
DATA afqt;
  INPUT white old faed ed count @@;
  DATALINES;
1  0  1  1   39
1  0  1  2   29
1  0  1  3    8
1  0  2  1    4
1  0  2  2    8
1  0  2  3    1
1  0  3  1   11
1  0  3  2    9
1  0  3  3    6
1  0  4  1   48
1  0  4  2   17
1  0  4  3    8
1  1  1  1  231
1  1  1  2  115
1  1  1  3   51
1  1  2  1   17
1  1  2  2   21
1  1  2  3   13
1  1  3  1   18
1  1  3  2   28
1  1  3  3   45
1  1  4  1  197
1  1  4  2  111
1  1  4  3   35
;

/* --- 0068-data-first.sas --- */
DATA first;
  SET afqt;
  stage=1;
  advance = ed GE 2;
RUN;

/* --- 0069-data-second.sas --- */
DATA second;
  SET afqt;
  stage=2;
  IF ed=1 THEN DELETE;
  advance = ed EQ 3;
RUN;

/* --- 0071-data-combined.sas --- */
DATA combined;
  SET afqt;
   stage=1;
   advance = ed GE 2;
  OUTPUT;
   stage=2;
   IF ed=1 THEN DELETE;
   advance = ed EQ 3;
  OUTPUT;
RUN;
