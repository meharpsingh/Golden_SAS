data CensoredData(keep= PatientID t Censored);
call streaminit(1);
HazardRate = 0.01;
/* rate at which subject experiences event */
CensorRate = 0.001;
/* rate at which subject drops out
*/
EndTime = 365;
/* end of study period
*/
do PatientID = 1 to 100;
tEvent = %RandExp(1/HazardRate);
c = %RandExp(1/CensorRate);
t = min(tEvent, c, EndTime);
Censored = (c < tEvent | tEvent > EndTime);
output;
end;
run;
proc lifetest data=CensoredData plots=(survival(atrisk CL));
time t*Censored(1);
ods select Quartiles Means CensoredSummary SurvivalPlot;
run;
