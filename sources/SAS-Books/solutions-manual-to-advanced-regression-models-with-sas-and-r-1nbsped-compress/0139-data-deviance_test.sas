data deviance_test;
 deviance = -2*(-54.4484 - (-46.6927));
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
