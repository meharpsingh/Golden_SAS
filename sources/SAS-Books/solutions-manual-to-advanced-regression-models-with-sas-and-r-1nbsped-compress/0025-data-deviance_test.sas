data deviance_test;
 deviance = -2*(-117.8512 - (-96.2779));
  pvalue = 1 - probchi(deviance,8);
run;
proc print noobs;
run;
