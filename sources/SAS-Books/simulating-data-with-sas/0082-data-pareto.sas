data Pareto(keep= X);
a = 4;
/* alpha > 0
*/
k = 1.5;
/* scale > 0 determines lower limit for x */
call streaminit(1);
do i = 1 to 1000;
U = rand("Uniform");
X = k / U**(1/a);
output;
end;
run;
