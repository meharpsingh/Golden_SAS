data deviance;
 deviance = 305.82 - 299.97;
 pvalue = 1 - probchi(deviance,1);
run;
proc print noobs;
run;
