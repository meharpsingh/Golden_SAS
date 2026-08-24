data deviance;
 deviance = 184.3 - 163.4;
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
