data StudentData(keep= Height Weight);
call streaminit(1);
set Sashelp.Class;
/* implicit loop over observations
*/
b0 = -143; b1 = 3.9;
/* parameter estimates from regression */
rmse = 11.23;
/* estimate of scale of error term
*/
Weight = b0 + b1*Height + rand("Normal", 0, rmse);
run;
