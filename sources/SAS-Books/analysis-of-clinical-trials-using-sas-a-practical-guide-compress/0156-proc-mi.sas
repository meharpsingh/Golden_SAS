proc mi data=growthmi seed=495838 simple nimpute=5 out=growthmi2;
em itprint outem=growthem2;
var meas8 meas12 meas14 meas10;
by sex;
run;
