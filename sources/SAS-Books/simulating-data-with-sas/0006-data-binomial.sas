data Binomial(keep=x);
call streaminit(4321);
p = 1/2;
do i = 1 to &N;
x = rand("Binomial", p, 10);
/* number of heads in 10 tosses */
output;
end;
run;
