data deviance;
 deviance = 121.1 - 96.4664;
 pvalue= 1 - probchi(deviance,3);
run;
proc print noobs;
run;
