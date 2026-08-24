data RegSim2(keep= SampleID i x y);
call streaminit(1);
do i = 1 to &N;
x = rand("Uniform");
/* use this value NumSamples times */
eta = 1 - 2*x;
/* parameters are 1 and -2
*/
do SampleID = 1 to &NumSamples;
y = eta + rand("Normal", 0, 0.5);
output;
end;
end;
run;
proc sort data=RegSim2;
by SampleID i;
run;
