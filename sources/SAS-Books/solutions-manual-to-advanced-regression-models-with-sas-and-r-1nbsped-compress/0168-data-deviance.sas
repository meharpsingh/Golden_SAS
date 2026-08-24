data deviance;
 deviance = -2*(-9.3440 - (-3.6998));
 pvalue = 1 - probchi(deviance,4);
run;
proc print noobs;
run;
