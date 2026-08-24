data deviance_test;
 deviance = -2*(-18.3259 - (-10.5042));
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
