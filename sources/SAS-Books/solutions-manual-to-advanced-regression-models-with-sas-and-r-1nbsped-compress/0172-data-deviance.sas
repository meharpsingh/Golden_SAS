data deviance;
 deviance = -2*(29.0520 - 33.3456);
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
