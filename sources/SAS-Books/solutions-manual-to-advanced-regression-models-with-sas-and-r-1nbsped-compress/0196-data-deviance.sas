data deviance;
 deviance = -2*(-22.4440 - (-16.9395));
 pvalue = 1 - probchi(deviance, 3);
run;
proc print noobs;
run;
