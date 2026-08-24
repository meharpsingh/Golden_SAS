/* Merged listing: this program was assembled from 6 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0062-data-happy.sas --- */
DATA happy;
  INPUT year married happy count;
  DATALINES;
1 1 1 473
1 1 2 493
1 1 3  93
1 0 1  84
1 0 2 231
1 0 3  99
2 1 1 332
2 1 2 387
2 1 3  62
2 0 1 150
2 0 2 347
2 0 3 117
3 1 1 571
3 1 2 793
3 1 3 112
3 0 1 257
3 0 2 889
3 0 3 234
;

/* --- 0063-proc-logistic.sas --- */
PROC LOGISTIC DATA=happy;
  FREQ count;
  CLASS year / PARAM=GLM;
  MODEL happy = married year / AGGREGATE SCALE=NONE;
RUN;

/* --- 0064-data-a.sas --- */
DATA a;
 SET happy;
 lesshap=happy GE 2;
 nottoo=happy EQ 3;
PROC LOGISTIC DATA=a;
  FREQ count;
  CLASS year / PARAM=GLM;
  MODEL lesshap=married year;
PROC LOGISTIC DATA=a;
  FREQ count;
  CLASS year / PARAM=GLM;
  MODEL nottoo=married year;
RUN;

/* --- 0065-data-happy2.sas --- */
DATA happy2;
  set happy;
  yr94=year EQ 3;
  yr84=year EQ 2;
PROC QLIM data=happy2;
  FREQ count;
  MODEL happy=married / DISCRETE(D=LOGISTIC);
  HETERO happy ~ yr94 yr84 / NOCONST;
RUN;

/* --- 0066-proc-catmod.sas --- */
PROC CATMOD DATA=happy;
  WEIGHT count;
  RESPONSE ALOGIT;
  MODEL happy = _RESPONSE_ married year / PARAM=REF;
RUN;

/* --- 0115-data-happy2.sas --- */
DATA happy2;
  SET happy;
  happyq=happy;
RUN;
