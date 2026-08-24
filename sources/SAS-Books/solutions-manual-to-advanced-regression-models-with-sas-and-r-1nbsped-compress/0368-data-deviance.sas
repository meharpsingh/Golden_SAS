data deviance;
 deviance = 162.82 - 147.31;
 pvalue = 1 - probchi(deviance, 3);
run;
proc print noobs;
run;
