data deviance;
 deviance = 212.8 - 191.9;
 pvalue = 1 - probchi(deviance,8);
run;
proc print noobs;
run;
