data deviance;
 deviance = -38.25 - (-49.20);
 pvalue = 1 - probchi(deviance,4);
run;
proc print noobs;
run;
