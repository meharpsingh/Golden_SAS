data deviance;
 deviance = 661.07 - 592.37;
 pvalue  = 1 - probchi(deviance, 2);
run;
proc print noobs;
run;
