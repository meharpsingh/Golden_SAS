/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0175-data-nonparam.sas --- */
data NonParam;
call streaminit(1);
do x = 1 to 30 by 0.1;
f = sin(x/5) + 0.2*cos(x);
y = f + rand("Normal", 0, 0.2);
output;
end;

/* --- 0176-proc-loess.sas --- */
ods graphics on;
proc loess data=NonParam;
model y = x;
score /;
ods output ScoreResults = Score;
ods select FitPlot;
run;
