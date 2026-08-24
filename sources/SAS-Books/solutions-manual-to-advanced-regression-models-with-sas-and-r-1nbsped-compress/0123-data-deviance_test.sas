data deviance_test;
 deviance = -2*(-43.0673 - (-27.5443));
 pvalue = 1 - probchi(deviance,2);
run;
proc print noobs;
run;
