%let N = 100;
data Bernoulli(keep=x);
call streaminit(4321);
p = 1/2;
do i = 1 to &N;
x = rand("Bernoulli", p);
/* coin toss */
output;
end;
run;
