data deviance;
 deviance = 109.3 - 99.3494;
 pvalue = 1 - probchi(deviance,4);
run;
proc print noobs;
run;
