/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0179-data-ar1.sas --- */
%let N = 100;
data AR1(keep=t y);
call streaminit(12345);
phi = 0.4;
yLag = 0;
do t = -10 to &N;
eps = rand("Normal");
/* variance of 1
*/
y = phi*yLag + eps;
/* expected value of Y is 0 */
if t>0 then output;
yLag = y;
end;
run;

/* --- 0180-proc-arima.sas --- */
ods graphics on;
proc arima data=AR1 plots(unpack only)=(series(corr));
identify var=y nlag=1;
/* estimate AR1 lag */
estimate P=1;
ods select SeriesPlot ParameterEstimates FitStatistics;
quit;
