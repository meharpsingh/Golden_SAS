data deviance;
 deviance = -2*(-30.1687 - (-12.1919));
 pvalue = 1 - probchi(deviance,4);
run;
proc print noobs;
run;
