%let std = 10;
/* magnitude of contamination */
%let N = 100;
/* size of sample
*/
data CN(keep=x);
call streaminit(12345);
do i = 1 to &N;
if rand("Bernoulli", 0.1) then
x = rand("Normal", 0, &std);
else
x = rand("Normal");
output;
end;
run;
proc univariate data=CN;
var x;
histogram x / kernel vscale=proportion endpoints=-15 to 21 by 1;
qqplot x;
run;
