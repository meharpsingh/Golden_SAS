data deviance_test;
 deviance = -2*(-143.5324 - (-133.7181));
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
