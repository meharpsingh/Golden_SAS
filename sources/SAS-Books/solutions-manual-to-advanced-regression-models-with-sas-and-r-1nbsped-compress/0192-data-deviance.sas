data deviance;
 deviance = -2*(-24.8739 - (-15.1014));
 pvalue = 1 - probchi(deviance, 5);
run;
proc print noobs;
run;
