data Normal(keep=x);
call streaminit(4321);
/* Step 1 */
do i = 1 to 100;
/* Step 2 */
x = rand("Normal");
/* Step 3 */
output;
end;
run;
proc print data=Normal(obs=5);
run;
