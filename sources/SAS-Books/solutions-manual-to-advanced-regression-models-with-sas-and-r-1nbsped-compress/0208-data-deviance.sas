data deviance;
 deviance = 117.2 - 104.5;
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
