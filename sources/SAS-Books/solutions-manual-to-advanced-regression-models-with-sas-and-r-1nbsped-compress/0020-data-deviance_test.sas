data deviance_test;
 deviance = -2*(-74.6263 - (-56.4150));
  pvalue = 1 - probchi(deviance,5);
run;
proc print noobs;
run;
