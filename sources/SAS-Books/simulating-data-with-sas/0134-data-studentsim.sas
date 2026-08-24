%let NumSamples = 100;
/* number of samples
*/
data StudentSim(drop= b0 b1 rmse);
b0 = -143; b1 = 3.9; rmse = 11.23;
/* parameter estimates
*/
call streaminit(1);
set Sashelp.Class;
/* implicit loop over obs
*/
i = _N_;
eta = b0 + b1*Height;
/* linear predictor for student */
do SampleID = 1 to &NumSamples;
Weight = eta + rand("Normal", 0, rmse);
output;
end;
run;
proc sort data=StudentSim;
by SampleID i;
run;
