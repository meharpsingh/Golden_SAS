data Poisson(keep=x);
call streaminit(4321);
lambda = 4;
do i = 1 to &N;
x = rand("Poisson", lambda);
/* num events per unit time */
output;
end;
run;
