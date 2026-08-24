data deviance;
 deviance = 215.51 - 211.02;
 pvalue = 1 - probchi(deviance, 1);
run;
proc print noobs;
run;
