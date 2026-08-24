data deviance;
 deviance = 15.8 - (-11.6);
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
