data deviance_test;
 deviance = -2*(5.8777 - 9.5061);
 pvalue = 1 - probchi(deviance,4);
run;
proc print noobs;
run;
