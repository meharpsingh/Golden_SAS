data deviance;
 deviance = -2*(12.8090 - 19.7922);
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
