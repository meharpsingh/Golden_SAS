data deviance_test;
 deviance = -2*(-102.6326 - (-98.4395));
  pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
