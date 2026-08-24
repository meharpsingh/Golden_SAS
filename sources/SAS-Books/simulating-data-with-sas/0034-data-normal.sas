%let N = 100;
data Normal(keep=x);
call streaminit(4321);
do i = 1 to &N;
x = rand("Normal");
/* N(0, 1) */
output;
end;
run;
/* Manually create a Q-Q plot */
proc sort data=Normal out=QQ; by x; run;
/* 1 */
data QQ;
set QQ nobs=NObs;
v = (_N_ - 0.375) / (NObs + 0.25);
/* 2 */
q = quantile("Normal", v);
/* 3 */
label x = "Observed Data" q = "Normal Quantiles";
run;
proc sgplot data=QQ;
/* 4 */
scatter x=q y=x;
xaxis grid;
yaxis grid;
run;
