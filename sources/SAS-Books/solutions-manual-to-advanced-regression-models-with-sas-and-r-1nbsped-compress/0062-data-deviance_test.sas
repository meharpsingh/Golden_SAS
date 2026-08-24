data deviance_test;
 deviance = -2*(35.5289 - 39.1840);
 pvalue = 1 - probchi(deviance,4);
run;
proc print noobs;
run;
