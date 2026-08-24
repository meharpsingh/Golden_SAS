data deviance;
 deviance = 173.2 - 168.2;
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
