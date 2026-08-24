data deviance;
 deviance = -2*(58.5757 - 72.2132);
 pvalue = 1 - probchi(deviance,4);
run;
proc print noobs;
run;
