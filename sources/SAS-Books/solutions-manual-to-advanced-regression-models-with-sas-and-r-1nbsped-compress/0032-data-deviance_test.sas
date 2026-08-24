data deviance_test;
 deviance = -2*(-44.8268 - (-33.2950));
  pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
