/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0091-proc-sort.sas --- */
PROC SORT DATA = sashelp.prdsal3 OUT = Prdsal3;
 BY state date;
RUN;

/* --- 0092-proc-timeseries.sas --- */
PROC TIMESERIES DATA=prdsal3
                OUTSEASON=season
                OUTTREND=trend
                OUTDECOMP=decomp
                OUTCORR = corr
                MAXERROR=0;
 BY state;
 WHERE product = 'SOFA';
 SEASON SUM / TRANSPOSE = YES;
 TREND MEAN / TRANSPOSE = YES;
 CORR ACOV /  TRANSPOSE = YES;
 DECOMP TCS / LAMBDA = 1600 TRANSPOSE = YES;
 ID date INTERVAL=MONTH ACCUMULATE=TOTAL SETMISSING=MISSING;
 VAR actual ;
RUN;
