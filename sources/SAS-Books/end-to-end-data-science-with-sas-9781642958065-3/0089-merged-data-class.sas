/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0089-proc-means.sas --- */
PROC MEANS DATA=MYDATA.BASE
(DROP=ROW_NUM BAD)
       MIN MAX MEAN MEDIAN;
       VAR _NUMERIC_;
       OUTPUT
OUT=VALUES(DROP=_type_ _freq_)
       MIN= MAX= MEAN= MEDIAN= /
AUTONAME;
RUN;

/* --- 0091-data-class.sas --- */
DATA class(DROP=i);
       DO i = 1 TO 150000;
              DO j = 1 TO n;
                     SET values
NOBS=n POINT=j;
                     OUTPUT;
              END;
       END;
       STOP;
RUN;
