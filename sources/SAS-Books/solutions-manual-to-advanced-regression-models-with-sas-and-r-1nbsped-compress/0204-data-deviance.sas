data deviance;
 deviance = 330.3 - 311.1;
 pvalue = 1 - probchi(deviance,3);
proc print noobs;
run;
