data deviance_test;
 deviance = -2*(-219.9272 - (-211.7158));
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
