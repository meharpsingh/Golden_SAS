data deviance;
 deviance = -2*(-95.2421 - (-88.8603));
  pvalue = 1 - probchi(deviance,4);
run;
proc print noobs;
run;
