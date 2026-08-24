data deviance;
 deviance = 140.2 - 118.9;
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
