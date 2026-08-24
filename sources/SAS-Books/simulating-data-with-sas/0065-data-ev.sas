%let n1 = 10;
%let n2 = 10;
%let NumSamples = 10000;
/* number of samples
*/
/* Scenario 1: (x1 | c=1) ~ N(0,1);
(x1 | c=2) ~ N(0,1);
*/
/* Scenario 2: (x2 | c=1) ~ N(0,1);
(x2 | c=2) ~ N(0,10);
*/
data EV(drop=i);
label x1 = "Normal data, same variance"
x2 = "Normal data, different variance";
call streaminit(321);
do SampleID = 1 to &NumSamples;
c = 1;
/* sample from first group
*/
do i = 1 to &n1;
x1 = rand("Normal");
x2 = x1;
output;
end;
c = 2;
/* sample from second group */
do i = 1 to &n2;
x1 = rand("Normal");
x2 = rand("Normal", 0, 10);
output;
end;
end;
run;
