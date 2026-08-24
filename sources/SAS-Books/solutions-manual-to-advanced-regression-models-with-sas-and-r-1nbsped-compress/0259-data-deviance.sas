data deviance;
 deviance = 25.2 - 11.1;
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
