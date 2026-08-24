%macro RandExp(sigma);
((&sigma) * rand("Exponential"))
%mend;
data LifeData;
call streaminit(1);
do PatientID = 1 to 100;
t = %RandExp(1/0.01);
/* hazard rate = 0.01 */
output;
end;
run;
proc lifetest data=LifeData;
time t;
ods select Quartiles Means;
run;
