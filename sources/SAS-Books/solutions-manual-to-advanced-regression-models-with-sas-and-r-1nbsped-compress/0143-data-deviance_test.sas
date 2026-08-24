data deviance_test;
 deviance = -2*(-54.4484 - (-48.3651));
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
