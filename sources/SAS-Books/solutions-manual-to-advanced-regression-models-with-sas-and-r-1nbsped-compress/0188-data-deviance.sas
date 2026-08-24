data deviance;
 deviance = 114.1 - 104.6;
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
