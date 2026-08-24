data deviance_test;
 deviance = -2*(-48.6416 - (-33.4006));
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
