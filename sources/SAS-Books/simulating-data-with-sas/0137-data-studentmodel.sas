data StudentModel(keep= Height Weight);
call streaminit(1);
b0 = -143; b1 = 3.9;
/* parameter estimates from regression */
rmse = 11.23;
/* estimate of scale of error term
*/
do i = 1 to 19;
Height = rand("Normal", 62.3, 5.13);
/* Height is random normal */
Weight = b0 + b1*Height + rand("Normal", 0, rmse);
output;
end;
run;
