/* Merged listing: this program was assembled from 2 consecutive listings in the same book,
   because later listings read tables the earlier ones create. No data was invented;
   every statement is verbatim from the source. */

/* --- 0084-data-su.sas --- */
data SU(keep= X);
call streaminit(1);
theta = 1;
sigma = 5;
delta = 1.5;
gamma = -1;
do i = 1 to 10000;
Y = (rand("Normal")-gamma) / delta;
X = theta + sigma * sinh(Y);
output;
end;
run;

/* --- 0085-proc-univariate.sas --- */
proc univariate data=SU;
histogram x / su noplot;
ods select ParameterEstimates;
run;
