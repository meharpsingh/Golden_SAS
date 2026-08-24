data deviance;
 deviance = -2*(75.8189 - 81.7552);
 pvalue = 1 - probchi(deviance,3);
run;
proc print noobs;
run;
