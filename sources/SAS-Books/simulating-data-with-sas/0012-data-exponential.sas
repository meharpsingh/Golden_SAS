data Exponential(keep=x);
call streaminit(4321);
sigma = 10;
do i = 1 to &N;
x = sigma * rand("Exponential");
/* X ~ Expo(10) */
output;
end;
run;
