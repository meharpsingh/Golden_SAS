data deviance_test;
 deviance = -2*(-37.1492 - (-22.7726));
 pvalue = 1 - probchi(deviance,5);
run;
proc print noobs;
run;
