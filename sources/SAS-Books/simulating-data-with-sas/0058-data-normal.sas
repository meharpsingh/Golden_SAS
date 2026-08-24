%let N = 50;
/* size of each sample
*/
%let NumSamples = 10000;
/* number of samples
*/
/* 1. Simulate obs from N(0,1) */
data Normal(keep=SampleID x);
call streaminit(123);
do SampleID = 1 to &NumSamples;
/* simulation loop
*/
do i = 1 to &N;
/* N obs in each sample */
x = rand("Normal");
/* x ~ N(0,1)
*/
output;
end;
end;
run;
