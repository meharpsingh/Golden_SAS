data deviance;
 deviance = 583.13 - 503.98;
 pvalue = 1 - probchi(deviance, 1);
run;
proc print noobs;
run;
