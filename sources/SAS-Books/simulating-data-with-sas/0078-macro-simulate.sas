%macro Simulate(N, NumSamples);
options nonotes;
/* turn off notes to log
*/
proc datasets nolist;
delete OutStats;
/* delete data if it exists
*/
run;
%do i = 1 %to &NumSamples;
data Temp;
/* create one sample
*/
call streaminit(0);
do i = 1 to &N;
x = rand("Uniform");
output;
end;
run;
proc means data=Temp noprint;
/* compute one statistic
*/
var x;
output out=Out mean=SampleMean;
run;
proc append base=OutStats data=Out;
/* accumulate stats */
run;
%end;
options notes;
%mend;
