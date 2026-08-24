data deviance_test;
 deviance = -2*(-13.3323 - (1.4688));
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
