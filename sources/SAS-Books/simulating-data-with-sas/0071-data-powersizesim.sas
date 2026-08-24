%let NumSamples = 1000;
/* number of samples */
data PowerSizeSim(drop=i Delta);
call streaminit(321);
Delta = 0.5;
/* true difference between means */
do N =
40 to 100 by 5;
/* sample size
*/
do SampleID = 1 to &NumSamples;
do i = 1 to N;
c = 1; x1 = rand("Normal");
output;
c = 2; x1 = rand("Normal", Delta, 1); output;
end;
end;
end;
run;
