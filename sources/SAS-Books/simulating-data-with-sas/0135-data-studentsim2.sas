data StudentSim2(drop= b0 b1 rmse);
b0 = -143; b1 = 3.9; rmse = 11.23;
/* parameter estimates
*/
call streaminit(1);
do SampleID = 1 to &NumSamples;
do i = 1 to NObs;
/* NObs defined at compile time */
set Sashelp.Class point=i nobs=NObs;
/* random access */
eta = b0 + b1*Height;
/* linear predictor for student */
Weight = eta + rand("Normal", 0, rmse);
output;
end;
end;
STOP;
/* IMPORTANT: Use STOP with POINT= option in the SET stmt */
run;
