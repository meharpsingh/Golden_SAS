%let N = 50;
/* size of each sample
*/
%let NumSamples = 100;
/* number of samples
*/
data RegSim1(keep= SampleID x y);
array xx{&N} _temporary_;
/* do not output the array
*/
call streaminit(1);
do i = 1 to &N;
/* create x values one time */
xx{i} = rand("Uniform");
end;
do SampleID = 1 to &NumSamples;
do i = 1 to &N;
x = xx{i};
/* use same values for each sample */
y = 1 - 2*x + rand("Normal", 0, 0.5); /* params are 1 and -2 */
output;
end;
end;
run;
