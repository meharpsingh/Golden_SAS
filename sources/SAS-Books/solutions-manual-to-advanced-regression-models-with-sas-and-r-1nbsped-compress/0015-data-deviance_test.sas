data deviance_test;
 deviance = -2*(-73.0195 - (-54.6201));
  pvalue = 1 - probchi(deviance,10);
run;
proc print noobs;
run;
