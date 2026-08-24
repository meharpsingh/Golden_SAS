/* Merged listing: this program was assembled from 3 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0134-data-abc.sas --- */
DATA ABC;
RETAIN ID 1;
DO CODE = 'aa','aa',
          'bb','bb','bb','bb',
          'cc','cc';
   OUTPUT;
   END;
RUN;
DATA ab;
RETAIN ID 1;
DO CODE = 'aa','aa','aa',
          'bb','bb';
   OUTPUT;
   END;
RUN;

/* --- 0137-data-unionall.sas --- */
DATA unionall;
SET abc ab;
RUN;

/* --- 0138-proc-sort.sas --- */
PROC SORT DATA=unionall OUT=union NODUPRECS;
BY _ALL_;
RUN;
