%let N = 100;
/* size of sample */
data Exp(keep=x);
call streaminit(12345);
do i = 1 to &N;
u = rand("Uniform");
x = -log(1-u);
output;
end;
run;
proc univariate data=Exp;
histogram x / exponential(sigma=1) endpoints=0 to 6 by 0.5;
cdfplot x / exponential(sigma=1);
ods select GoodnessOfFit Histogram CDFPlot;
run;
